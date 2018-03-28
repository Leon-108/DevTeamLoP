#include "..\..\script_macros.hpp"
/*
	Author: Bryan "Tonic" Boardwine
	
	Description:
	Tells the player that the gang is created and throws him into it.
*/
private["_group"];
life_action_gangInUse = nil;

if(BANK < (__GETC__(life_gangPrice))) exitWith {
	//h/int format[localize "STR_GNOTF_NotEnoughMoney",[((__GETC__(life_gangPrice))-BANK)] call life_fnc_numberText];
	[format[localize "STR_GNOTF_NotEnoughMoney",[((__GETC__(life_gangPrice))-BANK)] call life_fnc_numberText],"PURPLE",5] spawn life_fnc_notification_system;
	{(group player) setVariable[_x,nil,true];} foreach ["gang_id","gang_owner","gang_name","gang_members","gang_maxmembers","gang_bank"];
};

__SUB__(BANK,(__GETC__(life_gangPrice)));

//h/int format[localize "STR_GNOTF_CreateSuccess",(group player) getVariable "gang_name",[(__GETC__(life_gangPrice))] call life_fnc_numberText];
[format[localize "STR_GNOTF_CreateSuccess",(group player) getVariable "gang_name",[(__GETC__(life_gangPrice))] call life_fnc_numberText],"PURPLE",5] spawn life_fnc_notification_system;