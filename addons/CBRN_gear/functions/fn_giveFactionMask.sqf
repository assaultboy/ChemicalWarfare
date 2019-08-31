/*
	DESCRIPTION:
		This function will attempt to put the given units faction mask in their inventory
		This function is called automatically by CBA XEH but may be used again if needed
		The given unit must be local
		
	PARAMETERS:
		Unit
			The unit to give the mask to
			
	RETURNS
		Nothing
		
	EXAMPLE
		_this call CBRN_fnc_giveFactionMask
*/

params ["_unit"];

//We only want local units
if (!local _unit) exitWith {};

private _factionMask = missionNamespace getVariable [format ["CBRN_factionMask_%1", faction _unit], ""];

//If our mask is none or undefined, then just exit
if (_factionMask == "") exitWith {};

//Add da item
_unit addItem _factionMask;