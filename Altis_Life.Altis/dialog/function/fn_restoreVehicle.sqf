#include "..\..\script_macros.hpp"
/*
	File: fn_restoreVehicle.sqf
	Author: Alex "moeck" Moeckel
	
	Description:
	Restore the vehicle back to garage
*/
private["_vehicle","_vid","_pid","_unit","_price"];
disableSerialization;
if(lbCurSel 2802 isEqualto -1) exitWith {
	//h/int localize "STR_Global_NoSelection"
	[localize "STR_Global_NoSelection","RED",10] spawn life_fnc_notification_system;
};
_vehicle = lbData[2802,(lbCurSel 2802)];
_vehicle = (call compile format["%1",_vehicle]) select 0;
_vid = lbValue[2802,(lbCurSel 2802)];
_pid = getPlayerUID player;
_unit = player;
if(isNil "_vehicle") exitWith {
	[localize "STR_Garage_Selection_Error","RED",10] spawn life_fnc_notification_system;
};

_price = M_CONFIG(getNumber,"LifeCfgVehicles",_vehicle,"insurance");
if(_price isEqualTo -1) then {_price = 100000;};
if(BANK < _price) exitWith {
	[format[(localize "STR_Garage_CashError"),[_price] call life_fnc_numberText],"RED",10] spawn life_fnc_notification_system;
};
[[_vid,_pid,_unit],"TON_fnc_restoreVehicle",false,false] spawn life_fnc_MP;
[localize "STR_Garage_SpawningVeh","YELLOW",5] spawn life_fnc_notification_system;
BANK = BANK - _price;