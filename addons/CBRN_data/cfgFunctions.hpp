class CfgFunctions
{
	class CBRN
	{
		class data
		{
			file = "CBRN_data\functions";
			
			class isAddonLoaded {};
			class getItemConfigValue {};
			class throwWarning {};
			class initializeCBRN {preInit = 1};
			class initializeGrenades {postInit = 1};
			class registerKeybinds {postInit = 1};
			class registerSettings {postInit = 1};
		};
	};
};