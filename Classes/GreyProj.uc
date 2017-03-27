//=============================================================================
// GreyProj.  Freeze Balls.
//=============================================================================
class GreyProj expands Projectile;

var() Sound ExploSound;
var int NumExtraRockets;
var pawn Victim;

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
		if ( (Other != instigator) && !Other.IsA('Projectile') && !Other.IsA('Effects') )
		{
			Victim = Pawn(Other);
			Freeze(HitLocation,Normal(HitLocation-Other.Location));
		}
	}

	function BeginState()
	{
		Velocity = vector(Rotation) * speed;	
	}
}

function Explode(vector HitLocation, vector HitNormal)
{
	local Greyteleeffect s;

	if ( Role < ROLE_Authority )
			return;		

	s = spawn(class'Rainbow.Greyteleeffect',,,HitLocation + HitNormal*16);	
 	s.RemoteRole = ROLE_SimulatedProxy;	

	Destroy();
}

function Freeze(vector HitLocation,vector HitNormal)
	{
		local FreezeBitch fb;
		local Greyteleeffect s;
		
		if ( Role < ROLE_Authority )
			return;

		s = spawn(class'Rainbow.Greyteleeffect',,,HitLocation + HitNormal*16);	
 		s.RemoteRole = ROLE_SimulatedProxy;

	if (Instigator != None && Victim != None)
	{	
	  if (ClassIsChildOf(Level.Game.class, class'TeamGamePlus'))
	  {
            if (Instigator.PlayerReplicationInfo.Team != Victim.PlayerReplicationInfo.Team)
 	    {

		fb = spawn(class'Rainbow.FreezeBitch',,,,Victim.rotation);
		fb.mesh=Victim.mesh;
		fb.animsequence=Victim.animsequence;	
	
		Victim.level.game.Killed(Instigator, Victim, 'freezed');
		Victim.HidePlayer();
		Victim.Level.Game.DiscardInventory(Victim);
		Victim.Health = -1;
		Victim.GotoState('Dying');	

		Victim.ReceiveLocalizedMessage( class'Rainbow.Frozen' );
            }
	  }
	else
	  {
		fb = spawn(class'Rainbow.FreezeBitch',,,,Victim.rotation);
		fb.mesh=Victim.mesh;
		fb.animsequence=Victim.animsequence;	

		Victim.level.game.Killed(Instigator, Victim, 'freezed');
		Victim.HidePlayer();
		Victim.Level.Game.DiscardInventory(Victim);
		Victim.Health = -1;
		Victim.GotoState('Dying');
	
		Victim.ReceiveLocalizedMessage( class'Rainbow.Frozen' );
		
          }
	}
 		Destroy();
}
	

defaultproperties
{
     ExploSound=Sound'UnrealShare.General.SpecialExpl'
     speed=900.000000
     MaxSpeed=1600.000000
     Damage=75.000000
     MomentumTransfer=70000
     MyDamageType=RocketDeath
     ImpactSound=Sound'UnrealShare.General.Expla02'
     ExplosionDecal=Class'Botpack.EnergyImpact'
     bNetTemporary=False
     RemoteRole=ROLE_SimulatedProxy
     LifeSpan=10.000000
     DrawType=DT_Sprite
     Style=STY_Translucent
     Texture=Texture'Rainbow.GreyASMDAlt.GreyASMDAlt_a00'
     DrawScale=0.400000
     bUnlit=True
     CollisionRadius=15.000000
     CollisionHeight=15.000000
     bProjTarget=True
     LightType=LT_Steady
     LightEffect=LE_NonIncidence
     LightBrightness=255
     LightHue=165
     LightSaturation=255
     LightRadius=6
     bFixedRotationDir=True
     RotationRate=(Pitch=45345,Yaw=33453,Roll=63466)
     DesiredRotation=(Pitch=23442,Yaw=34234,Roll=34234)
}
