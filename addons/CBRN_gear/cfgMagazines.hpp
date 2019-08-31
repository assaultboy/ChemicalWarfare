class cfgMagazines
{	
	class IEDLandSmall_Remote_Mag;
	class CBRN_IEDLandSmall_Type1_Remote_Mag: IEDLandSmall_Remote_Mag
	{
		displayName = "Asphyxiant IED (Dug-In)";
		ammo = "CBRN_IEDLandSmall_Type1_Remote_Ammo";
		ACE_Explosives_SetupObject = "ACE_Explosives_Place_IEDLandSmall";
		class ACE_Triggers {
            SupportedTriggers[] = {"Command", "DeadmanSwitch", "Cellphone", "PressurePlate"};
            class Command {
                FuseTime = 0.5;
                ammo = "CBRN_IEDLandSmall_Type1_Command_Ammo";
            };
            class DeadmanSwitch: Command {};
            class Cellphone: Command {};
            class PressurePlate {
                displayName = "Pressure Plate";
                digDistance = 0;
                ammo = "CBRN_IEDLandSmall_Type1_Range_Ammo";
                pitch = 0;
            };
        };
	};
	class CBRN_IEDLandSmall_Type2_Remote_Mag: IEDLandSmall_Remote_Mag
	{
		displayName = "Nerve Agent IED (Dug-In)";
		ammo = "CBRN_IEDLandSmall_Type2_Remote_Ammo";
		ACE_Explosives_SetupObject = "ACE_Explosives_Place_IEDLandSmall";
		class ACE_Triggers {
            SupportedTriggers[] = {"Command", "DeadmanSwitch", "Cellphone", "PressurePlate"};
            class Command {
                FuseTime = 0.5;
                ammo = "CBRN_IEDLandSmall_Type2_Command_Ammo";
            };
            class DeadmanSwitch: Command {};
            class Cellphone: Command {};
            class PressurePlate {
                displayName = "Pressure Plate";
                digDistance = 0;
                ammo = "CBRN_IEDLandSmall_Type2_Range_Ammo";
                pitch = 0;
            };
        };
	};
	
	class IEDUrbanSmall_Remote_Mag;
	class CBRN_IEDUrbanSmall_Type1_Remote_Mag: IEDUrbanSmall_Remote_Mag
	{
		displayName = "Asphyxiant IED (Urban)";
		ammo = "CBRN_IEDUrbanSmall_Type1_Remote_Ammo";
		ACE_Explosives_SetupObject = "ACE_Explosives_Place_IEDUrbanSmall";
		class ACE_Triggers {
            SupportedTriggers[] = {"Command", "DeadmanSwitch", "Cellphone", "PressurePlate"};
            class Command {
                FuseTime = 0.5;
                ammo = "CBRN_IEDUrbanSmall_Type1_Command_Ammo";
            };
            class DeadmanSwitch: Command {};
            class Cellphone: Command {};
            class PressurePlate {
                displayName = "Pressure Plate";
                digDistance = 0;
                ammo = "CBRN_IEDUrbanSmall_Type1_Range_Ammo";
                pitch = 0;
            };
        };
	};
	class CBRN_IEDUrbanSmall_Type2_Remote_Mag: IEDUrbanSmall_Remote_Mag
	{
		displayName = "Nerve Agent IED (Urban)";
		ammo = "CBRN_IEDUrbanSmall_Type2_Remote_Ammo";
		ACE_Explosives_SetupObject = "ACE_Explosives_Place_IEDUrbanSmall";
		class ACE_Triggers {
            SupportedTriggers[] = {"Command", "DeadmanSwitch", "Cellphone", "PressurePlate"};
            class Command {
                FuseTime = 0.5;
                ammo = "CBRN_IEDUrbanSmall_Type2_Command_Ammo";
            };
            class DeadmanSwitch: Command {};
            class Cellphone: Command {};
            class PressurePlate {
                displayName = "Pressure Plate";
                digDistance = 0;
                ammo = "CBRN_IEDUrbanSmall_Type2_Range_Ammo";
                pitch = 0;
            };
        };
	};
};