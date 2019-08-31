/*
	DESCRIPTION:
		This function will assign a cough identity to the given unit
		This function has a global effect
		This function is called automatically by CBA XEH
		
	PARAMETERS:
		Unit
			The unit to assign the cough identity to
			
		Cough Identity (OPTIONAL)
			The identity to assign to to the unit, if non is provided, one is chosen at random
			
	RETURNS
		Nothing
		
	EXAMPLE
		[player, "assaultboy"] call CBRN_fnc_assignCoughIdentity
*/

params ["_unit", ["_identity", ""]];

//Get our random identity if one wasn't provided
if (_identity == "") then {
	_identity = (configName selectRandom ("(configFile >> 'cfgVehicles' >> 'Sound_CBRN_coughBase') == inheritsFrom _x" configClasses (configFile >> "cfgVehicles"))) select [17];
};

//Make sure our identity is valid
if !(isClass (configFile >> "cfgVehicles" >>  format ["Sound_CBRN_cough_%1", _identity])) exitWith {["Cough identity does not exist: %1", _identity] call BIS_fnc_error};

//Set our identity
_unit setVariable ["CBRN_coughIdentity", _identity, true];