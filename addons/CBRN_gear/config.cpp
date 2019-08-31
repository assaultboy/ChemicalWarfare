class CfgPatches
{
	class CBRN_gear
	{
		units[] = {"CBRN_IEDLandSmall_Type1", "CBRN_IEDLandSmall_Type2", "CBRN_IEDUrbanSmall_Type1", "CBRN_IEDUrbanSmall_Type2"};
		weapons[] = {};
		requiredVersion = 0.1;
		requiredAddons[] = {"cba_common","cba_events", "ace_medical", "A3_Static_F_Mortar_01", "ace_mk6mortar", "ace_explosives", "ace_interaction"};
	};
};

#include "cfgWeapons.hpp"
#include "cfgGlasses.hpp"
#include "cfgMagazines.hpp"
#include "cfgAmmo.hpp"
#include "ace_medical_treatment_actions.hpp"
#include "rscTitles.hpp"
#include "cfgVehicles.hpp"
#include "XEH_init.hpp"
#include "XEH_respawn.hpp"
#include "XEH_postInit.hpp"
#include "cfgFunctions.hpp"