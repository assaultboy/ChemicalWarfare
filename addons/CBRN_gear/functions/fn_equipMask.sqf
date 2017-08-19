/*
	Author: Assaultboy

	Description:
		This function will force the given unit to put on or take off their mask
	
	Remark(s):
		This function must be executed on the server

	Parameter(s):
		0 - Unit: The unit to modify
		1 - Equip: True to equip, false to unequip

	Returns:
		Boolean - Success
*/

//Handle our parameters and locality
if (!isServer) then {["This function must be executed on the server!"] call BIS_fnc_error};
params [
	["_unit", objNull, [objNull]],
	["_doEquip", true]
];

//Make sure that our unit exists
if (isNull _unit) then {["Invalid unit given"] call BIS_fnc_error};

private _success = false;
private _currentGoggles = goggles _unit;

//If we are equipping a mask
if (_doEquip) then {
	//Cycle through their inventory to find an object with CBRN protection
	private _invMask = "";
	{
		if (([_x, "CBRN_protection", "number", 0] call CBRN_fnc_getItemConfigValue) != 0) then {_invMask = _x};
	} forEach items _unit;
	
	//If we actually have a mask in our inventory
	if (_invMask != "") then {
		removeGoggles _unit;
		_unit addGoggles _invMask;
			
		_unit removeItem _invMask;
		_unit addItem _currentGoggles;
		
		_success = true;
	};

//If we are unequipping a mask
} else {
	//If our goggles are a mask
	if (([_currentGoggles, "CBRN_protection", "number", 0] call CBRN_fnc_getItemConfigValue) != 0) then {
		removeGoggles _unit;
		_unit addItem _currentGoggles;
		
		_success = true;
	};
};

_success;