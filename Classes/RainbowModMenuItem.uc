//=============================================================================
// RainbowModMenuItem.
//=============================================================================
class RainbowModMenuItem expands UMenuModMenuItem;

function Execute()
{ 
	MenuItem.Owner.Root.CreateWindow(class'RainbowConfigWindow',10,10,150,100);
}

defaultproperties
{
     MenuCaption="&Color Eightball Launcher Setup"
     MenuHelp="Configure the Color Eightball Launcher."
}
