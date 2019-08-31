class CfgPatches
{
	class CBRN_scripts
	{
		units[] = {};
		weapons[] = {};
		requiredVersion = 0.1;
		requiredAddons[] = {"cba_common","cba_events", "ace_medical"};
	};
};

#include "cfgFunctions.hpp"
#include "XEH_postInit.hpp"
#include "XEH_init.hpp"
#include "XEH_preInit.hpp"
#include "XEH_firedMan.hpp"
#include "cfg3Den.hpp"