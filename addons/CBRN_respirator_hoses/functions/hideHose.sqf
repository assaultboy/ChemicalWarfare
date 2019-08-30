params[["_unit", player, [objNull]]];

if (!local _unit) exitWith {};

_backpack		= backpackContainer _unit;
_backpackType	= backpack _unit;

switch _backpackType do {
	case "B_CombinationUnitRespirator_01_F": {
		_backpack setObjectTextureGlobal [1, ""];
		_backpack setObjectTextureGlobal [2, ""];
		_backpack setObjectTextureGlobal [3, ""];
	};
	case "B_SCBA_01_F": {
		_backpack setObjectTextureGlobal [1, ""];
		_backpack setObjectTextureGlobal [2, ""];
	};
};