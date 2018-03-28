#include "..\..\script_macros.hpp"
/*
	File: fn_ticketGive.sqf
	Author: Bryan "Tonic" Boardwine
	
	Description:
	Gives a ticket to the targeted player.
*/
private["_val","_maxTicket","_TicketGive","_TicketOver"];
_TicketGive= "STR_Cop_TicketGive";
if(isNil {life_ticket_unit}) exitWith {
	//h/int localize "STR_Cop_TicketNil"
	[localize "STR_Cop_TicketNil","RED",10] spawn life_fnc_notification_system;
};
if(isNull life_ticket_unit) exitWith {
	//h/int localize "STR_Cop_TicketExist"
	[localize "STR_Cop_TicketExist","RED",10] spawn life_fnc_notification_system;
};
_val = ctrlText 2652;
_maxTicket = 1000000;
_TicketOver = "STR_Cop_TicketNum";
if(playerSide isEqualTo independent) then {
	_maxTicket = 100000;
	_TicketGive= "STR_Medic_TicketGive";
	_TicketOver = "STR_Medic_TicketNum";
};
if(!([_val] call TON_fnc_isnumber)) exitWith {
	//h/int localize "STR_Cop_TicketNum"
	[localize "STR_Cop_TicketNum","RED",10] spawn life_fnc_notification_system;
};
if((parseNumber _val) > _maxTicket) exitWith {
	//h/int localize _TicketOver
	[localize _TicketOver,"RED",10] spawn life_fnc_notification_system;
};
[[0,_TicketGive,true,[profileName,[(parseNumber _val)] call life_fnc_numberText,life_ticket_unit getVariable["realname",name life_ticket_unit]]],"life_fnc_broadcast",true,false] spawn life_fnc_MP;
[[player,(parseNumber _val)],"life_fnc_ticketPrompt",life_ticket_unit,false] spawn life_fnc_MP;
closeDialog 0;