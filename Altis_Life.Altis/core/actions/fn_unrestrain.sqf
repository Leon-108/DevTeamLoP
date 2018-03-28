/*
	File: fn_unrestrain.sqf
*/
private["_unit","_oldgroup"];
_unit = [_this,0,ObjNull,[ObjNull]] call BIS_fnc_param;
if(isNull _unit OR !(_unit getVariable["Re-strained",FALSE])) exitWith {}; //Error check?

_unit setVariable["Re-strained",FALSE,TRUE];
_unit setVariable["Escorting",FALSE,TRUE];
_unit setVariable["transporting",FALSE,TRUE];
//_oldgroup = player getVariable ["oldGroup",group player];
//player setVariable ["oldGroup",nil];
//[player] joinSilent _oldgroup;
detach _unit;

[[0,"STR_NOTF_Unrestrain",true,[_unit getVariable["realname",name _unit], profileName]],"life_fnc_broadcast",civilian,FALSE] call life_fnc_MP;
[[0,"STR_NOTF_Unrestrain",true,[_unit getVariable["realname",name _unit], profileName]],"life_fnc_broadcast",west,FALSE] call life_fnc_MP;