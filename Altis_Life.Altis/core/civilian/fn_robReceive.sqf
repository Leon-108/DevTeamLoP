#include "..\..\script_macros.hpp"
/*
	File: fn_robReceive.sqf
	Author: Bryan "Tonic" Boardwine
*/
if (license_civ_rebel) then {
private["_cash"];
_cash = [_this,0,0,[0]] call BIS_fnc_param;
if(_cash isEqualTo 0) exitWith {
	//t/itleText[localize "STR_Civ_RobFail","PLAIN"]
	[localize "STR_Civ_RobFail","RED",10] spawn life_fnc_notification_system;
};

CASH = CASH + _cash;
//t/itleText[format[localize "STR_Civ_Robbed",[_cash] call life_fnc_numberText],"PLAIN"];
[format[localize "STR_Civ_Robbed",[_cash] call life_fnc_numberText],"GREEN",5] spawn life_fnc_notification_system;
}
else 
{ 
	//h/int "Du brauchst eine Rebellenlizenz!";
	["Du brauchst eine Rebellenlizenz!","RED",10] spawn life_fnc_notification_system;
};