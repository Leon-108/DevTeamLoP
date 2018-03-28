#include "..\..\script_macros.hpp"
/*
	Author: Bryan "Tonic" Boardwine
	
	Description:
	Pulls up the menu and creates the gang?
*/
private["_gangName","_length","_badChar","_chrByte","_allowed"];
disableSerialization;

_gangName = ctrlText (getControl(2520,2522));
_length = count (toArray(_gangName));
_chrByte = toArray (_gangName);
_allowed = toArray("ABCDEFGHIJKLMNOPQRSTUVWXYZabcdefghijklmnopqrstuvwxyz0123456789_ ");
if(_length > 32) exitWith {
	//h/int localize "STR_GNOTF_Over32"
	[localize "STR_GNOTF_Over32","RED",10] spawn life_fnc_notification_system;
};
_badChar = false;
{if(!(_x in _allowed)) exitWith {_badChar = true;};} foreach _chrByte;
if(_badChar) exitWith {
	//h/int localize "STR_GNOTF_IncorrectChar";
	[localize "STR_GNOTF_IncorrectChar","RED",10] spawn life_fnc_notification_system;
};
if(BANK < (__GETC__(life_gangPrice))) exitWith {
	//h/int format[localize "STR_GNOTF_NotEnoughMoney",[((__GETC__(life_gangPrice))-BANK)] call life_fnc_numberText];
	[format[localize "STR_GNOTF_NotEnoughMoney",[((__GETC__(life_gangPrice))-BANK)] call life_fnc_numberText],"RED",10] spawn life_fnc_notification_system;
};

[[player,getPlayerUID player,_gangName],"TON_fnc_insertGang",false,false] spawn life_fnc_MP;
//h/int localize "STR_NOTF_SendingData";
[localize "STR_NOTF_SendingData","PURPLE",5] spawn life_fnc_notification_system;
closeDialog 0;
life_action_gangInUse = true;