/*
	DESCRIPTION:
		This function will update the contaminated area array
		This function is called by the updateContamination script of the particles
		
	PARAMETERS:
		Position
			ASL location to spawn the mist
			
		Lifetime
			The lifetime of the contamination area
			
		Type
			The type of chemical
			
	RETURNS
		Nothing
		
	EXAMPLE
		[_this, 5, 1] call CBRN_fnc_updateContaminatedArea
*/

params ["_position", "_lifetime", "_type"];

//Get our type container
private _typeArray = (CBRN_contaminatedAreas select _type);

//See if we have a free spot somewhere
private _index = (_typeArray findIf {isNil "_x"});

//If it is -1 we can just pushback
if (_index == -1) then {
	_typeArray pushBack _position;
	_index = (count _typeArray) - 1;
	
//else put it at that empty index
} else {
	_typeArray set [_index, _position];
};

//Now we wait until the end of our lifetime and set the index to nil to free it up
[{(_this # 0) set [_this # 1, nil]}, [_typeArray, _index], _lifetime] call CBA_fnc_waitAndExecute;