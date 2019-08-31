class CfgPatches
{
	class CBRN_modules
	{
		units[] = {"ModuleOrdnanceMortar_Chemical_Type0", "ModuleOrdnanceMortar_Chemical_Type1", "ModuleOrdnanceMortar_Chemical_Type2", "ModuleCBRN_RemoveExposure"};
		weapons[] = {};
		requiredVersion = 0.1;
		requiredAddons[] = {"A3_Modules_F", "A3_Modules_F_Curator_Ordnance"};
	};
};

#include "cfgFactionClasses.hpp"
#include "cfgVehicles.hpp"
#include "cfgFunctions.hpp"