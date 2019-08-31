class cfg3Den
{
	class Object
	{
		class AttributeCategories
		{
			class StateSpecial
			{
				class Attributes
				{
					class CBRN_isImmuneToCBRN
					{
						displayName = "Immune to chemicals";
						tooltip = "Should this unit be immune to chemical weapons even when unprotected?";
						property = "CBRN_immuneToCBRN";
						control = "Checkbox";
						defaultValue = "false";
						expression = "if (_value) then {[_this, true] call CBRN_fnc_makeImmune}";
						condition = "objectControllable";
					};
				};
			};
		};
	};
};