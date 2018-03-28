#include "..\..\script_macros.hpp"
/*
	File: fn_keyDrop.sqf
	Author: Bryan "Tonic" Boardwine
	
	Description:
	Drops the key.
*/
private["_dialog","_list","_sel","_vehicle","_impounded","_owners","_index","_index2","_i"];
disableSerialization;

_dialog = findDisplay 2700;
_list = _dialog displayCtrl 2701;
_sel = lbCurSel _list;
if(_sel  isEqualto  -1) exitWith {
	//h/int "No Data Selected";
	["No Data Selected","RED",10] spawn life_fnc_notification_system;
};
_index = (parseNumber(_list lbData _sel));
_vehicle = life_2vehicles select _index;
if(_vehicle isKindOf "House_F") exitWith {
	//h/int "You can't remove the keys to your house!"
	["You can't remove the keys to your house!","RED",10] spawn life_fnc_notification_system;
};
_owners = _vehicle getVariable "vehicle_info_owners";

_index2 = [(getPlayerUID player),_owners] call TON_fnc_index;
life_2vehicles = life_2vehicles - [_vehicle];
_owners set[_index,-1];
_owners = _owners - [-1];
_vehicle setVariable["vehicle_info_owners",_owners,true];

[] spawn life_fnc_keyMenu;