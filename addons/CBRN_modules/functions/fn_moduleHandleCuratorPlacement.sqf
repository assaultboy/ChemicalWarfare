/*
	DESCRIPTION:
		This function is used as a tool to help curator placed modules
		It will validate a curator module has been placed on a valid object and handle failure gracefully
		If the selected unit is not valid, a error is displayed and the module is deleted
		This will also check if the logic is local or not
		
	PARAMETERS:
		Logic
			The logic unit
			
		Custom Checks (ARRAY OF ARRAYS) (OPTIONAL)
			Custom1
				Function
					Function passed unit as _this to check
				
				Error Message
					Message to display if the check fails
			...
			
	RETURNS
		Selected
			Returns the selected object on valid selection, returns null on failure
		
	EXAMPLE
		[_logic, true, [
			[{local _this}, "UNIT MUST BE LOCAL"],
			[{alive _this}, "UNIT MUST BE ALIVE"]
		]] call CBRN_fnc_moduleHandleCuratorPlacement;
*/

params ["_logic", ["_custom", []]];

//We must have a local logic object
if (!local _logic) exitWith {false};

//Sweet jesus look at this black magic
((missionNamespace getVariable ["bis_fnc_curatorObjectPlaced_mouseOver", [""]])) params ["_mouseOverType", "_mouseOverUnit"];

//Objects only bitch
if (_mouseOverType != "OBJECT") exitWith {
	[objNull, "PLACE ON A UNIT"] call BIS_fnc_showCuratorFeedbackMessage;
	deleteVehicle _logic;
	objNull;
};

//Make sure all our custom functions pass
private _failCustomIndex = _custom findIf {!(_mouseOverUnit call (_x # 0))};

if (_failCustomIndex > -1) exitWith {
	[objNull, _custom # _failCustomIndex # 1] call BIS_fnc_showCuratorFeedbackMessage;
	deleteVehicle _logic;
	objNull;
};

//If we got here we passed all the goodies, we can return true
_mouseOverUnit;