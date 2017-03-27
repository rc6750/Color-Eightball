//=============================================================================
// RainbowClientWindow.
//=============================================================================
class RainbowClientWindow expands UWindowDialogClientWindow;

var UWindowCheckBox Redeemers;
var UWindowSmallCloseButton CloseButton;

function Created()

{
	// Use Redeemers
	Redeemers = UWindowCheckBox(CreateControl(class'UWindowCheckBox', 10, 25, 150, 1));
	Redeemers.SetText("Use Redeemers: ");
	Redeemers.SetHelpText("Enable Red Redeemer Balls.");
	Redeemers.bChecked = class'Color_Eightball'.default.bRedeemer;

	// Finished button
	CloseButton = UWindowSmallCloseButton(CreateWindow(class'UWindowSmallCloseButton', 152, 100, 48, 16));
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
				}
		case DE_Click:
			switch(C){		
				case CloseButton:
					class'Color_Eightball'.default.bRedeemer=Redeemers.bChecked;
					class'Color_Eightball'.static.StaticSaveConfig();
					break;
				}	
						
		break;
		}
}
	

defaultproperties
{
}