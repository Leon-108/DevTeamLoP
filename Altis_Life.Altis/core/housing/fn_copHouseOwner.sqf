#include "..\..\script_macros.hpp"
/*
	Displays the house owner
*/
private["_house"];
_house = [_this,0,ObjNull,[ObjNull]] call BIS_fnc_param;
if(isNull _house OR !(_house isKindOf "House_F")) exitWith {};
if(isNil {(_house getVariable "house_owner")}) exitWith {
	//h/int localize "STR_House_Raid_NoOwner"
	[localize "STR_House_Raid_NoOwner","RED",10] spawn life_fnc_notification_system;
};
//h/int parseText format["<t color='#FF0000'><t size='2'>" +(localize "STR_House_Raid_Owner")+ "</t></t><br/>%1",(_house getVariable "house_owner") select 1];
[parseText format["<t color='#FF0000'><t size='2'>" +(localize "STR_House_Raid_Owner")+ "</t></t><br/>%1",(_house getVariable "house_owner") select 1],"BLUE",10] spawn life_fnc_notification_system;