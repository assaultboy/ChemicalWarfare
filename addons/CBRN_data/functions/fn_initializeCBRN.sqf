/*
	Author: Assaultboy

	Description:
		This function will initizalize all CBRN variables
	
	Remark(s):
		This function should not be called, it is executed automatically
		This function must be excuted on the server

	Parameter(s):
		None

	Returns:
		Nothing
*/

//Handle our locality
if (!isServer) exitWith {nil};

//For storing all our contamination areas
CBRN_var_contaminatedAreas = [];

//For setting our various ace feature settings
CBRN_set_useACEMedical = ("ace_medical" call CBRN_fnc_isAddonLoaded);
CBRN_set_useACEInteraction = ("ace_interaction" call CBRN_fnc_isAddonLoaded);
CBRN_set_useACECommon = ("ace_common" call CBRN_fnc_isAddonLoaded);
publicVariable "CBRN_set_useACEMedical";
publicVariable "CBRN_set_useACEInteraction";
publicVariable "CBRN_set_useACECommon";

//Other various settings
CBRN_set_maxUseItemDistance = 5;
publicVariable "CBRN_set_maxUseItemDistance";