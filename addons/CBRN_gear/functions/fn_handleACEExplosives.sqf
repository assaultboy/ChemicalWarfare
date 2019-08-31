/*
	DESCRIPTION:
		This function will handle ACE explosives
		This function is called automatically by CBA XEH
		
	PARAMETERS:
		None
			
	RETURNS
		Nothing
		
	EXAMPLE
		call CBRN_fnc_handleACEExplosives
*/

[{
    params ["_unit", "_range", "_explosive", "_fuzeTime", "_triggerItem"];
	
	private _ammoClass = (configFile >> "cfgAmmo" >> typeOf _explosive);
	
	//If it's not a chem explosive, we don't care
	if ((getNumber (_ammoClass >> "CBRN_isPlacedExplosive")) != 0) then {
		
		//Spawn our mist after the fuze delay
		[{
			params ["_ammoClass", "_pos"];
			
			private _chemLifeTime = [_ammoClass, "CBRN_lifetime", 60] call BIS_fnc_returnConfigEntry;
			private _heightOfBurst = [_ammoClass, "CBRN_heightOfBurst", 3] call BIS_fnc_returnConfigEntry;
			private _sprayWidth = [_ammoClass, "CBRN_sprayWidth", 15] call BIS_fnc_returnConfigEntry;
			private _chemType = [_ammoClass, "CBRN_chemicalType", 0] call BIS_fnc_returnConfigEntry;
			
			//Spawn da mist
			[_pos, _sprayWidth, _chemLifeTime, _chemType, _heightOfBurst, 0.4] remoteExecCall ["CBRN_fnc_spawnMist", 0];
		}, [_ammoClass, getPosASL _explosive], _fuzeTime + 0.1] call CBA_fnc_waitAndExecute;
	};
	
	true;
}] call ace_explosives_fnc_addDetonateHandler;
