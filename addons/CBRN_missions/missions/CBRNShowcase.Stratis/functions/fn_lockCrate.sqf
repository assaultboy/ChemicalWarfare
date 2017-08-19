params ["_crate", "_condition"];

_crate setVariable ["showcase_lockedCondition", _condition];

_crate addEventHandler ["ContainerOpened", {
	if (!(call ((_this select 0) getVariable ["showcase_lockedCondition", {true}]))) then {
		player action ["CancelAction", player];
	};
}];