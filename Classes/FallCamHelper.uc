//=============================================================================
// FallCamHelper.uc
// Forces behindview while owner is falling, then reverts.
// UT99-safe (uses ConsoleCommand).
//=============================================================================
class FallCamHelper extends Actor;

var() float MaxTime;
var PlayerPawn PP;
var float StartTime;
var bool bWasBehind;

simulated function PostBeginPlay()
{
    Super.PostBeginPlay();

    PP = PlayerPawn(Owner);
    if (PP == None)
        PP = PlayerPawn(Instigator);

    // If we still can't resolve PP immediately, try again next tick
    if (PP == None)
    {
        SetTimer(0.01, false);
        return;
    }

    StartHelper();
}

simulated function StartHelper()
{
    // MESSAGE (hardcoded, no replication needed)
    PP.ReceiveLocalizedMessage(class'Rainbow.Teleported');

    // CAMERA (leave as you had it working)
    bWasBehind = PP.bBehindView;
    PP.ConsoleCommand("behindview 1");

    StartTime = Level.TimeSeconds;
    SetTimer(0.10, true);
}

simulated function Timer()
{
    // one-shot retry path if PP was missing
    if (PP == None)
    {
        PP = PlayerPawn(Owner);
        if (PP == None)
            PP = PlayerPawn(Instigator);

        if (PP == None)
            return;

        StartHelper();
        return;
    }

    // normal fall cam logic
    if (PP.Physics != PHYS_Falling || (Level.TimeSeconds - StartTime) > MaxTime)
    {
        // STOP the tumble spin
        PP.bRotateToDesired = false;
        PP.RotationRate = rot(0,0,0);
        
        if (bWasBehind) PP.ConsoleCommand("behindview 1");
        else           PP.ConsoleCommand("behindview 0");

        Destroy();
    }
}

defaultproperties
{
    RemoteRole=ROLE_SimulatedProxy
    bAlwaysRelevant=True
    bNetTemporary=True
    MaxTime=3.0
}