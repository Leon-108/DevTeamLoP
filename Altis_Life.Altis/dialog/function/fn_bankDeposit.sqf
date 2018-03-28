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
_value = parseNumber(ctrlText 2702);

//Series of stupid checks
if(_value > 10000000) exitWith {
	//h/int localize "STR_ATM_GreaterThan";
	[localize "STR_ATM_GreaterThan","RED",5] spawn life_fnc_notification_system;
};
if(_value < 0) exitWith {};
//if(!([str(_value)] call life_fnc_isnumeric)) exitWith {h/int localize "STR_ATM_notnumeric"};
if(_value > CASH) exitWith {
	//h/int localize "STR_ATM_NotEnoughCash"
	[localize "STR_ATM_NotEnoughCash","RED",10] spawn life_fnc_notification_system;
};

CASH = CASH - _value;
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