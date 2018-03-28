#include "..\..\script_macros.hpp"
/*
	Author: Bryan "Tonic" Boardwine
	
	Description:
	32 hours...
*/
private["_unit","_unitID","_members"];
disableSerialization;

if((lbCurSel 2621) isEqualto -1) exitWith {
	//h/int localize "STR_GNOTF_SelectKick"
	[localize "STR_GNOTF_SelectKick","RED",10] spawn life_fnc_notification_system;
};
_unit = call compile format["%1",getSelData(2621)];

if(isNull _unit) exitWith {}; //Bad unit?
if(_unit isEqualto player) exitWith {
	//h/int localize "STR_GNOTF_KickSelf"
	[localize "STR_GNOTF_KickSelf","RED",10] spawn life_fnc_notification_system;
};

_unitID = getPlayerUID _unit;
_members = group player getVariable "gang_members";
if(isNil "_members") exitWith {};
if (!(_members isEqualType [])) exitWith {};
_members = _members - [_unitID];
group player setVariable ["gang_members",_members,true];

[format [localize "STR_GNOTF_GangKick",_unit getVariable ["realname",name _unit]],"PINK",5] spawn life_fnc_notification_system;
[[_unit,group player],"TON_fnc_clientGangKick",_unit,false] spawn life_fnc_MP; //Boot that bitch!
[[4,group player],"TON_fnc_updateGang",false,false] spawn life_fnc_MP; //Update the database.
[] call life_fnc_gangMenu;