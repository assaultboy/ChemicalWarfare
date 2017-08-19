class CfgPatches
{
	class CBRN_Gear
	{
		units[] = {};
		weapons[] = {
			"CBRN_DeconKit",
			"CBRN_DetectionKit",
			"CBRN_NAAK",
			"CBRN_Grenade_S",
			"CBRN_Grenade_N"
		};
		requiredVersion = 0.1;
		requiredAddons[] = {"A3_Weapons_F","A3_Armor_F_Slammer"};
	};
};

#include "cfgVehicles.hpp"
#include "cfgWeapons.hpp"
#include "cfgGlasses.hpp"
#include "cfgAmmo.hpp"
#include "cfgMagazines.hpp"
#include "cfgFunctions.hpp"