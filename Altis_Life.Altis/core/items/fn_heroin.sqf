/*
	@Version: 1.0
	@Author: Sebi, lostofparadise.de
	@Edited: 15.09.2014
	@Info: Bevor Ihr es klaut, fragt bitte bei uns nach. Vielen Dank.
*/
closeDialog 0;
life_pickAxeAllowed = false;
life_action_gather = true;
life_action_inUse = true;
sleep 1;
_smoke = "SmokeShellRed" createVehicle position player;
if (vehicle player != player) then {
	_smoke attachTo [vehicle player, [0,-1,0]];
} else {
	_smoke attachTo [player, [0,0,1]];
};
//h/int "Heroin FTW!";
["Heroin FTW!","PINK",5] spawn life_fnc_notification_system;
player setDamage 0.15;

"dynamicBlur" ppEffectEnable true; // enables ppeffect
"dynamicBlur" ppEffectAdjust [20]; // enables normal vision
"dynamicBlur" ppEffectCommit 15; // time it takes to normal
enableCamShake true;	 // enables camera shake
addCamShake [10, 45, 10];	// sets shakevalues
20 fadeSound 1;	 //fades the sound back to normal





"dynamicBlur" ppEffectEnable true; // enables ppeffect
"dynamicBlur" ppEffectAdjust [20]; // intensity of blur
"dynamicBlur" ppEffectCommit 10; // time till vision is fully blurred
enableCamShake true;	 // enables camera shake
addCamShake [10, 45, 10];	// sets shakevalues
5 fadeSound 0.1;	 // fades the sound to 10% in 5 seconds


sleep 50;
//h/int "Drogen nix gut!";
["Drogen nix gut!","PINK",5] spawn life_fnc_notification_system;
"dynamicBlur" ppEffectEnable true; // enables ppeffect
"dynamicBlur" ppEffectAdjust [0]; // enables normal vision
"dynamicBlur" ppEffectCommit 15; // time it takes to normal
resetCamShake; // resets the shake
20 fadeSound 1;	 //fades the sound back to normal
sleep 10;
life_action_gather = false;
life_action_inUse = false;
life_pickAxeAllowed = true;