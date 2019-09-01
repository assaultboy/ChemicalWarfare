/*
	DESCRIPTION:
		This function will handle curator placed explosives
		This function is called automatically by CBA XEH
		
	PARAMETERS:
		Explosive
			The explosive to handle
			
	RETURNS
		Nothing
		
	EXAMPLE
		_this call CBRN_fnc_handleCuratorExplosives
*/

params ["_explosive"];

//First we check to see if we actually have a chemical explosive
private _ammoConfig = (configFile >> "cfgAmmo" >> [configFile >> "cfgVehicles" >> typeOf _explosive, "ammo", ""] call BIS_fnc_returnConfigEntry);
if ((getNumber (_ammoConfig >> "CBRN_isPlacedExplosive")) == 0) exitWith {};

//Hide the object so we can pop our ammo object in
_explosive hideObjectGlobal true;

//We attach an actual ammo object to detonate, the vehicle is purely cosmetic
private _ammoObject = ((configName _ammoConfig) createVehicle [0,0,100]);
_ammoObject attachTo [_explosive, [0,0,0]];

//This will cause the detonation to trigger a chemical cloud
[{
	params ["_args", "_handle"];
	_args params ["_explosive", "_ammoObject"];
	
	//Make sure it didn't get deleted first
	if (isNull _explosive) exitWith {
		[_handle] call CBA_fnc_removePerFrameHandler;
		deleteVehicle _ammoObject;
	};
	
	//Check if we are dead, which means it's time to detonate
	if (!alive _explosive) then {
		deleteVehicle _explosive;
		[_handle] call CBA_fnc_removePerFrameHandler;
		
		private _ammoConfig = (configFile >> "cfgAmmo" >> typeOf _ammoObject);
		private _chemLifeTime = [_ammoConfig, "CBRN_lifetime", 60] call BIS_fnc_returnConfigEntry;
		private _heightOfBurst = [_ammoConfig, "CBRN_heightOfBurst", 3] call BIS_fnc_returnConfigEntry;
		private _sprayWidth = [_ammoConfig, "CBRN_sprayWidth", 15] call BIS_fnc_returnConfigEntry;
		private _chemType = [_ammoConfig, "CBRN_chemicalType", 0] call BIS_fnc_returnConfigEntry;
		
		//Spawn da mist
		[getPos _ammoObject, _sprayWidth, _chemLifeTime, _chemType, _heightOfBurst, 0.4] remoteExecCall ["CBRN_fnc_spawnMist", 0];
		
		//Detonate our ammo
		_ammoObject setDamage 1;
	};
}, 0, [_explosive, _ammoObject]] call CBA_fnc_addPerFrameHandler;