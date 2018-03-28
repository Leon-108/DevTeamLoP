/*

	Player clicked arrest/ok

*/

private ["_time"];

if(playerSide != west) exitWith {};
if(isNil "life_pInact_curTarget") exitWith {
	//h/int "Invalid destination."
	["Invalid destination.","RED",10] spawn life_fnc_notification_system;
};

//Get minutes
_time = ctrlText 1400;


if(! ([_time] call TON_fnc_isnumber)) exitWith
{
	//h/int "You have to enter a number.";
	["You have to enter a number.","RED",10] spawn life_fnc_notification_system;
};

_time = parseNumber _time; //requested number
_time = round _time;

if(_time < 5 || _time > 60) exitWith { 
	//h/int "Zwischen 5-60 Minuten."; 
	["Zwischen 5-60 Minuten.","RED",10] spawn life_fnc_notification_system;
};

closeDialog 0; 
[life_pInact_curTarget, _time] call life_fnc_arrestAction;