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