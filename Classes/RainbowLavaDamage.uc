//=============================================================================
// RainbowLavaDamage
//=============================================================================
class RainbowLavaDamage extends DamageType
	abstract;

static function string DeathMessage()
{
	return "%o was melted by %k.";
}

static function ScoreKill(Pawn Killer, Pawn Other)
{
	class'Rainbow.RainbowKillMessageHelper'.static.Send(Killer, Other, 6, 'RainbowLavaDamage');
}

defaultproperties
{
	Name="melted"
	AltName="melted"
}
