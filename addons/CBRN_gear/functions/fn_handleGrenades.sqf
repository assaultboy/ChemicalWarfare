/*
	Author: Assaultboy

	Description:
		This function is used to handle CBRN grenades being thrown.
	
	Remark(s):
		This function must be executed on the server

	Parameter(s):
		0 Fired Event Handler - The returns from a fired parameter

	Returns:
		Nothing
*/

//Handle our parameters and locality
if (!isServer) exitWith {"'CBRN_fnc_handleGrenades' must be called on the server!" call CBRN_fnc_throwWarning;nil};
params [
	["_unit", objNull, [objNull]],
	["_weapon", "", [""]],
	["_muzzle", "", [""]],
	["_mode", "", [""]],
	["_ammo", "", [""]],
	["_magazine", "", [""]],
	["_projectile", objNull, [objNull]],
	["_gunner", objNull, [objNull]]
];

//Get our chemical level from the magazine
private _chemLevel = ([(_magazine call CBA_fnc_getItemConfig) >> "CBRN_chemicalLevel", "number", -1] call CBA_fnc_getConfigEntry);

if (_chemLevel >= 0) then {
	//Handle a different gas colors
	private _gasColor = "CBRN_Gas_Tinted";
	if (!isNil "CBRN_set_gasColor") then {
		switch (CBRN_set_gasColor) do {
			//Do nothing for tinted gas as that is default
			case 1: {};
			
			//For white smoke
			case 2: {_gasColor = "SmokeShell"};
			
			//For clear gase
			case 3: {_gasColor = "CBRN_Gas_Clear"};
		};
	};

	//Create the 'smoke' and attach it to our dummy grenade
	private _emitter = (_gasColor createVehicle (position _projectile));
	_emitter attachTo [_projectile, [0,0,0]];
	
	([position _projectile, [10, 10, 10], 0.1, 90, _chemLevel] call CBRN_fnc_createContaminatedArea) attachTo [_projectile, [0,0,0]];
};