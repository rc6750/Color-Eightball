//=============================================================================
// RainbowFatDamage
//=============================================================================
class RainbowFatDamage extends DamageType
	abstract;

static function string DeathMessage()
{
	return "%k inflated %o until they popped.";
}

static function ScoreKill(Pawn Killer, Pawn Other)
{
	class'Rainbow.RainbowKillMessageHelper'.static.Send(Killer, Other, 5);
}

defaultproperties
{
	Name="inflated"
	AltName="inflated"
}
