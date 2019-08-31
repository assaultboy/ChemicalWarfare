class cfgMagazines
{
	class 8Rnd_82mm_Mo_shells;
	class 4Rnd_82mm_Mo_Chemical_Type0: 8Rnd_82mm_Mo_shells
	{
		author = "Assaultboy";
		displayNameMFDFormat = "CS";
		displayNameShort = "CS";
		displayName = "CS Gas Mortar Shells";
		ammo = "Sh_82mm_AMOS_Chem_Type0";
		count = 4;
	};
	
	class 4Rnd_82mm_Mo_Chemical_Type1: 4Rnd_82mm_Mo_Chemical_Type0
	{
		displayNameMFDFormat = "Asphyxiant";
		displayNameShort = "Asphyxiant";
		displayName = "Asphyxiant Chemical Mortar Shells";
		ammo = "Sh_82mm_AMOS_Chem_Type1";
	};
	
	class 4Rnd_82mm_Mo_Chemical_Type2: 4Rnd_82mm_Mo_Chemical_Type0
	{
		displayNameMFDFormat = "Nerve Agent";
		displayNameShort = "Nerve Agent";
		displayName = "Nerve Agent Mortar Shells";
		ammo = "Sh_82mm_AMOS_Chem_Type2";
	};
};