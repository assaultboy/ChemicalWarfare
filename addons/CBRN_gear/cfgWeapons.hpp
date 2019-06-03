class cfgWeapons
{
	class itemCore;
	class InventoryItem_Base_F;
	
	class CBRN_itemBase: itemCore {
		type = 4096;//4;
		detectRange = -1;
		simulation = "ItemMineDetector";
		author = "Assaultboy";
		scope = 1;
		icon = "iconObject_circle";
		model = "\A3\weapons_F\ammo\mag_univ.p3d";
		mapSize = 0.034;
		class ItemInfo: InventoryItem_Base_F {
			mass = 1;
		};
		
		CBRN_disposeOnUse = 0;
	};

	class CBRN_DeconKit: CBRN_itemBase {
		scope = 2;
		displayName = "Decontamination Kit";
		descriptionShort = "A kit used to decontaminate a single person in the field after a chemical attack.";
		descriptionUse = "UNUSED TEXT LET ASSAULTBOY KNOW IF YOU SEE THIS (REFERENCE: 'CBRN_DeconKit')";
		picture = "\CBRN_data\ui\items\deconKit.paa";
		CBRN_disposeOnUse = 1;
	};
	
	class CBRN_DetectionKit: CBRN_itemBase {
		scope = 2;
		displayName = "Chemical Detection Kit";
		descriptionShort = "A kit used to check for harmful chemical agents.";
		descriptionUse = "UNUSED TEXT LET ASSAULTBOY KNOW IF YOU SEE THIS (REFERENCE: 'CBRN_DetectionKit')";
		picture = "\CBRN_data\ui\items\detectionKit.paa";
	};
	
	class CBRN_NAAK: CBRN_itemBase {
		scope = 2;
		displayName = "Chemical Antidote Kit";
		descriptionShort = "An antidote for various weaponized chemicals.";
		descriptionUse = "UNUSED TEXT LET ASSAULTBOY KNOW IF YOU SEE THIS (REFERENCE: 'CBRN_NAAK')";
		picture = "\CBRN_data\ui\items\NAAK.paa";
		CBRN_disposeOnUse = 1;
	};
			
    class CBRN_Sample_1: CBRN_itemBase {
        author = "The_M";
        scope = 2;
		ace_arsenal_hide = 1
        scopeCurator = 2;
        displayName = "Sample 1"
		model = "a3\Props_F_Orange\Humanitarian\Garbage\MedicalGarbage_01_Injector_F";
		editorPreview = "\A3\EditorPreviews_F_Orange\Data\CfgVehicles\MedicalGarbage_01_Injector_F.jpg";
		picture = "\A3\EditorPreviews_F_Orange\Data\CfgVehicles\MedicalGarbage_01_Injector_F.jpg"; 
    };
	
	    class CBRN_Sample_2: CBRN_itemBase {
        author = "The_M";
        scope = 2;
		ace_arsenal_hide = 1
        scopeCurator = 2;
        displayName = "Sample 2"
		model = "a3\Props_F_Orange\Humanitarian\Garbage\MedicalGarbage_01_Injector_F";
		editorPreview = "\A3\EditorPreviews_F_Orange\Data\CfgVehicles\MedicalGarbage_01_Injector_F.jpg";
		picture = "\A3\EditorPreviews_F_Orange\Data\CfgVehicles\MedicalGarbage_01_Injector_F.jpg"; 
    };
	
		    class CBRN_Sample_3: CBRN_itemBase {
        author = "The_M";
        scope = 2;
		ace_arsenal_hide = 1
        scopeCurator = 2;
        displayName = "Sample 3"
		model = "a3\Props_F_Orange\Humanitarian\Garbage\MedicalGarbage_01_Injector_F";
		editorPreview = "\A3\EditorPreviews_F_Orange\Data\CfgVehicles\MedicalGarbage_01_Injector_F.jpg";
		picture = "\A3\EditorPreviews_F_Orange\Data\CfgVehicles\MedicalGarbage_01_Injector_F.jpg"; 
    };
	
	class GrenadeLauncher;
	class Throw: GrenadeLauncher {
		muzzles[] += {"CBRN_Grenade_SMuzzle", "CBRN_Grenade_NMuzzle"};

		class SmokeShellMuzzle;
		class CBRN_Grenade_SMuzzle: SmokeShellMuzzle {
			magazines[] = {"CBRN_Grenade_S"};
		};
		
		class CBRN_Grenade_NMuzzle: SmokeShellMuzzle {
			magazines[] = {"CBRN_Grenade_N"};
		};
	};
	
	//SUITS----------------------------------------
	class U_B_CombatUniform_mcam;
	class U_O_CombatUniform_ocamo;
	class U_I_CombatUniform;
	class U_B_CTRG_Soldier_F;
	class UniformItem;

	
	class U_B_CBRN: U_B_CombatUniform_mcam {
		author = "Assaultboy";
        scope = 2;
        displayName = "CBRN Uniform (M50)";
        picture = "\CBRN_data\ui\items\uniformBlufor.paa";
        hiddenSelections[] = {"camo"};
        hiddenSelectionsTextures[] = {"\skn_nbc_units\data_m50\NBC_M50_Uniform_CO.paa"};
		
		CBRN_protection = 1;
 
        class ItemInfo: UniformItem
        {
            uniformModel = "-";
            uniformClass = "B_CBRN_Unarmed";
            containerClass = Supply40;
            mass = 80;
        };
	};
	
	class U_O_CBRN: U_O_CombatUniform_ocamo {
		author = "Assaultboy";
        scope = 2;
        displayName = "CBRN Uniform (M04)";
        picture = "\CBRN_data\ui\items\uniformOpfor.paa";
        hiddenSelections[] = {"camo"};
        hiddenSelectionsTextures[] = {"\skn_nbc_units\data\xrt_suit_blu_co.paa"};
		
		CBRN_protection = 1;
 
        class ItemInfo: UniformItem
        {
            uniformModel = "-";
            uniformClass = "O_CBRN_Unarmed";
            containerClass = Supply40;
            mass = 80;
        };
	};
	
	class U_I_CBRN: U_I_CombatUniform {
		author = "Assaultboy";
        scope = 2;
        displayName = "CBRN Uniform (S10)";
        picture = "\CBRN_data\ui\items\uniformInd.paa";
        hiddenSelections[] = {"camo"};
        hiddenSelectionsTextures[] = {"\skn_nbc_units\data\noddy_suit_dry_blue_co.paa"};
		
		CBRN_protection = 1;
 
        class ItemInfo: UniformItem
        {
            uniformModel = "-";
            uniformClass = "I_CBRN_Unarmed";
            containerClass = Supply40;
            mass = 80;
        };
	};
		class U_B_CBRN_CTRG: U_B_CTRG_Soldier_F {
		author = "The M";
        scope = 2;
        displayName = "CTRG Stealth Uniform (CBRN)";

		CBRN_protection = 1;
 
        class ItemInfo: UniformItem
        {
            uniformModel = "-";
            uniformClass = "B_CBRN_CTRG_Unarmed";
            containerClass = Supply40;
            mass = 80;
        };
	};
};

