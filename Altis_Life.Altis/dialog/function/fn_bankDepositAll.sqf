#include "..\..\script_macros.hpp"
/*
	File: fn_bankDeposit.sqf
	Author: Bryan "Tonic" Boardwine
	
	Description:
	Figure it out.
*/
if(isNil "life_money_antiglitch") then {life_money_antiglitch = false;};
if(life_money_antiglitch) exitWith {
	//h/int "Geldspam verboten";
	["Geldspam verboten","RED",5] spawn life_fnc_notification_system;
	ctrlShow[2001,true];
};
private["_value"];
if(CASH isEqualTo 0) exitWith {
	//h/int "Du hast kein Geld bei Dir!"
	["Du hast kein Geld bei Dir!","RED",5] spawn life_fnc_notification_system;
};
_value = CASH;
CASH = 0;
BANK = BANK + _value;
//h/int format[localize "STR_ATM_DepositMSG",[_value] call life_fnc_numberText];
[format[localize "STR_ATM_DepositSuccess",[_value] call life_fnc_numberText],"GREEN",5] spawn life_fnc_notification_system;
[] call life_fnc_atmMenu;
[6] call SOCK_fnc_updatePartial;
[]spawn 
{
	life_money_antiglitch = true;
	uiSleep 1;
	life_money_antiglitch = false;
}