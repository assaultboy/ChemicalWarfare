/*
	DESCRIPTION:
		This function will check if the given unit has a mask in their inventory that can protect against CBRN (Level 1)
		
	PARAMETERS:
		Unit
			The unit to check
			
	RETURNS
		Nothing
		
	EXAMPLE
		_unit call CBRN_fnc_hasMaskInInventory
*/

params ["_unit"];

(((items _unit) findIf {_x in CBRN_allLevel1Masks}) > -1);