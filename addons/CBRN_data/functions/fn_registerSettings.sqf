/*
	Author: Assaultboy

	Description:
		This function will register all the settings for CBRN
	
	Remark(s):
		This function should not be called, it is executed automatically

	Parameter(s):
		None

	Returns:
		Nothing
*/

//Client Settings
if (hasInterface) then {
	//Show hints on item use
	["CBRN_set_showItemHints", "CHECKBOX", ["Show Item Hints", "Display a hint when a consumable item is used (Eg. Decontamination Kit)"], "Chemical Warfare", true, 2] call cba_settings_fnc_init;
	
	//Show ACE self interaction options
	["CBRN_set_showAceSelfInteractions", "CHECKBOX", ["Self Interact Actions", "Add Chemical Equipment to the ACE self interact menu"], "Chemical Warfare", true, 2] call cba_settings_fnc_init;
	
	//Show ACE interaction options
	["CBRN_set_showAceInteractions", "CHECKBOX", ["Interact Actions", "Add Chemical Equipment to the ACE interact menu"], "Chemical Warfare", true, 2] call cba_settings_fnc_init;
};