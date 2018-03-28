/*
	File: fn_dogHide.sqf
	Author: Slice of Life
	Rewrite of |TG-355th| Yink's dog PoC
	
	Description:
	Hides/removes the dog
*/
private ["_unit","_dog"];
_unit 	= _this select 0;
_dog 	= _unit getvariable "dog";

["Versteck dich, Rex!","PINK",5] spawn life_fnc_notification_system;

_unit setvariable ["follow",'false'];
_unit setvariable ["order","nil"];
_unit setvariable ["step","go"];
_unit setvariable ["action","false"];

sleep 3;
deleteVehicle _dog;