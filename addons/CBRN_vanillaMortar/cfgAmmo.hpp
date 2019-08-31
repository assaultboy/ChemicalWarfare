class cfgAmmo
{
	class Sh_82mm_AMOS;
	
	class Sh_82mm_AMOS_Chem_Type0: Sh_82mm_AMOS
	{
		ace_frag_enabled = 0;
		aiAmmoUsageFlags = 64 + 128;
		CraterEffects = "";
		
		CBRN_isProjectile = 1;
		CBRN_chemicalType = 0;
		CBRN_heightOfBurst = 20;
		CBRN_sprayWidth = 15;
		CBRN_lifetime = 90;
	};
	
	class Sh_82mm_AMOS_Chem_Type1: Sh_82mm_AMOS
	{
		ace_frag_enabled = 0;
		aiAmmoUsageFlags = 64 + 128;
		CraterEffects = "";
		
		CBRN_isProjectile = 1;
		CBRN_chemicalType = 1;
		CBRN_heightOfBurst = 30;
		CBRN_sprayWidth = 15;
		CBRN_lifetime = 90;
	};
	
	class Sh_82mm_AMOS_Chem_Type2: Sh_82mm_AMOS
	{
		ace_frag_enabled = 0;
		aiAmmoUsageFlags = 64 + 128;
		CraterEffects = "";
		
		CBRN_isProjectile = 1;
		CBRN_chemicalType = 2;
		CBRN_heightOfBurst = 30;
		CBRN_sprayWidth = 15;
		CBRN_lifetime = 90;
	};
};