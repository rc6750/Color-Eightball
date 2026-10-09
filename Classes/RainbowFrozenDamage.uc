//=============================================================================
// RainbowFrozenDamage
//=============================================================================
class RainbowFrozenDamage extends DamageType
	abstract;

static function string DeathMessage()
{
	return "%k froze %o solid.";
}

static function ScoreKill(Pawn Killer, Pawn Other)
{
	class'Rainbow.RainbowKillMessageHelper'.static.Send(Killer, Other, 4);
}

defaultproperties
{
	Name="froze"
	AltName="froze"
}
