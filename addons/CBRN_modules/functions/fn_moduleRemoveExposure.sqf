/*
	DESCRIPTION:
		This function is used by the zeus module to remove exposure from a given unit
		This function is called automatically by the module
		
	PARAMETERS:
		Logic
			The logic object
		
		Unit
			Affected units
			
		Activated
			Has the module been activated
			
	RETURNS
		Nothing
		
	EXAMPLE
		_this call CBRN_fnc_moduleRemoveExposure
*/

params ["_logic", "_unit", "_activated"];

//Only worry about the curators machine
if (!local _logic) exitWith {};

//Get our selected unit or fail gracefully
private _unit = [_logic, [
	[{_this isKindOf "CAManBase"}, "PLACE ON A UNIT"]
]] call CBRN_fnc_moduleHandleCuratorPlacement;

//If we failed we can just leave
if (isNull _unit) exitWith{};

//This will broadcast everywhere, which we don't really care about but we can't target the machine that object is local to so fuck it
_unit setVariable ["CBRN_exposure", 0, true];

["CBRN_unitExposureLevelChanged", [_unit, 0], _unit] call CBA_fnc_targetEvent;

deleteVehicle _logic;