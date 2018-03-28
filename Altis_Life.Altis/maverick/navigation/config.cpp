/*--------------------------------------------------------------------------
    Author:		Maverick Applications
    Website:	https://maverick-applications.com

    You're not allowed to use this file without permission from the author!
---------------------------------------------------------------------------*/

// Configuration file for the navigation script

class maverick_navigation_cfg {

	class bindings {
		keyCode		= 49; // Keycodes can be found at https://community.bistudio.com/wiki/DIK_KeyCodes
		reqShift	= 0;
		reqAlt		= 0;
		reqCtrl		= 1;
	};

	option_list[] = {
		{$STR_Current_Route, "maverick\navigation\data\currentroute.paa", "!isNil 'mav_gps_v_markers'", "(ctrlParent (_this select 0)) createDisplay 'MAV_guiNavigationCurrent';"},
		{$STR_New_Route, "maverick\navigation\data\newroute.paa", "isNil 'mav_gps_v_markers'", "(ctrlParent (_this select 0)) createDisplay 'MAV_guiNavigationNew';"},
		{$STR_Saved_Routes, "maverick\navigation\data\savedroutes.paa", "true", "(ctrlParent (_this select 0)) createDisplay 'MAV_guiNavigationSaved';"},
		{$STR_GPS_Settings, "maverick\navigation\data\mapsettings.paa", "true", "(ctrlParent (_this select 0)) createDisplay 'MAV_guiNavigationSettings';"},
		{"GPS Information", "maverick\navigation\data\help.paa", "false", "(ctrlParent (_this select 0)) createDisplay 'MAV_guiNavigationHelp';"}
	};

	class presets {
		class Altis {
			presetLocations[] = {

			};
		};
		class Malden {
			presetLocations[] = {

			};
		};
		class Stratis {
			presetLocations[] = {

			};
		};
		class Tanoa {
			presetLocations[] = {

			};
		};
	};

	class localization {

		// Display messages from around the navigation system
		msgStartPosInvalid = 		$STR_msgStartPosInvalid;
		msgEndPosInvalid = 			$STR_msgEndPosInvalid;
		msgCheckpointInvalid = 		$STR_msgCheckpointInvalid;
		msgNoRoadsegmentFound = 	$STR_msgNoRoadsegmentFound;
		msgAbortCurrentRoute = 		$STR_msgAbortCurrentRoute;
		msgSettingsSaved = 			$STR_msgSettingsSaved;
		msgPositionReset = 			$STR_msgPositionReset;
		msgCalcRoadDirs = 			$STR_msgCalcRoadDirs;
		msgCalcRoadDirsProgress = 	$STR_msgCalcRoadDirsProgress;
		msgOneMinute = 				$STR_msgOneMinute;
		msgSmallerThanMinute = 		$STR_msgSmallerThanMinute;
		msgMinutesLeft = 			$STR_msgMinutesLeft;
		msgReachDestination = 		$STR_msgReachDestination;
		msgFollowThenTurnLeft = 	$STR_msgFollowThenTurnLeft;
		msgFollowThenTurnRight = 	$STR_msgFollowThenTurnRight;
		msgArrivedFormatted = 		$STR_msgArrivedFormatted;
		msgReachedDestination = 	$STR_msgReachedDestination;
		msgNoRoadsFound = 			$STR_msgNoRoadsFound;
		msgInvalidRoadSegment = 	$STR_msgInvalidRoadSegment;
		msgCurrentLocation = 		$STR_msgCurrentLocation;
		msgStart = 					"Start";
		msgCheckpoint = 			$STR_msgCheckpoint;
		msgDestination = 			$STR_msgDestination;
		msgPressSpace = 			$STR_msgPressSpace;
		msgGpsPosSaved = 			$STR_msgGpsPosSaved;
		msgNoRouteFound = 			$STR_msgNoRouteFound;
		msgTimedOut = 				$STR_msgTimedOut;
		msgRouteFound = 			$STR_msgRouteFound;
		msgRouteInfo = 				$STR_msgRouteInfo;
		msgFrom = 					$STR_msgFrom;
		msgTo = 					$STR_msgTo;
		msgTotalDistance = 			$STR_msgTotalDistance;
		msgTotalravelTime = 		$STR_msgTotalravelTime;
		msgRoadPreference = 		$STR_msgRoadPreference;
		msgRouteCalculate = 		$STR_msgRouteCalculate;
		msgCancelConfirm = 			$STR_msgCancelConfirm;
		msgCancelRoute = 			$STR_msgCancelRoute;
		msgCancel = 				$STR_msgCancel;
		msgProceed = 				$STR_msgProceed;
		msgNoRouteNameGiven = 		$STR_msgNoRouteNameGiven;
		msgRouteNameLimit = 		$STR_msgRouteNameLimit;
		msgIllegalChars = 			$STR_msgIllegalChars;
		msgRouteLimit = 			$STR_msgRouteLimit;
		msgRouteSaved = 			$STR_msgRouteSaved;
		msgRouteDeleted = 			$STR_msgRouteDeleted;
		msgFinishRouteFirst = 		$STR_msgFinishRouteFirst;
		msgNoSavedRoutes = 			$STR_msgNoSavedRoutes;
		msgTurnNow =				$STR_msgTurnNow;

