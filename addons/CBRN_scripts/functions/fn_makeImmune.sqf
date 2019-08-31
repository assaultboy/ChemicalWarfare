/*
	DESCRIPTION:
		This function will make the given unit immune to chemical weapons
		This function has a global effect
		The given unit does NOT have to be local
		
	PARAMETERS:
		Unit
			The unit to make immune
			
		Immune
			True/False should the unit be immune
			
	RETURNS
		Nothing
		
	EXAMPLE
		[player, true] call CBRN_fnc_makeImmune;
*/

params ["_unit", "_immune"];

//It's that easy folks
_unit setVariable ["CBRN_immuneToCBRN", _immune, true];