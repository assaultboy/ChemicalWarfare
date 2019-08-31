/*
	DESCRIPTION:
		This function will add the chemical handler to the given unit
		This function is called automatically on all men when spawned via CBA XEH / When a unit changes locality
		The unit passed must be local
		
	PARAMETERS:
		Unit
			The unit to add the handler to
			
	RETURNS
		Nothing
		
	EXAMPLE
		_unit call CBRN_fnc_addChemicalHandler
*/

params ["_unit"];

//Only do shit if we're local
if (!local _unit) exitWith {};

//Don't worry about UAVs
if (unitIsUAV _unit) exitWith {};

["Giving (%1) a chemical handler", _unit] call CBRN_fnc_debugMessage;

//Check if our unit already has a chemical handler
if ((_unit getVariable ["CBRN_repsawnEH", -1]) != -1) exitWith {
	["Attempted to give (%1) chemical handler but it already had one?", _unit] call CBRN_fnc_debugMessage;
};

//This will handle respawns of players and such
_unit setVariable ["CBRN_repsawnEH", _unit addEventHandler ["Respawn", {
	params ["_unit", "_corpse"];
	
	//Stop those event handlers from stacking up
	_unit removeEventHandler ["Respawn", _unit getVariable ["CBRN_repsawnEH", -1]];
	_unit setVariable ["CBRN_repsawnEH", nil];
	
	//It's not a fan of doing this on the same frame (Ie. It crashes)
	[{_this call CBRN_fnc_addChemicalHandler}, _unit] call CBA_fnc_execNextFrame;
}]];

//This variable increments based on exposure level
_unit setVariable ["CBRN_exposure", 0];

//This is set to true when the unit is actively being exposed (Mainly for the sweet blur effect and whatnot)
_unit setVariable ["CBRN_isCurrentlyExposed", false];

//This will force our other scripts to update in case of locality changes
["CBRN_unitExposureChanged", [_unit, false]] call CBA_fnc_localEvent;
["CBRN_unitExposureLevelChanged", [_unit, 0]] call CBA_fnc_localEvent;

//We check every couple seconds because we don't need instant reactions. It also gives the players some leeway
[{
	params ["_unit", "_handle"];
	
	//If the unit is dead kill the PFH since we don't care anymore
	if (!alive _unit) exitWith {
		_handle call CBA_fnc_removePerFrameHandler;
		["Removed chemical handler from (%1) due to death/deletion", _unit] call CBRN_fnc_debugMessage;
	};
	
	//If the unit is not local any more, kill the PFH and force the owner to add the PFH
	if (!local _unit) exitWith {
		_handle call CBA_fnc_removePerFrameHandler;
		_unit remoteExecCall ["CBRN_fnc_addChemicalHandler", _unit];
		_unit setVariable ["CBRN_hasChemicalHandler", nil];
		["Removed chemical handler from (%1) due to locality change", _unit] call CBRN_fnc_debugMessage;
	};
	
	//If our unit is immune, we can bail
	if (_unit getVariable ["CBRN_immuneToCBRN", false]) exitWith {};
	
	//We need this for later, there's  no real good place to put it
	private _cachedProtectionLevel = (_unit getVariable ["CBRN_cachedProtectionLevel", -1]);
	
	//Check for exposure in each of the chemical types
	private _isExposed = false;
	private _protectionLevel = (_unit call CBRN_fnc_getProtectionLevel);
	private _additionalExposure = 0;
	
	private _priorExposure = (_unit getVariable ["CBRN_exposure", 0]);
	private _alreadyExposed = (_unit getVariable ["CBRN_isCurrentlyExposed", false]);
	{
		//Only worry about this type if we are actually exposed
		if (_x && (_forEachIndex > _protectionLevel)) then {
			
			//If we are exposed from an earlier type, don't override it
			_isExposed = (_isExposed || _x);
			
			//Calculate our additional exposure
			_additionalExposure = _additionalExposure + (_forEachIndex - (_protectionLevel max 0));
		};
		
	} forEach ((getPos _unit) call CBRN_fnc_isAreaContaminated);
	
	//Keep our variables updated
	_unit setVariable ["CBRN_isCurrentlyExposed", _isExposed];
	_unit setVariable ["CBRN_exposure", _additionalExposure + _priorExposure];
	_unit setVariable ["CBRN_cachedProtectionLevel", _protectionLevel];
	
	//And push out our local events
	
	//If we have become exposed, or stop becoming exposed
	if !(_alreadyExposed isEqualTo _isExposed) then {["CBRN_unitExposureChanged", [_unit, _isExposed]] call CBA_fnc_localEvent};
	
	//If our exposure level has changed
	if (_additionalExposure > 0) then {["CBRN_unitExposureLevelChanged", [_unit, _additionalExposure + _priorExposure]] call CBA_fnc_localEvent};
	
	//If our protection level has changed then we need to update
	if (_cachedProtectionLevel != _protectionLevel) then {["CBRN_unitProtectionLevelChanged", [_unit, _protectionLevel]] call CBA_fnc_localEvent};
}, 2, _unit] call CBA_fnc_addPerFrameHandler;