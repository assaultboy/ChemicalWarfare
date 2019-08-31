/*
	DESCRIPTION:
		This function is used by the zeus modules to spawn and handle chemical rounds
		
	PARAMETERS:
		Default Module Params
			
	RETURNS
		Nothing
		
	EXAMPLE
		_this call CBRN_fnc_moduleProjectiles
*/

params ["_logic", "_unit", "_activated"];

//This will reveal the circle to the curator
if ({local _x} count (objectCurators _logic) > 0) then {
    _logic hideObject false;
    _logic setPos position _logic;
};

//Handle the rest on the server
if !(isServer) exitWith {};

//Create our pos 500m above the logic
private _pos = getPos _logic;
_pos set [2, 500];

//Draw the ammo from the config of the logic
private _ammo = _logic getVariable ["type", getText (configFile >> "cfgVehicles" >> typeOf _logic >> "ammo")];

//Create our projectile
private _projectile = _ammo createVehicle [0,0,100];
_projectile setPosATL _pos;
_projectile setVelocity [0,0,-100];
_projectile call CBRN_fnc_handleProjectile;

//And once the projectile is gone, delete our logic
[{isNull (_this # 0)}, {deleteVehicle (_this # 1)}, [_projectile, _logic]] call CBA_fnc_waitUntilAndExecute;