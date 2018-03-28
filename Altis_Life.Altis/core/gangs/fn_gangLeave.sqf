#include "..\..\script_macros.hpp"
/*
	Author: Bryan "Tonic" Boardwine
	
	Description:
	32 hours later...
*/
private ["_unitID ","_members"];
if (getPlayerUID player isEqualTo (group player getVariable "gang_owner")) exitWith {
	//h/int localize "STR_GNOTF_LeaderLeave"
	[localize "STR_GNOTF_LeaderLeave","RED",10] spawn life_fnc_notification_system;
};
_unitID = getPlayerUID player;
_members = group player getVariable "gang_members";
if (isNil "_members") exitWith {};
if (!(_members isEqualType [])) exitWith {};

_members = _members - [_unitID];
group player setVariable ["gang_members",_members,true];
[[player,group player],"TON_fnc_clientGangLeft",player,false]spawn life_fnc_MP;
[[4,group player],"TON_fnc_updateGang",false,false] spawn life_fnc_MP;
closeDialog 0;

/*
if(steamid isEqualto (grpPlayer getVariable "gang_owner")) exitWith {h/int localize "STR_GNOTF_LeaderLeave"};
_grp = grpPlayer;
_grpMembers = grpPlayer getVariable "gang_members";
_grpMembers = _grpMembers - [steamid];
_grp setVariable["gang_members",_grpMembers,true];
[player] joinSilent (createGroup civilian);


*/