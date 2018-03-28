/*	
	File: fn_safeOpen.sqf
	Author: Bryan "Tonic" Boardwine
	
	Description:
	Opens the safe inventory menu.
*/
if(dialog) exitWith {}; //A dialog is already open.
life_safeObj = [_this,0,ObjNull,[ObjNull]] call BIS_fnc_param;
if(isNull life_safeObj) exitWith {};
if(playerSide != civilian) exitWith {};
if((life_safeObj getVariable["safe",-1]) < 1) exitWith {
	//h/int localize "STR_Civ_VaultEmpty";
	[localize "STR_Civ_VaultEmpty","RED",10] spawn life_fnc_notification_system;
};
if((life_safeObj getVariable["inUse",false])) exitWith {
	//h/int localize "STR_Civ_VaultInUse"
	[localize "STR_Civ_VaultInUse","RED",10] spawn life_fnc_notification_system;
};
if({side _x isEqualto west} count playableUnits < 7) exitWith {
	//h/int localize "STR_Civ_NotEnoughCops"
	[localize "STR_Civ_NotEnoughCops","RED",10] spawn life_fnc_notification_system;
};
if(!createDialog "Federal_Safe") exitWith {localize "STR_MISC_DialogError"};
disableSerialization;
ctrlSetText[3501,(localize "STR_Civ_SafeInv")];
[life_safeObj] call life_fnc_safeInventory;
life_safeObj setVariable["inUse",true,true];
[life_safeObj] spawn
{
	waitUntil {isNull (findDisplay 3500)};
	(_this select 0) setVariable["inUse",false,true];
};