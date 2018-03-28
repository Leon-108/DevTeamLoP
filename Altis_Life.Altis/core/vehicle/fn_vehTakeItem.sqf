#include "..\..\script_macros.hpp"
#define ctrlSelData(ctrl) (lbData[##ctrl,(lbCurSel ##ctrl)])
/*
	File: fn_vehTakeItem.sqf
	Author: Bryan "Tonic" Boardwine
	
	Description:
	Used in the vehicle trunk menu, takes the selected item and puts it in the players virtual inventory
	if the player has room.
*/
private["_ctrl","_num","_index","_data","_old","_value","_weight","_diff"];
disableSerialization;
if(isNull life_trunk_vehicle OR !alive life_trunk_vehicle) exitWith {
	//h/int localize "STR_MISC_VehDoesntExist"
	[localize "STR_MISC_VehDoesntExist","RED",10] spawn life_fnc_notification_system;
};
if(!alive player) exitwith {closeDialog 0;};
if ((life_trunk_vehicle getVariable ["trunk_in_use_by",player]) != player) exitWith {  closeDialog 0; [localize "STR_MISC_VehInvUse","RED",10] spawn life_fnc_notification_system; };

if((lbCurSel 3502) isEqualto -1) exitWith {
	//h/int localize "STR_Global_NoSelection";
	[localize "STR_Global_NoSelection","RED",10] spawn life_fnc_notification_system;
};
_ctrl = ctrlSelData(3502);
_num = ctrlText 3505;
if(!([_num] call TON_fnc_isnumber)) exitWith {[localize "STR_MISC_WrongNumFormat","RED",10] spawn life_fnc_notification_system;};
_num = parseNumber(_num);
if(_num < 1) exitWith {[localize "STR_MISC_Under1","RED",10] spawn life_fnc_notification_system;};

_index = [_ctrl,((life_trunk_vehicle getVariable "Trunk") select 0)] call TON_fnc_index;
_data = (life_trunk_vehicle getVariable "Trunk") select 0;
_old = life_trunk_vehicle getVariable "Trunk";
if(_index isEqualto -1) exitWith {};
_value = _data select _index select 1;
if(_num > _value) exitWith {[localize "STR_MISC_NotEnough","RED",10] spawn life_fnc_notification_system;};
_num = [_ctrl,_num,life_carryWeight,life_maxWeight] call life_fnc_calWeightDiff;
if(_num isEqualto 0) exitWith {[localize "STR_NOTF_InvFull","RED",10] spawn life_fnc_notification_system;};
_weight = ([_ctrl] call life_fnc_itemWeight) * _num;
if(_ctrl isEqualto "money") then {
	if(_num isEqualto _value) then {
		_data set[_index,-1];
		_data = _data - [-1];
	} else {
		_data set[_index,[_ctrl,(_value - _num)]];
	};
	
	CASH = CASH + _num;
	[0] call SOCK_fnc_updatePartial;
	life_trunk_vehicle setVariable["Trunk",[_data,(_old select 1) - _weight],true];
	[life_trunk_vehicle] call life_fnc_vehInventory;
} else {
	if([true,_ctrl,_num] call life_fnc_handleInv) then {
		if(_num isEqualto _value) then {
			_data deleteAt _index;
		} else {
			_data set[_index,[_ctrl,(_value - _num)]];
		};
		life_trunk_vehicle setVariable["Trunk",[_data,(_old select 1) - _weight],true];
		[life_trunk_vehicle] call life_fnc_vehInventory;
	} else {
		[localize "STR_NOTF_InvFull","RED",10] spawn life_fnc_notification_system;
	};
};