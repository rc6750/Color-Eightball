class LavaMark expands BioMark;

#exec TEXTURE IMPORT NAME=lavasplat FILE=TEXTURES\lavasplat.PCX LODSET=2 GROUP="Lava"
#exec TEXTURE IMPORT NAME=lavasplat2 FILE=TEXTURES\lavasplat2.PCX LODSET=2 GROUP="Lava"

simulated function BeginPlay()
{
    Super.BeginPlay();

    if ( !Level.bDropDetail && (FRand() < 0.5) )
        Texture = texture'Rainbow.Lava.lavasplat2';
    else
        Texture = texture'Rainbow.Lava.lavasplat';

    //Log("LavaMark spawned. Texture="$Texture);
}

defaultproperties
{
     MultiDecalLevel=2
     Style=STY_Modulated
     Texture=Texture'Rainbow.Lava.lavasplat'
     DrawScale=0.650000
}