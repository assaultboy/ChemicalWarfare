/*
	DESCRIPTION:
		This function will add the exposure effects handler to the local machine
		This function is called automatically via CBA XEH
		
	PARAMETERS:
		None
			
	RETURNS
		Nothing
		
	EXAMPLE
		_call CBRN_fnc_effectsHandler
*/


["CBRN_unitExposureLevelChanged", {
	params ["_unit", "_exposure"];
	
	//Put us in pain if we are not already
	if ((_exposure > 0) && ((_unit getVariable ["ace_medical_pain", -1]) < 0.25)) then {_unit setVariable ["ace_medical_pain", 0.25]};
	
	//Force us to walk if we are too exposed
	if ((_exposure >= CBRN_exposureLimpThreshold) && (0 != CBRN_exposureLimpThreshold)) then {[_unit, "forceWalk", "CBRN", true] call ace_common_fnc_statusEffect_set}
	else {[_unit, "forceWalk", "CBRN", false] call ace_common_fnc_statusEffect_set};
	
	//Knock us out if we are too exposed
	if ((_exposure >= CBRN_exposureKnockoutThreshold) && (0 != CBRN_exposureKnockoutThreshold)) then {[_unit, true, 300] call ace_medical_fnc_setUnconscious};
	
	//Kill us if we get hella exposed
	if ((_exposure >= CBRN_exposureDeathThreshold) && (0 != CBRN_exposureDeathThreshold)) then {_unit setDamage 1};
}] call CBA_fnc_addEventHandler;



/*
params ["_unit"];

//Only do shit if we're local
if (!local _unit) exitWith {};

//We check every couple seconds because we don't need instant reactions. It also gives the players some leeway
[{
	params ["_unit", "_handle"];
	
	//If the unit is dead kill the PFH since we don't care anymore
	if (!alive _unit) then {_handle call CBA_fnc_removePerFrameHandler};
	
	//Pull our variables
	private _exposure = _unit getVariable ["CBRN_exposure", 0];
	private _isCurrentlyExposed = _unit getVariable ["CBRN_isCurrentlyExposed", false];
	
	//Force us to walk if we are too exposed
	if ((_exposure >= CBRN_exposureLimpThreshold) && (0 != CBRN_exposureLimpThreshold)) then {[_unit, "forceWalk", "CBRN", true] call ace_common_fnc_statusEffect_set}
	else {[_unit, "forceWalk", "CBRN", false] call ace_common_fnc_statusEffect_set};
	
	//Knock us out if we are too exposed
	if ((_exposure >= CBRN_exposureKnockoutThreshold) && (0 != CBRN_exposureKnockoutThreshold)) then {[_unit, true] call ace_medical_fnc_setUnconscious};
	
	//Kill us if we get hella exposed
	if ((_exposure >= CBRN_exposureDeathThreshold) && (0 != CBRN_exposureDeathThreshold)) then {_unit setDamage 1};
	
	//Make AI stupid in chemical
	if (_isCurrentlyExposed || (_exposure > 3)) then {_unit setSkill 0};
	
	//Handle our blur if this is the player
	if (_unit == player) then {
		private _blurAmount = 0;
		
		//First we have to calculate our target
		//If we are currently exposed, blind the shit out of us
		if (_isCurrentlyExposed) then {_blurAmount = _blurAmount + 8};
		
		//Then modify our blur based on exposure
		_blurAmount = (_blurAmount + (_exposure / 5)) min 8;
		
		//Now we can check if we are already moving towards a blur, if not we can start that and set our flag
		if (!CBRN_ppBluring && (_blurAmount != CBRN_ppBlurAmount)) then {
			private _transitionTime = abs (CBRN_ppBlurAmount - _blurAmount);
		
			CBRN_ppBluring = true;
			CBRN_ppBlur ppEffectAdjust [_blurAmount];
			CBRN_ppBlur ppEffectEnable true;
			CBRN_ppBlur ppEffectCommit _transitionTime;
			
			[{
				//Set our flag and variable
				CBRN_ppBluring = false;
				CBRN_ppBlurAmount = _this;
				
				//Disable the effect if we can to squeeze out some performance
				if (CBRN_ppBlurAmount == 0) then {CBRN_ppBlur ppEffectEnable false};
			}, _blurAmount, _transitionTime] call CBA_fnc_waitAndExecute;
		};
	};
}, 2, _unit] call CBA_fnc_addPerFrameHandler;
*/