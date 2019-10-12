class cfgAmmo
{
	class IEDLandSmall_Remote_Ammo;
	class CBRN_IEDLandSmall_Type1_Remote_Ammo: IEDLandSmall_Remote_Ammo
	{
		hit = 0;
		indirectHit = 0;
		
		CBRN_isPlacedExplosive = 1;
		CBRN_chemicalType = 1
		CBRN_heightOfBurst = 3;
		CBRN_sprayWidth = 10;
		CBRN_lifetime = 60;
	};
	class CBRN_IEDLandSmall_Type1_Command_Ammo: CBRN_IEDLandSmall_Type1_Remote_Ammo{mineTrigger = "RemoteTrigger";};
	class CBRN_IEDLandSmall_Type1_Range_Ammo: CBRN_IEDLandSmall_Type1_Remote_Ammo{mineTrigger = "RangeTriggerShort";};
	
	class CBRN_IEDLandSmall_Type2_Remote_Ammo: CBRN_IEDLandSmall_Type1_Remote_Ammo
	{
		CBRN_chemicalType = 2
	};
	class CBRN_IEDLandSmall_Type2_Command_Ammo: CBRN_IEDLandSmall_Type2_Remote_Ammo{mineTrigger = "RemoteTrigger";};
	class CBRN_IEDLandSmall_Type2_Range_Ammo: CBRN_IEDLandSmall_Type2_Remote_Ammo{mineTrigger = "RangeTriggerShort";};
	
	
	class IEDUrbanSmall_Remote_Ammo;
	class CBRN_IEDUrbanSmall_Type1_Remote_Ammo: IEDUrbanSmall_Remote_Ammo
	{
		hit = 0;
		indirectHit = 0;
		
		CBRN_isPlacedExplosive = 1;
		CBRN_chemicalType = 1
		CBRN_heightOfBurst = 3;
		CBRN_sprayWidth = 10;
		CBRN_lifetime = 60;
	};
	class CBRN_IEDUrbanSmall_Type1_Command_Ammo: CBRN_IEDUrbanSmall_Type1_Remote_Ammo{mineTrigger = "RemoteTrigger";};
	class CBRN_IEDUrbanSmall_Type1_Range_Ammo: CBRN_IEDUrbanSmall_Type1_Remote_Ammo{mineTrigger = "RangeTriggerShort";};
	
	class CBRN_IEDUrbanSmall_Type2_Remote_Ammo:CBRN_IEDUrbanSmall_Type1_Remote_Ammo
	{
		CBRN_chemicalType = 2;
	};
	class CBRN_IEDUrbanSmall_Type2_Command_Ammo: CBRN_IEDUrbanSmall_Type2_Remote_Ammo{mineTrigger = "RemoteTrigger";};
	class CBRN_IEDUrbanSmall_Type2_Range_Ammo: CBRN_IEDUrbanSmall_Type2_Remote_Ammo{mineTrigger = "RangeTriggerShort";};
	
	class ClaymoreDirectionalMine_Remote_Ammo_Scripted;
	class ClaymoreDirectionalMine_Remote_Ammo_Scripted_Fake: ClaymoreDirectionalMine_Remote_Ammo_Scripted
	{
		hit = 0;
		indirectHit = 0;
	};
};