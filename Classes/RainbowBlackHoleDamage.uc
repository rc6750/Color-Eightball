//=============================================================================
// RainbowBlackHoleDamage
//=============================================================================
class RainbowBlackHoleDamage extends DamageType
	abstract;

static function string DeathMessage()
{
	return "%o was crushed by %k's black hole.";
}

static function ScoreKill(Pawn Killer, Pawn Other)
{
	class'Rainbow.RainbowKillMessageHelper'.static.Send(Killer, Other, 7);
}

defaultproperties
{
	Name="crushed"
	AltName="crushed"
}
