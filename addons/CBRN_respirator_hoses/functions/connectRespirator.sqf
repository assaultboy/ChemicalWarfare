params[["_unit", player, [objNull]]];

if (!local _unit) exitWith {};

_gear			= goggles _unit;
_backpack		= backpackContainer _unit;
_backpackType	= backpack _unit;
_objectTextures = getObjectTextures _backpack;

if (_objectTextures select 1 == "" && _objectTextures select 2 == "") then {
	switch true do {
		case (_gear in ["G_AirPurifyingRespirator_01_F", "G_AirPurifyingRespirator_01_nofilter_F"]): {
			switch true do {
				case (_backpackType == "B_CombinationUnitRespirator_01_F"): {
					_unit linkItem "G_AirPurifyingRespirator_01_nofilter_F";

					_backpack setObjectTextureGlobal [1, "a3\supplies_f_enoch\bags\data\b_cur_01_co.paa"];
					_backpack setObjectTextureGlobal [2, "a3\supplies_f_enoch\bags\data\b_cur_01_co.paa"];
					_backpack setObjectTextureGlobal [3, ""];
				};
				case (_backpackType == "B_SCBA_01_F"): {
					_unit linkItem "G_AirPurifyingRespirator_01_nofilter_F";

					_backpack setObjectTextureGlobal [1, "a3\supplies_f_enoch\bags\data\b_scba_01_co.paa"];
					_backpack setObjectTextureGlobal [2, ""];
				};
			};
		};
		case (_gear in ["G_AirPurifyingRespirator_02_black_F", "G_AirPurifyingRespirator_02_black_nofilter_F"]): {
			switch true do {
				case (_backpackType == "B_CombinationUnitRespirator_01_F"): {
					_unit linkItem "G_AirPurifyingRespirator_02_black_nofilter_F";

					_backpack setObjectTextureGlobal [1, "a3\supplies_f_enoch\bags\data\b_cur_01_co.paa"];
					_backpack setObjectTextureGlobal [2, "a3\supplies_f_enoch\bags\data\b_cur_01_co.paa"];
					_backpack setObjectTextureGlobal [3, ""];
				};
				case (_backpackType == "B_SCBA_01_F"): {
					_unit linkItem "G_AirPurifyingRespirator_02_black_nofilter_F";

					_backpack setObjectTextureGlobal [1, "a3\supplies_f_enoch\bags\data\b_scba_01_co.paa"];
					_backpack setObjectTextureGlobal [2, ""];
				};
			};
		};
		case (_gear in ["G_AirPurifyingRespirator_02_olive_F", "G_AirPurifyingRespirator_02_olive_nofilter_F"]): {
			switch true do {
				case (_backpackType == "B_CombinationUnitRespirator_01_F"): {
					_unit linkItem "G_AirPurifyingRespirator_02_olive_nofilter_F";

					_backpack setObjectTextureGlobal [1, "a3\supplies_f_enoch\bags\data\b_cur_01_co.paa"];
					_backpack setObjectTextureGlobal [2, "a3\supplies_f_enoch\bags\data\b_cur_01_co.paa"];
					_backpack setObjectTextureGlobal [3, ""];
				};
				case (_backpackType == "B_SCBA_01_F"): {
					_unit linkItem "G_AirPurifyingRespirator_02_olive_nofilter_F";

					_backpack setObjectTextureGlobal [1, "a3\supplies_f_enoch\bags\data\b_scba_01_co.paa"];
					_backpack setObjectTextureGlobal [2, ""];
				};
			};
		};
		case (_gear in ["G_AirPurifyingRespirator_02_sand_F", "G_AirPurifyingRespirator_02_sand_nofilter_F"]): {
			switch true do {
				case (_backpackType == "B_CombinationUnitRespirator_01_F"): {
					_unit linkItem "G_AirPurifyingRespirator_02_sand_nofilter_F";

					_backpack setObjectTextureGlobal [1, "a3\supplies_f_enoch\bags\data\b_cur_01_co.paa"];
					_backpack setObjectTextureGlobal [2, "a3\supplies_f_enoch\bags\data\b_cur_01_co.paa"];
					_backpack setObjectTextureGlobal [3, ""];
				};
				case (_backpackType == "B_SCBA_01_F"): {
					_unit linkItem "G_AirPurifyingRespirator_02_sand_nofilter_F";

					_backpack setObjectTextureGlobal [1, "a3\supplies_f_enoch\bags\data\b_scba_01_co.paa"];
					_backpack setObjectTextureGlobal [2, ""];
				};
			};
		};
		case (_gear == "G_RegulatorMask_F"): {
			switch true do {
				case (_backpackType == "B_CombinationUnitRespirator_01_F"): {
					_backpack setObjectTextureGlobal [1, "a3\supplies_f_enoch\bags\data\b_cur_01_co.paa"];
					_backpack setObjectTextureGlobal [2, ""];
					_backpack setObjectTextureGlobal [3, "a3\supplies_f_enoch\bags\data\b_cur_01_co.paa"];
				};
				case (_backpackType == "B_SCBA_01_F"): {
					_backpack setObjectTextureGlobal [1, ""];
					_backpack setObjectTextureGlobal [2, "a3\supplies_f_enoch\bags\data\b_scba_01_co.paa"];
				};
			};
		};
	};
};
if (_objectTextures select 1 != "" || _objectTextures select 2 != "") then {
	switch true do {
		case (_gear in ["G_AirPurifyingRespirator_01_F", "G_AirPurifyingRespirator_01_nofilter_F"]): {
			switch true do {
				case (_backpackType == "B_CombinationUnitRespirator_01_F"): {
					_unit linkItem "G_AirPurifyingRespirator_01_F";

					_backpack setObjectTextureGlobal [1, ""];
					_backpack setObjectTextureGlobal [2, ""];
					_backpack setObjectTextureGlobal [3, ""];
				};
				case (_backpackType == "B_SCBA_01_F"): {
					_unit linkItem "G_AirPurifyingRespirator_01_F";

					_backpack setObjectTextureGlobal [1, ""];
					_backpack setObjectTextureGlobal [2, ""];
				};
			};
		};
		case (_gear in ["G_AirPurifyingRespirator_02_black_F", "G_AirPurifyingRespirator_02_black_nofilter_F"]): {
			switch true do {
				case (_backpackType == "B_CombinationUnitRespirator_01_F"): {
					_unit linkItem "G_AirPurifyingRespirator_02_black_F";

					_backpack setObjectTextureGlobal [1, ""];
					_backpack setObjectTextureGlobal [2, ""];
					_backpack setObjectTextureGlobal [3, ""];
				};
				case (_backpackType == "B_SCBA_01_F"): {
					_unit linkItem "G_AirPurifyingRespirator_02_black_F";

					_backpack setObjectTextureGlobal [1, ""];
					_backpack setObjectTextureGlobal [2, ""];
				};
			};
		};
		case (_gear in ["G_AirPurifyingRespirator_02_olive_F", "G_AirPurifyingRespirator_02_olive_nofilter_F"]): {
			switch true do {
				case (_backpackType == "B_CombinationUnitRespirator_01_F"): {
					_unit linkItem "G_AirPurifyingRespirator_02_olive_F";

					_backpack setObjectTextureGlobal [1, ""];
					_backpack setObjectTextureGlobal [2, ""];
					_backpack setObjectTextureGlobal [3, ""];
				};
				case (_backpackType == "B_SCBA_01_F"): {
					_unit linkItem "G_AirPurifyingRespirator_02_olive_F";

					_backpack setObjectTextureGlobal [1, ""];
					_backpack setObjectTextureGlobal [2, ""];
				};
			};
		};
		case (_gear in ["G_AirPurifyingRespirator_02_sand_F", "G_AirPurifyingRespirator_02_sand_nofilter_F"]): {
			switch true do {
				case (_backpackType == "B_CombinationUnitRespirator_01_F"): {
					_unit linkItem "G_AirPurifyingRespirator_02_sand_F";

					_backpack setObjectTextureGlobal [1, ""];
					_backpack setObjectTextureGlobal [2, ""];
					_backpack setObjectTextureGlobal [3, ""];
				};
				case (_backpackType == "B_SCBA_01_F"): {
					_unit linkItem "G_AirPurifyingRespirator_02_sand_F";

					_backpack setObjectTextureGlobal [1, ""];
					_backpack setObjectTextureGlobal [2, ""];
				};
			};
		};
		case (_gear == "G_RegulatorMask_F"): {
			switch true do {
				case (_backpackType == "B_CombinationUnitRespirator_01_F"): {
					_backpack setObjectTextureGlobal [1, ""];
					_backpack setObjectTextureGlobal [2, ""];
					_backpack setObjectTextureGlobal [3, ""];
				};
				case (_backpackType == "B_SCBA_01_F"): {
					_backpack setObjectTextureGlobal [1, ""];
					_backpack setObjectTextureGlobal [2, ""];
				};
			};
		};
	};
};