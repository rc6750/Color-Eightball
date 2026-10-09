//=============================================================================
// Rainbow Rocket
//=============================================================================


class RainbowRocket expands Mutator;

function PostBeginPlay()
{
	Super.PostBeginPlay();

	if (Level.Game != None)
		Level.Game.RegisterMessageMutator(Self);
}

function bool PlayerHasRainbowLauncher(PlayerReplicationInfo PRI)
{
	local Pawn P;
	local Inventory Inv;

	if (PRI == None)
		return false;

	for (P = Level.PawnList; P != None; P = P.NextPawn)
		if (P.PlayerReplicationInfo == PRI)
		{
			if (P.Weapon != None && P.Weapon.IsA('Color_Eightball'))
				return true;

			for (Inv = P.Inventory; Inv != None; Inv = Inv.Inventory)
				if (Inv.IsA('Color_Eightball'))
					return true;
		}

	return false;
}

function bool IsRainbowDeathMessage(
	class<LocalMessage> Message,
	int Switch,
	Object OptionalObject,
	PlayerReplicationInfo KillerPRI
)
{
	if (Message != class'Botpack.DeathMessagePlus')
		return false;

	if (Switch != 0 && Switch != 8)
		return false;

	return (OptionalObject == class'Rainbow.Color_Eightball') || PlayerHasRainbowLauncher(KillerPRI);
}

function bool MutatorBroadcastLocalizedMessage(
	Actor Sender,
	Pawn Receiver,
	out class<LocalMessage> Message,
	out optional int Switch,
	out optional PlayerReplicationInfo RelatedPRI_1,
	out optional PlayerReplicationInfo RelatedPRI_2,
	out optional Object OptionalObject
)
{
	if (IsRainbowDeathMessage(Message, Switch, OptionalObject, RelatedPRI_1))
		return false;

	if (NextMessageMutator != None)
		return NextMessageMutator.MutatorBroadcastLocalizedMessage(Sender, Receiver, Message, Switch, RelatedPRI_1, RelatedPRI_2, OptionalObject);

	return true;
}

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
