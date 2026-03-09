//=============================================================================
// RandomTeleportProj.uc
// A projectile that teleports a pawn to a random position (sky included).
//=============================================================================
class RandomTeleportProj extends Projectile;

var() float TeleportRadius;      // >0 = teleport all pawns in radius on impact; 0 = direct hit only
var() int   MaxTries;
var() float SkyZPad;
var() float MinZ;
var() float MaxZ;
var() bool  bAllowAir;
var int NumExtraRockets;
var() float ThirdPersonFallTime;   // max time to stay 3rd person after an air-teleport
var pawn Victim;

var() Sound ExploSound;

var Pawn TouchPawn; // store direct-hit pawn so Explode doesn't need tracing

simulated function PostBeginPlay()
{
	Super.PostBeginPlay();

	if (MaxTries <= 0) MaxTries = 60;
	if (SkyZPad == 0)  SkyZPad  = 8000;
	bAllowAir = true;

	if (Level.bDropDetail)
		LightType = LT_None;
}

auto state Flying
{
	function ProcessTouch(Actor Other, vector HitLocation)
	{
		if (Other == Instigator || Other.IsA('Projectile'))
			return;

		Explode(HitLocation, Normal(HitLocation - Other.Location));
	}

	function BeginState()
	{
		Velocity = Vector(Rotation) * Speed;
	}
}

simulated function HitWall(vector HitNormal, actor Wall)
{
	Explode(Location, HitNormal);
}

simulated function Explode(vector HitLocation, vector HitNormal)
{
	local Pawn P;
	local Greyteleeffect s;


	if (Role != ROLE_Authority)
		return;

	// Radius mode: chaos teleport everyone near the impact
	if (TeleportRadius > 0)
	{
		foreach RadiusActors(class'Pawn', P, TeleportRadius, HitLocation)
		{
			if (P != None && P.Health > 0 && !P.bDeleteMe)
				TeleportPawnRandom(P);
		}
			s = spawn(class'Rainbow.Greyteleeffect',,,HitLocation + HitNormal*16);	
			if (s != None)
 				s.RemoteRole = ROLE_SimulatedProxy;	
		
	}
	else
	{
		// Direct hit only: use a small radius or implement TouchPawn again
		foreach RadiusActors(class'Pawn', P, 1, HitLocation)
		{
			if (P != None && P.Health > 0 && !P.bDeleteMe)
				TeleportPawnRandom(P);
		}
			s = spawn(class'Rainbow.Greyteleeffect',,,HitLocation + HitNormal*16);	
			if (s != None)
 				s.RemoteRole = ROLE_SimulatedProxy;	
	}

	Destroy();
}

// -------------------- Teleport logic --------------------

function TeleportPawnRandom(Pawn P)
{
	local vector Dest;
	local rotator NewRot;
	local PlayerPawn PP;
	local FallCamHelper F;
	local TeleportDeathCredit TDC;

	if (P == None || P.Health <= 0)
		return;

	if (!FindRandomTeleportSpot(P, Dest))
		return;

	// Actually move (SetLocation returns false if encroaching)
	if (!P.SetLocation(Dest))
		return;

	// Track post-teleport environmental death and credit it to the shooter
	if (Instigator != None && P != None && P != Instigator && P.Health > 0)
	{
		TDC = Spawn(class'Rainbow.TeleportDeathCredit', Instigator);
		if (TDC != None)
			TDC.Init(P, Instigator, 8.0, 'teleported');
	}	

	NewRot = P.Rotation;
	NewRot.Pitch = 0;
	NewRot.Roll  = 0;

	P.Velocity = vect(0,0,0);
	P.SetRotation(NewRot);

	if (bAllowAir)
	{
		P.SetPhysics(PHYS_Falling);

		// CHAOS SPIN
    	P.bRotateToDesired = true;
    	P.DesiredRotation = RotRand();          // random orientation
   	 	P.RotationRate.Pitch = Rand(80000);
   		P.RotationRate.Yaw   = Rand(80000);
    	P.RotationRate.Roll  = Rand(80000);

		PP = PlayerPawn(P);
		if (PP != None)
		{
			F = Spawn(class'FallCamHelper', PP);
			if (F != None)
			{
				F.Instigator = PP;                    // <-- IMPORTANT
				F.MaxTime = ThirdPersonFallTime;
			}
}
	}

	P.SetCollision(true, true, true);
}

