/*
	DESCRIPTION:
		This function is used to initialize a bunch of stuff for CBRN
		
	PARAMETERS:
		None
			
	RETURNS
		Nothing
		
	EXAMPLE
		call CBRN_fnc_postInit
*/

//This is an array of positions that are contaminated, each has a radius of 5m (Or whatever is the standard) and is updated constantly by particles
//Each array inside this variable is the container for that level of exposure
CBRN_contaminatedAreas = [[], [], []];

//This is a counter of all the "contaminated" zones. Essentially keeping a broad count of contaminated particle spawners, it's used for cleaning up our arrays
CBRN_contaminationSpawners = [0,0,0];

//This will contain all masks that protect against level 1 and up
CBRN_allLevel1Masks = ("(2) <= getNumber (_x >> 'CBRN_protectionLevel')" configClasses (configFile >> "cfgGlasses")) apply {configName _x};

//Cache our projectiles for those sweet performance shortcuts
CBRN_chachedChemProjectileClasses = ("([_x, 'CBRN_isProjectile', 0] call BIS_fnc_returnConfigEntry) != 0" configClasses (configFile >> "cfgAmmo")) apply {configName _x};

//Tells us if debug mode is enabled
CBRN_debugEnabled = false;

//We do this funky hack so we know that the blur was created successfully
CBRN_ppBlur_priority = 399;
[{
	CBRN_ppBlur_priority = CBRN_ppBlur_priority + 1;
	CBRN_ppBlur = ppEffectCreate ["DynamicBlur", CBRN_ppBlur_priority];
	CBRN_ppBlur != -1
}, {
	CBRN_ppBlur ppEffectEnable false;
	CBRN_ppBlurAmount = 0;
	CBRN_ppBluring = false;
}] call CBA_fnc_waitUntilAndExecute;