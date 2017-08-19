waitUntil {
	((uniform player) == "U_B_CBRN") && (("G_CBRN_M50_Hood" in items player) || ((goggles player) == "G_CBRN_M50_Hood"));
};

closeDialog 1;

sleep 1;
private _content = [
parseText "
<t size='1.5'>Masks</t><br/>
All masks will provide moderate chemical protection. They will stop <t underline='true'>Suffocation Agent</t> from harming you. However they will not protect you from agents absorbed through the skin such as <t underline='true'>Nerve Agent</t>.",

parseText "
<t size='1.5'>Suits</t><br/>
All suits will provide complete chemical protection when used with a mask. If both a suit and mask are worn, no chemical agents will be able to affect you. However without a mask, the suit is useless."];

"Protective Gear" hintC _content;

hintC_EH = findDisplay 72 displayAddEventHandler ["unload", {
	0 = _this spawn {
		_this select 0 displayRemoveEventHandler ["unload", hintC_EH];
		hintSilent "";
	};
}];