//=============================================================================
// BlackHoleWisp.uc
// Small sprite projectile that flies inward briefly.
//=============================================================================
class BlackHoleWisp extends Projectile;

simulated function PostBeginPlay()
{
	Super.PostBeginPlay();
	// no collision, just visual
	SetCollision(false, false, false);
}

simulated function Tick(float DeltaTime)
{
	// gently bend trajectory (simple swirl)
	Velocity = Velocity + (Normal(Velocity cross vect(0,0,1)) * 120 * DeltaTime);
}

defaultproperties
{
	RemoteRole=ROLE_SimulatedProxy
	bNetTemporary=True
	LifeSpan=0.6

	DrawType=DT_Sprite
	Style=STY_Translucent
	Texture=Texture'Botpack.FlareFX.utflare7'
	DrawScale=0.30
	bUnlit=True

	Physics=PHYS_Projectile
	Speed=1.0
	MaxSpeed=2000.0

	CollisionRadius=0.0
	CollisionHeight=0.0
	bCollideWorld=False
	bProjTarget=False
}