/*
	File: fn_removeWeaponAction.sqf
	Author: Tobias 'Xetoxyc' Sittenauer
	
	Desc:
	Search for weapons
*/
private["_unit"];
_unit = life_pInact_curTarget;
if(isNull _unit) exitWith {};
//h/int "Suche nach Waffen...";
["Suche nach Waffen...","YELLOW",5] spawn life_fnc_notification_system;
_unit spawn {
	params ["_unit"];
	uisleep 1;
	if(player distance _unit > 5 || !alive player || !alive _unit) exitWith {
		//h/int "Cannot search that person."
		["Cannot search that person.","RED",10] spawn life_fnc_notification_system;
	};
	[[player],"life_fnc_removeWeapons",_unit,false] spawn life_fnc_MP;
	life_action_inUse = false;
}