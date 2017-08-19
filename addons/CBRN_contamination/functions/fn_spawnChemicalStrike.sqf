/*
	Author: Assaultboy

	Description:
		This function will spawn a small checmical artillery strike at the given position
	
	Remark(s):
		This function must be executed on the server.

	Parameter(s):
		0 - Position: The position of the strike
		1 - MOPP: The level of MOPP needed to protect from the strike

	Returns:
		Nothing
*/

//Handle our parameters and locality
if (!isServer) exitWith {"'CBRN_fnc_spawnChemicalStrike' must be called on the server!" call CBRN_fnc_throwWarning;nil};
params [
	["_position", [0,0,0], [[]], [2,3]],
	["_MOPPLevel", 0, [0]]
];

//Play our incoming round noise
{
	if (isPlayer _x) then {
		(format ["shell%1", selectRandom [1,2,3,4]]) remoteExec ["playSound", _x];
	};
} forEach (_position nearObjects ["CAManBase", 100]);

sleep 7;

//Play our small explosion noise to show the gas coming out
{
	if (isPlayer _x) then {
		"SmallExplosion" remoteExec ["playSound", _x];
	};
} forEach (_position nearObjects ["CAManBase", 100]);

//Adjust the gas color to our settings
private _smokeType = "CBRN_Gas_Tinted";

if (!isNil "CBRN_set_gasColor") then {
	switch (CBRN_set_gasColor) do {
		//Default is fine here
		case 1: {};
		case 2: {_smokeType = "SmokeShell"};
		case 3: {_smokeType = "CBRN_Gas_Clear"};
	};
};

//Spawn our smoke and make it fly around or whatever
private _smoke = (_smokeType createVehicle _position);
_smoke setPos [_position select 0, _position select 1, 30];
_smoke setVelocity [(random 2) - 1, (random 2) - 1, 10];

([position _smoke, [20, 20, 10], 0.1, 90, _MOPPLevel] call CBRN_fnc_createContaminatedArea) attachTo [_smoke, [0,0,0]];