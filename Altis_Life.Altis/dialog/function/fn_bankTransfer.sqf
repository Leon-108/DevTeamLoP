#include "..\..\script_macros.hpp"
/*
	File: fn_bankTransfer.sqf
	Author: Bryan "Tonic" Boardwine
	
	Description:
	Figure it out again.
*/
if(isNil "life_money_antiglitch") then {life_money_antiglitch = false;};
if(life_money_antiglitch) exitWith {
	//h/int "Geldspam verboten";
	["Geldspam verboten","RED",5] spawn life_fnc_notification_system;
	ctrlShow[2001,true];
};
private["_val","_unit","_tax"];
_val = parseNumber(ctrlText 2702);
_unit = call compile format["%1",(lbData[2703,(lbCurSel 2703)])];
if(isNull _unit) exitWith {};
if((lbCurSel 2703) isEqualto -1) exitWith {
	//h/int localize "STR_ATM_NoneSelected"
	[localize "STR_ATM_NoneSelected","RED",5] spawn life_fnc_notification_system;
};
if(isNil "_unit") exitWith {
	//h/int localize "STR_ATM_DoesntExist"
	[localize "STR_ATM_DoesntExist","RED",5] spawn life_fnc_notification_system;
};
if(_val > 10000000) exitWith {
	//h/int localize "STR_ATM_TransferMax";
	[localize "STR_ATM_TransferMax","RED",5] spawn life_fnc_notification_system;
};
if(_val < 0) exitwith {};
//if(!([str(_val)] call life_fnc_isnumeric)) exitWith {h/int localize "STR_ATM_notnumeric"};
if(_val > BANK) exitWith {
	//h/int localize "STR_ATM_NotEnough"
	[localize "STR_ATM_NotEnough","RED",5] spawn life_fnc_notification_system;
};
_tax = [_val] call life_fnc_taxRate;
if((_val + _tax) > BANK) exitWith {
	//h/int format[localize "STR_ATM_SentMoneyFail",_val,_tax]
	[format[localize "STR_ATM_SentMoneyFail",_val,_tax],"RED",5] spawn life_fnc_notification_system;
};

BANK = BANK - (_val + _tax);

[[_val,profileName],"TON_fnc_clientWireTransfer",_unit,false] spawn life_fnc_MP;
[[player, _unit, _val, 0, BANK, CASH],"TON_fnc_handleDBLog",false] spawn life_fnc_MP; //By Nukefliege
[] call life_fnc_atmMenu;
//h/int format[localize "STR_ATM_SentMoneySuccess",[_val] call life_fnc_numberText,_unit getVariable["realname",name _unit],[_tax] call life_fnc_numberText];
[format[localize "STR_ATM_SentMoneySuccess",[_val] call life_fnc_numberText,_unit getVariable["realname",name _unit],[_tax] call life_fnc_numberText],"GREEN",5] spawn life_fnc_notification_system;
[1] call SOCK_fnc_updatePartial;
[]spawn 
{
	life_money_antiglitch = true;
	uiSleep 1;
	life_money_antiglitch = false;
}