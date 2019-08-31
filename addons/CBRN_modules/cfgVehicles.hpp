class cfgVehicles
{
	class Logic;
	class Module_F: Logic
	{
		class AttributesBase
		{
			class Default;
			class Edit;
			class Combo;
			class Checkbox;
			class CheckboxNumber;
			class ModuleDescription;
			class Units;
		};
		class ModuleDescription
		{
			class AnyBrain;
		};
	};
	
	
	//Used by zeus to remove players exposure
	class ModuleCBRN_RemoveExposure: Module_F
	{
		displayName = "Remove Exposure";
		author = "Assaultboy";
		scope = 1;
		scopeCurator = 2;
		category = "CBRN_modules";
		
		isGlobal = 1;
		function = "CBRN_fnc_moduleRemoveExposure";
		class Attributes: AttributesBase
		{
			class Units: Units
			{
				property = "ModuleCBRN_RemoveExposure_Units";
			};
		};
	};
	
	//Used by zeus to drop chemical shells
	class ModuleOrdnanceMortar_F;
	class ModuleOrdnanceMortar_Chemical_Type0: ModuleOrdnanceMortar_F
	{
		author = "Assaultboy";
		displayName = "82 mm CS Gas";
		category = "CBRN_modules";
		function = "CBRN_fnc_moduleProjectile";
		ammo = "Sh_82mm_AMOS_Chem_Type0";
	};
	
	class ModuleOrdnanceMortar_Chemical_Type1: ModuleOrdnanceMortar_Chemical_Type0
	{
		displayName = "82 mm Asphyxiant Gas";
		ammo = "Sh_82mm_AMOS_Chem_Type1";
	};
	
	class ModuleOrdnanceMortar_Chemical_Type2: ModuleOrdnanceMortar_Chemical_Type0
	{
		displayName = "82 mm Nerve agent";
		ammo = "Sh_82mm_AMOS_Chem_Type2";
	};
};