/*
	DESCRIPTION:
		This function will setup the sync mechanism to ensure the server is aware of chemical releases
		This function is called automatically by CBA XEH
		
	PARAMETERS:
		None
			
	RETURNS
		Nothing
		
	EXAMPLE
		call CBRN_fnc_syncHandler
*/

//This is for the server
if (!hasInterface) then {
	//Every tick we ask a client for an update to the contaminated areas
	[{["CBRN_syncRequest", nil, selectRandom allPlayers] call CBA_fnc_targetEvent;}, 2] call CBA_fnc_addPerFrameHandler;
};

//This is for the clients
if (hasInterface) then {
	["CBRN_syncRequest", {
		publicVariableServer "CBRN_contaminationSpawners";
		publicVariableServer "CBRN_contaminatedAreas";
	}] call CBA_fnc_addEventHandler;
};