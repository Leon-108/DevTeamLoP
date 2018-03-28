#include "..\..\script_macros.hpp"
/*
	File: fn_removeItem.sqf
	Author: Bryan "Tonic" Boardwine
	
	Description:
	Removes the selected item & amount to remove from the players
	virtual inventory.
*/
private["_data","_value","_obj"];
disableSerialization;
_data = lbData[2005,(lbCurSel 2005)];
_value = ctrlText 2010;

if(_data isEqualto "") exitWith {[localize "STR_NOTF_didNotSelectToRemove","RED",10] spawn life_fnc_notification_system;};
if(!([_value] call TON_fnc_isnumber)) exitWith {[localize "STR_NOTF_notNumberFormat","RED",10] spawn life_fnc_notification_system;};
if(parseNumber(_value) <= 0) exitWith {[localize "STR_NOTF_enterAmountRemove","RED",10] spawn life_fnc_notification_system;};
if (ITEM_ILLEGAL(_data) isEqualTo 1 && ([west,visiblePosition player,100] call life_fnc_nearUnits)) exitWith {
	[localize "STR_NOTF_illegalItemCannotDispose","RED",10] spawn life_fnc_notification_system;
	closeDialog 0;
};
if !(isNull objectParent player) exitWith {[localize "STR_NOTF_cannotRemoveInVeh","RED",10] spawn life_fnc_notification_system;};
if(!([false,_data,(parseNumber _value)] call life_fnc_handleInv)) exitWith {[localize "STR_NOTF_couldNotRemoveThatMuch","RED",10] spawn life_fnc_notification_system;};

[format[localize "STR_NOTF_removedFromInventory",(parseNumber _value), (localize ITEM_NAME(_data))],"GREEN",5] spawn life_fnc_notification_system;
	
[] call life_fnc_p_updateMenu;