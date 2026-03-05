//=============================================================================
// BlackHoleProj.uc
// On impact, spawns a temporary gravity well that pulls players in.
//=============================================================================
class BlackHoleProj extends Projectile;

var() float FieldLifeTime;     // how long the black hole lasts
var() float FieldRadius;       // pull radius
var() float PullStrength;      // base pull acceleration
var() float SpinStrength;      // tangential acceleration
var() float FinalBlastDamage;  // damage when it collapses
var() float FinalBlastRadius;  // radius of collapse blast
var() name  FinalDamageType;
var() Sound ExploSound;
var int NumExtraRockets;
var() bool bSpawnClientFX;

simulated function PostBeginPlay()
{
	Super.PostBeginPlay();
	Velocity = Vector(Rotation) * Speed;
}

simulated function ProcessTouch(Actor Other, vector HitLocation)
{
	if (Other == Instigator || Other.IsA('Projectile'))
		return;

	Explode(HitLocation, Normal(HitLocation - Other.Location));
}

simulated function HitWall(vector HitNormal, actor Wall)
{
	Explode(Location, HitNormal);
}

simulated function Explode(vector HitLocation, vector HitNormal)
{
	local BlackHoleField BH;
	local BlackHoleFX FX;

	// VISUALS: run on clients too
	if (Level.NetMode != NM_DedicatedServer)
	{
		FX = Spawn(class'Rainbow.BlackHoleFX',,, HitLocation);
		if (FX != None)
		{
			FX.Radius = FieldRadius;
			FX.LifeTimeSeconds = FieldLifeTime;
		}
	}

	if (Role != ROLE_Authority)
		return;

	BH = Spawn(class'Rainbow.BlackHoleField', Instigator,,, Rotator(HitNormal));
	if (BH != None)
	{
		BH.SetLocation(HitLocation);

		BH.FieldRadius      = FieldRadius;
		BH.PullStrength     = PullStrength;
		BH.SpinStrength     = SpinStrength;
		BH.LifeTimeSeconds  = FieldLifeTime;

		BH.FinalBlastDamage = FinalBlastDamage;
		BH.FinalBlastRadius = FinalBlastRadius;
		BH.FinalDamageType  = FinalDamageType;

		BH.Instigator = Instigator;
		BH.InitField();
	}

	Destroy();
}

defaultproperties
{
	Speed=1200.000000
	Damage=0.000000
	MomentumTransfer=0
	MyDamageType=RainbowDamage

	// black hole tuning
	FieldLifeTime=3.000000
	FieldRadius=650.000000
	PullStrength=2600.000000
	SpinStrength=1100.000000
	FinalBlastDamage=65.000000
	FinalBlastRadius=320.000000
	FinalDamageType=RainbowDamage

	DrawType=DT_Sprite
	Style=STY_Translucent
	Texture=Texture'Botpack.FlareFX.utflare7'
	DrawScale=0.45
	bUnlit=True

	RemoteRole=ROLE_SimulatedProxy
	LifeSpan=10.0
	bNetTemporary=False

	CollisionRadius=10.0
	CollisionHeight=10.0
	bProjTarget=True
}