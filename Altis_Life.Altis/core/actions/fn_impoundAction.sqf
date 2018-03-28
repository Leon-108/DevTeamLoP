#include "..\..\script_macros.hpp"
/*
	File: fn_impoundAction.sqf
	Author: Bryan "Tonic" Boardwine
	
	Description:
	Impounds the vehicle
*/
private["_vehicle","_type","_time","_price","_vehicleData","_upp","_ui","_progress","_pgText","_cP","_jail","_jail_price","_vehicleList","_classname"];
params [
	["_vehicle",objNull,[objNull]],
	["_jail",0,[0]]
];
_filters = ["Car","Air","Ship"];
private _jail_price = 0;
private _price = 0;
private _type = typeOf _vehicle;

if (!((KINDOF_ARRAY(_vehicle,_filters)))) exitWith {};
if(player distance _vehicle > 10) exitWith {};

_vehicleData = _vehicle getVariable["vehicle_info_owners",[]];
if(count _vehicleData isEqualto 0) exitWith {deleteVehicle _vehicle}; //Bad vehicle.
_vehicleName = FETCH_CONFIG2(getText,"CfgVehicles",(typeOf _vehicle),"displayName");
_price = M_CONFIG(getNumber,"LifeCfgVehicles",(typeOf _vehicle),"price");
if (_jail isEqualTo 1) then {
	[[0,"STR_NOTF_BeingImpounded",true,[(_vehicleData select 0) select 1,_vehicleName]],"life_fnc_broadcast",true,false] spawn life_fnc_MP;
} else {
	_who = call {
		if(playerSide isEqualTo west) exitWith {"PPD"};
		if(playerSide isEqualTo independent) exitWith {"PRS"};
	};
	[[0,"STR_NOTF_BeingTowedaway",true,[(_vehicleData select 0) select 1,_vehicleName,_who]],"life_fnc_broadcast",true,false] spawn life_fnc_MP;
};
life_action_inUse = true;
_upp = localize "STR_NOTF_Impounding";
//Setup our progress bar.
disableSerialization;
"progressBar" cutRsc ["life_progress","PLAIN"];
_ui = uiNameSpace getVariable "life_progress";
_progress = _ui displayCtrl 38201;
_pgText = _ui displayCtrl 38202;
_pgText ctrlSetText format["%2 (1%1)...","%",_upp];
_progress progressSetPosition 0.01;
_cP = 0.01;

for "_i" from 0 to 1 step 0 do {
	sleep 0.09;
	_cP = _cP + 0.01;
	_progress progressSetPosition _cP;
	_pgText ctrlSetText format["%3 (%1%2)...",round(_cP * 100),"%",_upp];
	if(_cP >= 1) exitWith {};
	if(player distance _vehicle > 10) exitWith {};
	if(!alive player) exitWith {};
};
"progressBar" cutText ["","PLAIN"];
	
	if(player distance _vehicle > 10) exitWith {
		[localize "STR_NOTF_ImpoundingCancelled","RED",10] spawn life_fnc_notification_system;
		life_action_inUse = false;
	};
if(!alive player) exitWith {life_action_inUse = false;};
if((count crew _vehicle) isEqualTo 0) then {
	if (!(KINDOF_ARRAY(_vehicle,_filters))) exitWith {life_action_inUse = false;};
	_type = FETCH_CONFIG2(getText,"CfgVehicles",(typeOf _vehicle),"displayName");
	_price = call {
		if (_vehicle isKindOf "Car") exitWith {call life_impound_car};
		if (_vehicle isKindOf "Ship") exitWith {call life_impound_boat};
		if (_vehicle isKindOf "Air") exitWith {call life_impound_air};
	};
		
	life_impound_inuse = true;
	_impoundstring = "STR_NOTF_tow_away";
	_impoundedstring = "STR_NOTF_Hastowedaway";
	if (_jail isEqualTo 1) then {
		_impoundMultiplier = LIFE_SETTINGS(getNumber,"vehicle_cop_impound_multiplier");
		_newprice = M_CONFIG(getNumber,"LifeCfgVehicles",(typeOf _vehicle),"price");
		_jail_price = _newprice * _impoundMultiplier;
		_impoundstring = "STR_NOTF_Impounded";
		_impoundedstring = "STR_NOTF_HasImpounded";
	};
	[[_vehicle,true,player,_jail,_jail_price],"TON_fnc_vehicleStore",false,false] spawn life_fnc_MP;
	waitUntil {!life_impound_inuse};
	[[0,_impoundedstring,true,[profileName,(_vehicleData select 0) select 1,_vehicleName]],"life_fnc_broadcast",true,false] spawn life_fnc_MP;
	
	if (_vehicle in life_2vehicles) then {
		[format [localize "STR_NOTF_OwnImpounded",[_price] call life_fnc_numberText,_type],"RED",5] spawn life_fnc_notification_system;
		BANK = BANK - _price;
	} else {
		[format [localize _impoundstring,_type,[_price] call life_fnc_numberText],"GREEN",5] spawn life_fnc_notification_system;
		[format[localize _impoundstring,_type,_price],"GREEN",5] spawn life_fnc_notification_system;
		BANK = BANK + _price;
	};
} else {
	[localize "STR_NOTF_ImpoundingCancelled","RED",10] spawn life_fnc_notification_system;
};
life_action_inUse = false;