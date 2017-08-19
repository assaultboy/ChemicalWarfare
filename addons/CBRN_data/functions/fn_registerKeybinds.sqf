/*
	Author: Assaultboy

	Description:
		This function will register all the CBRN keybinds
	
	Remark(s):
		This function should not be called, it is executed automatically
		This function must be executed on a client

	Parameter(s):
		None

	Returns:
		Nothing
*/

//Handle our locality
if (!hasInterface) exitWith {"'CBRN_fnc_registerKeybinds' must be called on a client!" remoteExecCall ['CBRN_fnc_throwWarning', 0];nil};

//Get our keycodes
#include "\a3\editor_f\Data\Scripts\dikCodes.h"

//Self Detect
["Chemical Warfare", "CBRN_key_selfDetect", ["Use Detection Kit (Self)", "Use a detection kit on yourself"], {
	[player, 'CBRN_DetectionKit', player] remoteExecCall ['CBRN_fnc_useItem', 2];
}, "", [DIK_5, [false, false, false]]] call cba_fnc_addKeybind;

//Target Detect
["Chemical Warfare", "CBRN_key_targetDetect", ["Use Detection Kit (Other)", "Use a detection kit on the unit you are looking at"], {
	if ([player, cursorTarget] call CBRN_fnc_checkTargetIsValid) then {
		[player, 'CBRN_DetectionKit', cursorTarget] remoteExecCall ['CBRN_fnc_useItem', 2];
	} else {
		hint "You must be looking at another unit!";
	};
}, {false}, [DIK_5, [true, false, false]], false] call cba_fnc_addKeybind;

//Area Detect
["Chemical Warfare", "CBRN_key_areaDetect", ["Use Detection Kit (Area)", "Use a detection kit on the area around yourself"], {
	[player, 'CBRN_DetectionKit'] remoteExecCall ['CBRN_fnc_useItem', 2];
}, {false}, [DIK_5, [false, true, false]], false] call cba_fnc_addKeybind;


//Self Decon
["Chemical Warfare", "CBRN_key_selfDecon", ["Use Decontamination Kit (Self)", "Use a decontamination kit on yourself"], {
	[player, 'CBRN_DeconKit', player] remoteExecCall ['CBRN_fnc_useItem', 2];
}, "", [DIK_6, [false, false, false]], false] call cba_fnc_addKeybind;

//Target Decon
["Chemical Warfare", "CBRN_key_targetDecon", ["Use Decontamination Kit (Other)", "Use a decontamination kit on the unit you are looking at"], {
	if ([player, cursorTarget] call CBRN_fnc_checkTargetIsValid) then {
		[player, 'CBRN_DeconKit', cursorTarget] remoteExecCall ['CBRN_fnc_useItem', 2];
	} else {
		hint "You must be looking at another unit!";
	};
}, {false}, [DIK_6, [true, false, false]], false] call cba_fnc_addKeybind;


//Self Cure
["Chemical Warfare", "CBRN_key_selfCure", ["Use Antidote Kit (Self)", "Use an antidote kit on yourself"], {
	[player, 'CBRN_NAAK', player] remoteExecCall ['CBRN_fnc_useItem', 2];
}, {false}, [DIK_7, [false, false, false]], false] call cba_fnc_addKeybind;

//Target Cure
["Chemical Warfare", "CBRN_key_targetCure", ["Use Antidote Kit (Other)", "Use an antidote kit on the unit you are looking at"], {
	if ([player, cursorTarget] call CBRN_fnc_checkTargetIsValid) then {
		[player, "CBRN_NAAK", cursorTarget] remoteExecCall ['CBRN_fnc_useItem', 2];
	} else {
		hint "You must be looking at another unit!";
	};
}, {false}, [DIK_7, [true, false, false]]] call cba_fnc_addKeybind;