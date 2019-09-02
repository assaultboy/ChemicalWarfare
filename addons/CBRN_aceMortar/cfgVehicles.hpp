//This doesn't work fro some reason?
//It removes the ACE_mainAction from the ace_actions
//Anyone know why?

class cfgVehicles
{
	class StaticWeapon;
	class StaticMortar: StaticWeapon
	{
		class ACE_Actions
		{
			class ace_mk6mortar_LoadActions;
		};
	};
	
	class Mortar_01_base_F: StaticMortar
	{
		class ACE_Actions: ACE_Actions
		{
			class ace_mk6mortar_LoadActions: ace_mk6mortar_LoadActions
			{
				class ace_mk6mortar_loadMagazine_chemical_type0
				{
					condition = "[_target,_player,'CBRN_1Rnd_82mm_Mo_Chemical_Type0'] call ace_mk6mortar_fnc_canLoadMagazine";
					displayName = "Load CS";
					icon = "";
					statement = "[_target,_player,8,'CBRN_1Rnd_82mm_Mo_Chemical_Type0'] call ace_mk6mortar_fnc_loadMagazineTimer";
				};
				
				class ace_mk6mortar_loadMagazine_chemical_type1
				{
					condition = "[_target,_player,'CBRN_1Rnd_82mm_Mo_Chemical_Type1'] call ace_mk6mortar_fnc_canLoadMagazine";
					displayName = "Load Asphyxiant";
					icon = "";
					statement = "[_target,_player,8,'CBRN_1Rnd_82mm_Mo_Chemical_Type1'] call ace_mk6mortar_fnc_loadMagazineTimer";
				};
				
				class ace_mk6mortar_loadMagazine_chemical_type2
				{
					condition = "[_target,_player,'CBRN_1Rnd_82mm_Mo_Chemical_Type2'] call ace_mk6mortar_fnc_canLoadMagazine";
					displayName = "Load Nerve Agent";
					icon = "";
					statement = "[_target,_player,8,'CBRN_1Rnd_82mm_Mo_Chemical_Type2'] call ace_mk6mortar_fnc_loadMagazineTimer";
				};
			};
		};
	};
};