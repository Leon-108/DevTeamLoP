#include "..\..\script_macros.hpp"
/*
	Author: Bryan "Tonic" Boardwine
	
	Description:
	Sells the house?
*/
private["_house","_uid","_action","_houseCfg"];
_house = [_this,0,ObjNull,[ObjNull]] call BIS_fnc_param;
_uid = getPlayerUID player;
if (life_action_inUse) exitWith {}; // prevent duping

if(isNull _house) exitWith {};
if(!(_house isKindOf "House_F")) exitWith {};
if(isNil {_house getVariable "house_owner"}) exitWith {
	//h/int "There is no owner for this house."
	["There is no owner for this house.","RED",10] spawn life_fnc_notification_system;
};
closeDialog 0;
		life_action_inUse = true; // duping fix
_houseCfg = [(typeOf _house)] call life_fnc_houseConfig;
if(count _houseCfg isEqualto 0) exitWith {};

_action = [
	format[localize "STR_House_SellHouseMSG",
	(round((_houseCfg select 0)/2)) call life_fnc_numberText,
	(_houseCfg select 1)],localize "STR_pInAct_SellHouse",localize "STR_Global_Sell",localize "STR_Global_Cancel"
] call BIS_fnc_guiMessage;
if(_action) then {
	_house setVariable["house_sold",true,true];
	//h/int "Haus wird verkauft kleinen moment...";
	["Haus wird verkauft kleinen moment...","YELLOW",5] spawn life_fnc_notification_system;
	sleep 10;
	[[_house],"TON_fnc_sellHouse",false,false] spawn life_fnc_MP;
	_house setVariable["locked",false,true];
	_house setVariable["Trunk",nil,true];
	_house setVariable["containers",nil,true];
	deleteMarkerLocal format["house_%1",_house getVariable "uid"];
	_house setVariable["uid",nil,true];
	//h/int "Haus wurde verkauft das Geld wird dir gleich ausgezahlt...";
	["Haus wurde verkauft das Geld wird dir gleich überwiesen...","YELLOW",5] spawn life_fnc_notification_system;
		sleep 10;
	BANK = BANK + (round((_houseCfg select 0)/2));
	["Das Geld wurde auf die Bank überwiesen!","GREEN",5] spawn life_fnc_notification_system;
	_index = life_2vehicles find _house;
	if(_index != -1) then {
		life_2vehicles set[_index,-1];
		life_2vehicles = life_2vehicles - [-1];
	};
	
	_index = [str(getPosATL _house),life_houses] call TON_fnc_index;
	if(_index != -1) then {
		life_houses set[_index,-1];
		life_houses = life_houses - [-1];
	};
	_numOfDoors = getNumber(configFile >> "CfgVehicles" >> (typeOf _house) >> "numberOfDoors");
	for "_i" from 1 to _numOfDoors do {
		_house setVariable[format["bis_disabled_Door_%1",_i],0,true];
	};
};
life_action_inUse = false; // duping fix
closeDialog 0;