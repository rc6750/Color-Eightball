//=============================================================================
// GreyTeleEffect.
//=============================================================================
class GreyTeleEffect extends Effects;

#exec MESH IMPORT MESH=GreyTele ANIVFILE=MODELS\Tele2_a.3d DATAFILE=MODELS\Tele2_d.3d X=0 Y=0 Z=0

#exec MESH SEQUENCE MESH=GreyTele SEQ=All                   STARTFRAME=0 NUMFRAMES=100
#exec MESH SEQUENCE MESH=GreyTele SEQ=GreyTeleport                 STARTFRAME=0 NUMFRAMES=100
#exec MESHMAP NEW   MESHMAP=GreyTele MESH=GreyTele
#exec MESHMAP SCALE MESHMAP=GreyTele X=0.1 Y=0.1 Z=0.2

#exec TEXTURE IMPORT NAME=Grey_01 FILE=Textures\Grey.pcx GROUP=Skins
#exec MESHMAP SETTEXTURE MESHMAP=GreyTele NUM=1 TEXTURE=Grey_01


function PostBeginPlay()
{
	Super.PostBeginPlay();
	LoopAnim('GreyTeleport', 2.0, 0.0);
}

defaultproperties
{
     RemoteRole=ROLE_None
     LifeSpan=1.000000
     DrawType=DT_Mesh
     Style=STY_Translucent
     Mesh=LodMesh'Rainbow.GreyTele'
     bUnlit=True
}
