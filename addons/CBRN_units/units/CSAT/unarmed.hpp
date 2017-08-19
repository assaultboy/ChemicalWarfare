class O_Soldier_unarmed_F;
class O_CBRN_Unarmed: O_Soldier_unarmed_F
{
	scope = 1;
	editorSubcategory = "CBRN";
	
	//editorPreview = "\bonusUnits_CSF\editorPreviews\O_CSF_Unarmed.jpg";
	author = "Assaultboy";
	
	hiddenSelections[] = {"camo"};
	hiddenSelectionsTextures[] = {"\skn_nbc_units\data\xrt_suit_blu_co.paa"};
	
	modelSides[] = {0, 1, 2, 3};
	
	model = "\skn_nbc_units\models\skn_i_nbc_uniform.p3d";
	
	uniformClass = "U_O_CBRN";
	
	class EventHandlers
	{
		class CBRN_giveMask
		{
			init = "(_this select 0) addItem 'G_CBRN_M04'";
		};
	};
};