#include "..\..\script_macros.hpp"
/*
	File: fn_robAction.sqf
	Author: Bryan "Tonic" Boardwine
	
	Description:
	Starts the robbing process?
*/
if (license_civ_rebel) then {
private["_target"];
_target = cursorTarget;

//Error checks
if(isNull _target) exitWith {};
if(!isPlayer _target) exitWith {};

if(_target getVariable["robbed",false]) exitWith {};
[[player],"life_fnc_robPerson",_target,false] spawn life_fnc_MP;
_target setVariable["robbed",TRUE,TRUE];
}
else { 
	//h/int "Du brauchst eine Banditenlizenz!";
	["Du brauchst eine Banditenlizenz!","RED",10] spawn life_fnc_notification_system;
};