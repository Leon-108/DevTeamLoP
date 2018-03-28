#include "..\..\script_macros.hpp"
/*
	Author: Bryan "Tonic" Boardwine
	
	Description:
	Starts the invite process?
*/
private "_unit";
disableSerialization;

if((lbCurSel 2632) isEqualto -1) exitWith {
	//h/int localize "STR_GNOTF_SelectPerson"
	[localize "STR_GNOTF_SelectPerson","RED",10] spawn life_fnc_notification_system;
};
_unit = call compile format["%1",getSelData(2632)];
if(isNull _unit) exitWith {}; //Bad unit?
if(_unit isEqualto player) exitWith {
	//h/int localize "STR_GNOTF_InviteSelf"
	[localize "STR_GNOTF_InviteSelf","RED",10] spawn life_fnc_notification_system;
};
if(!isNil {(group _unit) getVariable "gang_name"}) exitWith {
	//h/int "Dieser Spieler ist bereits in einer Gang"
	[localize "STR_GNOTF_PlayerAlreadyInAGang","RED",10] spawn life_fnc_notification_system;
}; //Added

if (count(group player getVariable ["gang_members",8]) == (group player getVariable ["gang_maxMembers",8])) exitWith {
	//h/int localize "STR_GNOTF_MaxSlot"
	[localize "STR_GNOTF_MaxSlot","RED",10] spawn life_fnc_notification_system;
};

_action = [
	format[localize "STR_GNOTF_InvitePlayerMSG",_unit getVariable ["realname",name _unit]],
	localize "STR_Gang_Invitation",
	localize "STR_Global_Yes",
	localize "STR_Global_No"
] call BIS_fnc_guiMessage;

if(_action) then {
	[profileName,group player] remoteExec ["life_fnc_gangInvite",_unit];
    _members = group player getVariable "gang_members";
    _members pushBack getPlayerUID _unit;
    group player setVariable ["gang_members",_members,true];
    //h/int format [localize "STR_GNOTF_InviteSent",_unit getVariable ["realname",name _unit]];
	[format [localize "STR_GNOTF_InviteSent",_unit getVariable ["realname",name _unit]],"GREEN",5] spawn life_fnc_notification_system;
} else {
	//h/int localize "STR_GNOTF_InviteCancel";
	[localize "STR_GNOTF_InviteCancel","RED",10] spawn life_fnc_notification_system;
};