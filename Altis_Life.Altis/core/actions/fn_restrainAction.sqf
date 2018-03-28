/*
	File: fn_restrainAction.sqf
	Author: Bryan "Tonic" Boardwine
	
	Description:
	Retrains the target.
*/
private["_unit"];
_unit = cursorTarget;
if(isNull _unit) exitWith {}; //Not valid
if((_unit getVariable "Re-strained")) exitWith {};
if(side _unit isEqualTo west) exitWith {};
if(player isEqualTo _unit) exitWith {};
if(!isPlayer _unit) exitWith {};
if((_unit getVariable ["admin",0]) > 0) exitWith{};
//Broadcast!
player say3D "cuff";

_unit setVariable["Re-strained",true,true];
[[player], "life_fnc_restrain", _unit, false] spawn life_fnc_MP;
[[0,"STR_NOTF_Re-strained",true,[_unit getVariable["realname", name _unit], profileName]],"life_fnc_broadcast",civilian,false] spawn life_fnc_MP;
[[0,"STR_NOTF_Re-strained",true,[_unit getVariable["realname", name _unit], profileName]],"life_fnc_broadcast",west,false] spawn life_fnc_MP;
[[0,"STR_NOTF_Re-strained",true,[_unit getVariable["realname", name _unit], profileName]],"life_fnc_broadcast",independent,false] spawn life_fnc_MP;