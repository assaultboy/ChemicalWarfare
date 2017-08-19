/*
	Author: Assaultboy

	Description:
		This function will return an appropriate message for the MOPP level of contamination given
	
	Remark(s):

	Parameter(s):
		0 - MOPP Level: The MOPP level required for protection (0 - Non-Lethal, 1 - Suffocation Agent, 2 - Nerve Agent)

	Returns:
		String: The sickness message
*/

private _messages = [
	["Your eyes burn slightly.", "Your skin burns slightly.", "Your throat burns slightly."], 
	["It is becoming hard to breathe.", "Your chest feels tight.", "You can't seem to catch your breathe."],
	["Your limbs feel numb.", "You can't feel your fingers.", "You are beginning to have muscle spasms."]
];

selectRandom (_messages select _this);