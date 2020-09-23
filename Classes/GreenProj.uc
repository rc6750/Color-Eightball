//=============================================================================
// GreenProj.
// Green projectile = disintegrate 
// =============================================================================
class GreenProj expands Projectile;

var() Sound ExploSound;
var int NumExtraRockets;
var int NumSplash;
var vector SpawnPoint;
var bool bOnGround;
var vector SurfaceNormal;

simulated function PostBeginPlay()
{
	Super.PostBeginPlay();
	if ( Level.bDropDetail )
		LightType = LT_None;
}

simulated function SetWall(vector HitNormal, Actor Wall)
{
	local rotator RandRot;

	SurfaceNormal = HitNormal;
	if ( Level.NetMode != NM_DedicatedServer )
		spawn(class'BioMark',,,Location, rotator(SurfaceNormal));
	RandRot = rotator(HitNormal);
	RandRot.Roll += 32768;
	SetRotation(RandRot);	
	if ( Mover(Wall) != None )
		SetBase(Wall);
}

auto state Flying
{
	function ProcessTouch (Actor Other, vector HitLocation)
	{
		if ( (Other != instigator) && !Other.IsA('Projectile')  && !Other.IsA('Effects') )
			{ 	
				Disintegrate(HitLocation,Normal(HitLocation-Other.Location),Pawn(Other));	
			}
		if ( Pawn(Other)!=Instigator || bOnGround) 
		   Global.Timer(); 
	}

	simulated function HitWall( vector HitNormal, actor Wall )
	{
		bHidden = True;
		SetPhysics(PHYS_None);		
		MakeNoise(1);	
		bOnGround = True;
		NumSplash = 20;
		PlaySound(ImpactSound);	
		SetWall(HitNormal, Wall);
		if ( DrawScale > 1 )
			NumSplash = int(2 * DrawScale) - 1;
		SpawnPoint = Location + 5 * HitNormal;
		DrawScale= FMin(DrawScale, 3.0);
		if ( NumSplash > 0 )
		{
			SpawnSplash();
			if ( NumSplash > 0 )
				SpawnSplash();
		}
		GoToState('OnSurface');
	
		
	}

	function BeginState()
	{
		Velocity = vector(Rotation) * speed;	
	}
}

function Disintegrate(vector HitLocation,vector HitNormal, Pawn Victim)
  
    {

    	if ( Role < ROLE_Authority )
			return;

		
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
	    SpawnPoint = HitLocation + 5 * HitNormal;
	    SpawnTsunami();
		Destroy();
	}

function SpawnSplash()
{
	local vector Start;

	NumSplash--;
	Start = SpawnPoint + 4 * VRand(); 
	Spawn(class'BioSplash',,,Start,Rotator(Start - Location));
}

function SpawnTsunami()
{
	local vector Start;
	local int splash;
	local int maxsplash; 

	splash = 0;
	maxsplash = 150;

	while( splash < maxsplash )
		{
   			splash = splash + 1;
			Start = SpawnPoint + 4 * VRand(); 
			Spawn(class'BioSplash',,,Start,Rotator(Start - Location));
   		If(splash >= maxsplash) 
   		break; 
		}
	
}


state OnSurface
{
	function Tick(float DeltaTime)
	{
		if ( NumSplash > 0 )
		{
			SpawnSplash();
			if ( NumSplash > 0 )
				SpawnSplash();
			else
				Disable('Tick');
		}
		else
			Disable('Tick');
	}

	function ProcessTouch (Actor Other, vector HitLocation)
	{
		if ( Other.IsA('BioSplash') )
			return;
		GotoState('Exploding');
	}
}

defaultproperties
{
     ExploSound=Sound'UnrealShare.Gibs.Gib4'
     speed=900.000000
     MaxSpeed=1600.000000
     Damage=455.000000
     MomentumTransfer=70000
     MyDamageType=RocketDeath
     MiscSound=Sound'UnrealShare.Tentacle.splat2tn'
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
