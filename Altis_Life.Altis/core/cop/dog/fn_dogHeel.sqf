/*
	File: fn_dogHeel.sqf
	Author: Slice of Life
	Rewrite of |TG-355th| Yink's dog PoC
	
	Description:
	Animation
*/
private ["_unit","_dog"];
_unit 	= _this select 0;
_dog 	= _unit getvariable "dog";

["dog_one", _dog] spawn life_fnc_dogPlaySound;
["Rex, Beifuß!","PINK",5] spawn life_fnc_notification_system;

_unit setvariable ["follow",'false'];

_dog domove [(getpos _unit) select 0,((getpos _unit) select 1) - 1, 0];
_unit setvariable ["order","active"];
_unit setvariable ["step","go"];