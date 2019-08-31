/*
	DESCRIPTION:
		This function will create a contaminated area at the given location
		
	PARAMETERS:
		Position
			ATL location to spawn the mist
			
		Radius
			The radius to spawn the mist in
			
		Lifetime
			How long the mist should linger in seconds
			
		Type
			The type of contamination to spawn
			
		Vertical Spread (OPTIONAL)
			The total amount of vertical spread of the mist downwards in meters (Defaults to 2)
			
		Thickness (OPTIONAL)
			The thickness of the mist (Default is 1)
			
	RETURNS
		Nothing
		
	EXAMPLE
		[getPosASL player, 25, 60, 1] call CBRN_fnc_spawnMist
*/

params ["_position", "_radius", "_lifetime", "_contaminationType",
	["_verticleSpread", 2],
	["_thickness", 1]
];

//Add to our counter and start our lifetime countdown to decrement the counter
CBRN_contaminationSpawners set [_contaminationType, (CBRN_contaminationSpawners # _contaminationType) + 1];
[{CBRN_contaminationSpawners set [_this, (CBRN_contaminationSpawners # _this) - 1]}, _contaminationType, _lifetime + 1] call CBA_fnc_waitAndExecute;

//Lol fuck ellipsoids
private _fnc_getEllipsoidArea = {
	params ["_a", "_b", "_c"];
	
	(4 * pi * (((((_a * _b) ^ 1.6) + ((_a * _c) ^ 1.6) + ((_c * _b) ^ 1.6)) / 3) ^ (1/1.6)));
};

//An easy little polar coordinate function
private _fnc_getSpherePolarCoordinates = {
	params ["_theta", "_phi", "_distance", "_vert"];
	[_distance * (cos _theta) * (sin _phi), _distance * (sin _theta) * (sin _phi), _vert * (cos _phi) * 0.33];
};


//Select our color based on our type and the set settings
private _contaminationColor = + (missionNamespace getVariable format ["CBRN_color_contamination%1", _contaminationType]);
private _color = [_contaminationColor + [0.001], _contaminationColor + [0.1], [1,1,1,0]];

//We do this so we have granular control over how many particles we have
for "_i" from 1 to floor ((([_radius, _radius, _verticleSpread] call _fnc_getEllipsoidArea) / 10) * _thickness) do {
	private _particleSource = "#particlesource" createVehicle _position;
	
	//Particle options
	_particleSource setParticleParams [
		["\A3\data_f\cl_basic",1,0,1], // File,Ntieth,Index,Count,Loop
		"", //Animation name
		"Billboard", //Type
		0.1 + random 5, //Timer Period (We do this to spread the updates out and reduce overhead)
		_lifetime - random 2, //Lifetime
		[random 360, random 360, _radius * sqrt (random 1), _verticleSpread] call _fnc_getSpherePolarCoordinates,//) + [-2 - (random _verticleSpread)], //Position relative to the particle source (Don't mind da maffs)
		[0,0,(-0.003 - random 0.5)], //Move velocity
		5 + random 10, //Rotation velocity
		10, //Weight
		7.843, //Volume
		0.05 + random 0.05, //Rubbing
		[5,5,5], //Size
		_color, //Color
		[0,0], //Animation speed
		0, //Random direction period
		0, //Random direction intensity
		selectRandom [format ["CBRN_scripts\scripts\updateContamination%1.sqf", _contaminationType], "", ""], //On timer script (We only do it on 1/3 of the particles to remove some overhead, good enough)
		"", //Before destroy script
		_particleSource //This
	];
	_particleSource setDropInterval 100;
	
	[{deleteVehicle _this}, _particleSource, 0.5] call CBA_fnc_waitAndExecute;
};