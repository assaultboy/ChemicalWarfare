/*
	Author: Assaultboy

	Description:
		This function will start a checmical damage loop
	
	Remark(s):
		This function must be executed on the server

	Parameter(s):
		0 - Unit: The unit to start the loop for

	Returns:
		Nothing
*/

//Handle our parameters and locality
if (!isServer) exitWith {"'CBRN_fnc_startChemicalDamageLoop' must be called on the server!" call CBRN_fnc_throwWarning;nil};
if (!alive _this) exitWith {nil};

//First we check to make sure they don't already have a chemical damage loop happening
if ((_this getVariable ["CBRN_chemicalDamage", 0]) == 0) then {
	//Set the variable so another loop can't start while we wait for damage
	_this setVariable ["CBRN_chemicalDamage", 0.001];
	
	//Start the loop
	_nil = (_x spawn {
		private _contamination = (_this getVariable ["CBRN_contaminationLevel", 0]);
		private _damage = (_this getVariable ["CBRN_chemicalDamage", 0]);
		
		//As long as we are contaminated or damages keep looping
		while {((_contamination > 0) || (_damage > 0)) && (alive _this)} do {
			//Compute our actual damage
			_damage = (_damage + _contamination);
			
			//Add to our pain
			[_this, _contamination] remoteExecCall ["ace_medical_fnc_adjustPainLevel",_this];
			
			//These side effects only occur if we are using the ACE medical system, since vanilla arma handles total damage fine
			if (CBRN_set_useACEMedical) then {
				//Our actual side effects
				if (_damage >= 0.1) then {
					//After 0.1 exposure you can't sprint
					if (isSprintAllowed _this) then {_this allowSprint false};
					
					//After 0.3 exposure you can only walk
					if (_damage >= 0.3) then {
						if (!isForcedWalk _this) then {_this forceWalk true};
						
						//After 0.75 exposure you go unconscious
						if (_damage >= 0.75) then {
							if (!(_this getVariable ["ACE_isUnconscious", false])) then {[_this, true, 120, true] call ace_medical_fnc_setUnconscious};
							
							//After full exposure you die
							if (_damage >= 1) then {[_this, false, false] remoteExecCall ["ace_medical_fnc_setDead", _this]};
						};
					};
				};
				
			//If we are not using the ACE medical system we will just damage the player
			} else {
				_this setDamage ((damage _this) + _contamination);
			};
			
			//Now we save our damage
			//We do it this way just in case someone healed at just the wrong moment
			_this setVariable ["CBRN_chemicalDamage", (_contamination + (_this getVariable ["CBRN_chemicalDamage", 0])) min 1];
		
			//And get our new contamination levels for next loop
			_contamination = (_this getVariable ["CBRN_contaminationLevel", 0]);
			_damage = (_this getVariable ["CBRN_chemicalDamage", 0]);
			
			//If it is an AI, then have them try to keep themselves alive
			if ((!isPlayer _this) && !(_this getVariable ["CBRN_disableAI", false])) then {
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
					};
				}, _this, 2 + random 10] call CBA_fnc_waitAndExecute;
			};
			
			sleep 1;
		};
		
		//Let them do things again (If we took it away when ACE was enabled)
		if (CBRN_set_useACEMedical) then {
			[_this, true] remoteExecCall ["allowSprint", _this];
			[_this, false] remoteExecCall ["forceWalk", _this];
		};
	});
};