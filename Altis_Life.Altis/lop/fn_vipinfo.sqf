/*
	File: fn_vipinfo.sqf
	Author: moeck
 
	Description: Checks the DB how long the user has VIP

*/
params [
	["_mode" ,true,[false]],
	["_unit",ObjNull,[ObjNull]],
	["_days",0,[-1]]
];
uisleep 5;
if !(_mode) exitWith {[[_unit],"DB_fnc_getDonatorInfo",false,false] call life_fnc_MP;};
if (_mode) then {
	uiSleep 5;
	if ((_days <= 10) && (_days > 0)) then {
		_days = parseText format ["<t color='#FF3B3E'>%1</t>",_days];
		hintC format["Hallo %1, INFO\n\nDeine VIP Lizenz läuft noch %2 Tag(e).\nBitte beachte, dass Deine Fahrzeuge nach dem Ablauf deiner VIP Lizenz auf einen Standard Skin umlackiert werden.\nWeitere Informationen zu der VIP Lizenz erhälst Du auf der Homepage wo Du sie auch verlängern kannst.\nSolltest Du weitere Fragen haben schaue einfach bei unserem Support unter: ts3.lostonparadise.de:11181 vorbei.\n\nDein LoP Team",name _unit,_days];
	};
};
