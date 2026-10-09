//=============================================================================
// RainbowKillMessageHelper
//=============================================================================
class RainbowKillMessageHelper extends Object
	abstract;

var int NextMessageSlot;
var PlayerReplicationInfo LastKillerPRI;
var PlayerReplicationInfo LastVictimPRI;
var int LastEffect;
var float LastSendTime;
var PlayerReplicationInfo LastMultiKillerPRI;
var float LastMultiKillTime;
var int MultiKillLevel;

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

static function string EffectName(int Effect)
{
	switch (Effect)
	{
		case 1: return "rocket";
		case 2: return "nuke";
		case 3: return "disintegrate";
		case 4: return "freeze";
		case 5: return "fat";
		case 6: return "lava";
		case 7: return "blackhole";
		case 8: return "teleport";
	}

	return "unknown";
}

static function LogEvent(string Status, Pawn Killer, Pawn Victim, int Effect, name Source)
{
	local string KillerName;
	local string VictimName;
	local int KillerHealth;
	local int VictimHealth;
	local float TimeSeconds;

	if (!class'Rainbow.Color_Eightball'.default.bLogRainbowKillMessages)
		return;

	if (Killer != None)
	{
		KillerHealth = Killer.Health;
		TimeSeconds = Killer.Level.TimeSeconds;
		if (Killer.PlayerReplicationInfo != None)
			KillerName = Killer.PlayerReplicationInfo.PlayerName;
	}
	if (KillerName == "")
		KillerName = "None";

	if (Victim != None)
	{
		VictimHealth = Victim.Health;
		if (Victim.PlayerReplicationInfo != None)
			VictimName = Victim.PlayerReplicationInfo.PlayerName;
	}
	if (VictimName == "")
		VictimName = "None";

	Log(
		"RainbowKillMessage "
		$ Status
		$ " source=" $ string(Source)
		$ " effect=" $ string(Effect) $ "/" $ EffectName(Effect)
		$ " killer=" $ KillerName $ " health=" $ string(KillerHealth)
		$ " victim=" $ VictimName $ " health=" $ string(VictimHealth)
		$ " time=" $ string(TimeSeconds),
		'RainbowKill'
	);
}

static function bool IsDuplicate(Pawn Killer, Pawn Victim, int Effect)
{
	if (Killer == None || Victim == None)
		return false;

	return (Killer.PlayerReplicationInfo == Default.LastKillerPRI)
		&& (Victim.PlayerReplicationInfo == Default.LastVictimPRI)
		&& (Effect == Default.LastEffect)
		&& ((Killer.Level.TimeSeconds - Default.LastSendTime) < 0.35);
}

static function Remember(Pawn Killer, Pawn Victim, int Effect)
{
	Default.LastKillerPRI = Killer.PlayerReplicationInfo;
	Default.LastVictimPRI = Victim.PlayerReplicationInfo;
	Default.LastEffect = Effect;
	Default.LastSendTime = Killer.Level.TimeSeconds;
}

static function LogMultiKill(Pawn Killer, int Switch, name Source)
{
	if (!class'Rainbow.Color_Eightball'.default.bLogRainbowKillMessages)
		return;

	Log(
		"RainbowMultiKill send"
		$ " source=" $ string(Source)
		$ " switch=" $ string(Switch)
		$ " killer=" $ Killer.PlayerReplicationInfo.PlayerName
		$ " time=" $ string(Killer.Level.TimeSeconds),
		'RainbowKill'
	);
}

static function MaybeSendMultiKill(Pawn Killer, name Source)
{
	local int MultiKillSwitch;

	if (PlayerPawn(Killer) == None)
		return;

	if (Killer.PlayerReplicationInfo != Default.LastMultiKillerPRI
		|| (Killer.Level.TimeSeconds - Default.LastMultiKillTime) > 3.0)
	{
		Default.LastMultiKillerPRI = Killer.PlayerReplicationInfo;
		Default.MultiKillLevel = 0;
	}

	Default.MultiKillLevel++;
	Default.LastMultiKillTime = Killer.Level.TimeSeconds;

	if (Default.MultiKillLevel > 1)
	{
		MultiKillSwitch = Default.MultiKillLevel - 1;
		if (MultiKillSwitch > 4)
			MultiKillSwitch = 4;

		PlayerPawn(Killer).ReceiveLocalizedMessage(
			class'Botpack.MultiKillMessage',
			MultiKillSwitch,
			None,
			Killer.PlayerReplicationInfo
		);
		LogMultiKill(Killer, MultiKillSwitch, Source);
	}
}

static function Send(Pawn Killer, Pawn Victim, int Effect, optional name Source)
{
	local int Slot;

	if (Victim == None || Killer == None || Killer == Victim)
	{
		LogEvent("skip-invalid", Killer, Victim, Effect, Source);
		return;
	}

	if (Killer.PlayerReplicationInfo == None || Victim.PlayerReplicationInfo == None)
	{
		LogEvent("skip-no-pri", Killer, Victim, Effect, Source);
		return;
	}

	if (IsDuplicate(Killer, Victim, Effect))
	{
		LogEvent("skip-duplicate", Killer, Victim, Effect, Source);
		return;
	}

	Remember(Killer, Victim, Effect);
	LogEvent("send", Killer, Victim, Effect, Source);
	MaybeSendMultiKill(Killer, Source);

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
