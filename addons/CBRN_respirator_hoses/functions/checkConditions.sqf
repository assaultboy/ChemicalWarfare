params[["_unit", player, [objNull]], ["_mode", "hose", [""]]];

if (!local _unit) exitWith {false};

_gear			= goggles _unit;
_backpack		= backpackContainer _unit;
_backpackType	= backpack _unit;
_objectTextures = getObjectTextures _backpack;
_showAction		= false;

_allowedGoggles		= 	[	
							"G_AirPurifyingRespirator_01_F",
							"G_AirPurifyingRespirator_01_nofilter_F",
							"G_AirPurifyingRespirator_02_black_F",
							"G_AirPurifyingRespirator_02_black_nofilter_F",
							"G_AirPurifyingRespirator_02_olive_F",
							"G_AirPurifyingRespirator_02_olive_nofilter_F",
							"G_AirPurifyingRespirator_02_sand_F",
							"G_AirPurifyingRespirator_02_sand_nofilter_F",
							"G_RegulatorMask_F"
						];
_allowedBackpacks	= 	[
							"B_CombinationUnitRespirator_01_F",
							"B_SCBA_01_F"
						];
						
if (isNull _backpack) then {_objectTextures = ["","","","",""]};
if !(_backpackType in _allowedBackpacks) then {_objectTextures = ["","","","",""]};

switch _mode do {
	case "combo": {
		if !(_gear in _allowedGoggles) exitWith {};
		if !(_backpackType in _allowedBackpacks) exitWith {};
		_showAction = true;
	};
	case "mask": {
		if !(_gear in (_allowedGoggles - ["G_RegulatorMask_F"])) exitWith {};
		if (_objectTextures select 1 != "" || _objectTextures select 2 != "") exitWith {};
		_showAction = true;
	};
	case "hose": {
		if (_gear in _allowedGoggles) exitWith {};
		if !(_backpackType in _allowedBackpacks) exitWith {};
		if (_objectTextures select 1 == "" && _objectTextures select 2 == "") exitWith {};
		_showAction = true;
	};
	default {_showAction = false};
};
_showAction;