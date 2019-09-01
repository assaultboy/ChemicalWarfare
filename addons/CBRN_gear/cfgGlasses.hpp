class cfgGlasses
{
	//Vanilla stuff
	class G_RegulatorMask_base_F;
	
	class G_RegulatorMask_F: G_RegulatorMask_base_F
	{
		CBRN_protectionLevel = 1 + 2;
		CBRN_overlayType = "CBRN_gear\data\hud\overlay_style_m50.paa";
	};
	
	class G_AirPurifyingRespirator_02_base_F;
	
	class G_AirPurifyingRespirator_02_black_F :G_AirPurifyingRespirator_02_base_F
	{
		CBRN_protectionLevel = 1 + 2;
		CBRN_overlayType = "CBRN_gear\data\hud\overlay_style_m50.paa";
	};
	
	class G_AirPurifyingRespirator_02_olive_F :G_AirPurifyingRespirator_02_base_F
	{
		CBRN_protectionLevel = 1 + 2;
		CBRN_overlayType = "CBRN_gear\data\hud\overlay_style_m50.paa";
	};
	
	class G_AirPurifyingRespirator_02_sand_F :G_AirPurifyingRespirator_02_base_F
	{
		CBRN_protectionLevel = 1 + 2;
		CBRN_overlayType = "CBRN_gear\data\hud\overlay_style_m50.paa";
	};
	
	class G_AirPurifyingRespirator_01_F :G_AirPurifyingRespirator_02_base_F
	{
		CBRN_protectionLevel = 1 + 2;
		CBRN_overlayType = "CBRN_gear\data\hud\overlay_style_m50.paa";
	};
	
	//Free stuff
	class G_CBRN_M50: G_RegulatorMask_F
	{
		author = "Assaultboy"; //Obvious
		displayname = "M50 Promask"; //What the player sees
		model = "\skn_nbc_units\models\skn_b_nbc_mask.p3d"; //A Path to the .p3d file
		picture = "\CBRN_gear\data\items\maskM50.paa"; //This is what is shown in the inventory etc
		identityTypes[] = {}; //This is used to add the mask to the random facewear selection pool. Leave it blank to keep it from being spawned rnadomly on people
		mass = 4; //The 'weight' of the mask

		//ACE_Overlay = "CBRN_data\ui\hud\maskSharedOverlay.paa"; //This is projected onto the screen when wearing the mask (Only when ACE is enabled, leave blank to disable)

		CBRN_protectionLevel = 1 + 2; //Used by 'Chemical Warfare' mod to designate this mask as protective
		CBRN_overlayType = "CBRN_gear\data\hud\overlay_style_m50.paa";
		
		DLC = "";
	};
	
	class G_CBRN_M50_Hood: G_CBRN_M50
	{
		author = "Assaultboy";
		displayname = "M50 Promask w/ Hood";
		model = "\skn_nbc_units\models\skn_b_nbc_mask_hood.p3d";
		CBRN_protectionLevel = 1 + 2 + 4;
	};
	
	class G_CBRN_M04: G_CBRN_M50
	{
		author = "Assaultboy";
		displayname = "M04 Promask";
		model = "\skn_nbc_units\models\skn_i_nbc_mask.p3d";
		picture = "\CBRN_gear\data\items\maskM04.paa";
		//ACE_Overlay = "CBRN_data\ui\hud\maskSharedOverlay.paa";
	};
	
	class G_CBRN_M04_Hood: G_CBRN_M04
	{
		author = "Assaultboy";
		displayname = "M04 Promask w/ Hood";
		model = "\skn_nbc_units\models\skn_i_nbc_mask_hood.p3d";
		
		CBRN_protectionLevel = 1 + 2 + 4;
	};
	
	class G_CBRN_S10: G_CBRN_M50
	{
		author = "Assaultboy";
		displayname = "S10 Promask w/ Hood";
		model = "\skn_nbc_units\models\skn_o_nbc_mask.p3d";
		picture = "\CBRN_gear\data\items\maskS10.paa";
		//ACE_Overlay = "CBRN_data\ui\hud\maskOpforOverlay.paa";
		
		CBRN_protectionLevel = 1 + 2 + 4;
		CBRN_overlayType = "CBRN_gear\data\hud\overlay_style_round.paa";
	};
};