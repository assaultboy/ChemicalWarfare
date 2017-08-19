class CfgVehicles {
	class Man;
	class CAManBase: Man 
	{
		class EventHandlers
		{
			class CBRN_Contamination
			{
				respawn = "(_this select 0) setVariable ['CBRN_contaminationLevel', 0];(_this select 0) setVariable ['CBRN_chemicalDamage', 0];";
			};
		};
	};
};