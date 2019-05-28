/*
	Description:
		This function will add handlers for grenades if ace is loaded
	
	Remark(s):
		This function should not be called, it is executed automatically

	Parameter(s):
		None

	Returns:
		Nothing
*/
if (isServer && CBRN_set_useACECommon) then {
	['ace_firedPlayer', {_this call CBRN_fnc_handleGrenades}] call CBA_fnc_addEventHandler;
	['ace_firedPlayerNonLocal', {_this call CBRN_fnc_handleGrenades}] call CBA_fnc_addEventHandler;
	['ace_firedNonPlayer', {_this call CBRN_fnc_handleGrenades}] call CBA_fnc_addEventHandler;
};
