#include "..\..\script_macros.hpp"
/*
	Author: Bryan "Tonic" Boardwine
	
	Description:
	Locks up the entire house and closes all doors.
*/
private["_house"];
_house = [_this,0,ObjNull,[ObjNull]] call BIS_fnc_param;
if(isNull _house OR !(_house isKindOf "House_F")) exitWith {};

_numberOfDoors = getNumber(configFile >> "CfgVehicles" >> (typeOf _house) >> "numberOfDoors");
if(_numberOfDoors isEqualto -1 OR _numberOfDoors isEqualto 0) exitWith {}; //MEH

//t/itleText [localize "STR_House_LockingUp","PLAIN"];
[localize "STR_House_LockingUp","YELLOW",5] spawn life_fnc_notification_system;
sleep 3;

for "_i" from 1 to _numberOfDoors do {
	_house animate[format["door_%1_rot",_i],0];
	_house setVariable[format["bis_disabled_Door_%1",_i],1,true];
};

_house setVariable["locked",true,true];
//t/itleText[localize "STR_House_LockedUp","PLAIN"];
[localize "STR_House_LockedUp","YELLOW",5] spawn life_fnc_notification_system;