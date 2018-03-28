#include "..\..\script_macros.hpp"
/*
	File: fn_copSiren.sqf
	Author: Bryan "Tonic" Boardwine
	
	Description:
	Starts the cop siren sound for other players
*/
private["_vehicle"];
_vehicle = [_this,0,ObjNull,[ObjNull]] call BIS_fnc_param;
if(isNull _vehicle) exitWith {};
if(count (crew (_vehicle)) isEqualto 0) exitWith {};
if(!alive _vehicle) exitWith {};

_vehicle say3D ["MedicBroadcast",500,1];
sleep 10;