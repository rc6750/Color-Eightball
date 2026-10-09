//=============================================================================
// RainbowKillMessageHelper
//=============================================================================
class RainbowKillMessageHelper extends Object
	abstract;

var int NextMessageSlot;

static function int NextSlot()
{
	local int Slot;

	Slot = Default.NextMessageSlot;
	Default.NextMessageSlot++;
	if (Default.NextMessageSlot >= 6)
		Default.NextMessageSlot = 0;

	return Slot;
}

static function SendTo(PlayerPawn P, int Slot, int Switch, PlayerReplicationInfo VictimPRI, PlayerReplicationInfo KillerPRI)
{
	switch (Slot)
	{
		case 0:
			P.ReceiveLocalizedMessage(class'Rainbow.RainbowKillMessageLine0', Switch, VictimPRI, KillerPRI);
			return;
		case 1:
			P.ReceiveLocalizedMessage(class'Rainbow.RainbowKillMessageLine1', Switch, VictimPRI, KillerPRI);
			return;
		case 2:
			P.ReceiveLocalizedMessage(class'Rainbow.RainbowKillMessageLine2', Switch, VictimPRI, KillerPRI);
			return;
		case 3:
			P.ReceiveLocalizedMessage(class'Rainbow.RainbowKillMessageLine3', Switch, VictimPRI, KillerPRI);
			return;
		case 4:
			P.ReceiveLocalizedMessage(class'Rainbow.RainbowKillMessageLine4', Switch, VictimPRI, KillerPRI);
			return;
	}

	P.ReceiveLocalizedMessage(class'Rainbow.RainbowKillMessageLine5', Switch, VictimPRI, KillerPRI);
}

static function Send(Pawn Killer, Pawn Victim, int Effect)
{
	local int Slot;

	if (Victim == None || Killer == None || Killer == Victim)
		return;

	if (Killer.PlayerReplicationInfo == None || Victim.PlayerReplicationInfo == None)
		return;

	Slot = NextSlot();

	if (PlayerPawn(Killer) != None)
		SendTo(
			PlayerPawn(Killer),
			Slot,
			Effect,
			Victim.PlayerReplicationInfo,
			Killer.PlayerReplicationInfo
		);

	if (PlayerPawn(Victim) != None)
		SendTo(
			PlayerPawn(Victim),
			Slot,
			Effect + 100,
			Victim.PlayerReplicationInfo,
			Killer.PlayerReplicationInfo
		);
}
