#include "..\..\script_macros.hpp"
/*
	Author: Bryan "Tonic" Boardwine
	
	Description:
	Deposits money into the players gang bank.
*/
private["_value"];
_value = parseNumber(ctrlText 2702);

//Series of stupid checks
if(_value > 999999) exitWith {
	//h/int localize "STR_ATM_GreaterThan";
	[localize "STR_ATM_GreaterThan","RED",10] spawn life_fnc_notification_system;
};
if(_value < 0) exitWith {};
if(!([str(_value)] call life_fnc_isnumeric)) exitWith {
	//h/int localize "STR_ATM_notnumeric"
	[localize "STR_ATM_notnumeric","RED",10] spawn life_fnc_notification_system;
};
if(_value > BANK) exitWith {
	//h/int localize "STR_NOTF_NotEnoughFunds"
	[localize "STR_NOTF_NotEnoughFunds","RED",10] spawn life_fnc_notification_system;
};

__SUB__(BANK,_value);
_gFund = grpPlayer getVariable ["gang_bank",0];
_gFund = _gFund + _value;
grpPlayer setVariable ["gang_bank",_gFund,true];

//h/int format[localize "STR_ATM_DepositGang",[_value] call life_fnc_numberText];
[format[localize "STR_ATM_DepositGang",[_value] call life_fnc_numberText],"GREEN",5] spawn life_fnc_notification_system;
[] call life_fnc_atmMenu;
[6] call SOCK_fnc_updatePartial; //Silent Sync
[[1,grpPlayer],"TON_fnc_updateGang",false,false] spawn life_fnc_MP;
