//=============================================================================
// LavaMeltEffect.
// A temporary copy of a lava victim that sinks into a bubbling lava puddle.
//=============================================================================
class LavaMeltEffect extends Actor;

var vector MeltStart;
var float MeltProgress;
var float PuffTimer;

function CopyAppearanceFrom(Pawn Victim)
{
	local int i;

	if (Victim == None)
		return;

	Mesh = Victim.Mesh;
	Skin = Victim.Skin;
	Texture = Victim.Texture;
	AnimSequence = Victim.AnimSequence;
	AnimFrame = Victim.AnimFrame;
	DrawScale = Victim.DrawScale;
	SetRotation(Victim.Rotation);

	for (i = 0; i < 8; i++)
		MultiSkins[i] = Victim.MultiSkins[i];
}

simulated function PostBeginPlay()
{
	local LavaMark Mark;

	// Do not call Decoration.PostBeginPlay: it does not exist in UT v436.
	MeltStart = Location;

	if (Level.NetMode != NM_DedicatedServer)
	{
		Mark = Spawn(class'Rainbow.LavaMark',,, Location, rot(16384,0,0));
		if (Mark != None)
			Mark.RemoteRole = ROLE_None;
	}
}

simulated function Tick(float DeltaTime)
{
	local LavaPuff Puff;

	MeltProgress = 1.0 - (LifeSpan / Default.LifeSpan);
	SetLocation(MeltStart - vect(0,0,44) * MeltProgress);
	DrawScale = Default.DrawScale * (1.0 - 0.45 * MeltProgress);
	ScaleGlow = 1.0;

	if (Level.NetMode == NM_DedicatedServer)
		return;

	PuffTimer += DeltaTime;
	if (PuffTimer >= 0.36)
	{
		PuffTimer = 0;
		// Keep the bubbling low so the melting body remains easy to read.
		Puff = Spawn(class'Rainbow.LavaPuff',,, Location - vect(0,0,20) + VRand() * 10);
		if (Puff != None)
		{
			Puff.numBlobs = 1;
			Puff.SurfaceNormal = vect(0,0,1);
			Puff.RemoteRole = ROLE_None;
		}
	}
}

defaultproperties
{
	bStatic=False
	bNoDelete=False
	bAlwaysRelevant=True
	bNetTemporary=True
	RemoteRole=ROLE_SimulatedProxy
	LifeSpan=3.000000
	DrawType=DT_Mesh
	Style=STY_Normal
	bUnlit=True
	AmbientGlow=255
	CollisionRadius=0.000000
	CollisionHeight=0.000000
	bCollideActors=False
	bCollideWorld=False
	bBlockActors=False
	bBlockPlayers=False
	Physics=PHYS_None
}
