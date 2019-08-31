#define COUGHPARAMS(PROB) 0.8, 1, 25, PROB, 3, 8, 10
#define CALLOUTPARAMS 0.9, 1, 50

class CfgPatches
{
	class CBRN_sounds
	{
		units[] = {};
		weapons[] = {};
		requiredVersion = 0.1;
		requiredAddons[] = {};
	};
};

#include "cfgFunctions.hpp"

class cfgVehicles
{
	class Sound;
	class Sound_CBRN_coughBase: Sound {};
	class Sound_CBRN_coughMuffledBase: Sound {};
	
	#include "sounds\chaddlesg\cfgVehicles.hpp"
	#include "sounds\assaultboy\cfgVehicles.hpp"
	#include "sounds\ritalin\cfgVehicles.hpp"
	#include "sounds\zgonjanin\cfgVehicles.hpp"
	#include "sounds\maccas\cfgVehicles.hpp"
	#include "sounds\raven06\cfgVehicles.hpp"
	#include "sounds\ragz993\cfgVehicles.hpp"
};

class cfgSFX
{
	#include "sounds\chaddlesg\cfgSFX.hpp"
	#include "sounds\assaultboy\cfgSFX.hpp"
	#include "sounds\ritalin\cfgSFX.hpp"
	#include "sounds\zgonjanin\cfgSFX.hpp"
	#include "sounds\maccas\cfgSFX.hpp"
	#include "sounds\raven06\cfgSFX.hpp"
	#include "sounds\ragz993\cfgSFX.hpp"
};

//Maybe one day
/*
class cfgSounds
{
	#include "sounds\chaddlesg\cfgSounds.hpp"
	#include "sounds\assaultboy\cfgSounds.hpp"
};
*/