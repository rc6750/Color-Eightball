//=============================================================================
// BlueProj.
//=============================================================================
class BlueProj extends Projectile;

var() Sound ExploSound;
var int NumExtraRockets;

simulated function PostBeginPlay()
{
	Super.PostBeginPlay();
	if ( Level.bDropDetail )
		LightType = LT_None;
}

auto state Flying
{
	function ProcessTouch (Actor Other, vector HitLocation)
	{
		 if ( (Other != instigator) && !Other.IsA('Projectile') ) 	
			Explode(HitLocation,Normal(HitLocation-Other.Location));
	}

	function BeginState()
	{
		Velocity = vector(Rotation) * speed;	
	}
}

function BlowUp(vector HitLocation)
	{
		HurtRadius(Damage,220.0, MyDamageType, MomentumTransfer, HitLocation );
		MakeNoise(1.0);
	}

function Explode(vector HitLocation,vector HitNormal)
	{
		local UT_SpriteBallExplosion s;

		if ( Role < ROLE_Authority )
			return;

		s = spawn(class'Botpack.UT_SpriteBallExplosion',,,HitLocation + HitNormal*16);	
 		s.RemoteRole = ROLE_SimulatedProxy;	

		BlowUp(HitLocation);

 		Destroy();
	}

defaultproperties
{
     ExploSound=Sound'UnrealShare.General.SpecialExpl'
     speed=1000.000000
     Damage=55.000000
     MomentumTransfer=70000
     MyDamageType=RocketDeath
     ImpactSound=Sound'UnrealShare.General.Expla02'
     ExplosionDecal=Class'Botpack.EnergyImpact'
     bNetTemporary=False
     RemoteRole=ROLE_SimulatedProxy
     LifeSpan=10.000000
     DrawType=DT_Sprite
     Style=STY_Translucent
     Texture=Texture'Rainbow.BlueASMDAlt.BlueASMDAlt_a00'
     DrawScale=0.400000
     bUnlit=True
     CollisionRadius=12.000000
     CollisionHeight=12.000000
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
}
