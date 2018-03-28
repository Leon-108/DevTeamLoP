#include "..\..\script_macros.hpp"
/*
    File: fn_adminMarkers.sqf
    Author: NiiRoZz
    Description:
    Display markers for all players
*/
private _on = [_this,0,false,[true]] call BIS_fnc_param;

if (FETCH_CONST(life_adminlevel) < 3) exitWith {
	closeDialog 0; 
	//h/int localize "STR_ANOTF_ErrorLevel";
	[localize "STR_ANOTF_ErrorLevel","RED",10] spawn life_fnc_notification_system;
};
[] spawn TON_fnc_MapMarkersAdmin;

