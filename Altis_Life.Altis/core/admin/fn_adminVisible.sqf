#include "..\..\script_macros.hpp"
/*
	File: fn_adminVisible.sqf
	Author: moeck (lostonparadise.de)
	
	Description: makes invisble Admins visible

*/
if ((alive player) && (FETCH_CONST(life_adminlevel) > 3)) then {
		if (isObjectHidden player) then {
			[format ["Du bist nun sichtbar",(name player)],"RED",5] spawn life_fnc_notification_system;
			player hideObject false;
			[[player,false],"life_fnc_blabla",true,false] spawn life_fnc_MP;
		} else {
			[format ["Du bist nun unsichtbar",(name player)],"RED",5] spawn life_fnc_notification_system;
			player hideObject true;
			[[player,true],"life_fnc_blabla",true,false] spawn life_fnc_MP;
		};
};