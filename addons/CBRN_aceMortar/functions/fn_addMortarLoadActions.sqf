/*
	DESCRIPTION:
		This function will add the loading actions to the ACE mortar.
		This function is called by CBA XEH.
		We use this because the Mk6 mortar config acts super weird and adds compat issues
		
	PARAMETERS:
		Nothing
			
	RETURNS
		None
		
	EXAMPLE
		call CBRN_fnc_addMortarLoadActions
*/

[
	"Mortar_01_base_F",
	0,
	["ace_mk6mortar_LoadActions"],
	[
		"ace_mk6mortar_loadMagazine_chemical_type0",
		"Load CS",
		"",
		{[_target,_player,8,'CBRN_1Rnd_82mm_Mo_Chemical_Type0'] call ace_mk6mortar_fnc_loadMagazineTimer},
		{[_target,_player,'CBRN_1Rnd_82mm_Mo_Chemical_Type0'] call ace_mk6mortar_fnc_canLoadMagazine}
	] call ace_interact_menu_fnc_createAction,
	true
] call ace_interact_menu_fnc_addActionToClass;

[
	"Mortar_01_base_F",
	0,
	["ace_mk6mortar_LoadActions"],
	[
		"ace_mk6mortar_loadMagazine_chemical_type1",
		"Load Ashpyxiant",
		"",
		{[_target,_player,8,'CBRN_1Rnd_82mm_Mo_Chemical_Type1'] call ace_mk6mortar_fnc_loadMagazineTimer},
		{[_target,_player,'CBRN_1Rnd_82mm_Mo_Chemical_Type1'] call ace_mk6mortar_fnc_canLoadMagazine}
	] call ace_interact_menu_fnc_createAction,
	true
] call ace_interact_menu_fnc_addActionToClass;

[
	"Mortar_01_base_F",
	0,
	["ace_mk6mortar_LoadActions"],
	[
		"ace_mk6mortar_loadMagazine_chemical_type2",
		"Load Nerve Agent",
		"",
		{[_target,_player,8,'CBRN_1Rnd_82mm_Mo_Chemical_Type2'] call ace_mk6mortar_fnc_loadMagazineTimer},
		{[_target,_player,'CBRN_1Rnd_82mm_Mo_Chemical_Type2'] call ace_mk6mortar_fnc_canLoadMagazine}
	] call ace_interact_menu_fnc_createAction,
	true
] call ace_interact_menu_fnc_addActionToClass;