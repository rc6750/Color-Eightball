//=============================================================================
// BlackHoleField.uc
// Pulls pawns inward and adds spin for a short duration, then collapses.
//=============================================================================
class BlackHoleField extends Actor;

var() float FieldRadius;
var() float PullStrength;
var() float SpinStrength;
var() float LifeTimeSeconds;

var() float FinalBlastDamage;
var() float FinalBlastRadius;
var() name  FinalDamageType;

var float StartTime;

replication
{
	reliable if (Role == ROLE_Authority)
		FieldRadius, LifeTimeSeconds;
}

function PostBeginPlay()
{
	Super.PostBeginPlay();
	// Do NOT start timers here; variables aren't set yet.
}

function InitField()
{
	if (Role != ROLE_Authority)
		return;

	StartTime = Level.TimeSeconds;
	SetTimer(0.05, true); // start pull now that radius/time are valid
}

simulated function PostNetBeginPlay()
{
	local BlackHoleFX FX;

	Super.PostNetBeginPlay();

	// Clients: spawn visuals once we exist network-side
	if (Level.NetMode != NM_DedicatedServer)
	{
		FX = Spawn(class'Rainbow.BlackHoleFX', self);
		if (FX != None)
		{
			FX.Radius = FieldRadius;
			FX.LifeTimeSeconds = LifeTimeSeconds;
		}
	}
}

function Timer()
{
	local Pawn P;
	local vector Dir, Tangent, Accel;
	local float Dist, Alpha;
	local Projectile Pr;

	if (Role != ROLE_Authority)
		return;

	// collapse
	if ((Level.TimeSeconds - StartTime) >= LifeTimeSeconds)
	{
		Collapse();
		return;
	}

	foreach RadiusActors(class'Pawn', P, FieldRadius, Location)
	{
		if (P == None || P.Health <= 0 || P.bDeleteMe)
			continue;

		if (PlayerPawn(P) != None && FRand() < 0.50)  // don’t spam every tick
    		PlayerPawn(P).ClientMessage("You are being sucked into a black hole!");
    		PlayerPawn(P).ReceiveLocalizedMessage(class'Rainbow.BlackHoled');

		// Dir points from pawn -> center
		Dir = Location - P.Location;
		Dist = VSize(Dir);
		if (Dist < 1) continue;
		Dir = Dir / Dist;

		// 0..1, stronger near center
		Alpha = FClamp(1.0 - (Dist / FieldRadius), 0.0, 1.0);

		// Tangent around Z axis
		Tangent = Normal(vect(0,0,1) cross Dir);
		if (VSize(Tangent) < 0.1)
    		Tangent = Normal(vect(0,1,0) cross Dir);

		// Spiral: inward pull + strong sideways + slight vertical wobble
		Accel =
    		Dir     * (PullStrength * (0.35 + Alpha)) +
    		Tangent * (SpinStrength * (0.20 + 1.40*Alpha));

		// “Whip” boost when they’re mid-range (makes slingshot feel)
		Accel += Tangent * (SpinStrength * 0.8 * FClamp((Dist/FieldRadius), 0.0, 1.0));

		P.Velocity += Accel * 0.05;

		// Force falling so they can get yanked off ledges
		if (P.Physics != PHYS_Falling && P.Physics != PHYS_Swimming)
			P.SetPhysics(PHYS_Falling);
	}

	foreach RadiusActors(class'Projectile', Pr, FieldRadius, Location)
	{
	    if (Pr == None || Pr.bDeleteMe)
	        continue;

	    // Don’t suck these (avoid recursion / visuals)
	    if (Pr.IsA('BlackHoleProj') || Pr.IsA('BlackHoleWisp'))
	        continue;

	    // Optional: ignore slow decorative stuff / or your own rainbow effects if needed
	    // if (Pr.IsA('SomeVisualProjClass')) continue;

	    Dir = Location - Pr.Location;
	    Dist = VSize(Dir);
	    if (Dist < 1)
	        continue;

	    Dir = Dir / Dist;

	    Alpha = FClamp(1.0 - (Dist / FieldRadius), 0.0, 1.0);

	    // Orbit tangent around Z axis
	    Tangent = Normal(vect(0,0,1) cross Dir);
	    if (VSize(Tangent) < 0.1)
	        Tangent = Normal(vect(0,1,0) cross Dir);

	    // Pull + spin (lighter than pawns so it feels fair)
	    Accel =
	        Dir     * (PullStrength * 0.20 * (0.35 + Alpha)) +
	        Tangent * (SpinStrength * 0.20 * (0.20 + 1.40*Alpha));

	    // Apply (scale by same timer interval you use, e.g. 0.05)
	    Pr.Velocity += Accel * 0.05;

	    // Clamp so rockets don’t go insane
	    if (VSize(Pr.Velocity) > Pr.MaxSpeed && Pr.MaxSpeed > 0)
	        Pr.Velocity = Normal(Pr.Velocity) * Pr.MaxSpeed;
	}
}

function Collapse()
{
	if (Role != ROLE_Authority)
		return;

	// Final pop
	HurtRadius(FinalBlastDamage, FinalBlastRadius, FinalDamageType, 0, Location);

	// Quick visible cue (optional)
	Spawn(class'Rainbow.RainbowShockWave',,, Location);

	Destroy();
}

defaultproperties
{
	RemoteRole=ROLE_SimulatedProxy
	bAlwaysRelevant=True
	bNetTemporary=True

	DrawType=DT_SpriteAnimOnce
	Style=STY_Translucent
	Texture=Texture'UnrealShare.SKEffect.SKJ_a00'
	DrawScale=1.10
	bUnlit=True

	CollisionRadius=0
	CollisionHeight=0
	bCollideActors=False
	bCollideWorld=False

	LifeSpan=8.0
}