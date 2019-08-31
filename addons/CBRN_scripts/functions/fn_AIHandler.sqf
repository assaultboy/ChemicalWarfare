#define AIFILTERS(UNIT) if (isPlayer UNIT) exitWith {};if (!alive UNIT) exitWith {}

/*
	DESCRIPTION:
		This function will create the AI handler for the local machine
		The function is called automatically by CBA XEH
		
	PARAMETERS:
		None
			
	RETURNS
		Nothing
		
	EXAMPLE
		call CBRN_fnc_AIHandler
*/


//This is used to detect when a unit has been exposed, since to players it is very obvious via coughing and blur, so we assume the AI has instant knowledge as well
["CBRN_unitExposureChanged", {
	params ["_unit", "_isExposed"];
	
	//Filter our unit by player, locality, and alive status
	AIFILTERS(_unit);
	
	//We force a calculation regardless of the status
	["CBRN_AI_calculateSkill", _unit] call CBA_fnc_localEvent;
	
	if !(_isExposed) exitWith {};
	
	//Get that mask on, even if the squad is already alerted
	["CBRN_AI_donMask", _unit] call CBA_fnc_localEvent;
	
	//We only care if the group is not already exposed
	if ((group _unit) getVariable ["CBRN_groupIsAlerted", false]) exitWith {};
	
	//Call out for nearby players
	_unit groupChat "Gas! Gas! Gas!";
	
	//We may come back to re-enable callouts in the future if we get some professional VO
	//[_unit, [configName selectRandom ((format ["(configFile >> 'cfgSounds' >> 'CBRN_gas%1_0') == inheritsFrom _x", _unit getVariable ["CBRN_coughIdentity", 1]]) configClasses (configFile >> "cfgSounds")), 50, 1, false]] remoteExecCall ["say3D", 0];
	
	//Alert the squad and get them to don masks
	(group _unit) setVariable ["CBRN_groupIsAlerted", true, true];
	{["CBRN_AI_donMask", _x, _x] call CBA_fnc_targetEvent} forEach (units group _unit);
	
	//Start a timer script to check for the all clear every two minutes
	[{
		params ["_unit", "_handle"];
		
		//Remove the timer if the unit has already been given the all clear
		if !((group _unit) getVariable ["CBRN_groupIsAlerted", false]) exitWith {[_handle] call CBA_fnc_removePerFrameHandler};
		
		//Check if the area is still contaminated TODO make the function to check the contaminatio levels
		if (true in ((getPosASL _unit) call CBRN_fnc_isAreaContaminated)) exitWith {};
		
		//Sound the all clear
		_unit groupChat "All clear! All clear! All clear!";
		
		//We may come back to re-enable callouts in the future if we get some professional VO
		//[_unit, [configName selectRandom ((format ["(configFile >> 'cfgSounds' >> 'CBRN_clear%1_0') == inheritsFrom _x", _unit getVariable ["CBRN_coughIdentity", 1]]) configClasses (configFile >> "cfgSounds")), 50, 1, false]] remoteExecCall ["say3D", 0];
		
		//Have the group take their masks off
		(group _unit) setVariable ["CBRN_groupIsAlerted", nil, true];
		{["CBRN_AI_removeMask", _x, _x] call CBA_fnc_targetEvent} forEach (units group _unit);
	}, 120, _unit] call CBA_fnc_addPerFrameHandler;
}] call CBA_fnc_addEventHandler;


//This is called when the level of exposure for the unit has changed
["CBRN_unitExposureLevelChanged", {
	params ["_unit", "_exposureLevel"];
	
	AIFILTERS(_unit);
	
	["CBRN_AI_calculateSkill", _unit] call CBA_fnc_localEvent;
}] call CBA_fnc_addEventHandler;


//This is called to force the AI to rebalance their skill based on exposure
["CBRN_AI_calculateSkill", {
	params ["_unit"];
	
	private _exposureLevel = _unit getVariable ["CBRN_exposure", 0];
	if (_unit getVariable ["CBRN_isCurrentlyExposed", false]) then {_exposureLevel = _exposureLevel + 10};
	
	//First save our default values if we need to
	private _defaultLevel = _unit getVariable ["CBRN_defaultAISkill", -1];
	if (_defaultLevel == -1) then {
		_defaultLevel = skill _unit;
		_unit setVariable ["CBRN_defaultAISkill", _defaultLevel];
	};
	
	//Now if our exposure is 0, we can zero out our AISkill so the curator can modify it if they wanted
	if (_exposureLevel == 0) exitWith {
		_unit setVariable ["CBRN_defaultAISkill", nil];
		_unit setSkill _defaultLevel;
	};
	
	//If it's not, set our skill
	_unit setSkill (_defaultLevel / _exposureLevel);
}] call CBA_fnc_addEventHandler;

