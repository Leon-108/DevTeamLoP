#define ctrlSelData(ctrl) (lbData[##ctrl,(lbCurSel ##ctrl)])
/*
	File: fn_safeTake.sqf
	Author: Bryan "Tonic" Boardwine
	
	Description:
	Gateway to fn_vehTakeItem.sqf but for safe(s).
*/
private["_ctrl","_num","_safeInfo"];
disableSerialization;

if((lbCurSel 3502) isEqualto -1) exitWith {
	//h/int localize "STR_Civ_SelectItem";
	[localize "STR_Civ_SelectItem","RED",10] spawn life_fnc_notification_system;
};
_ctrl = ctrlSelData(3502);
_num = ctrlText 3505;
_safeInfo = life_safeObj getVariable["safe",0];

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
if(_num > _safeInfo) exitWith {
	//h/int format[localize "STR_Civ_IsntEnoughGold",_num];
	[format[localize "STR_Civ_IsntEnoughGold",_num],"RED",10] spawn life_fnc_notification_system;
};

//Secondary checks
_num = [_ctrl,_num,life_carryWeight,life_maxWeight] call life_fnc_calWeightDiff;
if(_num isEqualto 0) exitWith {
	//h/int localize "STR_NOTF_InvFull"
	[localize "STR_NOTF_InvFull","RED",10] spawn life_fnc_notification_system;
};


//Take it
if(!([true,_ctrl,_num] call life_fnc_handleInv)) exitWith {
	//h/int localize "STR_NOTF_CouldntAdd";
	[localize "STR_NOTF_CouldntAdd","RED",10] spawn life_fnc_notification_system;
};
life_safeObj setVariable["safe",_safeInfo - _num,TRUE];
[life_safeObj] call life_fnc_safeInventory;