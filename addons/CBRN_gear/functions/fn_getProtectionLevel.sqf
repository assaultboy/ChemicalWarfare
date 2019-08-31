/*
	DESCRIPTION:
		This function will return the level of contamination the given unit is protected against
		
	PARAMETERS:
		Unit
			The unit to check
			
	RETURNS
		Protection Level
			-1..2 level of protection (-1 being no protection at all)
		
	EXAMPLE
		player call CBRN_fnc_getProtectionLevel
*/

params ["_unit"];


//Get our config values
private _maskLevel = getNumber (configFile >> "cfgGlasses" >> goggles _unit >> "CBRN_protectionLevel");
private _suitLevel = getNumber (configFile >> "cfgWeapons" >> uniform _unit >> "CBRN_protectionLevel");

//Combine our flags
private _flags = ([_maskLevel, _suitLevel] call BIS_fnc_bitwiseOR) call BIS_fnc_bitFlagsToArray;

private _faceCovered = 1 in _flags;
private _hasFilter = 2 in _flags;
private _hasHood = 4 in _flags;
private _bodyCovered = 8 in _flags;

//First check if we are fully covered
if (_faceCovered && _hasFilter && _hasHood && _bodyCovered) exitWith {2};

//Since we aren't fully covered we can check if we at least have a filter and face cover
if (_faceCovered && _hasFilter) exitWith {1};

//If we don't even have that, check if the face is covered
if (_faceCovered) exitWith {0};

//Fuckin naked mate
-1;