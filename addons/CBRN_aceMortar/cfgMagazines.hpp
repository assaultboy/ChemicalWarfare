class cfgMagazines
{
	class ACE_1Rnd_82mm_Mo_HE;
	class CBRN_1Rnd_82mm_Mo_Chemical_Type0: ACE_1Rnd_82mm_Mo_HE
	{
		author = "Assaultboy";
		ammo = "Sh_82mm_AMOS_Chem_Type0";
		displayNameMFDFormat = "CS";
		displayNameShort = "CS";
		displayName = "82mm CS Gas Round";
	};
	class CBRN_1Rnd_82mm_Mo_Chemical_Type1: CBRN_1Rnd_82mm_Mo_Chemical_Type0
	{
		ammo = "Sh_82mm_AMOS_Chem_Type1";
		displayNameMFDFormat = "Asphyxiant";
		displayNameShort = "Asphyxiant";
		displayName = "82mm Asphyxiant Gas Round";
	};
	class CBRN_1Rnd_82mm_Mo_Chemical_Type2: CBRN_1Rnd_82mm_Mo_Chemical_Type0
	{
		ammo = "Sh_82mm_AMOS_Chem_Type2";
		displayNameMFDFormat = "Nerve Agent";
		displayNameShort = "Nerve Agent";
		displayName = "82mm Nerve Agent Round";
	};
};