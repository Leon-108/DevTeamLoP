#include "..\..\script_macros.hpp"
#define ctrlSelData(ctrl) (lbData[##ctrl,(lbCurSel ##ctrl)])
/*
	File: fn_vehStoreItem.sqf
	Author: Bryan "Tonic" Boardwine
	
	Description:
	Used in the vehicle trunk menu, stores the selected item and puts it in the vehicles virtual inventory
	if the vehicle has room for the item.
*/
private["_ctrl","_num","_totalWeight","_itemWeight","_veh_data","_inv","_index","_val","_Truck","_FuelTrucks","_FuelStuff"];
disableSerialization;
if ((life_trunk_vehicle getVariable ["trunk_in_use_by",player]) != player) exitWith { closeDialog 0; [localize "STR_MISC_VehInvUse","RED",10] spawn life_fnc_notification_system; };

_ctrl = ctrlSelData(3503);
_num = ctrlText 3506;
if(!([_num] call TON_fnc_isnumber)) exitWith {[localize "STR_MISC_WrongNumFormat","RED",10] spawn life_fnc_notification_system;};
_num = parseNumber(_num);
if(_num < 1) exitWith {[localize "STR_MISC_Under1","RED",10] spawn life_fnc_notification_system;};

if(life_trunk_vehicle isKindOf "House_F") then {
	_mWeight = 0;
	{_mWeight = _mWeight + ([(typeOf _x)] call life_fnc_vehicleWeightCfg);} foreach (life_trunk_vehicle getVariable["containers",[]]);
	_totalWeight = [_mWeight,(life_trunk_vehicle getVariable["Trunk",[[],0]]) select 1];
} else {
	_totalWeight = [life_trunk_vehicle] call life_fnc_vehicleWeight;
};
_itemWeight = ([_ctrl] call life_fnc_itemWeight) * _num;
_veh_data = life_trunk_vehicle getVariable ["Trunk",[[],0]];
_inv = _veh_data select 0;

if(_ctrl isEqualto "goldbar" && {(life_trunk_vehicle isKindOf "Air")}) exitWith {
	["You cannot store that in anything but a land vehicle!","RED",10] spawn life_fnc_notification_system;
};
_Truck = TypeOf life_trunk_vehicle;
_fueltruck = M_CONFIG(getNumber,"LifeCfgVehicles",_Truck,"storeLiquid");
if (life_trunk_vehicle isKindOf "House_F") then {_fueltruck = -1};
if ((ITEM_LIQUID(_ctrl) isEqualTo 1) && (_fueltruck isEqualTo 0)) exitWith {
	["BISSU IRRE? Dat Zeug wuerde ueberall auslaufen! (Du kannst Flüssigkeiten NUR in einen Tanklaster fuellen!) Pillen kann man nicht einlagern!","RED",10] spawn life_fnc_notification_system;
};
if ((ITEM_LIQUID(_ctrl) isEqualTo 0) && (_fueltruck isEqualTo 1)) exitWith {
	["Ey Jung! Dat passt nich durch den Stutzen! (Du kannst nur Flüssigkeiten in einen Tanklaster fuellen!) Pillen kann man nicht einlagern!","RED",10] spawn life_fnc_notification_system;
};

if(_ctrl isEqualto "money") then {
	_index = [_ctrl,_inv] call TON_fnc_index;
	if(CASH < _num) exitWith {
		["Du hast nicht genuegend Geld um das Fahrzeug auszuparken!","RED",10] spawn life_fnc_notification_system;
	};
	if(_index isEqualto -1) then {
		_inv pushBack [_ctrl,_num];
	} else {
		_val = _inv select _index select 1;
		_inv set[_index,[_ctrl,_val + _num]];
	};
	
	CASH = CASH - _num;
	[0] call SOCK_fnc_updatePartial;
	life_trunk_vehicle setVariable["Trunk",[_inv,(_veh_data select 1) + _itemWeight],true];
	[life_trunk_vehicle] call life_fnc_vehInventory;
} else {
	if(((_totalWeight select 1) + _itemWeight) > (_totalWeight select 0)) exitWith {
				[localize "STR_NOTF_VehicleFullOrInsufCap","RED",10] spawn life_fnc_notification_system;
	};
	if(!([false,_ctrl,_num] call life_fnc_handleInv)) exitWith {
		[localize "STR_CouldNotRemoveItemsToPutInVeh","RED",10] spawn life_fnc_notification_system;
	};
	_index = [_ctrl,_inv] call TON_fnc_index;
	if(_index isEqualto -1) then {
		_inv pushBack [_ctrl,_num];
	} else {
		_val = _inv select _index select 1;
		_inv set[_index,[_ctrl,_val + _num]];
	};
	
	life_trunk_vehicle setVariable["Trunk",[_inv,(_veh_data select 1) + _itemWeight],true];
	[life_trunk_vehicle] call life_fnc_vehInventory;
};
