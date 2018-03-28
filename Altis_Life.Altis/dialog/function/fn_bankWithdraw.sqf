#include "..\..\script_macros.hpp"
/*
	COPY PASTE TIME
*/
if(isNil "life_money_antiglitch") then {life_money_antiglitch = false;};
if(life_money_antiglitch) exitWith {
	//h/int "Geldspam verboten";
	["Geldspam verboten","RED",5] spawn life_fnc_notification_system;
	ctrlShow[2001,true];
};
private["_val"];
_val = parseNumber(ctrlText 2702);
if(_val > 10000000) exitWith {
	//h/int localize "STR_ATM_WithdrawMax";
	[localize "STR_ATM_WithdrawMax","RED",5] spawn life_fnc_notification_system;
};
if(_val < 0) exitwith {};
//if(!([str(_val)] call life_fnc_isnumeric)) exitWith {h/int localize "STR_ATM_notnumeric"};
if(_val > BANK) exitWith {
	//h/int localize "STR_ATM_NotEnoughFunds"
	[localize "STR_ATM_NotEnoughFunds","RED",5] spawn life_fnc_notification_system;
};
if(_val < 100 && BANK > 20000000) exitWith {
	//h/int localize "STR_ATM_WithdrawMin"
	[localize "STR_ATM_WithdrawMin","RED",5] spawn life_fnc_notification_system;
}; //Temp fix for something.

CASH = CASH + _val;
BANK = BANK - _val;
//h/int format [localize "STR_ATM_WithdrawSuccess",[_val] call life_fnc_numberText];
[format [localize "STR_ATM_WithdrawSuccess",[_val] call life_fnc_numberText],"GREEN",5] spawn life_fnc_notification_system;
[] call life_fnc_atmMenu;
[6] call SOCK_fnc_updatePartial;
[]spawn 
{
	life_money_antiglitch = true;
	uiSleep 1;
	life_money_antiglitch = false;
}