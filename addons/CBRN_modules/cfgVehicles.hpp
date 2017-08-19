class CfgFactionClasses
{
	class NO_CATEGORY;
	class CBRN: NO_CATEGORY
	{
		displayName = "Chemical";
	};
};

class CfgVehicles
{
	class Logic;
	class Module_F: Logic
	{
		class ModuleDescription
		{
			class AnyPlayer;
			class AnyBrain;
			class EmptyDetector;
		};
	};
	
	class CBRN_Module_Base : Module_F
	{
		mapSize = 1;
		author = "Assaultboy";
		vehicleClass = "Modules";
		category = "CBRN";
		side = 7;

		scope = 1;				// Editor visibility; 2 will show it in the menu, 1 will hide it.
		scopeCurator = 1;		// Curator visibility; 2 will show it in the menu, 1 will hide it.

		displayName = "CBRN Module Base";	// Name displayed in the menu
		icon = "\CBRN_data\ui\icons\moduleIcon.paa";

		function = "";			// Name of function triggered once conditions are met
		functionPriority = 1;	// Execution priority, modules with lower number are executed first. 0 is used when the attribute is undefined
		isGlobal = 0;			// 0 for server only execution, 1 for remote execution on all clients upon mission start, 2 for persistent execution
		isTriggerActivated = 0;	// 1 for module waiting until all synced triggers are activated
		isDisposable = 0;		// 1 if modules is to be disabled once it's activated (i.e., repeated trigger activation won't work)
		
		class Arguments {};
		class ModuleDescription: ModuleDescription
		{
			description = "CBRN Module Base";
		};
	};
	
	#include "mod_chemicalStrike_S.hpp"
	#include "mod_chemicalStrike_N.hpp"
	#include "mod_giveMasks.hpp"
	#include "mod_settings.hpp"
	#include "mod_contaminatedArea.hpp"
};