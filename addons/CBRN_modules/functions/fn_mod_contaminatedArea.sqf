/*
	Author: Assaultboy
*/

//Handle our locality
if (!isServer) exitWith {"'CBRN_fnc_mod_contaminatedArea' must be called on the server!" call CBRN_fnc_throwWarning;nil};

//Get all our arguments
private _logic = (_this select 0);
private _MOPP = (_logic getVariable ["MOPPLevel", 0]);
private _lifetime = (_logic getVariable ["Lifetime", -1]);
private _deleteSource = (_logic getVariable ["DeleteMarker", 1]);
private _damageMod = (_logic getVariable ["Lethality", 1]);

//Get all our triggers
private _trgs = [];
{
	if (_x isKindOf "EmptyDetector") then {_trgs pushBack _x};
} forEach synchronizedObjects _logic;

//Make sure we actually got our trigger
if ((count _trgs) > 0) then {
	{
		//Get all our data
		private _position = (position _x);
		private _size = (triggerArea _x);
		private _direction = (getDir _x);
		
		//In case our trigger has no ceiling then we will remove that pesky -1 it returns for the Z axis
		if ((_size select 2) == -1) then {_size set [2, nil]};
		
		//Delete the trigger if we have to
		if (_deleteSource == 1) then {deleteVehicle _x};
		
		//And create our area
		[_position, [_size select 0, _size select 1, _size select 4], 0.1 * _damageMod, _lifetime, _MOPP, _direction] call CBRN_fnc_createContaminatedArea;
	} forEach _trgs;
	
//If we don't have a source then let the players know
} else {
	"(CBRN) Warning: No triggers synched for Contaminated Area!" remoteExec ["systemChat", 0];
};