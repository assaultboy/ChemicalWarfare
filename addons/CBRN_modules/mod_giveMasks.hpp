class CBRN_Module_GiveMasks: CBRN_Module_Base
{
	scope = 2;
	displayName = "Give Masks";

	function = "CBRN_fnc_mod_giveMasks";
	isGlobal = 0;
	
	class Arguments
	{
		class recievers
		{
			displayName = "Recipient";
			description = "Who should recieve masks";
			typeName = "NUMBER";
			class values
			{
				class synced
				{
					name = "Synched units";
					value = 1;
					default = 1;
				};
				class group
				{
					name = "Synched groups";
					value = 2;
				};
			};
		};
		
		class maskType
		{
			displayName = "Mask Type";
			description = "The type of mask to give each unit";
			typeName = "STRING";
			class values
			{
				class m50
				{
					name = "M50";
					value = "G_CBRN_M50";
					default = 1;
				};
				class m50_hood
				{
					name = "M50 w/ Hood";
					value = "G_CBRN_M50_Hood";
				};
				class m04
				{
					name = "M04";
					value = "G_CBRN_M04";
				};
				class m04_hood
				{
					name = "M04 w/ Hood";
					value = "G_CBRN_M04_Hood";
				};
				class s10
				{
					name = "S10";
					value = "G_CBRN_S10";
				};
			};
		};
	};

	
	class ModuleDescription
	{
		description = "Gives units protective chemical masks";
		sync[] = {};
	};
};