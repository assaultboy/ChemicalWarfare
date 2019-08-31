/*
	DESCRIPTION:
		This function will check if the given ASL position is contaminated
		
	PARAMETERS:
		Position ASL
			The position to check
			
	RETURNS
		Array
			Type 1
				Bool showing the area is contaminated with a type 1 chemical
			Type 2
				Bool showing the area is contaminated with a type 2 chemical
			Type 3
				Bool showing the area is contaminated with a type 3 chemical
		
	EXAMPLE
		(getPosASL player) call CBRN_fnc_isAreaContaminated
*/

//We cycle through each chemical type and create our nifty array
private _returnArray = [false, false, false];
{
	//Find the index of the first contaminated area that is within 10m, if it returns -1 we know none are
	_returnArray set [_forEachIndex, -1 < (_x findIf {
		//First make sure our element is not nil (Since we don't garbage collect until all chemicals are gone) which will help performance
		if (!isNil "_x") then {
			
			//Check if we are 10m or closer
			if (10 >= abs (_this vectorDistance _x)) exitWith {true};
		};
	})];
} forEach CBRN_contaminatedAreas;

_returnArray;