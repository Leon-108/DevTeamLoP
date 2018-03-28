#include "..\..\script_macros.hpp"
/*
	File: fn_adminMenu.sqf
	Author: Bryan "Tonic" Boardwine
	
	Description:
	Opens the admin menu, sorry nothing special in here. Take a look for yourself.
*/
if(FETCH_CONST(life_adminlevel) < 1) exitWith {closeDialog 0;};
private["_display","_list","_side"];
disableSerialization;
waitUntil {!isNull (findDisplay 2900)};
_display = findDisplay 2900;
_list = _display displayCtrl 2902;
if(FETCH_CONST(life_adminlevel) < 1) exitWith {closeDialog 0;};
//Purge List
lbClear _list;

{
	_side = switch(side _x) do {case west: {"Cop"}; case civilian: {"Civ"}; case independent: {"Medic"}; default {"Unknown"};};
	_list lbAdd format["%1 - %2", _x getVariable["realname",name _x],_side];
	_list lbSetdata [(lbSize _list)-1,str(_x)];
} foreach playableUnits;
lbSort _list;

if(FETCH_CONST(life_adminlevel) < 4) then {
	ctrlShow[2912,false];
};
if(FETCH_CONST(life_adminlevel) < 5) then {
	ctrlShow[2911,false];
};
if ((player getVariable ["admin",0]) isEqualTo 0) then {
	ctrlEnable[2090,false];
};
if ((player getVariable ["admin",0]) > 0) then {
	ctrlEnable[2080,false];
};

if(FETCH_CONST(life_adminlevel) < 1) exitWith {closeDialog 0;};