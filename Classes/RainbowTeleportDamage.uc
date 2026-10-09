//=============================================================================
// RainbowTeleportDamage
//=============================================================================
class RainbowTeleportDamage extends DamageType
	abstract;

static function string DeathMessage()
{
	return "%k teleported %o somewhere fatal.";
}

static function ScoreKill(Pawn Killer, Pawn Other)
{
	class'Rainbow.RainbowKillMessageHelper'.static.Send(Killer, Other, 8);
}

defaultproperties
{
	Name="teleported"
	AltName="teleported"
}
