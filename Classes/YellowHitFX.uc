class YellowHitFX extends Effects;

var int Frame;

simulated function PostBeginPlay()
{
	if (Level.NetMode == NM_DedicatedServer)
	{
		Destroy();
		return;
	}

	DrawType = DT_Sprite;
	Style = STY_Translucent;
	bUnlit = True;

	SetTimer(0.04, true);
	SetFrame();
}

simulated function SetFrame()
{
	switch(Frame)
	{
		case 0: Texture = Texture'UnrealShare.DispExpl.dseY_A00'; break;
		case 1: Texture = Texture'UnrealShare.DispExpl.dseY_A01'; break;
		case 2: Texture = Texture'UnrealShare.DispExpl.dseY_A02'; break;
		case 3: Texture = Texture'UnrealShare.DispExpl.dseY_A03'; break;
		case 4: Texture = Texture'UnrealShare.DispExpl.dseY_A04'; break;
		case 5: Texture = Texture'UnrealShare.DispExpl.dseY_A05'; break;
		case 6: Texture = Texture'UnrealShare.DispExpl.dseY_A06'; break;
		case 7: Texture = Texture'UnrealShare.DispExpl.dseY_A07'; break;
		case 8: Texture = Texture'UnrealShare.DispExpl.dseY_A08'; break;
		case 9: Texture = Texture'UnrealShare.DispExpl.dseY_A09'; break;
		case 10: Texture = Texture'UnrealShare.DispExpl.dseY_A00'; break;
		case 11: Texture = Texture'UnrealShare.DispExpl.dseY_A01'; break;
		case 12: Texture = Texture'UnrealShare.DispExpl.dseY_A02'; break;
		case 13: Texture = Texture'UnrealShare.DispExpl.dseY_A03'; break;
		case 14: Texture = Texture'UnrealShare.DispExpl.dseY_A04'; break;
		case 15: Texture = Texture'UnrealShare.DispExpl.dseY_A05'; break;
		case 16: Texture = Texture'UnrealShare.DispExpl.dseY_A06'; break;
		case 17: Texture = Texture'UnrealShare.DispExpl.dseY_A07'; break;
		case 18: Texture = Texture'UnrealShare.DispExpl.dseY_A08'; break;
		case 19: Texture = Texture'UnrealShare.DispExpl.dseY_A09'; break;
	}
}

simulated function Timer()
{
	Frame++;

	if (Frame > 19)
	{
		Destroy();
		return;
	}

	SetFrame();
}

defaultproperties
{
	RemoteRole=ROLE_SimulatedProxy
	DrawScale=2.7
	ScaleGlow=1.0
	LifeSpan=2
}