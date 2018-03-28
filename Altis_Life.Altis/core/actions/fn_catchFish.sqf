#include "..\..\script_macros.hpp"
/*
	File: fn_catchFish.sqf
	Author: Bryan "Tonic" Boardwine
	
	Description:
	Catches a fish that is near by.
*/
private["_fish","_type"];
_fish = [_this,0,ObjNull,[ObjNull]] call BIS_fnc_param;
if(!(_fish isKindOf "Fish_Base_F")) exitWith {}; //Not a fishy!
if(player distance _fish > 3.5) exitWith {};
private _type = "";
_type = call {
	if ((typeOf _fish) isEqualto "Salema_F") exitWith {"salema"};
	if ((typeOf _fish) isEqualto "Ornate_random_F") exitWith {"ornate"};
	if ((typeOf _fish) isEqualto "Mackerel_F") exitWith {"mackerel"};
	if ((typeOf _fish) isEqualto "Tuna_F") exitWith {"tuna"};
	if ((typeOf _fish) isEqualto "Mullet_F") exitWith {"mullet"};
	if ((typeOf _fish) isEqualto "CatShark_F") exitWith {"catshark"};
};

if(_type isEqualto "") exitWith {}; //Couldn't get a type

if(([true,_type,1] call life_fnc_handleInv)) then
{
	deleteVehicle _fish;
	[format[(localize "STR_NOTF_Fishing"),_type],"BLUE",5] spawn life_fnc_notification_system;
};