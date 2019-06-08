class CfgVehicles {
	class Man;
	class CAManBase: Man 
	{
		#include "aceActions.hpp"
		
		class EventHandlers
		{
			class CBRN_Gear
			{
				respawn = "(_this select 0) addItem ((_this select 0) getVariable ['CBRN_respawnMask', ''])";
				fired = "if (!CBRN_set_useACECommon) then {_this remoteExecCall ['CBRN_fnc_handleGrenades', 2]};";
			};
		};
	};
	
		 // Samples
    class Item_Base_F;
    class CBRN_Item_Sample_1: Item_Base_F {
        author = "The_M";
        scope = 2;
        scopeCurator = 2;
        displayName = "Sample 1";
        vehicleClass = "Items";
		editorPreview = "\A3\EditorPreviews_F_Orange\Data\CfgVehicles\MedicalGarbage_01_Injector_F.jpg";
        class TransportItems { 
				class CBRN_Sample_1 {
			    name = CBRN_Sample_1;
                count = 1;  }         
        };
    };
	   class CBRN_Item_Sample_2: Item_Base_F {
        author = "The_M";
        scope = 2;
        scopeCurator = 2;
        displayName = "Sample 2";
        vehicleClass = "Items";
		editorPreview = "\A3\EditorPreviews_F_Orange\Data\CfgVehicles\MedicalGarbage_01_Injector_F.jpg";
        class TransportItems { 
				class CBRN_Sample_2 {
			    name = CBRN_Sample_2;
                count = 1;  }         
        };
    };
	   class CBRN_Item_Sample_3: Item_Base_F {
        author = "The_M";
        scope = 2;
        scopeCurator = 2;
        displayName = "Sample 3";
        vehicleClass = "Items";
		editorPreview = "\A3\EditorPreviews_F_Orange\Data\CfgVehicles\MedicalGarbage_01_Injector_F.jpg";
        class TransportItems { 
				class CBRN_Sample_3 {
			    name = CBRN_Sample_3;
                count = 1;  }         
        };
    };
	   class CTRG_GER_: Item_Base_F {
        author = "The_M";
        scope = 2;
        scopeCurator = 2;
        displayName = "Sample 3";
        vehicleClass = "Items";
		editorPreview = "\A3\EditorPreviews_F_Orange\Data\CfgVehicles\MedicalGarbage_01_Injector_F.jpg";
        class TransportItems { 
				class CBRN_Sample_3 {
			    name = CBRN_Sample_3;
                count = 1;  }         
        };
    };	

};