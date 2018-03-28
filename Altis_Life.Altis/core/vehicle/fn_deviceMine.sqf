#include "..\..\script_macros.hpp"
/*
	Author: Bryan "Tonic" Boardwine
	complete rework: moeck (Lost on Paradise)
	
	Description:
	Gather resources for configured items and vehicle. The amount depends on the weight of the item ^^. Each resource takes the same time to get a full device :-P
*/
params [["_vehicle",ObjNull,[ObjNull]]];
private _resource = life_whatIsIt;
private _item = "";
private _filter = true;
private _itemW = 0;
private _name = "";
private _percent = [1,100] call BIS_fnc_randomInt; //Make sure it's not 0
if (isClass (missionConfigFile >> "CfgGather" >> "Minerals" >> _resource)) then {
	_curConfig = missionConfigFile >> "CfgGather" >> "Minerals" >> _resource;
	_resources = getArray(_curConfig >> "mined");
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

if (isClass (missionConfigFile >> "VirtualItems" >> _item)) then {
	_filter = false;
	_itemW = M_CONFIG(getNumber,"VirtualItems",_item,"weight");
	_name = M_CONFIG(getText,"VirtualItems",_item,"displayName");
} else {_filter = true};

if (_filter) exitWith {life_action_inUse = false;};
if(isNull _vehicle) exitWith {}; //Null was passed?
if(!isNil {_vehicle getVariable "mining"}) exitWith {
	[localize "STR_NOTF_DeviceIsMining","PINK",5] spawn life_fnc_notification_system;
};
//Mining is already in process..
closeDialog 0; //Close the interaction menu.
life_action_inUse = true; //Lock out the interaction menu for a bit..
private _weight = [_vehicle] call life_fnc_vehicleWeight;
if((_weight select 1) >= (_weight select 0)) exitWith {
	[localize "STR_NOTF_DeviceFull","RED",10] spawn life_fnc_notification_system;
	life_action_inUse = false;
};
_vehicle setVariable ["mining",true,true]; //Lock the device
[_vehicle,"life_fnc_soundDevice",true,false] spawn life_fnc_MP; //Broadcast the 'mining' sound of the device for nearby units.

life_action_inUse = false; //Unlock it since it's going to do it's own thing...

while {true} do {
	if(!alive _vehicle OR isNull _vehicle) exitWith {};
	if(fuel _vehicle isEqualto 0) exitWith {[localize "STR_NOTF_OutOfFuel","RED",10] spawn life_fnc_notification_system;};
	if(isEngineOn _vehicle) exitWith {[localize "STR_NOTF_MiningStopped","RED",10] spawn life_fnc_notification_system;};
	[localize "STR_NOTF_DeviceMining","PINK",5] spawn life_fnc_notification_system;
	_time = time + 27;
	
	//Wait for 27 seconds with a 'delta-time' wait.
	waitUntil {
		if(isEngineOn _vehicle) exitWith {			
			true
		};
		if(round(_time - time) < 1) exitWith {true};
		sleep 0.2;
		false
	};
	
	if(isEngineOn _vehicle) exitWith {
		[localize "STR_NOTF_MiningStopped","RED",10] spawn life_fnc_notification_system;
	};
	
	_vInv = _vehicle getVariable ["Trunk",[[],0]];
	_items = _vInv select 0;
	_space = _vInv select 1;
	_itemIndex = [_item,_items] call TON_fnc_index;
	_weight = [_vehicle] call life_fnc_vehicleWeight;
	_gatherWeight = M_CONFIG(getNumber,"LifeCfgVehicles",(typeOf _vehicle),"gatherWeight");
	if (_gatherWeight isEqualTo -1) exitWith {};
	_itemval = round(_gatherWeight/_itemW);
	
	_sum = [_item,_itemval,_weight select 1,_weight select 0] call life_fnc_calWeightDiff;
	if(_sum < 1) exitWith {[localize "STR_NOTF_DeviceFull","RED",10] spawn life_fnc_notification_system;};
	_itemWeight = _itemW * _sum;
	if(_itemIndex isEqualto -1) then {
		_items pushBack [_item,_sum];
	} else {
		_val = _items select _itemIndex select 1;
		_items set[_itemIndex,[_item,_val + _sum]];
	};
	
	private _text= format["%1 %2",_sum, (localize _name)];
	private _minetext = M_CONFIG(getText,"LifeCfgVehicles",(typeof _vehicle),"Text");
	[format[localize _minetext ,_text],"BLUE",5] spawn life_fnc_notification_system;
	_vehicle setVariable["Trunk",[_items,_space + _itemWeight],true];
	_weight = [_vehicle] call life_fnc_vehicleWeight;
	_sum = [_item,_itemval,_weight select 1,_weight select 0] call life_fnc_calWeightDiff; //Get a sum base of the remaining weight.. 
	if(local _vehicle) then {
		_vehicle setFuel (fuel _vehicle)-0.045;
	} else {
		[[_vehicle,(fuel _vehicle)-0.045],"life_fnc_setFuel",_vehicle,false] spawn life_fnc_MP;
	};
	if(_sum < 1) exitWith {[localize "STR_NOTF_DeviceFull","RED",10] spawn life_fnc_notification_system;};
	sleep 2;
};

_vehicle setVariable["mining",nil,true];