#include "..\..\script_macros.hpp"
/*
	File: fn_ticketPrompt
	Author: Bryan "Tonic" Boardwine
	
	Description:
	Prompts the player that he is being ticketed.
*/
params [
	["_cop",ObjNull,[ObjNull]],
	["_val",0,[100]]
];
if(!isNull (findDisplay 2600)) exitwith {}; //Already at the ticket menu, block for abuse?
if(isNull _cop) exitWith {};
private _Refuse = "STR_Cop_Ticket_Refuse";
private _Given = "STR_Cop_Ticket_GUI_Given";
private _side = "";
call { 
	if (side _cop isEqualTo west) exitWith {
		_side = "west";
		_Refuse = "STR_Cop_Ticket_Refuse";
		_Given = "STR_Cop_Ticket_GUI_Given";
	};
	if (side _cop isEqualTo independent) exitWith {
		_side = "independent";
		_Refuse = "STR_Medic_Ticket_Refuse";
		_Given = "STR_Medic_Ticket_GUI_Given";
	};
};
createDialog "life_ticket_pay";
disableSerialization;
waitUntil {!isnull (findDisplay 2600)};
private _display = findDisplay 2600;
private _control = _display displayCtrl 2601;
life_ticket_paid = false;
life_ticket_val = _val;
life_ticket_cop = _cop;
_control ctrlSetStructuredText parseText format["<t align='center'><t size='.8px'>" +(localize _Given),_cop getVariable["realname",name _cop], _val];
[_cop,_side,_Refuse] spawn {
	params [
		["_cop",ObjNull,[ObjNull]],
		["_side","",["west"]],
		["_Refuse","",["STR_Cop_Ticket_Refuse"]]
	];
	disableSerialization;
	waitUntil {life_ticket_paid OR (isNull (findDisplay 2600))};
	if(isNull (findDisplay 2600) && !life_ticket_paid) then	{
		if(_side isEqualTo "west") then {//Strafzettel
			[[0,_Refuse,true,[profileName]],"life_fnc_broadcast",west,false] spawn life_fnc_MP;
			[[1,_Refuse,true,[profileName]],"life_fnc_broadcast",_cop,false] spawn life_fnc_MP;
		};
		if(_side isEqualTo "independent") then {//PRS Rechnung
			[[0,_Refuse,true,[profileName]],"life_fnc_broadcast",independent,false] spawn life_fnc_MP;
			[[1,_Refuse,true,[profileName]],"life_fnc_broadcast",_cop,false] spawn life_fnc_MP;
		};
	};
};