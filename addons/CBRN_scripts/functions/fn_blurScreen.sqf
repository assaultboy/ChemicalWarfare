/*
	DESCRIPTION:
		This function will blur the screen of the client
		
	PARAMETERS:
		BlurAmount
			The amount to blur to, 0..8
			
	RETURNS
		Nothing
		
	EXAMPLE
		5 call CBRN_fnc_blurScreen
*/

params ["_blurAmount"];

//Cap our blur amount
_blurAmount = (_blurAmount max 0) min 8;

//Blur da screen
CBRN_ppBlur ppEffectAdjust [_blurAmount];
CBRN_ppBlur ppEffectEnable true;
CBRN_ppBlur ppEffectCommit 5;