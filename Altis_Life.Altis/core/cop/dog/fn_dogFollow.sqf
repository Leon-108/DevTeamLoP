/*
	File: fn_dogFollow.sqf
	Author: Slice of Life
	Rewrite of |TG-355th| Yink's dog PoC
	
	Description:
	Tell the dog to follow its owner
*/
private ["_unit","_dog"];
_unit 	= _this select 0;
_dog	= _unit getvariable "dog";

["dog_one", _dog] spawn life_fnc_dogPlaySound;
["Rex, folg mir!","PINK",5] spawn life_fnc_notification_system;

_unit setvariable ["order","active"];
_unit setvariable ["step","go"];
_unit setvariable ["follow",'true'];

while {(_unit getvariable "follow") isEqualTo 'true'} do 
{
	sleep 0.5;
	if ((_dog distance _unit) < 2) then 
	{
		_dog domove (getpos _dog);
	} 
	else 
	{
		_dog domove (getpos _unit);
	};
	sleep 1;
};