		// Localization for the dialogs
		#define dialogMainMenu 		$STR_dialogMainMenu
		#define dialogClose 		$STR_dialogClose
		#define dialogCurrentRoute 	$STR_dialogCurrentRoute
		#define dialogResetRoute 	$STR_dialogResetRoute
		#define dialogRecalculate	$STR_dialogRecalculate
		#define dialogNewRoute 		$STR_dialogNewRoute
		#define dialogCalcRoute		$STR_dialogCalcRoute
		#define dialogBack 			$STR_dialogBack
		#define dialogStart 		"Start"
		#define dialogLoad 			$STR_dialogLoad
		#define dialogCheckpoint 	$STR_dialogCheckpoint
		#define dialogDestination 	$STR_dialogDestination
		#define dialogCommonDest	$STR_dialogCommonDest
		#define dialogSavedRouts	$STR_dialogSavedRouts
		#define dialogMenuSettings	$STR_dialogMenuSettings
		#define dialogSave			$STR_dialogSave
		#define dialogUnitSpeed		$STR_dialogUnitSpeed
		#define dialogPreference	$STR_dialogPreference
		#define dialogGpsPos		"GPS GUI Position"
		#define dialogCustomize		$STR_dialogCustomize
		#define dialogReset			$STR_dialogReset
		#define dialogGpsColor		$STR_dialogGpsColor
		#define dialogDragHere		$STR_dialogDragHere
		#define dialogSavedTitle	$STR_dialogSavedTitle
		#define dialogDelete		$STR_dialogDelete
		#define dialogCalcProgress	$STR_dialogCalcProgress
		#define dialogNavigation	$STR_dialogNavigation
		#define dialogSaveRoute		$STR_dialogSaveRoute
		#define dialogRouteName		$STR_dialogRouteName
		#define dialogCalculating	$STR_dialogCalculating
		#define dialogRouteInfo		$STR_dialogRouteInfo
		#define dialogRouteMapPrev	$STR_dialogRouteMapPrev
		#define dialogVoiceSetting	$STR_dialogVoiceSetting
		#define dialogCalculationH	$STR_dialogCalculationH
	};

	/*
		You should only add / remove / edit any of these parameters if you were advised to do so by Maverick Applications
		Unauthorized Changes can lead to a complete failure of the navigation system!
	*/
	class AlgorithmParameters {

		class Chernarus_Summer {
			greedy = 3.2;
		};

		class australia {
			greedy = 3.2;
		};

		class Malden {
			radius = 45;
		};

		class Sara {
			radius = 66;
		};
	};

	// Do not touch below
	#include "sounds\voicepacks\config.cpp"
};

//Do not touch below
#include "gui\gps_gui_master.cpp"