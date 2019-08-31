/*
	DESCRIPTION:
		This function will handle the overlay cause by gas masks
		This function is called automatically via CBA XEH
		
	PARAMETERS:
		None
			
	RETURNS
		Nothing
		
	EXAMPLE
		call CBRN_fnc_overlayHandler
*/

//Create our layer, it is stored automatically via the onLoad script
"CBRN_maskOverlay" cutRsc ["RscCBRN_maskEffect", "PLAIN"];
private _effectControl = (allControls (uiNamespace getVariable ["CBRN_mask_displayEffect", -1])) # 0;

//We use this to save some performance
CBRN_cachedPlayerGoggles = "";

//We check every couple seconds because we don't need instant reactions. It also gives the players some leeway
[{
	//Cache our mask so we don't have to hunt through the config every frame
	if ((goggles player) == (CBRN_cachedPlayerGoggles)) exitWith {};
	
	params ["_effectControl", "_handle"];
	
	//Chache that shit
	CBRN_cachedPlayerGoggles = goggles player;
	
	//Get our style and set the control to that style
	private _style = getNumber (configFile >> "cfgGlasses" >> CBRN_cachedPlayerGoggles >> "CBRN_overlayType");
	
	//0 means no overlay since that is the default, anything else is valid
	if (_style > 0) then {_effectControl ctrlSetText format ["CBRN_gear\data\hud\overlay_style%1.paa", _style]}
	else {_effectControl ctrlSetText ""}
}, 0, _effectControl] call CBA_fnc_addPerFrameHandler;