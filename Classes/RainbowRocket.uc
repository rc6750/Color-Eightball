//=============================================================================
// Rainbow Rocket
//=============================================================================


class RainbowRocket expands Mutator;

function bool CheckReplacement (Actor Other, out byte bSuperRelevant)
{
	if (Other.IsA('UT_EightBall'))
	{
		ReplaceWith(Other, "Rainbow.Color_Eightball");    
		return false;
	}
	
	if (Other.IsA('RocketPack'))
	{
		ReplaceWith(Other, "Rainbow.ColorRocketPack");    
		return false;
	}
	
	return true;
}

defaultproperties
{
}
