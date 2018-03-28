#include "..\..\script_macros.hpp"
    /*
        File: fn_mine.sqf
        Author: Devilfloh
        Editor: Dardo

        Description:
        Same as fn_gather,but it allows use of probabilities for mining.
    */
private ["_maxGather", "_amount", "_requiredItem", "_mined","_allowedside"];
params ["_resource"];
if (life_action_inUse) exitWith {};
if !(isNull objectParent player) exitWith {};
if (player getVariable "Re-strained") exitWith {
    [localize "STR_NOTF_isrestrained","RED",10] spawn life_fnc_notification_system;
};
private _percent = [1,100] call BIS_fnc_randomInt; //Make sure it's not 0
private _exit = false;
if (player getVariable "playerSurrender") exitWith {
    [localize "STR_NOTF_surrender","RED",10] spawn life_fnc_notification_system;
};
life_action_inUse = true;
_requiredItem = "";
_item="";
private _name = "";
private _maxGather = 0;
private _minetext ="STR_NOTF_Mine_Success";
if (isClass (missionConfigFile >> "CfgGather" >> "Minerals" >> _resource)) then {
	_curConfig = missionConfigFile >> "CfgGather" >> "Minerals" >> _resource;
	_resources = getArray(_curConfig >> "mined");
	_requiredItem = getText(_curConfig >> "item");
	_allowedside = getArray(_curConfig >> "side");
	_maxGather = getNumber(_curConfig >> "amount");
	_minetext = getText(_curConfig >> "Text");
	if (_resources isEqualTo []) exitWith {}; //Smart guy :O
    for "_i" from 0 to count (_resources) do {
        if (count _resources isEqualTo 1) exitWith {
            if (!((_resources select 0) isEqualType [])) then {
                _item = _resources select 0;
            } else {
                _item = (_resources select 0) select 0;
            };
        };
        _mined = (_resources select _i) select 0;
        _prob = (_resources select _i) select 1;
        _probdiff = (_resources select _i) select 2;
        if ((_percent >= _prob) && (_percent <= _probdiff)) exitWith {
            _item = _mined;
        };
    };
};
private _filter = true;
if (isClass (missionConfigFile >> "VirtualItems" >> _item)) then {
	_filter = false;
	_name = M_CONFIG(getText,"VirtualItems",_item,"displayName");
} else {_filter = true};
if (_filter) exitWith {life_action_inUse = false;};

_side ="";
if (playerSide isEqualTo civilian) then {_side = "civ"};
if (playerSide isEqualTo west) then {_side = "cop"};
if (playerSide isEqualTo independent) then {_side = "med"};
if (!(_side in _allowedside)) exitWith {life_action_inUse = false;};
if !(_requiredItem isEqualTo "") then {
	_rname = M_CONFIG(getText,"VirtualItems",_requiredItem,"displayName");
    if (ITEM_VALUE(_requiredItem) < 1) exitWith {
		[format[localize "STR_NOTF_Pickaxe",(localize _rname)],"PINK",5] spawn life_fnc_notification_system;
		life_action_inUse = false;
		_exit = true;
	};
};

if (_exit) exitWith {
    life_action_inUse = false;
};

_max = (2 * _maxGather);
_amount = floor(random [1,_maxGather,_max]);
_diff = [_item, _amount, life_carryWeight, life_maxWeight] call life_fnc_calWeightDiff;
if (_diff isEqualTo 0) exitWith {
	[localize "STR_NOTF_InvFull","RED",10] spawn life_fnc_notification_system;
    life_action_inUse = false;
};
player say3D "mining";

for "_i" from 0 to 6 do {
    player playMoveNow "AinvPercMstpSnonWnonDnon_Putdown_AmovPercMstpSnonWnonDnon";
    waitUntil {
        animationState player != "AinvPercMstpSnonWnonDnon_Putdown_AmovPercMstpSnonWnonDnon";
    };
    sleep 0.5;
};

if (([true, _item, _diff] call life_fnc_handleInv)) then {
    [format [localize _minetext,(localize _name), _diff],"BLUE",5] spawn life_fnc_notification_system;
};

sleep 2.5;
life_action_inUse = false;
