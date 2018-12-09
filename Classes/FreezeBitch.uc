//=============================================================================
// FreezeBitch
// this creates an ice statue based on the character model after they are hit and killed by the grey projectile
//=============================================================================
class FreezeBitch expands Decoration;

#exec TEXTURE IMPORT NAME=iceskin FILE=Textures\icer2.PCX GROUP="Skins"

var float itime,lifetime;
var() texture tex1;
var() sound FreezeSound;
var vector v001;

simulated function BeginPlay()
{
	Super.BeginPlay();
	lifetime=0;
	itime=0;
	skin=tex1;
	PlaySound (FreezeSound);	
	MakeNoise(1.0);		
	v001.X=0;
	v001.Y=0;
	v001.Z=1;
}

simulated function tick(float DeltaTime){
	lifetime+=DeltaTime;
	if(lifetime>=15) takedamage(10,PlayerPawn(Owner),Location,v001,'');
	if (lifetime>(itime+30*frand())){
		itime=lifetime;
		if(skin==tex1) skin=tex1;
		else skin=tex1;
	}	
}

auto state active
{
	function TakeDamage( int NDamage, Pawn instigatedBy, Vector hitlocation, 
						Vector momentum, name damageType)
	{
		PlaySound (Sound'BreakGlass');
		skinnedFrag(class'UnrealShare.Fragment1',texture'iceskin', Momentum,0.7,17);
		Instigator = InstigatedBy;
		if ( Instigator != None )
			MakeNoise(1.0);
	}

Begin:
}

defaultproperties
{
     tex1=Texture'Rainbow.Skins.iceskin'
     bPushable=True
     bStatic=False
     Physics=PHYS_Falling
     RemoteRole=ROLE_SimulatedProxy
     DrawType=DT_Mesh
     Skin=Texture'Rainbow.Skins.iceskin'
     CollisionRadius=35.000000
     CollisionHeight=46.000000
     bCollideActors=True
     bCollideWorld=True
     bBlockActors=True
     bBlockPlayers=True
}
