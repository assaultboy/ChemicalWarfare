/*
	DESCRIPTION:
		This function is called during the interaction to place a mask on another unit
		
	PARAMETERS:
		Player
			The local player executing the action
			
		Target
			The unit having the mask put on
			
	RETURNS
		Nothing
		
	EXAMPLE
		[_player, _target] call CBRN_fnc_putOnMaskAction
*/

params ["_player", "_target"];

//First figure out which unit has the mask, preferring the target
if (_target call CBRN_fnc_hasMaskInInventory) exitWith {
	private _masks = (items _target) arrayIntersect (CBRN_allLevel1Masks);
	
	//Remove our item
	_target removeItem (_masks # 0);
	
	//Take the targets glasses and add it to their inventory (or ground if they run out of space)
	[_target, goggles _target, true] call CBA_fnc_addItem;
	
	//Finally put the mask on the target
	_target linkItem (_masks # 0);
};

//If it's player that has it then do that
if (_player call CBRN_fnc_hasMaskInInventory) exitWith {
	private _masks = (items _player) arrayIntersect (CBRN_allLevel1Masks);
	
	//Remove our item
	_target removeItem (_masks # 0);
	
	//Take the targets glasses and add it to their inventory (or ground if they run out of space)
	[_target, goggles _target, true] call CBA_fnc_addItem;
	
	//Finally put the mask on the target
	_target linkItem (_masks # 0);
};