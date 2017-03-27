//=============================================================================
// GoldProj.  FatExplosion, baby!
//=============================================================================
class GoldProj expands Projectile;

var() Sound ExploSound;
var int NumExtraRockets;
var pawn Victim;
var pawn Killer;

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
				Killer = Instigator;
				Victim = Pawn(Other);
				GotoState('FatBastard');
			}
		
	}

function BeginState()
	{
		Velocity = vector(Rotation) * speed;	
	}
}
	

function Explode(vector HitLocation, vector HitNormal)
{
	local Yellowteleeffect s;

	if ( Role < ROLE_Authority )
			return;		

	s = spawn(class'Rainbow.Yellowteleeffect',,,HitLocation + HitNormal*16);	
 	s.RemoteRole = ROLE_SimulatedProxy;	

	Destroy();
}


state FatBastard
{
ignores ProcessTouch, HitWall;
 function Timer()
 {
 	 if (Killer != None && Victim != None)
 	 {	
  		if (ClassIsChildOf(Level.Game.class, class'TeamGamePlus'))
  		{
			if (Instigator.PlayerReplicationInfo.Team != Victim.PlayerReplicationInfo.Team)
			{
	 			if(Victim.Health > 0)
	 			{
	  				if (Victim.Fatness < 248)
	  				{
						Victim.Fatness += 30;
						Victim.ReceiveLocalizedMessage( class'Rainbow.Tighter' );
	  				}
	  				else
	  				{
					Victim.TakeDamage(1000, Killer,Victim.Location,(MomentumTransfer * Normal(Velocity)), MyDamageType);
	    			Victim.Level.Game.DiscardInventory(Victim);
					Victim.PlaySound( Victim.Die, SLOT_Talk );
					Victim.ReceiveLocalizedMessage( class'Rainbow.FatExplosion' );	
					MakeNormal(Victim);
					GotoState('');
	  				}
				}
	 			else
				{
					MakeNormal(Victim);
					GotoState('');
	  			}		
			}
		}	
		else
		{
		 	if(Victim.Health > 0)
	 		{
	  			if (Victim.Fatness < 248)
	  			{
					Victim.Fatness += 30;
					Victim.ReceiveLocalizedMessage( class'Rainbow.Tighter' );
	  			}
	  			else
	  			{
					Victim.TakeDamage(1000, Killer,Victim.Location,(MomentumTransfer * Normal(Velocity)), MyDamageType);
				    Victim.Level.Game.DiscardInventory(Victim);
					Victim.PlaySound( Victim.Die, SLOT_Talk );
					Victim.ReceiveLocalizedMessage( class'Rainbow.FatExplosion' );	
					MakeNormal(Victim);
					GotoState('');
	 			}
			}
			else
			{
					MakeNormal(Victim);
					GotoState('');
			}		
		}
	}
  }

	
Begin:
	bHidden=True;
	SetCollision(False,False,False);
	SetTimer(0.5,True);
}

function MakeNormal(Pawn Victim)
{
	if (Victim != None)
	{
		Victim.Fatness = 128;
	}	
	
}

defaultproperties
{
     ExploSound=Sound'UnrealShare.General.SpecialExpl'
     speed=900.000000
     MaxSpeed=1600.000000
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
     Texture=Texture'Rainbow.GoldASMDAlt.GoldASMDAlt_a00'
     DrawScale=0.400000
     bUnlit=True
     CollisionRadius=12.000000
     CollisionHeight=12.000000
     bProjTarget=True
     LightType=LT_Steady
     LightEffect=LE_NonIncidence
     LightBrightness=255
     LightHue=50
     LightSaturation=72
     LightRadius=6
     bFixedRotationDir=True
     RotationRate=(Pitch=45345,Yaw=33453,Roll=63466)
     DesiredRotation=(Pitch=23442,Yaw=34234,Roll=34234)
}
