/*
	Author: Assaultboy

	Description:
		This function will give the specified unit a chemical damage handler
	
	Remark(s):
		This function must be executed on the server

	Parameter(s):
		0 - Unit: The unit to give the handler to

	Returns:
		Nothing
*/

//Handle our parameters and locality
if (!isServer) exitWith {"'CBRN_fnc_addChemicalDamageHandler' must be called on the server!" call CBRN_fnc_throwWarning;nil};
if (!alive _this) exitWith {nil};

//First we check to make sure they don't already have a chemical damage loop happening
if ((_this getVariable ["CBRN_chemicalDamageHandler", -1]) == -1) then {
	//Start our PFH and set the variable to the correct value
	_this setVariable ["CBRN_chemicalDamageHandler", [{
		params ["_unit", "_handle"];
		
		private _contamination = (_unit getVariable ["CBRN_contaminationLevel", 0]);
		private _damage = (_unit getVariable ["CBRN_chemicalDamage", 0]);
		
		//Check if we need to remove the PFH and for saving memory
		if ((_contamination > 0) || (_damage > 0)) then {
			//Compute our new damage
			_damage = (_damage + _contamination);
			
			if (CBRN_set_useACEMedical) then {
				//Add to our pain
				[_unit, _contamination] remoteExecCall ["ace_medical_fnc_adjustPainLevel", _unit];
				
				//Our side effects
				if (_damage >= 0.1) then {
					//After 0.1 exposure you can't sprint
					if (isSprintAllowed _unit) then {[_unit, false] remoteExecCall ["allowSprint", _unit]};
					
					//After 0.3 exposure you can only walk
					if (_damage >= 0.3) then {
						if (!isForcedWalk _unit) then {[_unit, false] remoteExecCall ["forceWalk", _unit]};
						
						//After 0.75 exposure you go unconscious
						if (_damage >= 0.75) then {
							if (!(_unit getVariable ["ACE_isUnconscious", false])) then {[_unit, true, 120, true] remoteExecCall ["ace_medical_fnc_setUnconscious", _unit]};
							
							//After full exposure you die
							if (_damage >= 1) then {[_unit, false, false] remoteExecCall ["ace_medical_fnc_setDead", _unit]};
						};
					};
				};
			
			//If we are not using ACE medical, we just set the damage
			} else {
				_unit setDamage ((damage _unit) + _contamination);
			};
			
			//Now we save our damage
			_unit setVariable ["CBRN_chemicalDamage", _damage];
			
			//If it is an AI, then have them try to keep themselves alive
			if ((!isPlayer _unit) && !(_unit getVariable ["CBRN_disableAI", false])) then {
				//Check to make sure we haven't already tried to decon/antidote
				if (!(_unit getVariable ["CBRN_attemptingReact", false])) then {
					_unit setVariable ["CBRN_attemptingReact", true];
					
					//We execute after a delay so that the whole squad doesn't do it at the same time
					[{
						//Make sure they aren't in a firefight
						if ((getSuppression _this) == 0) then {
							//Try to decontaminate first
							if (((_this getVariable ["CBRN_contaminationLevel", 0]) > 0) && ("CBRN_DeconKit" in items _this)) then {
								[_this, "CBRN_DeconKit", _this] call CBRN_fnc_useItem;
								
							//Then try to use the antidote
							} else {
								if (((_this getVariable ["CBRN_chemicalDamage", 0]) > 0) && ("CBRN_NAAK" in items _this)) then {
									[_this, "CBRN_NAAK", _this] call CBRN_fnc_useItem;
								};
							};
							
							//Now that we have reacted we can set our thinking variable to false
							_unit setVariable ["CBRN_attemptingReact", false];
						};
					}, _unit, 2 + random 10] call CBA_fnc_waitAndExecute;
				};
			};
		
		//Since we have no contamination or damage, we can remove the PFH and undo side effects
		} else {
			_handle call CBA_fnc_removePerFrameHandler;
			_unit setVariable ['CBRN_chemicalDamageHandler', -1];
			
			//Let them do things again (If we took it away when ACE was enabled)
			//We know this is fine because we are at a point where contamination and damage are both 0
			if (CBRN_set_useACEMedical) then {
				[_unit, true] remoteExecCall ["allowSprint", _unit];
				[_unit, false] remoteExecCall ["forceWalk", _unit];
			};
		};
	}, 1, _this] call CBA_fnc_addPerFrameHandler];
};