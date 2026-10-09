//=============================================================================
// RainbowRedeemerDamage
//=============================================================================
class RainbowRedeemerDamage extends DamageType
	abstract;

static function string DeathMessage()
{
	return "%o was nuked by %k's %w.";
}

static function ScoreKill(Pawn Killer, Pawn Other)
{
	class'Rainbow.RainbowKillMessageHelper'.static.Send(Killer, Other, 2, 'RainbowRedeemerDamage');
}

defaultproperties
{
	Name="nuked"
	AltName="nuked"
}
