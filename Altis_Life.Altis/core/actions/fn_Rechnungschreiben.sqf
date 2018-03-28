#include "..\..\script_macros.hpp"
//Author: PierreAmyf ### Some edits by Lost of Paradise (Sebi, Oktas) 
if(isServer)exitWith{};
if(playerside != independent)exitWith{};
private["_ziel","_val"];


if(vehicle player != player )exitWith{};
_ziel = cursorTarget;
if(isNull _ziel) exitWith{};    
if(!(_ziel isKindOf "Man")) exitWith{};  
//if(!(alive _ziel)) exitWith{};
if(player distance _ziel > 6) exitWith {
	//h/int parseText format ["<t color='#FFFF00'>Deine Arme sind viel zu kurz um die Rechnung von hier auszustellen! Geh näher ran.</t>"]
	[parseText format ["<t color='#FFFF00'>Deine Arme sind viel zu kurz um die Rechnung von hier auszustellen! Geh näher ran.</t>"],"RED",10] spawn life_fnc_notification_system;
}; // Nix mehr mit auf 500m Ausweis zeigen.

private["_unit"];
_unit = player;
disableSerialization;
if(!(createDialog "life_ticket_give")) exitWith {
	//h/int localize "STR_Cop_TicketFail"
	[localize "STR_Cop_TicketFail","RED",10] spawn life_fnc_notification_system;
};
//if(isNull _unit OR !isPlayer _unit) exitwith {};
ctrlSetText[2651,format[localize "STR_Cop_Ticket",_unit getVariable["realname",name _unit]]];
life_ticket_unit = player;
/*
if(isNil {life_ticket_ziel}) exitWith {h/int localize "STR_Cop_TicketNil"};
if(isNull life_ticket_ziel) exitWith {h/int localize "STR_Cop_TicketExist"};
_val = ctrlText 2652;
if(!([_val] call TON_fnc_isnumber)) exitWith {h/int localize "STR_Cop_TicketNum"};
if((parseNumber _val) > 1000000) exitWith {h/int localize "STR_Cop_TicketOver100"};
[[0,"STR_Cop_TicketGive",true,[profileName,[(parseNumber _val)] call life_fnc_numberText,life_ticket_ziel getVariable["realname",name life_ticket_ziel]]],"life_fnc_broadcast",true,false] spawn life_fnc_MP;
[[player,(parseNumber _val)],"life_fnc_ticketPrompt",life_ticket_ziel,false] spawn life_fnc_MP;
closeDialog 0;
*/
life_ticket_ziel = _ziel;

