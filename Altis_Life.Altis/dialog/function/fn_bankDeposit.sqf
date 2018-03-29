#include "..\..\script_macros.hpp"
/*
    File: fn_bankDeposit.sqf
    Author: Bryan "Tonic" Boardwine

    Description:
    Figure it out.
*/
if(isNil "life_money_antiglitch") then {life_money_antiglitch = false;};
if(life_money_antiglitch) exitWith {
	["Geldspam verboten","RED",5] spawn life_fnc_notification_system;
	ctrlShow[2001,true];
};
private _value = parseNumber(ctrlText 2702);

//Series of stupid checks
if(_value > 10000000) exitWith {[localize "STR_ATM_GreaterThan","RED",5] spawn life_fnc_notification_system;};
if(_value < 0) exitWith {};
if(_value > CASH) exitWith {[localize "STR_ATM_NotEnoughCash","RED",10] spawn life_fnc_notification_system;};

CASH = CASH - _value;
BANK = BANK + _value;

[] call life_fnc_atmMenu;
[6] call SOCK_fnc_updatePartial;
[format[localize "STR_ATM_DepositSuccess",[_value] call life_fnc_numberText],"GREEN",5] spawn life_fnc_notification_system;

if (LIFE_SETTINGS(getNumber,"player_moneyLog") isEqualTo 1) then {
    if (LIFE_SETTINGS(getNumber,"battlEye_friendlyLogging") isEqualTo 1) then {
        money_log = format [localize "STR_DL_ML_depositedBank_BEF",_value,[BANK] call life_fnc_numberText,[CASH] call life_fnc_numberText];
    } else {
        money_log = format [localize "STR_DL_ML_depositedBank",profileName,(getPlayerUID player),_value,[BANK] call life_fnc_numberText,[CASH] call life_fnc_numberText];
    };
    publicVariableServer "money_log";
};
[]spawn 
{
	life_money_antiglitch = true;
	uiSleep 1;
	life_money_antiglitch = false;
};
