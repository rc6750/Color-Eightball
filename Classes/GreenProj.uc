//=============================================================================
// GreenProj.
//=============================================================================
class GreenProj expands Projectile;

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
		if ( (Other != instigator) && !Other.IsA('Projectile')  && !Other.IsA('Effects') )
			{ 	
			Disintegrate(HitLocation,Normal(HitLocation-Other.Location),Pawn(Other));
			}
	}

	function BeginState()
	{
		Velocity = vector(Rotation) * speed;	
	}
}

function Explode(vector HitLocation, vector HitNormal)
{
	local UTteleeffect s;

	if ( Role < ROLE_Authority )
			return;		

	s = spawn(class'Botpack.UTteleeffect',,,HitLocation + HitNormal*16);	
 	s.RemoteRole = ROLE_SimulatedProxy;	

	Destroy();
}


function Disintegrate(vector HitLocation,vector HitNormal, Pawn Victim)


	{
		local UTteleeffect s;
		
		if ( Role < ROLE_Authority )
			return;

		s = spawn(class'Botpack.UTteleeffect',,,HitLocation + HitNormal*16);	
 		s.RemoteRole = ROLE_SimulatedProxy;
	
	if (Instigator != None && Victim != None)
	{	
	  if (ClassIsChildOf(Level.Game.class, class'TeamGamePlus'))
	  {
	   if (Instigator.PlayerReplicationInfo.Team != Victim.PlayerReplicationInfo.Team)
		{	

		Victim.level.game.Killed(Instigator, Victim, 'disintegrated');
		Victim.HidePlayer();
		Victim.Level.Game.DiscardInventory(Victim);
		Victim.Health = -1;
		Victim.GotoState('Dying');	

		Victim.ReceiveLocalizedMessage( class'Rainbow.Disintigrated' );
		}
	   }
	else
	   {		
 		Victim.level.game.Killed(Instigator, Victim, 'disintegrated');
		Victim.HidePlayer();
		Victim.Level.Game.DiscardInventory(Victim);
		Victim.Health = -1;
		Victim.GotoState('Dying');	

		Victim.ReceiveLocalizedMessage( class'Rainbow.Disintigrated' );
	    }
	   }	
		Destroy();
	}

defaultproperties
{
     ExploSound=Sound'UnrealShare.General.SpecialExpl'
     speed=900.000000
     MaxSpeed=1600.000000
     Damage=455.000000
     MomentumTransfer=70000
     MyDamageType=Corroded
     MiscSound=Sound'UnrealShare.General.Explg02'
     ExplosionDecal=Class'Botpack.EnergyImpact'
     bNetTemporary=False
     RemoteRole=ROLE_SimulatedProxy
     LifeSpan=10.000000
     DrawType=DT_Sprite
     Style=STY_Translucent
     Texture=Texture'Rainbow.GrenASMDAlt.GrenASMDAlt_a00'
     DrawScale=0.400000
     bUnlit=True
     CollisionRadius=15.000000
     CollisionHeight=15.000000
     bProjTarget=True
     LightType=LT_Steady
     LightEffect=LE_NonIncidence
     LightBrightness=255
     LightHue=85
     LightSaturation=72
     LightRadius=6
     bFixedRotationDir=True
     RotationRate=(Pitch=45345,Yaw=33453,Roll=63466)
     DesiredRotation=(Pitch=23442,Yaw=34234,Roll=34234)
}
