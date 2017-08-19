/*
	Author: Assaultboy
*/

//Handle our locality
if (!isServer) exitWith {"'CBRN_fnc_mod_settings' must be called on the server!" call CBRN_fnc_throwWarning;nil};

private _logic = (_this select 0);

//Setting our gas color
CBRN_set_gasColor = (_logic getVariable ["gasColor", 1]);
publicVariable "CBRN_set_gasColor";

//Setting our damage modifier
CBRN_set_damageMod = ((_logic getVariable ["damageMod", 1]) max 0);
publicVariable "CBRN_set_damageMod";