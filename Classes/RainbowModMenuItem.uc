//=============================================================================
// RainbowModMenuItem.
//=============================================================================
class RainbowModMenuItem expands UMenuModMenuItem;

const MenuCaption = "&Rainbow Launcher Setup";

function Execute()
{ 
	MenuItem.Owner.Root.CreateWindow(class'RainbowConfigWindow',10,10,150,100);
}

defaultproperties
{
     MenuCaption="&Rainbow Launcher Setup"
     MenuHelp="Configure the Rainbow Rocket Launcher."
}
