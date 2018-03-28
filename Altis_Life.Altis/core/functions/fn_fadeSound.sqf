/*
File: fn_fadeSound.sqf
Auhtor: Michael Francis

Description:
Fades out sound.
*/
if (life_fadeSound isEqualTo 0) exitWith
{
	1 fadeSound 0.5; // Faded to 60%
	//t/itleText ["Ohrstöpsel 50% Reduzierung", "PLAIN"];
	["Ohrstöpsel 50% Reduzierung","YELLOW",2] spawn life_fnc_notification_system;
	life_fadeSound = 50;
};
if (life_fadeSound isEqualTo 50) exitWith
{
	1 fadeSound 0.1; // Faded to 10%
	//t/itleText ["Ohrstöpsel 90% Reduzierung", "PLAIN"];
	["Ohrstöpsel 90% Reduzierung","YELLOW",2] spawn life_fnc_notification_system;
	life_fadeSound = 20;
};
if (life_fadeSound isEqualTo 20) exitWith
{
	1 fadeSound 0.01; // Faded to 1%
	//t/itleText ["Ohrstöpsel 99% Reduzierung", "PLAIN"];
	["Ohrstöpsel 99% Reduzierung","GREEN",2] spawn life_fnc_notification_system;
	life_fadeSound = 1;
};
if (life_fadeSound isEqualTo 1) exitWith
{
	1 fadeSound 1; // Faded to 100%
	//t/itleText ["Ohrstöpsel Aus", "PLAIN"];
	["Ohrstöpsel Aus","RED",2] spawn life_fnc_notification_system;
	life_fadeSound = 0;
};
