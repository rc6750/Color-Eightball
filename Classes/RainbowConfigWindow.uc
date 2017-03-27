//=============================================================================
// RainbowConfigWindow.
//=============================================================================
class RainbowConfigWindow expands UWindowFramedWindow;

function BeginPlay()
{
Super.BeginPlay();

//Set the title of the Framed Window
WindowTitle = "Rainbow Rocket Launcher Settings";

//The class of the content
ClientClass = class'RainbowClientWindow';

bSizable = False;
}

function Created()
{
	Super.Created();
	SetSize(220, 140);
	WinLeft = (Root.WinWidth - WinWidth) / 2;
	WinTop = (Root.WinHeight - WinHeight) / 2;
}

defaultproperties
{
}
