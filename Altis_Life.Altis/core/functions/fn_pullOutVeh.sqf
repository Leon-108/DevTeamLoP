/*
	File: fn_pullOutVeh.sqf
	Author: Bryan "Tonic" Boardwine
*/
if (playerSide isEqualTo west || (isNull objectParent player)) exitWith {};
if(player getVariable "Re-strained") then {
	detach player;
    player setVariable ["Escorting",false,true];
    player setVariable ["transporting",false,true];
    life_disable_getOut = false;
    player action ["Eject", vehicle player];
	life_disable_getIn = true;

} else {
	player action ["Eject", vehicle player];
};
[localize "STR_NOTF_PulledOut","PINK",5] spawn life_fnc_notification_system;
titleFadeOut 4;