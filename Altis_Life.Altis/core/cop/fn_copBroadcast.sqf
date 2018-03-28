/*
	File: fn_copSiren.sqf
	Author: Bryan "Tonic" Boardwine
	
	Description:
	Starts the cop siren sound for other players
*/
private["_vehicle"];
_vehicle = [_this,0,ObjNull,[ObjNull]] call BIS_fnc_param;
_range=100;
if(isNull _vehicle) exitWith {};
if(count (crew (_vehicle)) isEqualTo 0) exitWith {};
if(!alive _vehicle) exitWith {};
if (_vehicle isKindOf "Air" ) then { _range = 200 };
if (_vehicle isKindOf "Car" ) then { _range = 150 };
if (_vehicle isKindOf "Ship" ) then { _range = 150 };
_vehicle say3D ["CopBroadcast01",_range,1];
sleep 10;