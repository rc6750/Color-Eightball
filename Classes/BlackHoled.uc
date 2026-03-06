//=============================================================================
// BlackHoled.uc
//=============================================================================
class BlackHoled extends LocalMessagePlus;

var(Messages) localized string BlackHoledString;

static function float GetOffset(int Switch, float YL, float ClipY)
{
	return (Default.YPos/768.0) * ClipY - 2 * YL;
}

static function string GetString(
	optional int Switch,
	optional PlayerReplicationInfo RelatedPRI_1,
	optional PlayerReplicationInfo RelatedPRI_2,
	optional Object OptionalObject
)
{
	return Default.BlackHoledString;
}

defaultproperties
{
	BlackHoledString="You are being sucked into a black hole!"
	FontSize=2
	bIsSpecial=True
	bIsUnique=True
	bFadeMessage=True
	DrawColor=(R=128,G=0,B=255)
	YPos=196.000000
	bCenter=True
}