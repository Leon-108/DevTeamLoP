/*
	File: fn_copSiren.sqf
	Author: Bryan "Tonic" Boardwine
	
	Description:
	Starts the cop siren sound for other players
*/
params ["_vehicle","_sirene"];

if(isNull _vehicle) exitWith {};
if(isNil {_vehicle getVariable "siren"}) exitWith {};

if(_sirene isEqualTo "siren") then {
	while {true} do
	{
		if(!(_vehicle getVariable "siren")) exitWith {};
		if(count (crew (_vehicle)) isEqualTo 0) then {_vehicle setVariable["siren",false,true]};
		if(!alive _vehicle) exitWith {};
		if(isNull _vehicle) exitWith {};
		_vehicle say3D ["SirenLong",500,1];
		sleep 4.7;
		if(!(_vehicle getVariable "siren")) exitWith {};
	};
};
if(_sirene isEqualTo "yelp") then {
	for "_i" from 0 to 1 do {
		if(!(_vehicle getVariable "siren")) exitWith {};
		if(count (crew (_vehicle)) isEqualTo 0) then {_vehicle setVariable["siren",false,true]};
		if(!alive _vehicle) exitWith {};
		if(isNull _vehicle) exitWith {};
		_vehicle say3D ["cop_yelp", 500, 1];
		sleep 2;
	};
};