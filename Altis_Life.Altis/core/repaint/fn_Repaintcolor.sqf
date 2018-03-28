#include "..\..\script_macros.hpp"
/*
File: fn_Repaintcolor.sqf
Author: MooN-Gaming modified by moeck


Description: Opens the display to recolor the vehicle


*/
#define Repaint 37457
private["_index","_veh","_c_arr","_id","_colorcost","_i","_text","_Repaint"];
if(!isNull (findDisplay 2300)) then {
_index = lbCurSel 2302;
lbClear 2303;
_veh = lbData[2302,_index];
_id = [];
_c_arr = M_CONFIG(getArray,"LifeCfgVehicles",_veh,"textures");
_colorcost = 100;
_i = 0;
{
    _text = (_x select 0);
    _x params ["_texture"];
    private _toShow = [_x] call life_fnc_levelCheck;
    if (_toShow) then {
		lbAdd[2303,format["%1",_text]];
		lbSetValue [2303,(lbSize 2303)-1,_i];
    };
	_i = _i +1;
} foreach _c_arr;

lbSetCurSel [2303,0];
if((lbSize 2303)-1 != -1) then
{
 ctrlShow[2303,true];
 _Repaint ctrlEnable true;
}
 else
{
 ctrlShow[2303,false];
 _Repaint ctrlEnable false;
};


};
_haha = typeOf _x;
_vehicles lbSetData [(lbSize _vehicles)-1,_haha];