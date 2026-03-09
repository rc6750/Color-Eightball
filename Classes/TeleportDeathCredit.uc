//=============================================================================
// TeleportDeathCredit.uc
// Credits environmental / void death after teleport to the shooter.
//=============================================================================
class TeleportDeathCredit extends Actor;

var Pawn  Victim;
var Pawn  Killer;
var float ExpireTime;
var name  CreditDamageType;

var bool  bWasFalling;
var float FallStartTime;
var float StartZ;
var float LastZ;

function Init(Pawn V, Pawn K, float Duration, name DmgType)
{
	Victim           = V;
	Killer           = K;
	ExpireTime       = Level.TimeSeconds + Duration;
	CreditDamageType = DmgType;

	if (Victim != None)
	{
		StartZ = Victim.Location.Z;
		LastZ  = Victim.Location.Z;
	}

	SetTimer(0.02, true);
}

function Timer()
{
	local float  FallDist;
	local float  FallTime;

	if (Role != ROLE_Authority)
		return;

	if (Victim == None || Victim.bDeleteMe)
	{
		Destroy();
		return;
	}

	if (Level.TimeSeconds > ExpireTime)
	{
		Destroy();
		return;
	}

	// If they are already dead, too late.
	if (Victim.Health <= 0)
	{
		Destroy();
		return;
	}

	// Pain / kill zones: kill them yourself immediately before the zone does.
	if (Victim.Region.Zone != None)
	{
		if (Victim.Region.Zone.bPainZone || Victim.Region.Zone.bKillZone)
		{
			CreditKill();
			return;
		}
	}

	// Track falling
	if (Victim.Physics == PHYS_Falling && Victim.Velocity.Z < -200)
	{
		if (!bWasFalling)
		{
			bWasFalling   = true;
			FallStartTime = Level.TimeSeconds;
			StartZ        = Victim.Location.Z;
		}
	}
	else if (Victim.Physics != PHYS_Falling)
	{
		// Landed or otherwise recovered
		bWasFalling = false;
	}

	// Predict "fell into space / doomed fall" before the engine counts it as suicide.
	if (bWasFalling)
	{
		FallDist = StartZ - Victim.Location.Z;
		FallTime = Level.TimeSeconds - FallStartTime;

		if (Victim.Velocity.Z < -900 && FallTime > 0.60 && FallDist > 900)
		{
			CreditKill();
			return;
		}
	}

	LastZ = Victim.Location.Z;
}

function CreditKill()
{
	if (Victim == None || Victim.bDeleteMe)
	{
		Destroy();
		return;
	}

	if (Victim.Health <= 0)
	{
		Destroy();
		return;
	}

	if (Killer == None)
		Killer = Victim;

	Victim.Died(Killer, CreditDamageType, Victim.Location);
	Destroy();
}

defaultproperties
{
	RemoteRole=ROLE_None
	bHidden=True
	bCollideActors=False
	bCollideWorld=False
}