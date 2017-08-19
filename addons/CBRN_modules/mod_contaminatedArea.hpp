class CBRN_Module_ContaminatedArea: CBRN_Module_Base
{
	scope = 2;
	displayName = "Create Contaminated Area";

	function = "CBRN_fnc_mod_contaminatedArea";
	isGlobal = 0;
	
	class Arguments
	{
		class MOPPLevel
		{
			displayName = "Type";
			description = "The type of contamination.";
			typeName = "NUMBER";
			class values
			{
				class suffocation
				{
					name = "Suffocation Agent";
					value = 1;
					default = 1;
				};
				class white
				{
					name = "Nerve Agent";
					value = 2;
				};
			};
		};
		
		class Lifetime
		{
			displayName = "Lifetime";
			description = "The lifetime of the contamination in seconds (-1 for infinite).";
			typeName = "NUMBER";
			defaultValue = -1;
		};
		
		class Lethality
		{
			displayName = "Lethality";
			description = "The lethality coefficient of the contamination.";
			typeName = "NUMBER";
			defaultValue = 1;
		};
		
		class DeleteMarker
		{
			displayName = "Delete Source";
			description = "Delete the  Trigger after the contamination area has been created.";
			typeName = "NUMBER";
			class values
			{
				class doDelete
				{
					name = "Yes";
					value = 1;
					default = 1;
				};
				class doNotDelete
				{
					name = "No";
					value = 2;
				};
			};
		};
	};

	
	class ModuleDescription
	{
		description = "Sets the synched trigger as contaminated";
		sync[] = {};
	};
};