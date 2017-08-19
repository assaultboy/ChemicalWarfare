class CBRN_Module_Settings: CBRN_Module_Base
{
	scope = 2;
	displayName = "Chemical Settings";

	function = "CBRN_fnc_mod_settings";
	isGlobal = 0;
	
	class Arguments
	{
		class gasColor
		{
			displayName = "Gas Color";
			description = "The color of gas grenades";
			typeName = "NUMBER";
			class values
			{
				class tinted
				{
					name = "Tinted";
					value = 1;
					default = 1;
				};
				class white
				{
					name = "White";
					value = 2;
				};
				class clear
				{
					name = "Semi-Transparent";
					value = 3;
				};
			};
		};
		class damageMod
		{
			displayName = "Damage Modifier";
			description = "The amount to modify the damage of chemicals by (Default is 1)";
			typeName = "NUMBER";
			defaultValue = 1;
		};
	};

	
	class ModuleDescription
	{
		description = "Sets various settings related to Chemical Warfare";
		sync[] = {};
	};
};