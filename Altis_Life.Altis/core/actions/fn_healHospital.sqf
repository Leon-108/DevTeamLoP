#include "..\..\script_macros.hpp"
/*
	File: fn_healHospital.sqf
	Author: Bryan "Tonic" Boardwine
	
	Description:
	Doesn't matter, will be revised later.
*/
if(CASH < 100) exitWith {
	//h/int format[localize "STR_NOTF_HS_NoCash",100];
	[format[localize "STR_NOTF_HS_NoCash",100],"RED",10] spawn life_fnc_notification_system;
};
//t/itleText[localize "STR_NOTF_HS_Healing","PLAIN"];
[localize "STR_NOTF_HS_Healing","YELLOW",8] spawn life_fnc_notification_system;
sleep 8;
if(player distance (_this select 0) > 5) exitWith {
	//t/itleText[localize "STR_NOTF_HS_ToFar","PLAIN"]
	[localize "STR_NOTF_HS_ToFar","RED",10] spawn life_fnc_notification_system;
};
//t/itleText[localize "STR_NOTF_HS_Healed","PLAIN"];
[localize "STR_NOTF_HS_Healed","GREEN",5] spawn life_fnc_notification_system;
player setdamage 0;
CASH = CASH - 100;