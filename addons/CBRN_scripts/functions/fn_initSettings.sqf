/*
	DESCRIPTION:
		This function is used to initialize a bunch of stuff for CBRN
		
	PARAMETERS:
		None
			
	RETURNS
		Nothing
		
	EXAMPLE
		call CBRN_fnc_initSettings
*/

//Thresholds for damage / Effects
["CBRN_exposureCoughThreshold", "SLIDER", ["Cough Threshold", "Change the threshold at which units cough from exposure (0 to disable)"], ["Chemical Warfare", "Exposure Thresholds"], [0, 30, 3, 1], 1] call cba_settings_fnc_init;
["CBRN_exposureLimpThreshold", "SLIDER", ["Limp Threshold", "Change the threshold at which units limp from exposure (0 to disable)"], ["Chemical Warfare", "Exposure Thresholds"], [0, 30, 7, 1], 1] call cba_settings_fnc_init;
["CBRN_exposureKnockoutThreshold", "SLIDER", ["Unconscious Threshold", "Change the threshold at which units go unconscious from exposure (0 to disable)"], ["Chemical Warfare", "Exposure Thresholds"], [0, 30, 10, 1], 1] call cba_settings_fnc_init;
["CBRN_exposureDeathThreshold", "SLIDER", ["Death Threshold", "Change the threshold at which units die from exposure (0 to disable)"], ["Chemical Warfare", "Exposure Thresholds"], [0, 30, 20, 1], 1] call cba_settings_fnc_init;

//Gas Colors
["CBRN_color_contamination0", "COLOR", ["Gas Color (CS)", "The color of CS gas"], ["Chemical Warfare", "Chemical Colors"], [0.9294,0.9843,1], 1] call cba_settings_fnc_init;
["CBRN_color_contamination1", "COLOR", ["Gas Color (Asphyxiant)", "The color of asphyxiant chemical gas"], ["Chemical Warfare", "Chemical Colors"], [0.8353,0.9294,0.4627], 1] call cba_settings_fnc_init;
["CBRN_color_contamination2", "COLOR", ["Gas Color (Nerve Agent)", "The color of nerve agent"], ["Chemical Warfare", "Chemical Colors"], [1,0.6666,0.6666], 1] call cba_settings_fnc_init;

//Calculate all our protective masks
private _maskList = [[""], ["None"], 0];
{
	(_maskList # 0) pushBack configName _x;
	(_maskList # 1) pushBack getText (_x >> "displayName");
} forEach ("((getNumber (_x >> 'CBRN_protectionLevel')) > 0) && ((getNumber (_x >> 'scopeArsenal')) > 0)" configClasses (configFile >> "cfgGlasses"));

//Give masks for factions
{
	private _factionName = getText (_x >> "displayName");
	
	[format ["CBRN_factionMask_%1", configName _x], "LIST", [format ["%1 masks", _factionName], "What type of mask should this faction spawn with?"], ["Chemical Warfare", "Faction Gear"], _maskList, 1] call cba_settings_fnc_init;
} forEach ("(getNumber (_x >> 'side')) in [0,1,2,3]" configClasses (configFile >> "cfgFactionClasses"));