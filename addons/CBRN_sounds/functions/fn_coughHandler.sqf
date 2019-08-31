/*
	DESCRIPTION:
		This function will add the coughing effects handler to the local machine
		This function is called automatically by CBA XEH
		
	PARAMETERS:
		None
			
	RETURNS
		Nothing
		
	EXAMPLE
		call CBRN_fnc_coughHandler
*/

private _fnc_checkToCough = {
	params ["_unit"];
	
	//If coughing is disabled don't worry about it
	if (CBRN_exposureCoughThreshold == 0) exitWith {};
	
	//Pull our variables
	private _exposure = _unit getVariable ["CBRN_exposure", 0];
	private _isCurrentlyExposed = _unit getVariable ["CBRN_isCurrentlyExposed", false];
	(_unit getVariable ["CBRN_coughSource", [objNull, ""]]) params ["_activeCoughSource", "_activeCoughType"];
	private _protectionLevel = _unit call CBRN_fnc_getProtectionLevel;
	private _identity = _unit getVariable ["CBRN_coughIdentity", "Sound_CBRN_cough_griffiths"];
	
	//If we are exposed
	if ((_exposure >= CBRN_exposureCoughThreshold) || _isCurrentlyExposed) then {
		
		//Set our cough based on if we are wearing a mask
		private _coughType = format ["Sound_CBRN_cough_%1", _identity];
		if (_protectionLevel >= 1) then {_coughType = format ["Sound_CBRN_coughMuffled_%1", _identity]};
		
		//If our wanted cough type and our active cough type don't match, update it
		if (_coughType != _activeCoughType) then {
			deleteVehicle _activeCoughSource;
			
			//Create our source and attach it to the unit
			private _source = createSoundSource [_coughType, [0,0,0], [], 0];
			_source attachTo [_unit, [0,0,1.5]];
			_unit setVariable ["CBRN_coughSource", [_source, _coughType], true];
			
			//We also add this a way to remove coughing should the unit die or whatnot
			[{
				params ["_cough", "_unit"];
				
				((!alive _unit) || (isNull _cough))
			}, {deleteVehicle (_this # 0)}, [_source, _unit]] call CBA_fnc_waitUntilAndExecute;
		};
	} else {
		
		//If we aren't exposed, make sure we don't have an active cough
		if (_activeCoughType != "") then {
			deleteVehicle _activeCoughSource;
			_unit setVariable ["CBRN_coughSource", nil, true];
		};
	};
};

["CBRN_unitExposureChanged", _fnc_checkToCough] call CBA_fnc_addEventHandler;
["CBRN_unitExposureLevelChanged", _fnc_checkToCough] call CBA_fnc_addEventHandler;
["CBRN_unitProtectionLevelChanged", _fnc_checkToCough] call CBA_fnc_addEventHandler;