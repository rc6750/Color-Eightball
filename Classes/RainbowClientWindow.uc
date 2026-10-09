//=============================================================================
// RainbowClientWindow.
//=============================================================================
class RainbowClientWindow expands UWindowDialogClientWindow;

var UWindowCheckBox Redeemers;
var UWindowCheckBox RandomizeLoadedRockets;
var UWindowSmallCloseButton CloseButton;

function Created()

{
	// Use Redeemers
	Redeemers = UWindowCheckBox(CreateControl(class'UWindowCheckBox', 10, 25, 150, 1));
	Redeemers.SetText("Use Redeemers: ");
	Redeemers.SetHelpText("Enable Red Redeemer Balls.");
	Redeemers.bChecked = class'Color_Eightball'.default.bRedeemer;

	// Randomize loaded rockets
	RandomizeLoadedRockets = UWindowCheckBox(CreateControl(class'UWindowCheckBox', 10, 50, 190, 1));
	RandomizeLoadedRockets.SetText("Randomize Loaded Rockets: ");
	RandomizeLoadedRockets.SetHelpText("Loaded rockets each get a random color/effect.");
	RandomizeLoadedRockets.bChecked = class'Color_Eightball'.default.bRandomizeLoadedRockets;

	// Finished button
	CloseButton = UWindowSmallCloseButton(CreateWindow(class'UWindowSmallCloseButton', 152, 115, 48, 16));
	CloseButton.SetText( "Finished" );	
}

function Notify(UWindowDialogControl C, byte E)
{

	switch(E) {
		case DE_Change: // the message sent by sliders and checkboxes
			switch(C) {
				case Redeemers:
					class'Color_Eightball'.default.bRedeemer=Redeemers.bChecked;
					class'Color_Eightball'.static.StaticSaveConfig();
					break;
				case RandomizeLoadedRockets:
					class'Color_Eightball'.default.bRandomizeLoadedRockets=RandomizeLoadedRockets.bChecked;
					class'Color_Eightball'.static.StaticSaveConfig();
					break;
				}
		case DE_Click:
			switch(C){		
				case CloseButton:
					class'Color_Eightball'.default.bRedeemer=Redeemers.bChecked;
					class'Color_Eightball'.default.bRandomizeLoadedRockets=RandomizeLoadedRockets.bChecked;
					class'Color_Eightball'.static.StaticSaveConfig();
					break;
				}	
						
		break;
		}
}
	

defaultproperties
{
}
