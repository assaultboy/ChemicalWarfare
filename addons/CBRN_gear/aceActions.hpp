class ACE_SelfActions
{
	class CBRN_Equipment
	{
		displayName = "CBRN";
		condition = "((('CBRN_DeconKit' in items _player) || ('CBRN_DetectionKit' in items _player)) || ('CBRN_NAAK' in items _player)) && (CBRN_set_showAceSelfInteractions)";
		exceptions[] = {};
		statement = "";
		icon = "\CBRN_data\ui\icons\interactionIcon.paa";
		
		class CBRN_selfUseDeconKit
		{
			displayName = "Self Decontaminate";
			condition = "('CBRN_DeconKit' in items _player)";
			exceptions[] = {};
			statement = "[_player, 'CBRN_DeconKit', _player] remoteExecCall ['CBRN_fnc_useItem', 2]";
			icon = "\CBRN_data\ui\items\deconKit.paa";
		};
		
		class CBRN_selfUseNAAK
		{
			displayName = "Administer Antidote Kit";
			condition = "('CBRN_NAAK' in items _player)";
			exceptions[] = {};
			statement = "[_player, 'CBRN_NAAK', _player] remoteExecCall ['CBRN_fnc_useItem', 2]";
			icon = "\CBRN_data\ui\items\NAAK.paa";
		};
		
		class CBRN_DetectionKit
		{
			displayName = "Detection Kit";
			condition = "'CBRN_DetectionKit' in items _player";
			exceptions[] = {};
			statement = "";
			icon = "\CBRN_data\ui\items\detectionKit.paa";
			
			class CBRN_DetectionKit_CheckSelf
			{
				displayName = "Check Self";
				condition = "'CBRN_DetectionKit' in items _player";
				exceptions[] = {};
				statement = "[_player, 'CBRN_DetectionKit', _player] remoteExecCall ['CBRN_fnc_useItem', 2]";
			};
			
			class CBRN_DetectionKit_CheckArea
			{
				displayName = "Check Area";
				condition = "'CBRN_DetectionKit' in items _player";
				exceptions[] = {};
				statement = "[_player, 'CBRN_DetectionKit'] remoteExecCall ['CBRN_fnc_useItem', 2]";
			};
		};
	};
};

class ACE_Actions
{
	class ACE_MainActions
	{
		class CBRN_Equipment
		{
			displayName = "CBRN";
			condition = "((('CBRN_DeconKit' in items _player) || ('CBRN_DetectionKit' in items _player)) || ('CBRN_NAAK' in items _player)) && (CBRN_set_showAceInteractions)";
			exceptions[] = {};
			statement = "";
			icon = "\CBRN_data\ui\icons\interactionIcon.paa";
			
			class CBRN_OtherUseDeconKit
			{
				displayName = "Decontaminate";
				condition = "('CBRN_DeconKit' in items _player)";
				exceptions[] = {};
				statement = "[_player, 'CBRN_DeconKit', _target] remoteExecCall ['CBRN_fnc_useItem', 2]";
				icon = "\CBRN_data\ui\items\deconKit.paa";
			};
			
			class CBRN_OtherUseNAAK
			{
				displayName = "Administer Antidote Kit";
				condition = "('CBRN_NAAK' in items _player)";
				exceptions[] = {};
				statement = "[_player, 'CBRN_NAAK', _target] remoteExecCall ['CBRN_fnc_useItem', 2]";
				icon = "\CBRN_data\ui\items\NAAK.paa";
			};
			
			class CBRN_DetectionKit_CheckOther
			{
				displayName = "Detection Kit";
				condition = "('CBRN_DetectionKit' in items _player)";
				exceptions[] = {};
				statement = "[_player, 'CBRN_DetectionKit', _target] remoteExecCall ['CBRN_fnc_useItem', 2]";
				icon = "\CBRN_data\ui\items\detectionKit.paa";
			};
		};
	};
};