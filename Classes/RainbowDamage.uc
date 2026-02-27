//=============================================================================
// RainbowDamage
//=============================================================================
class RainbowDamage extends DamageType
    abstract;

static function string DeathMessage()
{
    // UT replaces %o (victim), %k (killer), %w (weapon) when it formats the message.
    return "%o was bitch slapped by %k's %w.";
}

defaultproperties
{
    // Not strictly required since we override DeathMessage(), but harmless:
    Name="killed"
    AltName="killed"
}