class CfgGroups
{
	class East
	{

		class bonusUnits_CSF
		{
			name = "Chernarus Strike Force";


			class Infantry
			{
				name = "Infantry";
				
				#include "\bonusUnits_CSF\groups\team.hpp"
				#include "\bonusUnits_CSF\groups\atteam.hpp"
				#include "\bonusUnits_CSF\groups\shockteam.hpp"
				#include "\bonusUnits_CSF\groups\overwatch.hpp"
			};
			
			class SF
			{
				name = "Special Forces";
				
				#include "\bonusUnits_CSF\groups\sfteam.hpp"
				#include "\bonusUnits_CSF\groups\sfpatrol.hpp"
				#include "\bonusUnits_CSF\groups\sfoverwatch.hpp"
			};
		};
	};
};