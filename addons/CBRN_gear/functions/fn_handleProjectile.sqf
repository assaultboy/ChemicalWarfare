/*
	DESCRIPTION:
		This function will handle projectiles fired by any man
		This function is called automatically by CBA XEH
		
	PARAMETERS:
		Projectile
			The projectile to handle
			
	RETURNS
		Nothing
		
	EXAMPLE
		_this call CBRN_fnc_handleProjectile
*/

params ["_projectile"];
private _ammo = typeOf _projectile;

//We only care if it's a legit class with chem properties
if !(_ammo in CBRN_chachedChemProjectileClasses) exitWith {};

private _ammoClass = (configFile >> "cfgAmmo" >> _ammo);

//Various values we have pre-programmed for maximum war crimes
private _heightOfBurst = [_ammoClass, "CBRN_heightOfBurst", 30] call BIS_fnc_returnConfigEntry;
private _sprayWidth = [_ammoClass, "CBRN_sprayWidth", 15] call BIS_fnc_returnConfigEntry;
private _chemType = [_ammoClass, "CBRN_chemicalType", 0] call BIS_fnc_returnConfigEntry;
private _chemLifeTime = [_ammoClass, "CBRN_lifetime", 30] call BIS_fnc_returnConfigEntry;

[{
	params ["_args", "_handle"];
	_args params ["_projectile", "_posArray", "_fuzeInfo"];
	_fuzeInfo params ["_heightOfBurst", "_sprayWidth", "_chemType", "_chemLifeTime"];
	
	//This works in a hacky sort of way
	//We passed an array to this PFH, since it is passed as reference we can update that array with set
	//This creates a pseudo global variable that can be update each frame with the mortars position
	//And if the mortar is gone we still get to keep the variable until the EH is removed
	if (!isNull _projectile) exitWith {
		_args set [1, getPos _projectile];

		
		//We check the HOB and that the round is traveling downwards
		if ((((getPos _projectile) # 2) <= _heightOfBurst) && (((velocity _projectile) # 2) < 0)) then {
		
			//Fuck the real projectile, get that sweet claymore boom
			private _det = "ClaymoreDirectionalMine_Remote_Ammo_Scripted" createVehicle [0,0,0];
			_det setPos getPos _projectile;
			_det setDamage 1;
			
			deleteVehicle _projectile;
		};
	};
	
	//Spawn some mist based on our burst
	[_posArray vectorAdd [0,0, -((_posArray # 2) / 1.5)], _sprayWidth, _chemLifeTime, _chemType, (_posArray # 2) / 2, 0.4] remoteExecCall ["CBRN_fnc_spawnMist", 0];
	
	//And of course, get rid of the PFH
	[_handle] call CBA_fnc_removePerFrameHandler;
}, 0, [_projectile, [0,0,0], [_heightOfBurst, _sprayWidth, _chemType, _chemLifeTime]]] call CBA_fnc_addPerFrameHandler;