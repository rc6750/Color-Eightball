//=============================================================================
// lavaPUFFFF.
//=============================================================================
class LavaPuff expands UT_GreenGelPuff;

#exec TEXTURE IMPORT NAME=lava1r_a00 FILE=Textures\lava1r_a00.pcx GROUP="Lava" MIPS=OFF FLAGS=2
#exec TEXTURE IMPORT NAME=lava2r_a00 FILE=Textures\lava2r_a00.pcx GROUP="Lava" MIPS=OFF FLAGS=2
#exec TEXTURE IMPORT NAME=lava3r_a00 FILE=Textures\lava3r_a00.pcx GROUP="Lava" MIPS=OFF FLAGS=2

simulated function Timer()
{
	Local LavaBlob GB;
	local int j;

	if ( (Level.NetMode != NM_DedicatedServer) && (numBlobs > 0) && Level.bHighDetailMode && !Level.bDropDetail )
	{
		numBlobs = FMin(numBlobs, 5);
		for (j=0; j<numBlobs; j++) 
		{
			GB = Spawn(class'LavaBlob',,,Location+SurfaceNormal*(FRand()*8-4));
			if (GB != None)
			{
				GB.SetUp(SurfaceNormal);
				GB.RemoteRole = ROLE_None;
			}
		}
	}
}

defaultproperties
{
     
     SSprites(0)=Texture'Rainbow.Lava.lava1r_a00'
     SSprites(1)=Texture'Rainbow.Lava.lava2r_a00'
     SSprites(2)=Texture'Rainbow.Lava.lava3r_a00'
     SSprites(3)=None
     Texture=Texture'Rainbow.Lava.lava1r_a00'
 
}
