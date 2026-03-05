//=============================================================================
// FrozenWeaponProp.uc
// A simple mesh prop that we position relative to the ice statue.
//=============================================================================
class FrozenWeaponProp extends Decoration;

defaultproperties
{
    RemoteRole=ROLE_SimulatedProxy
    DrawType=DT_Mesh
    Physics=PHYS_None

    bStatic=False
    bCollideActors=False
    bCollideWorld=False
    bBlockActors=False
    bBlockPlayers=False
}