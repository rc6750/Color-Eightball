//=============================================================================
// Disintigrated message. Received by victim when hit by Green projectile
//=============================================================================


class Disintigrated expands LocalMessagePlus;

var(Messages)	localized string 	disintegratedString;

static function float GetOffset(int Switch, float YL, float ClipY )
{
	return (Default.YPos/768.0) * ClipY - 2*YL;
}

static function string GetString(
	optional int Switch,
	optional PlayerReplicationInfo RelatedPRI_1, 
	optional PlayerReplicationInfo RelatedPRI_2,
	optional Object OptionalObject 
	)
{
	
	return Default.disintegratedString;

}

static simulated function ClientReceive( 
	PlayerPawn P,
	optional int Switch,
	optional PlayerReplicationInfo RelatedPRI_1, 
	optional PlayerReplicationInfo RelatedPRI_2,
	optional Object OptionalObject
	)
{
	Super.ClientReceive(P, Switch, RelatedPRI_1, RelatedPRI_2, OptionalObject);

}

defaultproperties
{
     disintegratedString="You were DISINTEGRATED!!"
     FontSize=2
     bIsSpecial=True
     bIsUnique=True
     bFadeMessage=True
     DrawColor=(R=0,B=0)
     YPos=196.000000
     bCenter=True
}
