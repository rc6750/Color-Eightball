//=============================================================================
// YellowTeleEffect.
//=============================================================================
class YellowTeleEffect extends Effects;

#exec MESH IMPORT MESH=YellowTele ANIVFILE=MODELS\Tele2_a.3d DATAFILE=MODELS\Tele2_d.3d X=0 Y=0 Z=0

#exec MESH SEQUENCE MESH=YellowTele SEQ=All                   STARTFRAME=0 NUMFRAMES=100
#exec MESH SEQUENCE MESH=YellowTele SEQ=YellowTeleport                 STARTFRAME=0 NUMFRAMES=100
#exec MESHMAP NEW   MESHMAP=YellowTele MESH=YellowTele
#exec MESHMAP SCALE MESHMAP=YellowTele X=0.1 Y=0.1 Z=0.2

#exec TEXTURE IMPORT NAME=Yellow_01 FILE=Textures\Yellow.pcx GROUP=Skins
#exec MESHMAP SETTEXTURE MESHMAP=YellowTele NUM=1 TEXTURE=Yellow_01


function PostBeginPlay()
{
	Super.PostBeginPlay();
	LoopAnim('YellowTeleport', 2.0, 0.0);
}

defaultproperties
{
     RemoteRole=ROLE_None
     LifeSpan=1.000000
     DrawType=DT_Mesh
     Style=STY_Translucent
     Mesh=LodMesh'Rainbow.YellowTele'
     bUnlit=True
}
