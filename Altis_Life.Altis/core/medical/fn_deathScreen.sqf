#include "..\..\script_macros.hpp"
/*
	File: fn_deathScreen.sqf
	Author: Bryan "Tonic" Boardwine
	
	Description:
	Handles stuff being displayed on the death screen while
	it is currently active.
*/
private["_medicsOnline","_medicsNear"];
disableSerialization;

_medicsOnline = ((findDisplay 7300) displayCtrl 7304);
_medicsNear = ((findDisplay 7300) displayCtrl 7305);

waitUntil {
	private _nearby =-1;
	private _dist = "No";
	{
		if (side _x isEqualTo independent && (alive _x) && !(_x isEqualTo player)) then {
				_tmp = ((getPosATL _x) distance (getPosATL life_corpse));
				if ((_nearby isEqualTo -1) || (_nearby > _tmp)) then {_nearby =_tmp};
		};
	} count allPlayers;
	if (_nearby isEqualTo -1) then {_dist = "No"} else {_dist = [round (_nearby)] call life_fnc_numberText};
	_medicsOnline ctrlSetText format[localize "STR_Medic_Online",{side _x isEqualTo independent && (alive _x) } count allPlayers];
	_medicsNear ctrlSetText format[localize "STR_Medic_Near",_dist];
	uisleep 1;
	(isNull (findDisplay 7300))
};