class cfgVehicles
{
	class Man;
	class CAManBase: Man
	{
		class ACE_Actions
		{
			class ACE_Head
			{
				class CBRN_putMaskOn
				{
					displayName = "Put mask on";
					condition = "(ace_medical_menuTypeStyle == 0) && ((_target call CBRN_fnc_hasMaskInInventory) || (_player call CBRN_fnc_hasMaskInInventory)) && (_target getVariable ['ACE_isUnconscious', false]) && !((goggles _target) in CBRN_allLevel1Masks)";
					statement = "[_player, _target] call CBRN_fnc_putMaskOnAction";
					icon = "CBRN_scripts\data\icons\gasmaskIcon.paa";
				};	
			};
			
			class CBRN_Head
			{
				displayName = "Put mask on";
				condition = "(ace_medical_menuTypeStyle != 0) && ((_target call CBRN_fnc_hasMaskInInventory) || (_player call CBRN_fnc_hasMaskInInventory)) && (_target getVariable ['ACE_isUnconscious', false]) && !((goggles _target) in CBRN_allLevel1Masks)";
				distance = 1.75;
				exceptions[] = {"isNotSwimming"};
				selection = "pilot";
				
				statement = "[_player, _target] call CBRN_fnc_putMaskOnAction";
				icon = "CBRN_scripts\data\icons\gasmaskIcon.paa";
			};
		};
	};
	
	
	//Explosives
	class MineBase;
	
	
	
	class IEDUrbanSmall_F: MineBase
	{
		//Because MineBase doesn't support CBA XEH? Why?
		class EventHandlers
		{
			class CBRN_handleCuratorExplosives
			{
				init = "_this call CBRN_fnc_handleCuratorExplosives";
			};
		};
	};
	class CBRN_IEDUrbanSmall_Type1: IEDUrbanSmall_F
	{
		editorCategory = "EdCat_Things";
		editorSubcategory = "EdSubcat_Explosives";
		displayName = "Asphyxiant IED (Urban)";
		author = "Assautlboy";
		
		ammo = "CBRN_IEDUrbanSmall_Type1_Remote_Ammo";
		
		side = 3;
		scope = 1;
		scopeCurator = 2;
	};
	class CBRN_IEDUrbanSmall_Type2: CBRN_IEDUrbanSmall_Type1
	{
		displayName = "Nerve Agent IED (Urban)";
		ammo = "CBRN_IEDUrbanSmall_Type2_Remote_Ammo";
	};
	
	
	
	class IEDLandSmall_F: MineBase
	{
		//Because MineBase doesn't support CBA XEH? Why?
		class EventHandlers
		{
			class CBRN_handleCuratorExplosives
			{
				init = "_this call CBRN_fnc_handleCuratorExplosives";
			};
		};
	};
	class CBRN_IEDLandSmall_Type1: IEDLandSmall_F
	{
		editorCategory = "EdCat_Things";
		editorSubcategory = "EdSubcat_Explosives";
		displayName = "Asphyxiant IED (Dug-In)";
		author = "Assautlboy";
		
		ammo = "CBRN_IEDLandSmall_Type1_Remote_Ammo";
		
		side = 3;
		scope = 1;
		scopeCurator = 2;
	};
	class CBRN_IEDLandSmall_Type2: CBRN_IEDLandSmall_Type1
	{
		displayName = "Nerve Agent IED (Dug-In)";
		ammo = "CBRN_IEDLandSmall_Type2_Remote_Ammo";
	};
};