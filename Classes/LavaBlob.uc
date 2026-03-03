//=============================================================================
// LavaBlob
//=============================================================================
class LavaBlob extends UT_GreenBlob;

simulated function Setup(vector WallNormal)
{
    Super.Setup(WallNormal);

    // Force lava mesh texture every time
    Texture = Texture'Rainbow.Lava.Jlava';
    Skin = Texture'Rainbow.Lava.Jlava';
    
    // BioGelm commonly uses slot 1, so force them all
    MultiSkins[0] = Texture'Rainbow.Lava.Jlava';
    MultiSkins[1] = Texture'Rainbow.Lava.Jlava';
    MultiSkins[2] = Texture'Rainbow.Lava.Jlava';
    MultiSkins[3] = Texture'Rainbow.Lava.Jlava';
}

defaultproperties
{
    Texture=Texture'Rainbow.Lava.Jlava'
    Skin=Texture'Rainbow.Lava.Jlava'
    MultiSkins(0)=Texture'Rainbow.Lava.Jlava'
    MultiSkins(1)=Texture'Rainbow.Lava.Jlava'
    MultiSkins(2)=Texture'Rainbow.Lava.Jlava'
    MultiSkins(3)=Texture'Rainbow.Lava.Jlava'
}