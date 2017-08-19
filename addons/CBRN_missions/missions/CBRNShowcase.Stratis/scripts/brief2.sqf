sleep 3;

voice sideChat "Alright. So all this equipment is fairly self explanatory.";
sleep 5;
voice sideChat "The Detection Kit allows you to test for chemical contamination.";
sleep 5;
voice sideChat "The Decontamination Kit allows you to remove contamination from yourself or others.";
sleep 5;
voice sideChat "The Antidote Kit is used to counteract any side effects contamination may have on you or others.";
sleep 5;
voice sideChat "Any questions?";
sleep 3;



private _content = [
parseText "
<t size='1.5'>Detection Kit</t><br/>
Detection kits allow you to test yourself, others, or areas for the presence of chemical agents. The Detection Kit can be used by pressing its keybind (Default is 5 / Shift + 5 / Ctrl + 5) or alternatively if ACE is installed it can be used by self interacting or interacting with another unit.",

parseText "
<t size='1.5'>Decontamination Kit</t><br/>
Decontamination Kits allow you to remove any contamination from yourself or others. It will not remove negative effects caused by contamination, simply prevent them from worsening. Note that if you are still in a contaminated area you will still become contaminated after use, so it is best to remove yourself from the contaminated area before use. A Decontamination Kit can be used by pressing its keybind (Default is 6 / Shift + 6) or alternatively if ACE is installed it can be used by self interacting or interacting with another unit.",

parseText "
<t size='1.5'>Antidote Kit</t><br/>
Antidote Kits allow you to remove any negative effects caused by chemical contamination. It will not remove the contamination itself so it is best to be used after decontaminating. An Antidote Kit can be used by pressing its keybind (Default is 7 / Shift + 7) or alternatively if ACE is installed it can be used by self interacting or interacting with another unit."];

"Defensive Equipment" hintC _content;

hintC_EH = findDisplay 72 displayAddEventHandler ["unload", {
	0 = _this spawn {
		_this select 0 displayRemoveEventHandler ["unload", hintC_EH];
		hintSilent "";
	};
}];



sleep 3;

voice sideChat "No? Good. We will now begin the hands on portion.";
sleep 5;
voice sideChat format ["%1 you will be our demonstrator.", name player];
sleep 5;
voice sideChat "Go ahead and show us how to use a Decontamination Kit.";
player setVariable ["CBRN_contaminationLevel", 0.01]; 