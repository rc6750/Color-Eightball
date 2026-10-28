//=============================================================================
// TeleportRadiusEffect.
// A client-visible ring that marks the effective radius of a teleport impact.
//=============================================================================
class TeleportRadiusEffect extends Effects;

// ShockWavem has a radius of roughly 29 Unreal units at DrawScale 1.0.
const ShockWaveRadiusAtUnitScale = 29.0;

var float TeleportRadius;

replication
{
	reliable if (Role == ROLE_Authority)
		TeleportRadius;
}

simulated function InitRadius(float NewRadius)
{
	TeleportRadius = NewRadius;
	DrawScale = TeleportRadius / ShockWaveRadiusAtUnitScale;
	ScaleGlow = 1.45;
}

simulated function Tick(float DeltaTime)
{
	local float Progress;

	if (Level.NetMode == NM_DedicatedServer || TeleportRadius <= 0)
		return;

	// Begin at the same boundary used by RadiusActors, then collapse inward.
	Progress = 1.0 - (LifeSpan / Default.LifeSpan);
	DrawScale = (TeleportRadius / ShockWaveRadiusAtUnitScale) * (1.0 - Progress);
	// Fade as the ring closes so it disappears cleanly at the impact point.
	ScaleGlow = 1.45 * (1.0 - Progress);
	AmbientGlow = 255;
}

defaultproperties
{
	bAlwaysRelevant=True
	RemoteRole=ROLE_SimulatedProxy
	LifeSpan=1.500000
	DrawType=DT_Mesh
	Style=STY_Translucent
	Mesh=LodMesh'Rainbow.ShockWavem'
	Texture=Texture'Rainbow.Skins.Shockt1'
	Skin=Texture'Rainbow.Skins.Shockt1'
	bUnlit=True
	AmbientGlow=255
	bNetTemporary=True
}
