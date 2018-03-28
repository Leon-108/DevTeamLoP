#include "..\..\script_macros.hpp"
/*
	File: fn_sellTurtle.sqf
	
	Description:
	Sells the turtles! Save the turtles!
	This was a super lazy thing to do but I just want to push it...
*/
private["_index","_price","_val"];
if(life_inv_goldbar isEqualTo 0) exitWith {
	//t/itleText["Du hast keine Goldbarren zum verkaufen.","PLAIN"];
	["Du hast keine Goldbarren zum verkaufen.","RED",10] spawn life_fnc_notification_system;
};

_index = ["goldbar",__GETC__(sell_array)] call fnc_index;
_price = (__GETC__(sell_array) select _index) select 1;
_val = life_inv_goldbar;
_price = _price * _val;

if([false,"goldbar",life_inv_goldbar] call life_fnc_handleInv) then {
	//t/itleText[format["Du verkaufst %1 Goldbarren fuer $%2",_val,[_price] call life_fnc_numberText],"PLAIN"];
	[format["Du verkaufst %1 Goldbarren fuer $%2",_val,[_price] call life_fnc_numberText],"GREEN",5] spawn life_fnc_notification_system;
	CASH = CASH + _price;
};
