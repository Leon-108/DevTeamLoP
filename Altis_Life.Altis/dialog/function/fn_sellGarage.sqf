#include "..\..\script_macros.hpp"
/*
	File: fn_sellGarage.sqf
	Author: Bryan "Tonic" Boardwine
	
	Description:
	Sells a vehicle from the garage.
*/
private["_vehicle","_vid","_pid","_unit","_price","_action"];
disableSerialization;
_action = [
	"Möchtest du das Fahrzeug wirklich verkaufen?",
	"Fahrzeug verkaufen?",
	localize "STR_Global_Yes",
	localize "STR_Global_No"
] call BIS_fnc_guiMessage;
if(!_action) exitWith {
	//h/int "Verkaufen abgebrochen"
	["Verkaufen abgebrochen","RED",10] spawn life_fnc_notification_system;
};
if(lbCurSel 2802 isEqualto -1) exitWith {
	//h/int localize "STR_Global_NoSelection"
	[localize "STR_Global_NoSelection","RED",10] spawn life_fnc_notification_system;
};
_vehicle = lbData[2802,(lbCurSel 2802)];
_vehicle = (call compile format["%1",_vehicle]) select 0;
_vid = lbValue[2802,(lbCurSel 2802)];
_pid = getPlayerUID player;
_unit = player;
if(!life_pickAxeAllowed) exitWith {};
life_pickAxeAllowed = false;
life_action_gather = true;
life_action_inUse = true;
disableUserInput true;
if(isNil "_vehicle") exitWith {
	//h/int localize "STR_Garage_Selection_Error"
	[localize "STR_Garage_Selection_Error","RED",10] spawn life_fnc_notification_system;
};
_price = 1000;
call {
	if (playerSide isEqualTo west) exitWith {
		_price = M_CONFIG(getNumber,"LifeCfgVehicles",_vehicle,"copprice");
		_price = _price * LIFE_SETTINGS(getNumber,"vehicle_sell_multiplier_COP");
	};
	if (playerSide isEqualTo independent) exitWith {
		_price = M_CONFIG(getNumber,"LifeCfgVehicles",_vehicle,"medprice");
		_price = _price * LIFE_SETTINGS(getNumber,"vehicle_sell_multiplier_MEDIC");
	};
	if (playerSide isEqualTo civilian) exitWith {
		_price = M_CONFIG(getNumber,"LifeCfgVehicles",_vehicle,"price");
		_price = _price * LIFE_SETTINGS(getNumber,"vehicle_sell_multiplier_CIVILIAN");
	};
};


[[_vid,_pid,_price,player,life_garage_type],"TON_fnc_vehicleDelete",false,false] spawn life_fnc_MP;
//h/int format[localize "STR_Garage_SoldCar",[_price] call life_fnc_numberText];
[format[localize "STR_Garage_SoldCar",[_price] call life_fnc_numberText],"GREEN",5] spawn life_fnc_notification_system;
BANK = BANK + _price;

life_action_gather = false;
life_action_inUse = false;
life_pickAxeAllowed = true;
closeDialog 0;
disableUserInput false;