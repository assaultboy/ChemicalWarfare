voice sideChat "Welcome to my chamber.";

if (!(((uniform player) == "U_B_CBRN") && ((goggles player) == "G_CBRN_M50_Hood"))) then {
	sleep 4;
	voice sideChat "Before we do anything I need you to put on your protective gear.";
	
	waitUntil {
		(((uniform player) == "U_B_CBRN") && ((goggles player) == "G_CBRN_M50_Hood"));
	};
};

chamber animateSource ["Door_1_sound_source",0, 2];

showcase_disableInv = true;

sleep 4;

voice sideChat "Alright lets begin.";
sleep 4;
voice sideChat "The purpose of this exercise is to make sure you understand how to react to a chemical attack.";
sleep 5;
voice sideChat "I am going to activate this burner, filling the room with a suffocation agent.";
sleep 5;
voice sideChat "You will remove your mask briefly to contaminate yourself.";
sleep 5;
voice sideChat "Once you are contaminated, you will put your mask back on. Please do not forget to put your mask back on. It will kill you.";
sleep 6;
voice sideChat "You will then use a Decontamination kit on yourself.";
sleep 5;
voice sideChat "After decontaminating you will use an Antidote kit on yourself.";
sleep 5;
voice sideChat "At that point I will turn off the burner and you will exit the chamber.";
sleep 5;
voice sideChat "I am now activating the burner.";
sleep 3;

showcase_contaminatedArea = ([position chamberArea, [4, 4, 2.378], 0.001, -1, 1] call CBRN_fnc_createContaminatedArea);

showcase_disableInv = false;

sleep 3;

voice sideChat "Remove your mask.";

waitUntil {
	((player getVariable ["CBRN_contaminationLevel", 0]) > 0);
};

voice sideChat "Alright you have been contaminated, put your mask back on.";

waitUntil {
	((goggles player) == "G_CBRN_M50_Hood");
};

voice sideChat "Now use a Decontamination kit.";

waitUntil {
	((player getVariable ["CBRN_contaminationLevel", 0.1]) == 0);
};

voice sideChat "Next is the Antidote kit.";

waitUntil {
	((player getVariable ["CBRN_chemicalDamage", 0.1]) == 0);
};

voice sideChat "Perfect. I am turning off the burner now.";

deleteVehicle showcase_contaminatedArea;

sleep 5;

voice sideChat "Congratulations, you just reacted to a chemical threat.";
sleep 5;
voice sideChat "This concludes todays training. You are free to leave.";

chamber animateSource ["Door_1_sound_source",1, 2];

sleep 3;