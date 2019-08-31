/*
	DESCRIPTION:
		This function will print a global debug message only if debug mode has been enabled
		
	PARAMETERS:
		Message
			The message to print
			
		Arg1
			Anything to input into the message
			
		...
			
	RETURNS
		Nothing
		
	EXAMPLE
		["Player is %1", player] call CBRN_fnc_debugMessage
*/

//Only do it if our debug mode has been enabled
if (isNil "CBRN_debugEnabled") exitWith {};
if (!CBRN_debugEnabled) exitWith {};

//Yeet that biatch to erryuone
(format _this) remoteExecCall ["systemChat", 0];