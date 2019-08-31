class rscTitles
{
	class RscCBRN_maskEffect
	{
		duration = 1e+011;
		fadeIn = 0;
		fadeOut = 0.5;
		idd = -1;
		movingEnable = 0;
		name = "RscCBRN_maskEffect";
		onLoad = "uiNamespace setVariable ['CBRN_mask_displayEffect', _this select 0]";
		onUnload = "uiNamespace setVariable ['CBRN_mask_displayEffect', displayNull]";
		
		class controls
		{
			class maskOverlay
			{
				colorBackground[] = {0,0,0,0};
				colorText[] = {1,1,1,1};
				fixedWidth = 0;
				font = "RobotoCondensed";
				h = "safezoneH";
				idc = -1;
				lineSpacing = 0;
				shadow = 0;
				sizeEx = 0;
				style = 48;
				text = "";
				type = 0;
				w = "safezoneW";
				x = "safezoneX";
				y = "safezoneY";
			};
		};
	};
};