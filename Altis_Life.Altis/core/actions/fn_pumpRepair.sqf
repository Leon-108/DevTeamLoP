#include "..\..\script_macros.hpp"
/*
	File: fn_pumpRepair.sqf
	
	Description:
	Quick simple action that is only temp.
*/
private["_method"];
if(CASH < 500) then
{
	if(BANK < 500) exitWith {_method = 0;};
	_method = 2;
}
	else
{
	_method = 1;
};

switch (_method) do
{
	case 0: {
		//h/int "You do not have $500 in cash or in your bank accoumt."
		["You do not have $500 in cash or in your bank accoumt.","RED",10] spawn life_fnc_notification_system;
	};
	case 1: {
		vehicle player setDamage 0; 
		CASH = CASH - 500; 
		//h/int "You have repaired your vehicle for $500";
		["You have repaired your vehicle for $500","GREEN",5] spawn life_fnc_notification_system;
	};
	case 2: {
		vehicle player setDamage 0; 
		BANK = BANK - 500; 
		//h/int "You have repaired your vehicle for $500";
		["You have repaired your vehicle for $500","GREEN",5] spawn life_fnc_notification_system;
	};
};