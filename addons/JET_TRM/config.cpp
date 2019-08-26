#include "BIS_AddonInfo.hpp"
class cfgPatches
{
	class JET
	{
		name = "Jet's Toggle Respirator Mod";
		author = "JetfireBlack";
		url = "";

		requiredVersion = 1.0; 
		requiredAddons[] = {"A3_Data_F","ace_interaction"};
		units[] = {};
		weapons[] = {};
	};
};

class CfgFunctions
{
	class JET
	{
		class TRM
		{
			tag = "JET"
			class connectRespirator
			{
				file = "JET_TRM\functions\connectRespirator.sqf";
			};
			class toggleMask
			{
				file = "JET_TRM\functions\toggleMask.sqf";
			};
			class hideHose
			{
				file = "JET_TRM\functions\hideHose.sqf";
			};
			class checkConditions
			{
				file = "JET_TRM\functions\checkConditions.sqf";
			};
		};
	};
};

class CfgVehicles {
    class Man;
    class CAManBase: Man {
        class ACE_SelfActions {
            class ACE_Equipment {
				class JET_connectRespirator {
					displayName = "toggle respirator connection";
					condition = "[_player, 'combo'] call JET_fnc_checkConditions";
					exceptions[] = {};
					statement = "_player call JET_fnc_connectRespirator";
				};
				class JET_toggleMask {
					displayName = "toggle respirator filter";
					condition = "[_player, 'mask'] call JET_fnc_checkConditions";
					exceptions[] = {};
					statement = "_player call JET_fnc_toggleMask";
				};
				class JET_hideHose {
					displayName = "remove hose";
					condition = "[_player, 'hose'] call JET_fnc_checkConditions";
					exceptions[] = {};
					statement = "_player call JET_fnc_hideHose";
				};
			};
		};
	};
};