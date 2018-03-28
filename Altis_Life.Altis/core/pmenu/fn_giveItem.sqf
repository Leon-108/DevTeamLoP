#include "..\..\script_macros.hpp"
/*
	File: fn_giveItem.sqf
	Author: Bryan "Tonic" Boardwine
	
	Description:
	Gives the selected item & amount to the selected player and
	removes the item & amount of it from the players virtual
	inventory.
*/
private["_unit","_val"];
_val = ctrlText 2010;
ctrlShow[2002,false];
if((lbCurSel 2023) isEqualto -1) exitWith {
	//h/int "No one was selected!";
	[localize "STR_NOTF_noOneSelected","RED",10] spawn life_fnc_notification_system;
	ctrlShow[2002,true];
};
_unit = lbData [2023,lbCurSel 2023];
_unit = call compile format["%1",_unit];
if((lbCurSel 2005) isEqualto -1) exitWith {
	//h/int "You didn't select an item you wanted to give.";
	[localize "STR_NOTF_didNotSelectItemToGive","RED",10] spawn life_fnc_notification_system;
	ctrlShow[2002,true];
};
_item = lbData [2005,(lbCurSel 2005)];
if(isNil "_unit") exitWith {ctrlShow[2002,true];};
if(_unit isEqualto player) exitWith {ctrlShow[2002,true];};
if(isNull _unit) exitWith {ctrlShow[2002,true];};

//A series of checks *ugh*
if(!([_val] call TON_fnc_isnumber)) exitWith {[localize "STR_NOTF_notNumberFormat","RED",10] spawn life_fnc_notification_system;ctrlShow[2002,true];};
if(parseNumber(_val) <= 0) exitWith {[localize "STR_NOTF_enterAmountGive","RED",10] spawn life_fnc_notification_system;ctrlShow[2002,true];};
if(isNil "_unit") exitWith {ctrlShow[2001,true];[localize "STR_NOTF_notWithinRange","RED",10] spawn life_fnc_notification_system;};
if(!([false,_item,(parseNumber _val)] call life_fnc_handleInv)) exitWith {[localize "STR_NOTF_couldNotGive","RED",10] spawn life_fnc_notification_system;ctrlShow[2002,true];};
[[_unit,_val,_item,player],"life_fnc_receiveItem",_unit,false] spawn life_fnc_MP;
_type = M_CONFIG(getText,"VirtualItems",_item,"displayName");
[format[localize "STR_NOTF_youGaveItem",_unit getVariable["realname",name _unit],_val,(localize _type)],"PINK",5] spawn life_fnc_notification_system;
[] call life_fnc_p_updateMenu;

ctrlShow[2002,true];