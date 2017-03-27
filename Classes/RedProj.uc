//=============================================================================
// RedProj.
//=============================================================================
class RedProj expands Projectile;

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


function Explode(vector HitLocation, vector HitNormal)
	{
		if ( Role < ROLE_Authority )
			return;

		HurtRadius(Damage,300.0, MyDamageType, MomentumTransfer, HitLocation );	 		 		
 		spawn(class'Botpack.ShockWave',,,HitLocation+ HitNormal*16);	
		RemoteRole = ROLE_SimulatedProxy;	 		 		
 		Destroy();
	}

defaultproperties
{
     ExploSound=Sound'UnrealShare.General.SpecialExpl'
     speed=1000.000000
     Damage=1000.000000
     MomentumTransfer=70000
     MyDamageType=RedeemerDeath
     ImpactSound=Sound'UnrealShare.General.Expla02'
     ExplosionDecal=Class'Botpack.NuclearMark'
     bNetTemporary=False
     RemoteRole=ROLE_SimulatedProxy
     LifeSpan=10.000000
     DrawType=DT_Sprite
     Style=STY_Translucent
     Texture=Texture'Rainbow.RedASMDAlt.RedASMDAlt_a00'
     DrawScale=0.400000
     bUnlit=True
     CollisionRadius=15.000000
     CollisionHeight=8.000000
     bProjTarget=True
     LightType=LT_Steady
     LightEffect=LE_NonIncidence
     LightBrightness=255
     LightSaturation=72
     LightRadius=6
     bFixedRotationDir=True
     RotationRate=(Pitch=45345,Yaw=33453,Roll=63466)
     DesiredRotation=(Pitch=23442,Yaw=34234,Roll=34234)
}
