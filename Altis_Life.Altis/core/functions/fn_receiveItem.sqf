#include "..\..\script_macros.hpp"
/*
	File: fn_receiveItem.sqf
	Author: Bryan "Tonic" Boardwine
	
	Description:
	Receive an item from a player.
*/
params [
	"_unit",
	"_val",
	"_item",
	"_from"
];
if !(_unit isEqualTo player) exitWith {};
private _diff = [_item,(parseNumber _val),life_carryWeight,life_maxWeight] call life_fnc_calWeightDiff;

if(_diff != (parseNumber _val)) then{
	if(([true,_item,_diff] call life_fnc_handleInv)) then {
		[format[localize "STR_MISC_TooMuch_3",_from getVariable["realname",name _from],_val,_diff,((parseNumber _val) - _diff)],"RED",10] spawn life_fnc_notification_system;
		[[_from,_item,str((parseNumber _val) - _diff),_unit],"life_fnc_giveDiff",_from,false] spawn life_fnc_MP;
	} else {
		[[_from,_item,_val,_unit,false],"life_fnc_giveDiff",_from,false] spawn life_fnc_MP;
	};
} else {
	if(([true,_item,(parseNumber _val)] call life_fnc_handleInv)) then {
		private _type = M_CONFIG(getText,"VirtualItems",_item,"displayName");
		[format[localize "STR_NOTF_GivenItem",_from getVariable["realname",name _from],_val,(localize _type)],"PINK",5] spawn life_fnc_notification_system;
	} else {
		[[_from,_item,_val,_unit,false],"life_fnc_giveDiff",_from,false] spawn life_fnc_MP;
	};
};