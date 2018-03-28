/*
	File: fn_knockedOut.sqf
	Author: Bryan "Tonic" Boardwine
	
	Description:
	Starts and monitors the knocked out state.
*/
private["_target","_who","_obj"];
_target = [_this,0,ObjNull,[ObjNull]] call BIS_fnc_param;
_who = [_this,1,"",[""]] call BIS_fnc_param;
if(isNull _target) exitWith {};
if(_target != player) exitWith {};
if(_who isEqualTo "") exitWith {};

//t/itleText[format[localize "STR_Civ_KnockedOut",_who],"PLAIN"];
[format[localize "STR_Civ_KnockedOut",_who],"PINK",5] spawn life_fnc_notification_system;
player playMoveNow "Incapacitated";
_obj = "Land_ClutterCutter_small_F" createVehicle (getPosATL player);
_obj setPosATL (getPosATL player);
player say3D "schlag";
disableUserInput true;
player attachTo [_obj,[0,0,0]];
sleep 1;
disableUserInput false;
sleep 15;
player playMoveNow "amovppnemstpsraswrfldnon";
detach player;
deleteVehicle _obj;
player setVariable["robbed",FALSE,TRUE];