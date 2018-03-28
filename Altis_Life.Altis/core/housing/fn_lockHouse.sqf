#include "..\..\script_macros.hpp"
/*
	Author: Bryan "Tonic" Boardwine
	
	Description:
	Unlocks / locks the house.
*/
private["_house"];
_house = [_this,0,ObjNull,[ObjNull]] call BIS_fnc_param;
if(isNull _house OR !(_house isKindOf "House_F")) exitWith {};

_state = _house getVariable["locked",true];
if(_state) then {
	_house setVariable["locked",false,true];
	//t/itleText[localize "STR_House_StorageUnlock","PLAIN"];
	[localize "STR_House_StorageUnlock","RED",5] spawn life_fnc_notification_system;
} else {
	_house setVariable["locked",true,true];
	//t/itleText[localize "STR_House_StorageLock","PLAIN"];
	[localize "STR_House_StorageLock","YELLOW",5] spawn life_fnc_notification_system;
};