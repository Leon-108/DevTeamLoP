#include "..\..\script_macros.hpp"
/*
	File: fn_vehicleColorStr.sqf
	Author: Bryan "Tonic" Boardwine
	
	Description:
	Master configuration for color strings depending on their index location.
*/
params [
	["_vehicle","",[""]],
	["_index",-1,[0]]
];
private _color = "";
if (!isClass (missionConfigFile >> "LifeCfgVehicles" >> _classNameLife)) then {
    _classNameLife = "Default"; //Use Default class if it doesn't exist
    diag_log format ["%1: LifeCfgVehicles class doesn't exist",_className];
};
_color = ((M_CONFIG(getArray,"LifeCfgVehicles",_vehicle,"textures") select _index) select 0);
_color;