/*
	File: fn_earthquake.sqf
	Author: Bryan "Tonic" Boardwine
	
	Description:
	Makes Earthquake ^^.
*/
private["_int"];
_int = [_this,0,4] call BIS_fnc_param;
[_int] call bis_fnc_earthquake;