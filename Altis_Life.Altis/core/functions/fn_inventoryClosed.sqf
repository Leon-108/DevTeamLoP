/*
	Author: Bryan "Tonic" Boardwine
	
	Description:
	Used for syncing house container data but when the inventory menu
	is closed a sync request is sent off to the server.
*/
private["_container"];
_container = [_this,1,ObjNull,[ObjNull]] call BIS_fnc_param;
if(isNull _container) exitWith {}; //MEH

if((typeOf _container) in ["Box_IND_Grenades_F","I_supplyCrate_F","Land_CargoBox_V1_F"]) exitWith {
	_house = lineIntersectsWith [getPosASL player, ATLtoASL screenToWorld[0.5,0.5]];
	
	call {
		if (count _house isEqualTo 0) exitWith {_exit = true;};
		if (count _house isEqualTo 1) exitWith {_house = _house select 0;};
		if (count _house > 1) exitWith {
			{if(_x isKindOf "House_F") exitWith {_house = _x;};} foreach _house;
		};
	};
	if(!isNil "_exit" OR !(_house isKindOf "House_F")) exitWith {systemChat localize "STR_House_ContainerError"};
	[[_house],"TON_fnc_updateHouseContainers",false,false] spawn life_fnc_MP;
};