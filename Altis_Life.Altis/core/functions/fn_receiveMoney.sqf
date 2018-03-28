#include "..\..\script_macros.hpp"
/*
	File: fn_receiveMoney.sqf
	Author: Bryan "Tonic" Boardwine
	
	Description:
	Receives money
*/
private["_unit","_val","_from"];
_unit = [_this,0,Objnull,[Objnull]] call BIS_fnc_param;
_val = [_this,1,"",[""]] call BIS_fnc_param;
_from = [_this,2,Objnull,[Objnull]] call BIS_fnc_param;
if(isNull _unit OR isNull _from OR _val isEqualto "") exitWith {};
if(player != _unit) exitWith {};
if(!([_val] call TON_fnc_isnumber)) exitWith {};
if(_unit isEqualto _from) exitWith {}; //Bad boy, trying to exploit his way to riches.

//h/int format[localize "STR_NOTF_GivenMoney",_from getVariable["realname",name _from],[(parseNumber (_val))] call life_fnc_numberText];
[format[localize "STR_NOTF_GivenMoney",_from getVariable["realname",name _from],[(parseNumber (_val))] call life_fnc_numberText],"PINK",5] spawn life_fnc_notification_system;
diag_log format ["Name: %1, PlayerID: %2, Cash: %3", name _unit,getPlayerUID _unit, CASH];
CASH = CASH + (parseNumber(_val));
diag_log format ["Name: %1, PlayerID: %2, Cash: %3, FromName: %4, FromPlayerID: %5, Value: %6", name _unit,getPlayerUID _unit, CASH, name _from, getPlayerUID _from, parseNumber (_val)];