//=============================================================================
//
//=============================================================================
class LavaSplash extends BioSplash;

#exec TEXTURE IMPORT NAME=Jlava FILE=Textures\Jlava.pcx GROUP="Lava" MIPS=OFF FLAGS=2

simulated function PostBeginPlay()
{
    Super.PostBeginPlay();

    // Force lava appearance on mesh too
    Texture = Texture'Rainbow.Lava.Jlava';
    Skin    = Texture'Rainbow.Lava.Jlava';
    MultiSkins[0] = Texture'Rainbow.Lava.Jlava';

    // Force lava light (orange/red)
    LightType       = LT_Steady;
    LightEffect     = LE_NonIncidence;
    LightHue        = 16;     // red/orange range
    LightSaturation = 255;
    LightBrightness = 120;
    LightRadius     = 3;
}

function Timer()
{
	local LavaPuff f;

	f = spawn(class'LavaPuff',,,Location + SurfaceNormal*8); 
	f.numBlobs = numBio;
	if ( numBio > 0 )
		f.SurfaceNormal = SurfaceNormal;	
	PlaySound (MiscSound,,3.0*DrawScale);	
	if ( (Mover(Base) != None) && Mover(Base).bDamageTriggered )
		Base.TakeDamage( Damage, instigator, Location, MomentumTransfer * Normal(Velocity), MyDamageType);
	
	HurtRadius(damage * Drawscale, FMin(250, DrawScale * 75), MyDamageType, MomentumTransfer * Drawscale, Location);
	Destroy();	
}

simulated function SetWall(vector HitNormal, Actor Wall)
{
	local rotator RandRot;

	SurfaceNormal = HitNormal;
	if ( Level.NetMode != NM_DedicatedServer )
		spawn(class'LavaMark',,,Location, rotator(SurfaceNormal));
	RandRot = rotator(HitNormal);
	RandRot.Roll += 32768;
	SetRotation(RandRot);	
	if ( Mover(Wall) != None )
		SetBase(Wall);
}

defaultproperties
{
	RemoteRole=ROLE_SimulatedProxy
	bNetTemporary=False
	LifeSpan=2.000000
	Texture=Texture'Rainbow.Lava.Jlava'
	MyDamageType=Rainbow
	Skin=Texture'Rainbow.Lava.Jlava'
    MultiSkins(0)=Texture'Rainbow.Lava.Jlava'

    LightType=LT_Steady
    LightEffect=LE_NonIncidence
    LightBrightness=120
    LightHue=16
    LightSaturation=255
    LightRadius=3
}