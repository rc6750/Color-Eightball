//=============================================================================
// RainbowKillMessage
//=============================================================================
class RainbowKillMessage extends LocalMessagePlus;

static function float GetOffset(int Switch, float YL, float ClipY)
{
	return (Default.YPos / 768.0) * ClipY - 2 * YL;
}

static function string PlayerName(PlayerReplicationInfo PRI)
{
	if (PRI == None)
		return "someone";

	return PRI.PlayerName;
}

static function string GetString(
	optional int Switch,
	optional PlayerReplicationInfo RelatedPRI_1,
	optional PlayerReplicationInfo RelatedPRI_2,
	optional Object OptionalObject
	)
{
	local string VictimName;
	local string KillerName;

	VictimName = PlayerName(RelatedPRI_1);
	KillerName = PlayerName(RelatedPRI_2);

	if (Switch < 100)
	{
		switch (Switch)
		{
			case 1: return "You blasted " $ VictimName $ ".";
			case 2: return "You nuked " $ VictimName $ ".";
			case 3: return "You disintegrated " $ VictimName $ ".";
			case 4: return "You froze " $ VictimName $ ".";
			case 5: return "You inflated " $ VictimName $ " until they popped.";
			case 6: return "You melted " $ VictimName $ ".";
			case 7: return "You crushed " $ VictimName $ " with a black hole.";
			case 8: return "You teleported " $ VictimName $ " somewhere fatal.";
		}
	}
	else
	{
		switch (Switch - 100)
		{
			case 1: return "You were blasted by " $ KillerName $ ".";
			case 2: return "You were nuked by " $ KillerName $ ".";
			case 3: return "You were disintegrated by " $ KillerName $ ".";
			case 4: return "You were frozen by " $ KillerName $ ".";
			case 5: return "You were inflated by " $ KillerName $ " until you popped.";
			case 6: return "You were melted by " $ KillerName $ ".";
			case 7: return "You were crushed by " $ KillerName $ "'s black hole.";
			case 8: return "You were teleported somewhere fatal by " $ KillerName $ ".";
		}
	}

	return "";
}

defaultproperties
{
	FontSize=2
	bIsSpecial=True
	bIsUnique=False
	bFadeMessage=True
	DrawColor=(R=0,G=128,B=255)
	YPos=360.000000
	bCenter=True
}
