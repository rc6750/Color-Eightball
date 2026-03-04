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
var() class<LocalMessage> MsgClass;

simulated function PostBeginPlay()
{
    Super.PostBeginPlay();

    PP = PlayerPawn(Owner);
    StartTime = Level.TimeSeconds;

    if (PP != None)
    {
        // show HUD message
        if (MsgClass != None)
        PP.ReceiveLocalizedMessage(MsgClass);
        
        // remember prior state so we can restore it
        bWasBehind = PP.bBehindView;

        // force 3rd person on client
        PP.ConsoleCommand("behindview 1");
    }

    SetTimer(0.10, true);
}

simulated function Timer()
{
    if (PP == None)
    {
        Destroy();
        return;
    }

    // stop if landed OR time exceeded
    if (PP.Physics != PHYS_Falling || (Level.TimeSeconds - StartTime) > MaxTime)
    {
        // restore whatever they had before
        if (bWasBehind)
            PP.ConsoleCommand("behindview 1");
        else
            PP.ConsoleCommand("behindview 0");

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