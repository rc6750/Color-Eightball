//=============================================================================
// BlackHoleFX.uc
// Visual-only helper for the black hole core + wisps.
//=============================================================================
class BlackHoleFX extends Actor;

var() float Radius;
var() float LifeTimeSeconds;
var float StartTime;
var float Phase;

simulated function PostBeginPlay()
{
    Super.PostBeginPlay();
    StartTime = Level.TimeSeconds;
    SetTimer(0.08, true); // spawn wisps
}

simulated function Tick(float DeltaTime)
{
    local float A;

    Phase += DeltaTime * 4.0;

    // pulse size
    A = 0.85 + 0.25 * Sin(Phase);
    DrawScale = A;

    // auto-die
    if ((Level.TimeSeconds - StartTime) > LifeTimeSeconds)
        Destroy();
}

simulated function Timer()
{
    local BlackHoleWisp W;
    local vector P, V;

    P = Location + VRand() * Radius;
    P.Z = Location.Z + (FRand()*2 - 1) * (Radius * 0.25);

    W = Spawn(class'Rainbow.BlackHoleWisp',,, P);
    if (W == None)
        return;

    // random size
    W.DrawScale = 0.20 + FRand()*0.25;

    // inward velocity
    V = Normal(Location - P) * (400 + FRand()*500);
    W.Velocity = V;
    W.SetRotation(Rotator(V));
}

defaultproperties
{
    RemoteRole=ROLE_SimulatedProxy
    bNetTemporary=True
    bAlwaysRelevant=True

    DrawType=DT_Sprite
    Style=STY_Translucent
    Texture=Texture'Botpack.FlareFX.utflare7'
    DrawScale=1.0
    bUnlit=True

    Radius=650.0
    LifeTimeSeconds=3.0
    LifeSpan=8.0
}