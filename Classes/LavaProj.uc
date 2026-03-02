//=============================================================================
// LavaProj.
// lava projectile
//=============================================================================
class LavaProj extends Projectile;

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
          spawn(class'LavaMark',,,Location, rotator(SurfaceNormal));
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
          local vector HN;
          HN = HitLocation - Other.Location;
               if ( VSize(HN) < 1 )
               {HN = vector(Rotation);}

          if ( (Other != instigator) && !Other.IsA('Projectile')  && !Other.IsA('Effects') )
               {    
                    LavaHit(HitLocation, Normal(HN), Pawn(Other));    
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

function LavaHit(vector HitLocation,vector HitNormal, Pawn Victim)
  
    {

     if ( Role < ROLE_Authority )
               return;

         SpawnPoint = HitLocation + 5 * HitNormal;
         SpawnTsunami();
         Destroy();
     }


function SpawnSplash()
{
     local vector Start;

     NumSplash--;
     Start = SpawnPoint + 4 * VRand(); 
     Spawn(class'LavaSplash',,,Start,Rotator(Start - Location));
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
               Spawn(class'LavaSplash',,,Start,Rotator(Start - Location));
          If(splash >= maxsplash) 
          break; 
          }
     
}

state Exploding
{
    function BeginState()
    {
        if ( SpawnPoint == vect(0,0,0) )
            SpawnPoint = Location;

        SpawnTsunami();

        if (ExploSound != None)
            PlaySound(ExploSound);

        Destroy();
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
          if ( Other.IsA('LavaSplash') )
               return;
          GotoState('Exploding');
     }
}

simulated function Tick(float DeltaTime)
{
     Super.Tick(DeltaTime);

     if (Level.NetMode == NM_DedicatedServer)
          return;

     // spawn occasional smoke puff behind the projectile
     if (FRand() < 0.03)
          Spawn(class'Botpack.UT_SpriteSmokePuff',,, Location - Normal(Velocity) * 18);
}





defaultproperties
{
     ExploSound=Sound'UnrealShare.General.SpecialExpl'
     Speed=1000.000000
     Damage=55.000000
     MomentumTransfer=70000
     MyDamageType='RainbowDamage'
     ImpactSound=Sound'UnrealShare.General.Expla02'
     ExplosionDecal=Class'Botpack.EnergyImpact'
     bNetTemporary=False
     RemoteRole=ROLE_SimulatedProxy
     LifeSpan=10.000000

     DrawType=DT_Sprite
     Style=STY_Translucent
     Texture=Texture'Rainbow.LavaASMDAlt.LavaASMDAlt_a00'
     DrawScale=0.400000
     bUnlit=True

     CollisionRadius=15.000000
     CollisionHeight=8.000000
     bProjTarget=True

     LightType=LT_Steady
     LightEffect=LE_NonIncidence
     LightBrightness=120
     LightHue=25
     LightSaturation=200
     LightRadius=5

     bFixedRotationDir=True
     RotationRate=(Pitch=45345,Yaw=33453,Roll=63466)
     DesiredRotation=(Pitch=23442,Yaw=34234,Roll=34234)
}