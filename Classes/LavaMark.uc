class LavaMark expands BioMark;

#exec TEXTURE IMPORT NAME=lavasplat FILE=TEXTURES\lavasplat1.PCX LODSET=2
#exec TEXTURE IMPORT NAME=lavasplat2 FILE=TEXTURES\lavasplat2.PCX LODSET=2

simulated function BeginPlay()
{
	if ( !Level.bDropDetail && (FRand() < 0.5) )
		Texture = texture'Botpack.biosplat2';
	Super.BeginPlay();
}

defaultproperties
{
     MultiDecalLevel=2
     Texture=Texture'Rainbow.lavasplat'
     DrawScale=0.650000
}