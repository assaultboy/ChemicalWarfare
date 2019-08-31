/*
	DESCRIPTION:
		This function will add the blur handler to the local machine
		This function is called automatically via CBA XEH
		
	PARAMETERS:
		None
			
	RETURNS
		Nothing
		
	EXAMPLE
		call CBRN_fnc_blurHandler
*/

//If we don't have a screen to blur then just exit
if (!hasInterface) exitWith {};

//This will force an immediate blur for the player if they are exposed
["CBRN_unitExposureChanged", {
	params ["_unit", "_isExposed"];
	
	//We only care about the player
	if (_unit != player) exitWith {};
	
	//Set our blur based on exposure, but if we are exposed then set it to max
	_blurAmount = ((_unit getVariable ["CBRN_exposure", 0]) / 5);
	if (_isExposed) then {_blurAmount = 8};
	
	_blurAmount call CBRN_fnc_blurScreen;
}] call CBA_fnc_addEventHandler;


//This will attempt to blur the screen to an appropriate level for our exposure
["CBRN_unitExposureLevelChanged", {
	params ["_unit", "_exposure"];
	
	//We only care about the player
	if (_unit != player) exitWith {};
	
	//We don't want to overwrite the CBRN_unitExposureChanged changes when actively exposed
	if (_unit getVariable ["CBRN_isCurrentlyExposed", false]) exitWith {};
	
	//Set our blur based on exposure
	((_unit getVariable ["CBRN_exposure", 0]) / 5) call CBRN_fnc_blurScreen;
}] call CBA_fnc_addEventHandler;



//This will un-blur the screen when a unit dies
//TODO: This
["CBRN_unitDied", {
	
}] call CBA_fnc_addEventHandler;