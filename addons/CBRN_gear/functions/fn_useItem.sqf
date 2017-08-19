/*
	Author: Assaultboy

	Description:
		This function will force a unit to use the given CBRN item
	
	Remark(s):
		This function must be executed on the server

	Parameter(s):
		0: User - The unit using the decon kit
		1: Reciever - The unit being decontaminated

	Returns:
		Boolean - Was the use successful
*/

//Handle our parameters and locality
if (!isServer) then {["This function must be executed on the server!"] call BIS_fnc_error};
params [
	["_user", objNull, [objNull]],
	["_item", "<NOITEM>", [""]],
	["_reciever", objNull]
];

//Make sure that our giver exists
if (isNull _user) then {["Invalid user given"] call BIS_fnc_error};
if ((typeName _reciever) != "OBJECT") then {["Invalid reciever given"] call BIS_fnc_error};

//Make sure the user has the item
if (!(_item in items _user)) exitWith {false};

//Make sure our distance is good
private _inDistance = true;
if (!isNull _reciever) then {_inDistance = ((_user distance _reciever) <= CBRN_set_maxUseItemDistance)};
if(!_inDistance) exitWith {false};

//Are we checking the area with a detection kit?
private _checkingArea = ((_item == "CBRN_DetectionKit") && (isNull _reciever));

//If we are checking the area we have a seperate animation
if (_checkingArea) then {
	[_user, "MedicStart"] remoteExecCall ["playActionNow", _user];
	
//But if we are checking ourselves or another we have an easy animation set
} else {
	//Set our animation to be used
	private _action = "MedicOther";
	if (_user == _reciever) then {_action = "Medic"};
	
	[_user, _action] remoteExecCall ["playActionNow", _user];
};

//Now we wait for our animation to finish before we complete the action
[{
	params ["_user", "_item", "_reciever", "_checkingArea"];
	
	//First kill the animation if we need to
	if (_checkingArea) then {[_user, "MedicStop"] remoteExecCall ["playActionNow", _user]};
	
	private _eventParameters = [];
	
	//Now we actually take care of variables etc
	switch (_item) do {
		case "CBRN_DeconKit": {
			_reciever setVariable ["CBRN_contaminationLevel", 0];
			if (CBRN_set_showItemHints && (isPlayer _user)) then {"Decontamination Kit Used" remoteExecCall ["hint", _user]};
			_eventParameters = [_user, "CBRN_DeconKit", _reciever];
		};
		
		case "CBRN_NAAK": {
			_reciever setVariable ["CBRN_chemicalDamage", 0];
			if (CBRN_set_showItemHints && (isPlayer _user)) then {"Antidote Kit Used" remoteExecCall ["hint", _user]};
			_eventParameters = [_user, "CBRN_NAAK", _reciever];
		};
		
		case "CBRN_DetectionKit": {
			if (_checkingArea) then {
				//Check every contaminated area
				private _insideArea = false;
				{if ((position _user) inArea _x) then {_insideArea = true}} forEach CBRN_var_contaminatedAreas;
				_eventParameters = [_user, "CBRN_DetectionKit", objNull, _insideArea]; 
				
			} else {
				_eventParameters = [_user, "CBRN_DetectionKit", _reciever, (_reciever getVariable ["CBRN_contaminationLevel", 0]) > 0];
			};
			
			if (isPlayer _user) then {if (_eventParameters select 3) then {"Chemical agents were detected." remoteExecCall ["hint", _user]} else {"Chemical agents were not detected." remoteExecCall ["hint", _user]}};
		};
	};
	
	//Remove the item if we need to
	if (([(_item call CBA_fnc_getItemConfig) >> "CBRN_disposeOnUse", "number", 0] call CBA_fnc_getConfigEntry) != 0) then {_user removeItem _item};

	//Raise our CBA event
	["CBRN_itemUsed", _eventParameters] call CBA_fnc_localEvent;
	if (!local _user) then {["CBRN_itemUsed", _eventParameters, _user] call CBA_fnc_targetEvent};
}, [_user, _item, _reciever, _checkingArea], 7] call CBA_fnc_waitAndExecute;