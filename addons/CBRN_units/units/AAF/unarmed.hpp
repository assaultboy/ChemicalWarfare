class I_Soldier_unarmed_F;
class I_CBRN_Unarmed: I_Soldier_unarmed_F
{
	scope = 1;
	editorSubcategory = "CBRN";
	
	//editorPreview = "\bonusUnits_CSF\editorPreviews\O_CSF_Unarmed.jpg";
	author = "Assaultboy";
	
	hiddenSelections[] = {"camo"};
	hiddenSelectionsTextures[] = {"\skn_nbc_units\data\noddy_suit_dry_blue_co.paa"};
	
	modelSides[] = {0, 1, 2, 3};
	
	model = "\skn_nbc_units\models\skn_o_nbc_uniform.p3d";
	
	uniformClass = "U_I_CBRN";
	
	class EventHandlers
	{
		class CBRN_giveMask
		{
			init = "(_this select 0) addItem 'G_CBRN_M50_Hood'";
		};
	};
};