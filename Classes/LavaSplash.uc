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
	local Pawn P;
	local float Radius;
	local Pawn HitPawn[32];
	local int HitHealth[32];
	local int HitCount;
	local int i;

	f = spawn(class'LavaPuff',,,Location + SurfaceNormal*8); 
	f.numBlobs = numBio;
	if ( numBio > 0 )
		f.SurfaceNormal = SurfaceNormal;	
	PlaySound (MiscSound,,3.0*DrawScale);	
	if ( (Mover(Base) != None) && Mover(Base).bDamageTriggered )
		Base.TakeDamage( Damage, instigator, Location, MomentumTransfer * Normal(Velocity), MyDamageType);
	
	Radius = FMin(250, DrawScale * 75);

	foreach RadiusActors(class'Pawn', P, Radius, Location)
		if (P != None && P != Instigator && P.Health > 0 && HitCount < 32)
		{
			HitPawn[HitCount] = P;
			HitHealth[HitCount] = P.Health;
			HitCount++;
		}

	HurtRadius(damage * Drawscale, Radius, MyDamageType, MomentumTransfer * Drawscale, Location);

	for (i = 0; i < HitCount; i++)
		if (HitPawn[i] != None && HitHealth[i] > 0 && HitPawn[i].Health <= 0)
			class'Rainbow.RainbowKillMessageHelper'.static.Send(Instigator, HitPawn[i], 6);

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
	LifeSpan=6.000000
	Texture=Texture'Rainbow.Lava.Jlava'
	MyDamageType=RainbowLavaDamage
	Skin=Texture'Rainbow.Lava.Jlava'
    MultiSkins(0)=Texture'Rainbow.Lava.Jlava'

    LightType=LT_Steady
    LightEffect=LE_NonIncidence
    LightBrightness=120
    LightHue=16
    LightSaturation=255
    LightRadius=3
}
