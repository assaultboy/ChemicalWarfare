class CfgAmmo {
	class SmokeShell;
	class GrenadeHand_stone;

	class CBRN_Gas_Base: SmokeShell {
		effectsSmoke = "";
		whistleDist = 0;    
		whistleOnFire = 0;  
		aiAmmoUsageFlags = "64"; // infantry
	};
	
	class CBRN_Gas_Tinted: SmokeShell {
		smokeColor[] = {0.855,1,0.419,0.455};
	};
	
	class CBRN_Gas_Clear: SmokeShell {
		smokeColor[] = {1,1,1,0.1};
	};
};