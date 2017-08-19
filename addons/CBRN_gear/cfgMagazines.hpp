class CfgMagazines {
	class SmokeShell;
	class CBRN_Grenade_S: SmokeShell {
		author = "Assaultboy";
		displayname = "Suffocation Agent Grenade";
		descriptionShort = "Type: Suffocation Agent Grenade<br />Rounds: 1<br />Used in: Hand";
		displayNameShort = "Suffocation Agent";
		//model = QPATHTOF(models\ace_anm14th3.p3d);
		picture = "\CBRN_data\ui\items\chemGrenade";
		ammo = "CBRN_Gas_Base";
		mass = 4;
		CBRN_chemicalLevel = 1;
	};
	
	class CBRN_Grenade_N: CBRN_Grenade_S {
		displayname = "Nerve Agent Grenade";
		descriptionShort = "Type: Nerve Agent Grenade<br />Rounds: 1<br />Used in: Hand";
		displayNameShort = "Nerve Agent";
		CBRN_chemicalLevel = 2;
	};
};