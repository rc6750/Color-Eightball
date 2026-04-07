//=============================================================================
// RainbowConfigWindow.
//=============================================================================
class RainbowConfigWindow expands UWindowFramedWindow;

const VERSION = "1.06";

function BeginPlay()
{
Super.BeginPlay();

//Set the title of the Framed Window
WindowTitle = "Color Eightball Settings v" $ VERSION;

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
