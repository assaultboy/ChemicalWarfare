class cfgWeapons
{
	class Uniform_Base;

	//Vanilla suits
	class U_C_CBRN_Suit_01_Blue_F: Uniform_Base
	{
		CBRN_protectionLevel = 4 + 8;
	};

	class U_B_CBRN_Suit_01_MTP_F: Uniform_Base
	{
		CBRN_protectionLevel = 4 + 8;
	};

	class U_B_CBRN_Suit_01_Tropic_F: Uniform_Base
	{
		CBRN_protectionLevel = 4 + 8;
	};

	class U_C_CBRN_Suit_01_White_F: Uniform_Base
	{
		CBRN_protectionLevel = 4 + 8;
	};

	class U_B_CBRN_Suit_01_Wdl_F: Uniform_Base
	{
		CBRN_protectionLevel = 4 + 8;
	};

	class U_I_CBRN_Suit_01_AAF_F: Uniform_Base
	{
		CBRN_protectionLevel = 4 + 8;
	};

	class U_I_E_CBRN_Suit_01_EAF_F: Uniform_Base
	{
		CBRN_protectionLevel = 4 + 8;
	};

	//Free stuff
	class U_B_CombatUniform_mcam;
	class U_O_CombatUniform_ocamo;
	class U_I_CombatUniform;
	class UniformItem;

	class U_B_CBRN: U_B_CombatUniform_mcam {
		author = "Assaultboy";
		scope = 2;
		displayName = "CBRN Suit (M50) [NATO]";
		picture = "\CBRN_gear\data\items\uniformBlufor.paa";
		hiddenSelections[] = {"camo"};
		hiddenSelectionsTextures[] = {"\skn_nbc_units\data_m50\NBC_M50_Uniform_CO.paa"};
		
		CBRN_protectionLevel = 8;

		class ItemInfo: UniformItem
		{
			uniformModel = "-";
			uniformClass = "B_CBRN_Unarmed";
			containerClass = Supply40;
			mass = 40;
		};
	};

	class U_O_CBRN: U_O_CombatUniform_ocamo {
		author = "Assaultboy";
		scope = 2;
		displayName = "CBRN Suit (M04) [CSAT]";
		picture = "\CBRN_gear\data\items\uniformOpfor.paa";
		hiddenSelections[] = {"camo"};
		hiddenSelectionsTextures[] = {"\skn_nbc_units\data\xrt_suit_blu_co.paa"};
		
		CBRN_protectionLevel = 8;

		class ItemInfo: UniformItem
		{
			uniformModel = "-";
			uniformClass = "O_CBRN_Unarmed";
			containerClass = Supply40;
			mass = 40;
		};
	};

	class U_I_CBRN: U_I_CombatUniform {
		author = "Assaultboy";
		scope = 2;
		displayName = "CBRN Suit (S10) [AAF]";
		picture = "\CBRN_gear\data\items\uniformInd.paa";
		hiddenSelections[] = {"camo"};
		hiddenSelectionsTextures[] = {"\skn_nbc_units\data\noddy_suit_dry_blue_co.paa"};
		
		CBRN_protectionLevel = 8;

		class ItemInfo: UniformItem
		{
			uniformModel = "-";
			uniformClass = "I_CBRN_Unarmed";
			containerClass = Supply40;
			mass = 40;
		};
	};
	
	
	//For our explosives
	class Default;
	class Put: Default
	{
		muzzles[] += {"CBRN_Explosives_Muzzle"};
		
		class PutMuzzle: Default{};
		class CBRN_Explosives_Muzzle: PutMuzzle
		{
			magazines[] = {"CBRN_IEDLandSmall_Type1_Remote_Mag", "CBRN_IEDLandSmall_Type2_Remote_Mag", "CBRN_IEDUrbanSmall_Type1_Remote_Mag", "CBRN_IEDUrbanSmall_Type2_Remote_Mag"};
		};
	};
};