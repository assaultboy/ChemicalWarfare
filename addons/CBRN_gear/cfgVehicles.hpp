class CfgVehicles {
	class Man;
	class CAManBase: Man 
	{
		#include "aceActions.hpp"
		
		class EventHandlers
		{
			class CBRN_Gear
			{
				init = "if (CBRN_set_useACECommon) then {_nil = (['ace_firedPlayer', {_this remoteExecCall ['CBRN_fnc_handleGrenades', 2]}] call CBA_fnc_addEventHandler)};";
				respawn = "(_this select 0) addItem ((_this select 0) getVariable ['CBRN_respawnMask', ''])";
				fired = "if (!CBRN_set_useACECommon) then {_this remoteExecCall ['CBRN_fnc_handleGrenades', 2]};";
			};
		};
	};
	
	//Adding our custom artillery shells and etc
	class MBT_01_arty_base_F;
	class B_MBT_01_arty_base_F: MBT_01_arty_base_F {
		class Turrets {
			class MainTurret;
		};
	};
	class B_MBT_01_arty_F: B_MBT_01_arty_base_F {
		class Turrets: Turrets {
			class MainTurret: MainTurret {
				magazines[] += {"CBRN_6Rnd_155mm_Mo_nerveAgent"};
			};
		};
	};
};