#include "..\..\script_macros.hpp"
/*
File: fn_RepaintMenu.sqf
Author: MooN-Gaming modified by moeck


Description: What could it do bro?!


*/
private["_display","_vehicles","_objects","_color","_haha","_pic","_text","_owners","_price"];
createDialog "Life_vehicle_repaint";
disableSerialization;
if(!isNull (findDisplay 2300)) then {
	_display = findDisplay 2300;
	_vehicles = _display displayCtrl 2302;


	_objects = nearestObjects[getPos (_this select 0),["Car","Air","Ship"],20];
	//_objects = nearestObject [position player, "LandVehicle"];
	_xx = _objects select 0;


	//List vehicles
	{
 		if(vehicle player != _x) then {
			_colorArray = M_CONFIG(getArray,"LifeCfgVehicles",(typeOf _xx),"textures");
			_color = (_colorArray select (_xx getVariable "Life_VEH_color")) select 0;
			_pic = getText(configFile >> "CfgVehicles" >> typeOf _x >> "picture"); 
			_text = format["(%1)",_color];
			_haha = typeOf _x;
			_price = 20000;
			if (side player isEqualto civilian) then {
				_price = M_CONFIG(getNumber,"LifeCfgVehicles",_haha,"repaintprice");
				if(_price isEqualto -1) then {_price = 10000;};
			}; 
			if(_text isEqualto "()") then {
				_text = "";
			}; 
			if (cheaprepaint) then {_price = 100;};
			_vehicles lbAdd format ["%1 || %2 || $%3", getText(configFile >> "cfgVehicles" >> typeOf _x >> "DisplayName"), _text,[_price] call life_fnc_numberText]; 
			_vehicles lbSetPicture [(lbSize _vehicles)-1,_pic]; 
			_vehicles lbSetData [(lbSize _vehicles)-1,_haha];
		}; 
	} foreach _objects;
};