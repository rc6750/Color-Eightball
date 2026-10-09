//=============================================================================
// RainbowRocketDamage
//=============================================================================
class RainbowRocketDamage extends DamageType
	abstract;

static function string DeathMessage()
{
	return "%o was blasted by %k's %w.";
}

static function ScoreKill(Pawn Killer, Pawn Other)
{
	class'Rainbow.RainbowKillMessageHelper'.static.Send(Killer, Other, 1);
}

defaultproperties
{
	Name="blasted"
	AltName="blasted"
}
