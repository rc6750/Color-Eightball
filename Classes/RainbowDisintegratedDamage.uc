//=============================================================================
// RainbowDisintegratedDamage
//=============================================================================
class RainbowDisintegratedDamage extends DamageType
	abstract;

static function string DeathMessage()
{
	return "%o was disintegrated by %k.";
}

static function ScoreKill(Pawn Killer, Pawn Other)
{
	class'Rainbow.RainbowKillMessageHelper'.static.Send(Killer, Other, 3, 'RainbowDisintegratedDamage');
}

defaultproperties
{
	Name="disintegrated"
	AltName="disintegrated"
}
