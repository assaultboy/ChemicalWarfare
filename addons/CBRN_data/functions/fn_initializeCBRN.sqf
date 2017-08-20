/*
	Author: Assaultboy

	Description:
		This function will initizalize all CBRN variables
	
	Remark(s):
		This function should not be called, it is executed automatically

	Parameter(s):
		None

	Returns:
		Nothing
*/

//Start with Server only variables
if (isServer) then {

	//For storing all our contamination areas
	CBRN_var_contaminatedAreas = [];
	
	//The farthest we can use items on other players
	CBRN_set_maxUseItemDistance = 5;
};

//Then we have our shared variables

//For setting our various ace feature settings
CBRN_set_useACEMedical = ("ace_medical" call CBRN_fnc_isAddonLoaded);
CBRN_set_useACEInteraction = ("ace_interaction" call CBRN_fnc_isAddonLoaded);
CBRN_set_useACECommon = ("ace_common" call CBRN_fnc_isAddonLoaded);