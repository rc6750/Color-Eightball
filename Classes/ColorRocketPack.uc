//=============================================================================
// ColorRocketPack.
//=============================================================================
class ColorRocketPack extends TournamentAmmo;

#exec MESH IMPORT MESH=C_RocketPackMesh ANIVFILE=MODELS\rocketpackmesh_a.3D DATAFILE=MODELS\rocketpackmesh_d.3D X=0 Y=0 Z=0
#exec MESH ORIGIN MESH=C_RocketPackMesh X=0 Y=0 Z=0 ROLL=-64
#exec MESH SEQUENCE MESH=C_RocketPackMesh SEQ=All    STARTFRAME=0  NUMFRAMES=1
#exec MESHMAP SCALE MESHMAP=C_RocketPackMesh X=0.036 Y=0.036 Z=0.072
#exec MESHMAP SETTEXTURE MESHMAP=C_RocketPackMesh NUM=1 TEXTURE=Botpack.BoltHit.phit_a00

defaultproperties
{
     AmmoAmount=24
     MaxAmmo=48
     UsedInWeaponSlot(5)=1
     PickupMessage="You picked up a Color Eightball Rocket pack."
     PickupViewMesh=LodMesh'Rainbow.C_RocketPackMesh'
     MaxDesireability=0.300000
     Physics=PHYS_Falling
     Mesh=LodMesh'Rainbow.C_RocketPackMesh'
     CollisionRadius=27.000000
     CollisionHeight=12.000000
     bCollideActors=True
}
