//=============================================================================
// GreyProj.  Freeze Balls.
// turns character to ice statue
//=============================================================================
class GreyProj expands Projectile;

#exec TEXTURE IMPORT NAME=iceshard FILE=Textures\icer3.PCX GROUP="Skins"

var() Sound ExploSound;
var int NumExtraRockets;
var pawn Victim;
var vector v001;


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

	simulated function HitWall( vector HitNormal, actor Wall )
	{
		v001.X = 0;
		v001.Y = 0;
		v001.Z = 1;
		SetPhysics(PHYS_None);		
		MakeNoise(1);	
		PlaySound(ImpactSound);	
		skinnedFrag(class'UnrealShare.Fragment1',texture'iceshard',v001,0.7,50);
				
	}

	function BeginState()
	{
		Velocity = vector(Rotation) * speed;	
	}
}

function Freeze(vector HitLocation,vector HitNormal)
	{
		local FreezeBitch fb;
				
		if ( Role < ROLE_Authority )
			return;

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
	

simulated function skinnedFrag(class<fragment> FragType, texture FragSkin, vector Momentum, float DSize, int NumFrags) 
{
	local int i;
	local actor A, Toucher;
	local Fragment s;

	if (Event!='')
		foreach AllActors( class 'Actor', A, Event )
			A.Trigger( Toucher, pawn(Toucher) );
	if ( Region.Zone.bDestructive )
	{
		Destroy();
		return;
	}
	for (i=0 ; i<NumFrags ; i++) 
	{
		s = Spawn( FragType, Owner);
		s.CalcVelocity(Momentum/100,0);
		s.Skin = FragSkin;
		s.DrawScale = DSize*0.5+0.7*DSize*FRand();
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
     ImpactSound=Sound'UnrealShare.General.BreakGlass'
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
