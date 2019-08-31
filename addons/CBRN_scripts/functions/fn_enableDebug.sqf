/*
	DESCRIPTION:
		This function will enable/disable the map debug of contaminated areas
		This function has a global effect
		
	PARAMETERS:
		Enable
			Boolean to enable or disable the debug
			
	RETURNS
		Nothing
		
	EXAMPLE
		true call CBRN_fnc_enableDebug
*/


//If nothing changed, just leave the function
if (_this isEqualTo CBRN_debugEnabled) exitWith {};

//Tell everyone else to enable debug mode
_this remoteExecCall ["CBRN_fnc_enableDebug", - clientOwner];

CBRN_debugEnabled = _this;

//If our debug is enabled, we will add a neat little drawing function
if (_this and isNil "CBRN_debugMapEH") then {
	CBRN_debugMapEH = (findDisplay 12 displayCtrl 51 ctrlAddEventHandler ["Draw", 
	{
		{
			private _color = (missionNamespace getVariable format ["CBRN_color_contamination%1", _forEachIndex]);
			{
				if (!isNil "_x") then {
					_this select 0 drawEllipse [_x, 5, 5, 0, [1,1,1,1], format ["#(rgb,8,8,3)color(%1,%2,%3,0.15)", _color # 0,  _color # 1, _color # 2]];
				};
			} forEach _x;
		} forEach CBRN_contaminatedAreas;
	}]);
	hint "Chemical Warfare debugging has been enabled";
};

//If not, remove the alittle drawing function
if (!_this and !isNil "CBRN_debugMapEH") then {
	findDisplay 12 displayCtrl 51 ctrlRemoveEventHandler ["Draw", CBRN_debugMapEH];
	hint "Chemical Warfare debugging has been disabled";
};