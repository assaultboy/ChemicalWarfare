class cfgGlasses
{
	class None;
	class G_Balaclava_TI_G_blk_F;
	class G_Balaclava_TI_blk_F;
	
	
	class G_CBRN_M50: None
	{
		author = "Assaultboy"; //Obvious
		displayname = "M50 Promask"; //What the player sees
		model = "\skn_nbc_units\models\skn_b_nbc_mask.p3d"; //A Path to the .p3d file
		picture = "\CBRN_data\ui\items\maskM50.paa"; //This is what is shown in the inventroy etc
		identityTypes[] = {}; //This is used to add the mask to the random facewear selection pool. Leave it blank to keep it from being spawned rnadomly on people
		mass = 4; //The 'weight' of the mask

		ACE_Overlay = "CBRN_data\ui\hud\maskSharedOverlay.paa"; //This is projected onto the screen when wearing the mask (Only when ACE is enabled, leave blank to disable)
		
		ACE_Resistance = 2; //How easy is it to break (2 being indestructable)
		ACE_Protection = 1; //I forget what this one does but it prevents ace fuckery

		CBRN_protection = 1; //Used by 'Chemical Warfare' mod to designate this mask as protective
	};
	
	class G_CBRN_M50_Hood: G_CBRN_M50
	{
		author = "Assaultboy";
		displayname = "M50 Promask w/ Hood";
		model = "\skn_nbc_units\models\skn_b_nbc_mask_hood.p3d";
	};
	
	class G_CBRN_M04: G_CBRN_M50
	{
		author = "Assaultboy";
		displayname = "M04 Promask";
		model = "\skn_nbc_units\models\skn_i_nbc_mask.p3d";
		picture = "\CBRN_data\ui\items\maskM04.paa";
		ACE_Overlay = "CBRN_data\ui\hud\maskSharedOverlay.paa";
	};
	
	class G_CBRN_M04_Hood: G_CBRN_M04
	{
		author = "Assaultboy";
		displayname = "M04 Promask w/ Hood";
		model = "\skn_nbc_units\models\skn_i_nbc_mask_hood.p3d";
	};
	
	class G_CBRN_S10: G_CBRN_M50
	{
		author = "Assaultboy";
		displayname = "S10 Promask";
		model = "\skn_nbc_units\models\skn_o_nbc_mask.p3d";
		picture = "\CBRN_data\ui\items\maskS10.paa";
		ACE_Overlay = "CBRN_data\ui\hud\maskOpforOverlay.paa";
	};
	class gm_ge_facewear_m65: none
	{

		identityTypes[] = {}; 

		ACE_Overlay = "CBRN_data\ui\hud\maskSharedOverlay.paa"; 
		
		ACE_Resistance = 2; 
		ACE_Protection = 1; 

		CBRN_protection = 1; 
	};
	
	class gm_gc_army_facewear_schm41m: none
	{
 
		identityTypes[] = {}; 

		ACE_Overlay = "CBRN_data\ui\hud\maskOpforOverlay.paa"; 
		
		ACE_Resistance = 2; 
		ACE_Protection = 1; 

		CBRN_protection = 1; 
	}
	class G_RegulatorMask_base_F: none
	{

		identityTypes[] = {}; 

		ACE_Overlay = "CBRN_data\ui\hud\maskSharedOverlay.paa";
		ACE_Overlay = "CBRN_data\ui\hud\maskSharedOverlay.paa"; 
		
		ACE_Resistance = 2; 
		ACE_Protection = 1; 

		CBRN_protection = 1; 
	};
	class G_AirPurifyingRespirator_01_base_F: none
	{

		identityTypes[] = {}; 
D
		ACE_Overlay = "CBRN_data\ui\hud\maskSharedOverlay.paa";
		ACE_Resistance = 2; 
		ACE_Protection = 1; 

		CBRN_protection = 1; 
	};
		class G_AirPurifyingRespirator_02_base_F: none
	{

		identityTypes[] = {}; 

		ACE_Overlay = "CBRN_data\ui\hud\maskSharedOverlay.paa";
		ACE_Resistance = 2; 
		ACE_Protection = 1; 
		CBRN_protection = 1; 
	};
	class G_CTRG_GER_tropic_Balaclava: G_Balaclava_TI_blk_F
	{
		displayName = "Stealth Balaclava CTRG (tropic)";
		author = "The M/IndeedPeten";
        picture = "\CBRN_gear\ui\icons\icon_G_Balaclava_TI_CTRG_GER_Tropic_F_ca.paa"; 
		identityTypes[] = {}; 
		hiddenSelections[] = {"camo"};
        hiddenSelectionsTextures[] = {"\CBRN_gear\data\G_Balaclava_TI_CTRG_GER_Tropic_F_co.paa"};
		
		ACE_Resistance = 2; 
		ACE_Protection = 0; 

 
	};
		class G_CTRG_GER_arid_Balaclava: G_Balaclava_TI_blk_F
	{
		displayName = "Stealth Balaclava CTRG (arid)";
		author = "The M/IndeedPeten";
        picture = "\CBRN_gear\ui\icons\icon_G_Balaclava_TI_CTRG_GER_Arid_F_ca.paa";
		identityTypes[] = {}; 
		hiddenSelections[] = {"camo"};
        hiddenSelectionsTextures[] = {"\CBRN_gear\data\G_Balaclava_TI_CTRG_GER_Arid_F_co.paa"};
		
		ACE_Resistance = 2; 
		ACE_Protection = 0; 

 
	};
	class G_CTRG_GER_tropic_Balaclava_G: G_Balaclava_TI_G_blk_F
	{
		displayName = "Stealth Balaclava CTRG (tropic, Goggles)";
		author = "The M/IndeedPeten";
        picture = "\CBRN_gear\ui\icons\icon_G_Balaclava_TI_CTRG_GER_Tropic_F_ca.paa"; 
		identityTypes[] = {}; 
        hiddenSelections[] = {"Camo1","Camo2"};
		hiddenSelectionsTextures[] = {"\CBRN_gear\data\G_Balaclava_TI_CTRG_GER_Tropic_F_co.paa","\A3\Characters_F\Heads\Glasses\data\g_combat_ca.paa"};
		
		ACE_Resistance = 2; 
		ACE_Protection = 1; 

 
	};
	class G_CTRG_GER_arid_Balaclava_G: G_Balaclava_TI_G_blk_F
	{
		displayName = "Stealth Balaclava CTRG (arid, Goggles)";
		author = "The M/IndeedPeten";
        picture = "\CBRN_gear\ui\icons\icon_G_Balaclava_TI_CTRG_GER_Arid_F_ca.paa"; 
		identityTypes[] = {}; 
        hiddenSelections[] = {"Camo1","Camo2"};
		hiddenSelectionsTextures[] = {"\CBRN_gear\data\G_Balaclava_TI_CTRG_GER_Arid_F_co.paa","\A3\Characters_F\Heads\Glasses\data\g_combat_ca.paa"};
		
		ACE_Resistance = 2; 
		ACE_Protection = 1; 

 
	};
};