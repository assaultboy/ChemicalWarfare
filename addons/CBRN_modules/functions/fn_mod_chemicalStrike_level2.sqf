/*
	Author: Assaultboy
*/

//Handle our locality
if (!isServer) exitWith {"'CBRN_fnc_mod_chemicalStrike_level2' must be called on the server!" call CBRN_fnc_throwWarning;nil};

private _logic = (_this select 0);

[position _logic, 2] spawn CBRN_fnc_spawnChemicalStrike;

deleteVehicle _logic;