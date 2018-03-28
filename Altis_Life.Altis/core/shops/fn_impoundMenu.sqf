#include "..\..\script_macros.hpp"
/*
	File: fn_impoundMenu.sqf
	Author: Bryan "Tonic" Boardwine
	
	Description:
	Lists impounded vehicles.
	DUE TO BE REWROTE IN NEW SYSTEM
*/
private ["_vehicles","_control"];
disableSerialization;
_vehicles = param [0,[],[[]]];
_type =  param [1,"",[""]]];

ctrlShow[2803,false];
ctrlShow[2830,false];
waitUntil {!isNull (findDisplay 2800)};

if (count _vehicles isEqualTo 0) exitWith {
    ctrlSetText[2811,localize "STR_Garage_NoVehicles"];
};

_control = CONTROL(2800,2802);
lbClear _control;

{
    _vehicleInfo = [(_x select 2)] call life_fnc_fetchVehInfo;
    _control lbAdd (_vehicleInfo select 3);
    _tmp = [(_x select 2),(_x select 8),_type];
    _tmp = str(_tmp);
    _control lbSetData [(lbSize _control)-1,_tmp];
    _control lbSetPicture [(lbSize _control)-1,(_vehicleInfo select 2)];
    _control lbSetValue [(lbSize _control)-1,(_x select 0)];
} forEach _vehicles;

ctrlShow[2810,false];
ctrlShow[2811,false];



/*
private["_display","_cars","_name","_pic","_color","_text","_price"];

if(!dialog) then
{
	if(!(createDialog "Life_impound_menu")) exitWith {};
	life_impound_yard = _this select 3;
};
disableSerialization;

_display = findDisplay 2800;
if(isNull _display) exitWith {};
_cars = _display displayCtrl 2801;
lbClear _cars;

for "_i" from 0 to (count life_2vehicles)-1 do
{
	_veh = life_2vehicles select _i;
	if(_veh distance impound_obj < 50) then
	{
		_price = [_veh] call life_fnc_impoundPrice;
		switch (true) do
		{
			case (_veh isKindOf "Car") : {_price = _price + 100;};
			case (_veh isKindOf "Air") : {_price = _price + 650;};
			case (_veh isKindOf "Ship") : {_price = _price + 50;};
		};
	
		if(_price > CASH) then
		{
			_price = _price + 200;
		};
		_color = [(typeOf _veh),(_veh getVariable "Life_VEH_color")] call life_fnc_vehicleColorStr;
		_text = format["(%1)",_color];
		if(_text isEqualto "()") then
		{
			_text = "";
		};
		
		_name = getText(configFile >> "CfgVehicles" >> (typeOf _veh) >> "displayName");
		_pic = getText(configFile >> "CfgVehicles" >> (typeOf _veh) >> "picture");
		_cars lbAdd format["%1 %2 - Cost: $%3",_name,_text,[_price] call life_fnc_numberText];
		_cars lbSetPicture [(lbSize _cars)-1,_pic];
		_cars lbSetData [(lbSize _cars)-1,str(_i)];
		_cars lbSetValue [(lbSize _cars)-1,_price];
	};
};
*/