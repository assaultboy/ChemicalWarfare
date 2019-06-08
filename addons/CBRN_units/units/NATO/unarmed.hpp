class B_Soldier_unarmed_F;
class B_CBRN_Unarmed: B_Soldier_unarmed_F
{
	scope = 1;
	editorSubcategory = "CBRN";
	
	//editorPreview = "\bonusUnits_CSF\editorPreviews\O_CSF_Unarmed.jpg";
	author = "Assaultboy";
	
	hiddenSelections[] = {"camo"};
	hiddenSelectionsTextures[] = {"\skn_nbc_units\data_m50\NBC_M50_Uniform_CO.paa"};
	
	modelSides[] = {0, 1, 2, 3};
	
	model = "\skn_nbc_units\models\skn_b_nbc_uniform.p3d";
	
	uniformClass = "U_B_CBRN";
	
	class EventHandlers
	{
		class CBRN_giveMask
		{
			init = "(_this select 0) addItem 'G_CBRN_M50_Hood'";
		};
	};
};

class B_CBRN_CTRG_Unarmed: B_Soldier_unarmed_F
{
	scope = 1;
	editorSubcategory = "CBRN";
	
	//editorPreview = "\bonusUnits_CSF\editorPreviews\O_CSF_Unarmed.jpg";
	author = "The_M";
	
	hiddenSelections[] = {"camo"};
	hiddenSelectionsTextures[] = {"\A3\Characters_F_Exp\BLUFOR\Data\U_B_CTRG_Soldier_F_co.paa"};
	
	modelSides[] = {0, 1, 2, 3};
	
	model = "\A3\Characters_F_Exp\BLUFOR\B_CTRG_Soldier_01_F.p3d";
	
	uniformClass = "U_B_CBRN_CTRG";
	
	class EventHandlers
	{
		class CBRN_giveMask
		{
			init = "(_this select 0) addItem 'G_CBRN_M04_Hood'";
		};
	};
};
class B_CBRN_CTRG_GER_S_Arid_Unarmed: B_Soldier_unarmed_F
{
	scope = 1;
	editorSubcategory = "CBRN";
	
	//editorPreview = "\bonusUnits_CSF\editorPreviews\O_CSF_Unarmed.jpg";
	author = "The_M";
	
	hiddenSelections[] = {"camo"};
	hiddenSelectionsTextures[] = {"\CBRN_gear\data\clothing1_CTRG_GER_arid_co.paa"};
	
	modelSides[] = {0, 1, 2, 3};
	
	model = "\A3\Characters_F_Exp\BLUFOR\B_CTRG_Soldier_01_F.p3d";
	
	uniformClass = "U_B_CBRN_CTRG_GER_S_Arid";
	
	class EventHandlers
	{
		class CBRN_giveMask
		{
			init = "(_this select 0) addItem 'G_CBRN_M04_Hood'";
		};
	};
};
class B_CBRN_CTRG_GER_S_arid_CBRN_Unarmed: B_Soldier_unarmed_F
{
	scope = 1;
	editorSubcategory = "CBRN";
	
	//editorPreview = "\bonusUnits_CSF\editorPreviews\O_CSF_Unarmed.jpg";
	author = "The_M";
	
	hiddenSelections[] = {"camo"};
	hiddenSelectionsTextures[] = {"\CBRN_gear\data\clothing1_CTRG_GER_arid_co.paa"};
	
	modelSides[] = {0, 1, 2, 3};
	
	model = "\A3\Characters_F_Exp\BLUFOR\B_CTRG_Soldier_01_F.p3d";
	
	uniformClass = "U_B_CBRN_CTRG_GER_S_Arid";
	
	class EventHandlers
	{
		class CBRN_giveMask
		{
			init = "(_this select 0) addItem 'G_CBRN_M04_Hood'";
		};
	};
};
class B_CBRN_CTRG_GER_S_Tropic_Unarmed: B_Soldier_unarmed_F
{
	scope = 1;
	editorSubcategory = "CBRN";
	
	//editorPreview = "\bonusUnits_CSF\editorPreviews\O_CSF_Unarmed.jpg";
	author = "The_M";
	
	hiddenSelections[] = {"camo"};
	hiddenSelectionsTextures[] = {"\CBRN_gear\data\clothing1_CTRG_GER_tropic_co.paa"};
	
	modelSides[] = {0, 1, 2, 3};
	
	model = "\A3\Characters_F_Exp\BLUFOR\B_CTRG_Soldier_01_F.p3d";
	
	uniformClass = "U_B_CBRN_CTRG_GER_S_Tropic";
	
	class EventHandlers
	{
		class CBRN_giveMask
		{
			init = "(_this select 0) addItem 'G_CBRN_M04_Hood'";
		};
	};
};
class B_CBRN_CTRG_GER_S_Tropic_CBRN_Unarmed: B_Soldier_unarmed_F
{
	scope = 1;
	editorSubcategory = "CBRN";
	
	//editorPreview = "\bonusUnits_CSF\editorPreviews\O_CSF_Unarmed.jpg";
	author = "The_M";
	
	hiddenSelections[] = {"camo"};
	hiddenSelectionsTextures[] = {"\CBRN_gear\data\clothing1_CTRG_GER_tropic_co.paa"};
	
	modelSides[] = {0, 1, 2, 3};
	
	model = "\A3\Characters_F_Exp\BLUFOR\B_CTRG_Soldier_01_F.p3d";
	
	uniformClass = "U_B_CBRN_CTRG_GER_S_Tropic";
	
	class EventHandlers
	{
		class CBRN_giveMask
		{
			init = "(_this select 0) addItem 'G_CBRN_M04_Hood'";
		};
	};
};