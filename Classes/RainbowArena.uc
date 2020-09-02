//=============================================================================
// Color Eightball Launcher Arena.
// replaces all weapons and ammo with Rainbow Launchers and ammo
// well...except for the translocator because i like it.
//=============================================================================

class RainbowArena expands Arena;

function bool CheckReplacement(Actor Other, out byte bSuperRelevant)
{
	if ( Other.IsA('Translocator') )
		return true;

	return Super.CheckReplacement( Other, bSuperRelevant );
/*

	if ( Other.IsA('Ammo') )
	{
		if ((AmmoString != "") && !Other.IsA(AmmoName))
			ReplaceWith(Other, AmmoString);
		return false;
	}

	bSuperRelevant = 0;
	return true;
*/
}

defaultproperties
{
     WeaponName=Color_Eightball
     AmmoName=ColorRocketPack
     WeaponString="Rainbow.Color_Eightball"
     AmmoString="Rainbow.ColorRocketPack"
     DefaultWeapon=Class'Rainbow.Color_Eightball'
}
