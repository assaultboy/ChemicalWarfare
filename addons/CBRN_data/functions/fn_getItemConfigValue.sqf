/*
	Author: Assaultboy

	Description:
		Returns the given config value for the given item
	
	Remark(s):

	Parameter(s):
	0 - STRING: The item to check
	1 - STRING: The value to check
	2 - STRING: The type of value
	3 - ANY: The default value

	Returns:
		Any - The value
*/

params [
	["_item", "", [""]],
	["_value", "", [""]],
	"_type",
	"_default"
];

([(_item call CBA_fnc_getItemConfig) >> _value, _type, _default] call CBA_fnc_getConfigEntry);