//This is called to try to force the AI to treat themselves
//TODO Have AI heal others
["CBRN_AI_attemptTreatment", {
	params ["_unit"];
	
	//Filter for just AI
	AIFILTERS(_unit);
	
	//Check if we are exposed before we do anything
	if ((_unit getVariable ["CBRN_exposure", 0]) < 1) exitWith {};
	
	//Now check if we have atropine
	if !("ACE_atropine" in items _unit) exitWith {};
	
	//Since we do, let's go ahead and treat ourselves
	["CBRN_AI_kneel", [_unit, 3 + random 3, {
	
		//we do this because trying to do it normal puts a progress bar on the local players screen which is ghay
		//Remove our item
		_this removeItem "ACE_Atropine";
		
		//Call our event
		["ace_treatmentSucceded", [_this, _this, "hand_l", "Atropine"]] call CBA_fnc_localEvent;
		
		//Spawn that nice litter
		[_this, _this, "hand_l", "Atropine"] call ace_medical_fnc_createLitter;
	}, _unit]] call CBA_fnc_localEvent;
}] call CBA_fnc_addEventHandler;


//This will force the unit to take a knee for a certain amount of time and then perform a call back function before getting up
["CBRN_AI_kneel", {
	params ["_unit", "_duration", "_callback", "_args"];
	
	//First make sure it's an AI
	AIFILTERS(_unit);
	
	//We do this to respect mission makers that set these values, we can't assume they will not be set/disabled before now
	private _defaultAIValues = _unit getVariable ["CBRN_defaultAIValues", []]; 
	if (_defaultAIValues isEqualTo []) then {
		_defaultAIValues = [
			unitPos _unit,
			true //This should use checkAIFeature, but it seems to not be implemented? Thanks BI, we'll just assume they wanted the AI to move around
		];
		
		_unit setVariable ["CBRN_defaultAIValues", _defaultAIValues];
	};
	
	//Take a knee
	_unit setUnitPos "MIDDLE";
	_unit disableAI "MOVE";
	
	//Wait our duration before standing back up and executing our callback function
	[{
		params ["_unit", "_callback", "_args", "_defaultAIValues"];
		_defaultAIValues params ["_defaultPos", "_defaultMoveEnabled"];
		
		//Do the callback
		_args call _callback;
		
		//And stand back up
		//Un-force the kneel and hault (Or not depending on what the values were before we set them)
		_unit setUnitPos _defaultPos;
		if (_defaultMoveEnabled) then {_unit enableAI "MOVE"};
		
		//Clear our defaults for later use
		_unit setVariable ["CBRN_defaultAIValues", nil];
	}, [_unit, _callback, _args, _defaultAIValues], _duration] call CBA_fnc_waitAndExecute;
	
}] call CBA_fnc_addEventHandler;


//This is called to force the AI to don their mask if they have one
["CBRN_AI_donMask", {
	params ["_unit"];
	
	//Filter our unit by player, locality, and alive status
	AIFILTERS(_unit);
	
	//Don't try to don the mask again if we are already wearing one
	if ((_unit call CBRN_fnc_getProtectionLevel) >= 1) exitWith {};
	
	//Prevent double calls
	if (_unit getVariable ["CBRN_donningMask", false]) exitWith {};
	
	//Check if the unit has a mask they can put on
	if (_unit call CBRN_fnc_hasMaskInInventory) then {
		_unit setVariable ["CBRN_donningMask", true];
		
		["CBRN_AI_kneel", [_unit, 3 + random 4, {
			//Put the mask on
			private _mask = ((items _this) arrayIntersect (CBRN_allLevel1Masks)) # 0;
			_this removeItem _mask;
			_this linkItem _mask;
			
			//We can remove our holding var
			_this setVariable ["CBRN_donningMask", nil];
			
			//See if the unit can try to treat themselves
			[{["CBRN_AI_attemptTreatment", _this] call CBA_fnc_localEvent}, _this, 5] call CBA_fnc_waitAndExecute;
		}, _unit]] call CBA_fnc_localEvent;
	};
}] call CBA_fnc_addEventHandler;


//This is called to force the unit to remove their mask
["CBRN_AI_removeMask", {
	params ["_unit"];
	
	//As always, filter our handler
	AIFILTERS(_unit);
	
	//If we don't even have level 1 protection we know we aren't wearing a mask and can ignore this command
	if ((_unit call CBRN_fnc_getProtectionLevel) < 1) exitWith {};
	
	//I know this variable was for donning the mask, but fuck you
	_unit setVariable ["CBRN_donningMask", true];
	
	["CBRN_AI_kneel", [_unit, 3 + random 4, {
		//Take the mask off (TODO fix the goggles being eaten when the unit has no space)
		_this unassignItem goggles _unit;
		
		//We can remove our holding var
		_this setVariable ["CBRN_donningMask", nil];
		
		//See if the unit can try to treat themselves
		[{["CBRN_AI_attemptTreatment", _this] call CBA_fnc_localEvent}, _this, 5] call CBA_fnc_waitAndExecute;
	}, _unit]] call CBA_fnc_localEvent;
}] call CBA_fnc_addEventHandler;