function bool FindRandomTeleportSpot(Pawn P, out vector OutLoc)
{
	local vector MinV, MaxV;
	local vector Candidate;
	local float ZTop, ZBottom;
	local int i;

	if (!GetMapBoundsFromNav(MinV, MaxV))
		return false;

	if (MaxZ == 0) MaxZ = MaxV.Z + SkyZPad;
	if (MinZ == 0) MinZ = MinV.Z - 1024;

	ZTop    = MaxZ;
	ZBottom = MinZ;

	for (i = 0; i < MaxTries; i++)
	{
		Candidate.X = LerpFloat(FRand(), MinV.X, MaxV.X);
		Candidate.Y = LerpFloat(FRand(), MinV.Y, MaxV.Y);
		Candidate.Z = LerpFloat(FRand(), ZBottom, ZTop);

		if (TestPawnTeleportFit(P, Candidate))
		{
			OutLoc = Candidate;
			return true;
		}
	}

	return false;
}

function bool TestPawnTeleportFit(Pawn P, vector Candidate)
{
	local vector OldLoc;
	local bool bOK;

	OldLoc = P.Location;
	bOK = P.SetLocation(Candidate);

	if (bOK)
		P.SetLocation(OldLoc);

	return bOK;
}

function float LerpFloat(float Alpha, float A, float B)
{
	return A + Alpha * (B - A);
}

function bool GetMapBoundsFromNav(out vector MinV, out vector MaxV)
{
	local NavigationPoint N;
	local bool bInit;

	bInit = false;

	foreach AllActors(class'NavigationPoint', N)
	{
		if (!bInit)
		{
			MinV = N.Location;
			MaxV = N.Location;
			bInit = true;
		}
		else
		{
			MinV.X = FMin(MinV.X, N.Location.X);
			MinV.Y = FMin(MinV.Y, N.Location.Y);
			MinV.Z = FMin(MinV.Z, N.Location.Z);

			MaxV.X = FMax(MaxV.X, N.Location.X);
			MaxV.Y = FMax(MaxV.Y, N.Location.Y);
			MaxV.Z = FMax(MaxV.Z, N.Location.Z);
		}
	}

	if (bInit)
	{
		MinV -= vect(2048,2048,2048);
		MaxV += vect(2048,2048,2048);
	}

	return bInit;
}

defaultproperties
{
	ExploSound=Sound'UnrealShare.General.SpecialExpl'
	Speed=1000.000000
	Damage=55.000000
	MomentumTransfer=70000
	MyDamageType=RainbowDamage
	ImpactSound=Sound'UnrealShare.General.Expla02'
	ExplosionDecal=Class'Botpack.EnergyImpact'
	bNetTemporary=False
	RemoteRole=ROLE_SimulatedProxy
	LifeSpan=10.000000
	DrawType=DT_Sprite
	Style=STY_Translucent
	Texture=Texture'UnrealShare.SKEffect.SKJ_a00'
	DrawScale=0.400000
	bUnlit=True
	CollisionRadius=15.000000
	CollisionHeight=8.000000
	bProjTarget=True
	LightType=LT_Steady
	LightEffect=LE_NonIncidence
	LightBrightness=255
	LightHue=165
	LightSaturation=72
	LightRadius=6
	bFixedRotationDir=True
	RotationRate=(Pitch=45345,Yaw=33453,Roll=63466)
	DesiredRotation=(Pitch=23442,Yaw=34234,Roll=34234)
	ThirdPersonFallTime=3.0
	TeleportRadius=200
	MaxTries=60
	SkyZPad=8000
	bAllowAir=True
}