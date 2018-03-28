#include "..\..\script_macros.hpp"
/*
	File: fn_adminTeleport.sqf
	Author: ColinM9991
	Credits: To original script author(s)
	Description:
	Teleport to chosen position.
*/
if(FETCH_CONST(life_adminlevel) < 1) exitWith {closeDialog 0; hint localize "STR_ANOTF_ErrorLevel";};
if(FETCH_CONST(life_adminlevel) < 4 && (vehicle player != player)) exitWith {
	closeDialog 0;
	["Du bist nicht berechtigt Dich mit Fahrzeugen zu porten. Bitte steige erst aus dem Fahrzeug aus.","RED",5] spawn life_fnc_notification_system;
};

[] spawn {
  while {dialog} do {
   closeDialog 0;
   sleep 0.01;
  };
};

tele={
	_pos = [_this select 0, _this select 1, _this select 2];
	(vehicle player) setpos [_pos select 0, _pos select 1, 0];
	onMapSingleClick "";
	openMap [false, false];	
};
if !(visibleMap) then{
	openMap [true, false];
};
onMapSingleClick "[_pos select 0, _pos select 1, _pos select 2] call tele";