/*
	Author: Assaultboy

	Description:
		This function will check the MOPP level of the given unit
	
	Remark(s):

	Parameter(s):
		Unit - The unit to check

	Returns:
		Number - The MOPP level
*/

private _MOPP = 0;

private _gogglesProtection = ([goggles _this, "CBRN_protection", "number", 0] call CBRN_fnc_getItemConfigValue);
private _headgearProtection = ([headgear _this, "CBRN_protection", "number", 0] call CBRN_fnc_getItemConfigValue);
private _uniformProtection = ([uniform _this, "CBRN_protection", "number", 0] call CBRN_fnc_getItemConfigValue);

if ((_gogglesProtection > 0) || (_headgearProtection > 0)) then {
	_MOPP = 1;
	
	if (_uniformProtection > 0) then {
		_MOPP = 2;
	};
};

_MOPP;