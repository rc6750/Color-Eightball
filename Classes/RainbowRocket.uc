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

function bool IsRainbowRelatedMessage(Object OptionalObject, PlayerReplicationInfo KillerPRI, PlayerReplicationInfo VictimPRI)
{
	return (OptionalObject == class'Rainbow.Color_Eightball')
		|| PlayerHasRainbowLauncher(KillerPRI)
		|| PlayerHasRainbowLauncher(VictimPRI);
}

function bool IsRainbowDeathBundle(
	class<LocalMessage> Message,
	int Switch,
	Object OptionalObject,
	PlayerReplicationInfo KillerPRI,
	PlayerReplicationInfo VictimPRI
)
{
	if (Message != class'Botpack.DeathMessagePlus')
		return false;

	if (Switch != 0 && Switch != 8)
		return false;

	return IsRainbowRelatedMessage(OptionalObject, KillerPRI, VictimPRI);
}

function string PRIName(PlayerReplicationInfo PRI)
{
	if (PRI == None)
		return "None";

	return PRI.PlayerName;
}

function LogStockMessage(
	string Status,
	Actor Sender,
	Pawn Receiver,
	class<LocalMessage> Message,
	int Switch,
	PlayerReplicationInfo RelatedPRI_1,
	PlayerReplicationInfo RelatedPRI_2,
	Object OptionalObject
)
{
	local string ReceiverName;

	if (!class'Rainbow.Color_Eightball'.default.bLogRainbowKillMessages)
		return;

	if (Receiver != None && Receiver.PlayerReplicationInfo != None)
		ReceiverName = Receiver.PlayerReplicationInfo.PlayerName;
	else
		ReceiverName = "None";

	Log(
		"RainbowStockMessage "
		$ Status
		$ " message=" $ string(Message)
		$ " switch=" $ string(Switch)
		$ " pri1=" $ PRIName(RelatedPRI_1)
		$ " pri2=" $ PRIName(RelatedPRI_2)
		$ " receiver=" $ ReceiverName
		$ " optional=" $ string(OptionalObject)
		$ " sender=" $ string(Sender),
		'RainbowKill'
	);
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
	if (IsRainbowDeathBundle(Message, Switch, OptionalObject, RelatedPRI_1, RelatedPRI_2))
	{
		LogStockMessage("block", Sender, Receiver, Message, Switch, RelatedPRI_1, RelatedPRI_2, OptionalObject);
		return false;
	}

	if (Message == class'Botpack.DeathMessagePlus')
		LogStockMessage("allow", Sender, Receiver, Message, Switch, RelatedPRI_1, RelatedPRI_2, OptionalObject);

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
