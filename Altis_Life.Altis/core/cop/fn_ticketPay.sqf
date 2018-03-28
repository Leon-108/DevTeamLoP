#include "..\..\script_macros.hpp"
/*
	File: fn_ticketPay.sqf
	Author: Bryan "Tonic" Boardwine
	
	Description:
	Pays the ticket.
*/
private ["_notEnough","_NotEnoughNOTF","_NotEnoughNOTF_2","_PaidNOTF","_PaidNOTF_2","_Paid"];
if(isnil {life_ticket_val} OR isNil {life_ticket_cop}) exitWith {};
if (side life_ticket_cop isEqualTo west) then {
	_notEnough = "STR_Cop_Ticket_NotEnough";
	_NotEnoughNOTF = "STR_Cop_Ticket_NotEnoughNOTF";
	_Paid = "STR_Cop_Ticket_Paid";
	_PaidNOTF = "STR_Cop_Ticket_PaidNOTF";
	_PaidNOTF_2 = "STR_Cop_Ticket_PaidNOTF_2";
};
if (side life_ticket_cop isEqualTo independent) then {
	_notEnough = "STR_Medic_Ticket_NotEnough";
	_NotEnoughNOTF = "STR_Medic_Ticket_NotEnoughNOTF";
	_PaidNOTF = "STR_Medic_Ticket_PaidNOTF";
	_PaidNOTF_2 = "STR_Medic_Ticket_PaidNOTF_2";
	_Paid = "STR_Medic_Ticket_Paid";
};
if(CASH < life_ticket_val) exitWith
{
	if(BANK < life_ticket_val) exitWith 
	{
		//h/int localize _notEnough;
		[localize _notEnough,"RED",10] spawn life_fnc_notification_system;
		[[1,_NotEnoughNOTF,true,[profileName]],"life_fnc_broadcast",life_ticket_cop,false] spawn life_fnc_MP;
		closeDialog 0;
	};
	//h/int format[localize _Paid,[life_ticket_val] call life_fnc_numberText];
	[format[localize _Paid,[life_ticket_val] call life_fnc_numberText],"PINK",5] spawn life_fnc_notification_system;
	BANK = BANK - life_ticket_val;
	life_ticket_paid = true;
	[[0,_PaidNOTF,true,[profileName,[life_ticket_val] call life_fnc_numberText]],"life_fnc_broadcast",(side life_ticket_cop),false] spawn life_fnc_MP;
	[[1,_PaidNOTF_2,true,[profileName]],"life_fnc_broadcast",life_ticket_cop,false] spawn life_fnc_MP;
	[[life_ticket_val,player,life_ticket_cop],"life_fnc_ticketPaid",life_ticket_cop,false] spawn life_fnc_MP;
	if (side life_ticket_cop isEqualTo west) then {
		[[getPlayerUID player],"life_fnc_wantedRemove",false,false] spawn life_fnc_MP;
	};
	closeDialog 0;
};

CASH = CASH - life_ticket_val;
life_ticket_paid = true;
if (side life_ticket_cop isEqualTo west) then {
	[[getPlayerUID player],"life_fnc_wantedRemove",false,false] spawn life_fnc_MP;
};
[[0,_PaidNOTF,true,[profileName,[life_ticket_val] call life_fnc_numberText]],"life_fnc_broadcast",(side life_ticket_cop),false] spawn life_fnc_MP;
closeDialog 0;
[[1,_PaidNOTF_2,true,[profileName]],"life_fnc_broadcast",life_ticket_cop,false] spawn life_fnc_MP;
[[life_ticket_val,player,life_ticket_cop],"life_fnc_ticketPaid",life_ticket_cop,false] spawn life_fnc_MP;