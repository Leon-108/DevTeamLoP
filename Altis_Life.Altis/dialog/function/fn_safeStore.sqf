#define ctrlSelData(ctrl) (lbData[##ctrl,(lbCurSel ##ctrl)])
/*
	File: fn_safeStore.sqf
	Author: Bryan "Tonic" Boardwine

	Description:
	Gateway copy of fn_vehStoreItem but designed for the safe.
*/
private["_ctrl","_num"];
disableSerialization;
_ctrl = ctrlSelData(3503);
_num = ctrlText 3506;

//Error checks
if(!([_num] call TON_fnc_isnumber)) exitWith {
	//h/int localize "STR_MISC_WrongNumFormat";
	[localize "STR_MISC_WrongNumFormat","RED",10] spawn life_fnc_notification_system;
};
_num = parseNumber(_num);
if(_num < 1) exitWith {
	//h/int localize "STR_Cop_VaultUnder1";
	[localize "STR_Cop_VaultUnder1","RED",10] spawn life_fnc_notification_system;
};
if(_ctrl != "goldbar") exitWith {
	//h/int localize "STR_Cop_OnlyGold"
	[localize "STR_Cop_OnlyGold","RED",10] spawn life_fnc_notification_system;
};
if(_num > life_inv_goldbar) exitWith {
	//h/int format[localize "STR_Cop_NotEnoughGold",_num];
	[format[localize "STR_Cop_NotEnoughGold",_num],"RED",10] spawn life_fnc_notification_system;
};

//Store it.
if(!([false,_ctrl,_num] call life_fnc_handleInv)) exitWith {
	//h/int localize "STR_Cop_CantRemove";
	[localize "STR_Cop_CantRemove","RED",10] spawn life_fnc_notification_system;
};
_safeInfo = life_safeObj getVariable["safe",0];
life_safeObj setVariable["safe",_safeInfo + _num,true];

[life_safeObj] call life_fnc_safeInventory;