#include "..\..\script_macros.hpp"
/*
	Author: Bryan "Tonic" Boardwine
	
	Description:
	Prompts the player about an invite.
*/
private["_action","_grpMembers"];
params [
    ["_name","",[""]],
    ["_group",grpNull,[grpNull]]
];
_grpMembers = [];
if(_name isEqualTo "" OR isNull _group) exitWith {}; //Fail horn anyone?
if(!isNil {(group player) getVariable "gang_name"}) exitWith {
	//h/int "You are already in a gang"
	["You are already in a gang","RED",10] spawn life_fnc_notification_system;
};

_gangName = _group getVariable "gang_name";
_action = [
	format[localize "STR_GNOTF_InviteMSG",_name,_gangName],
	localize "STR_Gang_Invitation",
	localize "STR_Global_Yes",
	localize "STR_Global_No"
] call BIS_fnc_guiMessage;

if(_action) then {
	[player] join _group;
	[[4,_group],"TON_fnc_updateGang",false,false] spawn life_fnc_MP;
} else {
    _grpMembers = group player getVariable "gang_members";
    _grpMembers = _grpMembers - [getPlayerUID player];
    group player setVariable ["gang_members",_grpMembers,true];
	
	[[4,_grpMembers],"TON_fnc_updateGang",false,false] spawn life_fnc_MP;
};