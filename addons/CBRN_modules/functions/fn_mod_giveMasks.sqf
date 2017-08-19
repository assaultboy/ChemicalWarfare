/*
	Author: Assaultboy
*/

//Handle our locality
if (!isServer) exitWith {"'CBRN_fnc_mod_giveMasks' must be called on the server!" call CBRN_fnc_throwWarning;nil};

private _respawnFunc = {
	(_this select 0) addItem (_this select 1);
};

private _logic = (_this select 0);
private _mask = (_logic getVariable ["maskType", ""]);
private _units = [];

{
	if (_x isKindOf "CAManBase") then {_units pushBack _x};
} forEach synchronizedObjects _logic;

switch (_logic getVariable ["recievers", 0]) do {
	
	//Only synched units get masks
	case 1: {
		{
			if (!(_mask in (items _x))) then {
				_x addItem _mask;
				_x setVariable ["CBRN_respawnMask", _mask];
			};
		} forEach _units;
	};
	
	//Synched Groups get masks
	case 2: {
		{
			{
				if (!(_mask in (items _x))) then {
					_x addItem _mask;
					_x setVariable ["CBRN_respawnMask", _mask];
				};
			} forEach units group _x;
		} forEach _units;
	};
};