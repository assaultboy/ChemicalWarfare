/*
	Author: Assaultboy

	Description:
		This function will check if the given target is valid for items being used
	
	Remark(s):

	Parameter(s):
		0: User - The unit to use the item
		1: Reciever - The unit to have the item used on

	Returns:
		Boolean - Is the target valid?
*/

//Handle our parameters
params [
	["_giver", player, [objNull]],
	["_reciever", objNull, [objNull]]
];

private _valid = false;

if (_reciever isKindOf "CAManBase") then {
	if ((_giver distance _reciever) <= CBRN_set_maxUseItemDistance) then {
		_valid = true;
	};
};

_valid;