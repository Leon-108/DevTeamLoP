#include "..\..\script_macros.hpp"
/*
	File: fn_wantedMenu.sqf
	Author: Bryan "Tonic" Boardwine
	
	Description:
	Opens the Wanted menu and connects to the APD.
*/
private["_display","_list","_name","_crimes","_bounty","_units"];
disableSerialization;

createDialog "life_wanted_menu";

_display = findDisplay 2400;
_list = _display displayCtrl 2401;
lbClear _list;
_units = [];

ctrlSetText[2404,"Establishing connection..."];
if (playerSide in [civilian,Independent] && (__GETC__(life_adminlevel) isEqualto 0)) then {
	ctrlShow[9800,false];
	["Die Bearbeitungsgebühren (50.000$) für das Abfragen der Fahndungliste wurden von deinem Konto abgebucht.","PINK",5] spawn life_fnc_notification_system;
	BANK = BANK - 50000;
};
if(__GETC__(life_coplevel) < 2 && __GETC__(life_adminlevel) isEqualto 0) then {
	ctrlShow[2405,false];
};

[[player],"life_fnc_wantedFetch",false,false] spawn life_fnc_MP;