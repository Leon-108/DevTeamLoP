#include "..\..\script_macros.hpp"
/*
    File: fn_gather.sqf
    Author: Devilfloh

    Description:
    Main functionality for gathering.
*/
private ["_maxGather","_resource","_amount","_maxGather","_requiredItem","_allowedside"];
if (life_action_inUse) exitWith {};
if !(isNull objectParent player) exitWith {};
if (player getVariable "restrained") exitWith {
	//h/int localize "STR_NOTF_isrestrained";
	[localize "STR_NOTF_isrestrained","RED",10] spawn life_fnc_notification_system;
};
if (player getVariable "playerSurrender") exitWith {
	//h/int localize "STR_NOTF_surrender";
	[localize "STR_NOTF_surrender","RED",10] spawn life_fnc_notification_system;
};

life_action_inUse = true;
_zone = "";
_requiredItem = "";
_exit = false;

_resourceCfg = missionConfigFile >> "CfgGather" >> "Resources";
for "_i" from 0 to count(_resourceCfg)-1 do {

    _curConfig = _resourceCfg select _i;
    _resource = configName _curConfig;
    _maxGather = getNumber(_curConfig >> "amount");
    _zoneSize = getNumber(_curConfig >> "zoneSize");
    _resourceZones = getArray(_curConfig >> "zones");
    _requiredItem = getText(_curConfig >> "item");
	_allowedside = getArray(_curConfig >> "side");
    {
        if ((player distance (getMarkerPos _x)) < _zoneSize) exitWith {_zone = _x;};
    } forEach _resourceZones;

    if (_zone != "") exitWith {};
};
_side ="";
if (playerSide isEqualTo civilian) then {_side = "civ"};
if (playerSide isEqualTo west) then {_side = "cop"};
if (playerSide isEqualTo independent) then {_side = "med"};
if (_zone isEqualTo "" || !(_side in _allowedside)) exitWith {
    life_action_inUse = false;
};

if (_requiredItem != "") then {
    _valItem = missionNamespace getVariable "life_inv_" + _requiredItem;

    if (_valItem < 1) exitWith {
        switch (_requiredItem) do {
         //Messages here
        };
        life_action_inUse = false;
        _exit = true;
    };
};

if (_exit) exitWith {life_action_inUse = false;};

_max = (2 * _maxGather);
_amount = floor(random [1,_maxGather,_max]);
_diff = [_resource,_amount,life_carryWeight,life_maxWeight] call life_fnc_calWeightDiff;
if (_diff isEqualTo 0) exitWith {
    //h/int localize "STR_NOTF_InvFull";
	[localize "STR_NOTF_InvFull","RED",10] spawn life_fnc_notification_system;
    life_action_inUse = false;
};

switch (_requiredItem) do {
    case "pickaxe": {player say3D "mining";};
    default {player say3D "harvest";};
};

for "_i" from 0 to 4 do {
    player playMoveNow "AinvPercMstpSnonWnonDnon_Putdown_AmovPercMstpSnonWnonDnon";
    waitUntil{animationState player != "AinvPercMstpSnonWnonDnon_Putdown_AmovPercMstpSnonWnonDnon";};
    sleep 0.5;
};

if ([true,_resource,_diff] call life_fnc_handleInv) then {
    _itemName = M_CONFIG(getText,"VirtualItems",_resource,"displayName");
	[format [localize "STR_NOTF_Gather_Success",(localize _itemName),_diff],"BLUE",5] spawn life_fnc_notification_system;
};

sleep 1;
life_action_inUse = false;