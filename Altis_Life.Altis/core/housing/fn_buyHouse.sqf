#include "..\..\script_macros.hpp"
/*
	Author: Bryan "Tonic" Boardwine
	
	Description:
	Buys the house?
*/
private["_house","_uid","_unit","_action","_houseCfg","_check"];
_house = [_this,0,ObjNull,[ObjNull]] call BIS_fnc_param;
_check = [_this,1,false,[true]] call BIS_fnc_param;
_unit = player;
_uid = getPlayerUID player;
if(isNull _house) exitWith {};
if(!(_house isKindOf "House_F")) exitWith {};
if((_house getVariable["house_owned",false])) exitWith {
	//h/int "Dieses Haus ist bereits verkauft!"
	["Dieses Haus ist bereits verkauft!","RED",10] spawn life_fnc_notification_system;
};
if(!isNil {(_house getVariable "house_sold")}) exitWith {
	//h/int localize "STR_House_Sell_Process"
	[localize "STR_House_Sell_Process","RED",10] spawn life_fnc_notification_system;
};
if(!license_civ_home) exitWith {
	//h/int localize "STR_House_License"
	[localize "STR_House_License","RED",10] spawn life_fnc_notification_system;
};
if(count life_houses >= (__GETC__(life_houseLimit))) exitWith {
	//h/int format[localize "STR_House_Max_House",__GETC__(life_houseLimit)]
	[format[localize "STR_House_Max_House",__GETC__(life_houseLimit)],"RED",10] spawn life_fnc_notification_system;
};
closeDialog 0;

_houseCfg = [(typeOf _house)] call life_fnc_houseConfig;
if(count _houseCfg isEqualto 0) exitWith {};
if !(_check) then {
	_action = [
		format[localize "STR_House_BuyMSG",
		[(_houseCfg select 0)] call life_fnc_numberText,
		(_houseCfg select 1)],localize "STR_House_Purchase",localize "STR_Global_Buy",localize "STR_Global_Cancel"
	] call BIS_fnc_guiMessage;
} else {_action = true;};
if(BANK < (_houseCfg select 0)) exitWith {
	//h/int localize "STR_House_NotEnough"
	[localize "STR_House_NotEnough","RED",10] spawn life_fnc_notification_system;
};

if(_action) then {
	//[[_uid,_house],"TON_fnc_addHouse",false,false] spawn life_fnc_MP;
	if !(_check) exitWith{[[_unit,_house],"TON_fnc_addHouse",false,false] spawn life_fnc_MP;};
	_house setVariable["house_owner",[_uid,profileName],true];
	_house setVariable["locked",true,true];
	_house setVariable["Trunk",[[],0],true];
	_house setVariable["containers",[],true];
	_house setVariable["uid",round(random 99999),true];
	BANK = BANK - (_houseCfg select 0);
	[1] call SOCK_fnc_updatePartial;
	life_2vehicles pushBack _house;
	life_houses pushBack [str(getPosATL _house),[]];
	//h/int "Dein Haus wird im Grundbuch eingetragen... Bitte warten..."; //Anti CB Log
	["Dein Haus wird im Grundbuch eingetragen... Bitte warten...","YELLOW",5] spawn life_fnc_notification_system;
	_marker = createMarkerLocal [format["house_%1",(_house getVariable "uid")],getPosATL _house];
	_houseName = getText(configFile >> "CfgVehicles" >> (typeOf _house) >> "displayName");
	_marker setMarkerTextLocal _houseName;
	_marker setMarkerColorLocal "ColorBlue";
	_marker setMarkerTypeLocal "loc_Lighthouse";
	_numOfDoors = getNumber(configFile >> "CfgVehicles" >> (typeOf _house) >> "numberOfDoors");
	for "_i" from 1 to _numOfDoors do {
		_house setVariable[format["bis_disabled_Door_%1",_i],1,true];
	[] call SOCK_fnc_syncData; //Anti CB Log
	sleep 5; //Anti CB Log
	//h/int "Dein Haus ist nun angemeldet..."; //Anti CB Log
	["Dein Haus ist nun angemeldet!","GREEN",5] spawn life_fnc_notification_system;
	};
};