#include "..\..\script_macros.hpp"
/*
	File: fn_removeLicenses.sqf
	Author: Bryan "Tonic" Boardwine
	
	Description:
	Used for stripping certain licenses off of civilians as punishment.
*/
params ["_state"]; 
switch (_state) do
{
	//Death while being wanted
	case 0:
	{
		missionNamespace setVariable [LICENSE_VARNAME("gun","civ"),false];
		missionNamespace setVariable [LICENSE_VARNAME("rebaccess","civ"),false];
	};
	
	//Jail licenses
	case 1:
	{
		missionNamespace setVariable [LICENSE_VARNAME("gun","civ"),false];
		missionNamespace setVariable [LICENSE_VARNAME("rebaccess","civ"),false];
	};
	
	//Remove motor vehicle licenses
	case 2:	{
		if (missionNamespace getVariable LICENSE_VARNAME("driver","civ") || missionNamespace getVariable LICENSE_VARNAME("pilot","civ") || missionNamespace getVariable LICENSE_VARNAME("truck","civ") || missionNamespace getVariable LICENSE_VARNAME("boat","civ")) then {
            missionNamespace setVariable [LICENSE_VARNAME("pilot","civ"),false];
            missionNamespace setVariable [LICENSE_VARNAME("driver","civ"),false];
            missionNamespace setVariable [LICENSE_VARNAME("truck","civ"),false];
            missionNamespace setVariable [LICENSE_VARNAME("boat","civ"),false];
           [localize "STR_Civ_LicenseRemove_1","PINK",5] spawn life_fnc_notification_system;			
		};
	};
	
	//Killing someone while owning a gun license
	case 3:{
		if(missionNamespace getVariable LICENSE_VARNAME("gun","civ")) then {
			missionNamespace setVariable [LICENSE_VARNAME("gun","civ"),false];
			[localize "STR_Civ_LicenseRemove_2","PINK",5] spawn life_fnc_notification_system;
		};
	};
	// Führerschein Lizenz
	case 10:{
		if (missionNamespace getVariable LICENSE_VARNAME("driver","civ")) then {
			missionNamespace setVariable [LICENSE_VARNAME("driver","civ"),false];
			[localize "STR_Civ_RevokeLicense_Driver","PINK",5] spawn life_fnc_notification_system;
		};
	};
	 // LKW Führerschein Lizenz
	case 11: {
		if (missionNamespace getVariable LICENSE_VARNAME("truck","civ")) then {
			missionNamespace setVariable [LICENSE_VARNAME("truck","civ"),false];
			[localize "STR_Civ_RevokeLicense_Truck","PINK",5] spawn life_fnc_notification_system;
		};
	};
	 // Pilotenschein Lizenz
	case 12: {
		if (missionNamespace getVariable LICENSE_VARNAME("pilot","civ")) then {
			missionNamespace setVariable [LICENSE_VARNAME("pilot","civ"),false];
			[localize "STR_Civ_RevokeLicense_Pilot","PINK",5] spawn life_fnc_notification_system;
		};
	};
	 // Bootsschein Lizenz
	case 13: {
		if (missionNamespace getVariable LICENSE_VARNAME("boat","civ")) then {
			missionNamespace setVariable [LICENSE_VARNAME("boat","civ"),false];
			[localize "STR_Civ_RevokeLicense_Boating","PINK",5] spawn life_fnc_notification_system;
		};
	};
	case 14:{
		if (missionNamespace getVariable LICENSE_VARNAME("gun","civ")) then {
			missionNamespace setVariable [LICENSE_VARNAME("gun","civ"),false];
			[localize "STR_Civ_RevokeLicense_Gun","PINK",5] spawn life_fnc_notification_system;
		};
	};
	// Alle Scheine
	case 15: {
		if (missionNamespace getVariable LICENSE_VARNAME("driver","civ")) then {
			missionNamespace setVariable [LICENSE_VARNAME("driver","civ"),false];
		};
		if (missionNamespace getVariable LICENSE_VARNAME("truck","civ")) then {
			missionNamespace setVariable [LICENSE_VARNAME("truck","civ"),false];
			[localize "STR_Civ_RevokeLicense_Truck","PINK",5] spawn life_fnc_notification_system;
		};
		if (missionNamespace getVariable LICENSE_VARNAME("pilot","civ")) then {
			missionNamespace setVariable [LICENSE_VARNAME("pilot","civ"),false];
			[localize "STR_Civ_RevokeLicense_Pilot","PINK",5] spawn life_fnc_notification_system;
		};
		if (missionNamespace getVariable LICENSE_VARNAME("boat","civ")) then {
			missionNamespace setVariable [LICENSE_VARNAME("boat","civ"),false];
			[localize "STR_Civ_RevokeLicense_Boating","PINK",5] spawn life_fnc_notification_system;
		};
		if (missionNamespace getVariable LICENSE_VARNAME("gun","civ")) then {
			missionNamespace setVariable [LICENSE_VARNAME("gun","civ"),false];
			[localize "STR_Civ_RevokeLicense_Gun","PINK",5] spawn life_fnc_notification_system;
		};
		[localize "STR_Civ_RevokeLicense_AllMotor","PINK",5] spawn life_fnc_notification_system;
	};
};