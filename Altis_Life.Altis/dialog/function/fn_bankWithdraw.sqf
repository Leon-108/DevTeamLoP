#include "..\..\script_macros.hpp"
/*
    File: fn_bankWithdraw.sqf
    Author: Bryan "Tonic" Boardwine

    Description:
    Withdraws money from the players account
*/
if(isNil "life_money_antiglitch") then {life_money_antiglitch = false;};
if(life_money_antiglitch) exitWith {
	["Geldspam verboten","RED",5] spawn life_fnc_notification_system;
	ctrlShow[2001,true];
};
private _val = parseNumber(ctrlText 2702);
if(_val > 10000000) exitWith {[localize "STR_ATM_WithdrawMax","RED",5] spawn life_fnc_notification_system;};
if(_val < 0) exitwith {};
if(_val > BANK) exitWith {[localize "STR_ATM_NotEnoughFunds","RED",5] spawn life_fnc_notification_system;};
if(_val < 100 && BANK > 20000000) exitWith {[localize "STR_ATM_WithdrawMin","RED",5] spawn life_fnc_notification_system;}; //Temp fix for something.

CASH = CASH + _value;
BANK = BANK - _value;
[] call life_fnc_atmMenu;
[6] call SOCK_fnc_updatePartial;
[format [localize "STR_ATM_WithdrawSuccess",[_val] call life_fnc_numberText],"GREEN",5] spawn life_fnc_notification_system;

if (LIFE_SETTINGS(getNumber,"player_moneyLog") isEqualTo 1) then {
    if (LIFE_SETTINGS(getNumber,"battlEye_friendlyLogging") isEqualTo 1) then {
        money_log = format [localize "STR_DL_ML_withdrewBank_BEF",_value,[BANK] call life_fnc_numberText,[CASH] call life_fnc_numberText];
    } else {
        money_log = format [localize "STR_DL_ML_withdrewBank",profileName,(getPlayerUID player),_value,[BANK] call life_fnc_numberText,[CASH] call life_fnc_numberText];
    };
    publicVariableServer "money_log";
};
[]spawn 
{
	life_money_antiglitch = true;
	uiSleep 1;
	life_money_antiglitch = false;
};
