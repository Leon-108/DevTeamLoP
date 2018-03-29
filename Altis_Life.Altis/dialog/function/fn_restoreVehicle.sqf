#include "..\..\script_macros.hpp"
/*
	File: fn_restoreVehicle.sqf
	Author: Alex "moeck" Moeckel
	
	Description:
	Restore the vehicle back to garage
*/
disableSerialization;
if(lbCurSel 2802 isEqualto -1) exitWith {[localize "STR_Global_NoSelection","RED",10] spawn life_fnc_notification_system;};
private _vid = CONTROL_DATA(2802);
private _vehicle = (call compile format["%1",_vehicle]) select 0;
private _pid = getPlayerUID player;
private _unit = player;
if(isNil "_vehicle") exitWith {[localize "STR_Garage_Selection_Error","RED",10] spawn life_fnc_notification_system;};
private _price = M_CONFIG(getNumber,"LifeCfgVehicles",_vehicle,"insurance");
if(_price isEqualTo -1) then {_price = 100000;};
if(BANK < _price) exitWith {[format[(localize "STR_Garage_CashError"),[_price] call life_fnc_numberText],"RED",10] spawn life_fnc_notification_system;};
[_vid,_pid,_unit] remoteExecCall ["TON_fnc_restoreVehicle",RSERV];
[localize "STR_Garage_SpawningVeh","YELLOW",5] spawn life_fnc_notification_system;
BANK = BANK - _price;
[6] call SOCK_fnc_updatePartial;