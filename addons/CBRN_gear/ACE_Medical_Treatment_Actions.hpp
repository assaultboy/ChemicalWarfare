class ACE_Medical_Actions
{
	class Basic
	{
		class Morphine;
		
		class Atropine: Morphine
		{
			displayName = "Inject Atropine";
			displayNameProgress = "Injecting Atropine...";
			items[] = {"ACE_atropine"};
			litter[] = { {"All", "", {"ACE_MedicalLitter_atropine"}} };
		};
	};
};