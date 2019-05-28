class CfgVehicles {
	class Man;
	class CAManBase: Man 
	{
		#include "aceActions.hpp"
		
		class EventHandlers
		{
			class CBRN_Gear
			{
				respawn = "(_this select 0) addItem ((_this select 0) getVariable ['CBRN_respawnMask', ''])";
				fired = "if (!CBRN_set_useACECommon) then {_this remoteExecCall ['CBRN_fnc_handleGrenades', 2]};";
			};
		};
	};
};