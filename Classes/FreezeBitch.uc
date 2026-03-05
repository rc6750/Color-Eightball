//=============================================================================
// FreezeBitch
// this creates an ice statue based on the character model after they are hit and killed by the grey projectile
//=============================================================================
class FreezeBitch expands Decoration;

#exec TEXTURE IMPORT NAME=iceskin FILE=Textures\icer1.PCX GROUP="Skins"

var float itime,lifetime;
var() texture tex1;
var() sound FreezeSound;
var vector v001;
var FrozenWeaponProp FrozenGun;

var() vector WeaponOffset;     // tweak per pose/model
var() rotator WeaponRotOffset; // tweak per weapon/model

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
	SetupFrozenWeaponFrom(Pawn(Owner));
}

function SetupFrozenWeaponFrom(Pawn VP)
{
    local Mesh WMesh;
    local int i;

    if (VP == None || VP.Weapon == None)
        return;

    WMesh = VP.Weapon.ThirdPersonMesh;
    if (WMesh == None)
        WMesh = VP.Weapon.PickupViewMesh;

    if (WMesh == None)
        return;

    FrozenGun = Spawn(class'Rainbow.FrozenWeaponProp', self);
    if (FrozenGun == None)
        return;

    FrozenGun.Mesh = WMesh;
    FrozenGun.Skin = tex1;         // ice it too
    for (i = 0; i < 8; i++)
        FrozenGun.MultiSkins[i] = tex1;
    FrozenGun.SetBase(self);       // follow statue

    UpdateFrozenWeapon();          // place it immediately
}

function UpdateFrozenWeapon()
{
    local vector Off;

    if (FrozenGun == None)
        return;

    // Rotate the offset with the statue’s rotation so it stays “in hand” directionally
    Off = WeaponOffset >> Rotation;

    FrozenGun.SetLocation(Location + Off);
    FrozenGun.SetRotation(Rotation + WeaponRotOffset);
}

simulated function tick(float DeltaTime){
	UpdateFrozenWeapon();
	lifetime+=DeltaTime;
	if(lifetime>=25) takedamage(10,PlayerPawn(Owner),Location,v001,'');
	if (lifetime>(itime+30*frand())){
		itime=lifetime;
		if(skin==tex1) skin=tex1;
		else skin=tex1;
	}	
}

simulated function Destroyed()
{
    if (FrozenGun != None)
        FrozenGun.Destroy();
    Super.Destroyed();
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
     WeaponOffset=(X=20,Y=8,Z=15)
	WeaponRotOffset=(Pitch=0,Yaw=16384,Roll=0)
}
