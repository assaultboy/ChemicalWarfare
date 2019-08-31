class Extended_PostInit_EventHandlers {
    //Initializes some global variables and such
	class CBRN_PostInit {
        init = "call CBRN_fnc_postInit";
    };
	
	//Handles treatment via atropine
	class CBRN_treatmentHandler {
		init = "call CBRN_fnc_treatmentHandler";
	};
	
	//Handles local blur from exposure
	class CBRN_blurHandler {
		init = "call CBRN_fnc_blurHandler";
	};
	
	//Handles coughing from exposure
	class CBRN_coughHandler {
		init = "call CBRN_fnc_coughHandler";
	};
	
	//Handles detrimental effects from exposure
	class CBRN_effectsHandler {
		init = "call CBRN_fnc_effectsHandler";
	};
	
	//Handles keeping the server in sync with the clients for contaminated areas
	class CBRN_syncHandler {
		init = "call CBRN_fnc_syncHandler";
	};
	
	//Handles mask overlays
	class CBRN_overlayHandler {
		init = "call CBRN_fnc_overlayHandler";
	};
	
	//Handles AI behaviour
	class CBRN_AIHandler {
		init = "call CBRN_fnc_AIHandler";
	};
};