/*
	Author: Assaultboy

	Description:
		This function will make the given group react to chemicals within certain parameters
	
	Remark(s):
		This function must be executed on the server.

	Parameter(s):
		0 - Unit: The unit reacting to chemicals
		1 - Reaction Level: 0 - Safe, 1 - Not Safe (Default 1)

	Returns:
		Nothing
*/

//Handle our parameters and locality
if (!isServer) then {["Function must be executed on the server!"] call BIS_fnc_error};
params [
	["_unit", objNull, [objNull]],
	["_reaction", 1, [0]]
];

//Check our unit is an AI etc
if (!(_unit isKindOf "CAManBase")) then {["Bad unit given"] call BIS_fnc_error};
if (isPlayer _unit) exitWith {nil};
if (_unit getVariable ["CBRN_diableAI", false]) exitWith {nil};

switch (_reaction) do {
	//All clear
	case 0: {
		if (((group _unit) getVariable ["CBRN_alertness", 0]) == 1) then {
			(group _unit) setVariable ["CBRN_alertness", 0];
			[_unit, "All clear! All clear! All clear!"] remoteExecCall ["groupChat", 0];
			
			if ((behaviour _unit) == "AWARE") then {_unit setBehaviour "SAFE"};
			
			{
				if (_x != _unit) then {
					//So they don't all do it at the same time
					[{
						//We do this to prevent an endless loop of swapping states
						if (((group (_this select 0)) getVariable ["CBRN_alertness", 1]) == 0) then {_this call CBRN_fnc_reactToChemicals};
					}, [_x, 0], random 10] call CBA_fnc_waitAndExecute;
				};
			} forEach units group _unit;
		};
		
		//Take our mask off
		[_unit, false] call CBRN_fnc_equipMask;
	};
	
	//Gas in area
	case 1: {
		//If our group doesn't know there is some shit going down we better tell them
		if (((group _unit) getVariable ["CBRN_alertness", 0]) == 0) then {
			(group _unit) setVariable ["CBRN_alertness", 1];
			
			if ((behaviour _unit) == "SAFE") then {_unit setBehaviour "AWARE"};
			
			[_unit, "Gas! Gas! Gas!"] remoteExecCall ["groupChat", 0];
			
			{
				if (_x != _unit) then {
					//So they don't all do it at the same time
					[{
						//We do this to prevent an endless loop of swapping states
						if (((group (_this select 0)) getVariable ["CBRN_alertness", 0]) == 1) then {_this call CBRN_fnc_reactToChemicals};
					}, [_x, 1], random 5] call CBA_fnc_waitAndExecute;
				};
			} forEach units group _unit;
		};
		
		//Put our mask on
		[_unit, true] call CBRN_fnc_equipMask;
		
		//Start our testing loop (it's not really a loop though, just occasional checks)
		if ("CBRN_DetectionKit" in items _unit) then {
			private _testForChemFunc = {
				[{
					params ["_unit", "_func"];
					
					//Check to make sure we are still alerted before we start testing for chemicals
					if (((group _unit) getVariable ["CBRN_alertness", 0]) == 1) then {
					
						//If we are not in combat go ahead and test for chemicals
						if ((getSuppression _unit) == 0) then {
							
							//Create our event handler to listen for the detection results, and keep it stored so we don't have to keep defining it
							if ((_unit getVariable ["CBRN_listener_chemicalDetection", -1]) == -1) then {
							
								_unit setVariable ["CBRN_listener_chemicalDetection", ["CBRN_itemUsed", {
									params ["_unit", "_item", "_reciever", "_results"];
									
									//Check to make sure it is our unit using a detection kit
									if ((_unit == (_thisArgs select 0)) && (_item == "CBRN_DetectionKit")) then {
									
										//If the results are positive then we are still in a contaminated area so we have to call our function again
										if (_results) then {
											[_unit, (_thisArgs select 1)] call (_thisArgs select 1);
										
										//If the results are negative we remove the listener and tell the group we are safe
										} else {
											["CBRN_itemUsed", _thisId] call CBA_fnc_removeEventHandler;
											_unit setVariable ["CBRN_listener_chemicalDetection", nil];
											
											//Make sure we are stil alerted, just in case
											if (((group _unit) getVariable ["CBRN_alertness", 0]) == 1) then {[_unit, 0] call CBRN_fnc_reactToChemicals};
										};
									};
									
								}, [_unit, _func]] call CBA_fnc_addEventHandlerArgs];
							};
							
							//Now check for chemicals
							[_unit, "CBRN_DetectionKit", objNull] call CBRN_fnc_useItem;
							
						//If we are in combat it can wait
						} else {
							call (_this select 1);
						};
						
					//If we are no longer alert
					} else {
						
						//If our listener was defined go ahead and remove it
						private _listener = (_unit getVariable ["CBRN_listener_chemicalDetection", -1]);
						if (_listener != -1) then {
							["CBRN_itemUsed", _listener] call CBA_fnc_removeEventHandler;
							_unit setVariable ["CBRN_listener_chemicalDetection", nil];
						};
					};
				}, _this, (random (60 * 4)) + (60 * 3)] call CBA_fnc_waitAndExecute;
			};
			
			//Now we have to call the monstrosity
			[_unit, _testForChemFunc] call _testForChemFunc;
		};
	};
};