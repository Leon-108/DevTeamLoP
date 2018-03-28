#include "..\..\script_macros.hpp"
/*
	File: fn_deathmessage.sqf
	Author: moeck (lostonparadise.de)
	
	Description:
	Random death messages
*/
params [
	["_mode","",[""]]
	,["_unitName","",[""]]
	,["_killerName","",[""]]
	,["_vehicle",ObjNull,[ObjNull]]
];
private _deathmsg = "";
private _vehicleName = "";
call {
	if (_mode isEqualTo "killed") exitWith {
		if (!isNull _vehicle) exitWith {
			_vehicleName = FETCH_CONFIG2(getText,"CfgVehicles",(typeOf _vehicle),"displayName");
			if (_vehicle isKindOf "Car") exitWith {
				_deathmsg = format ["STR_NOTF_Murdered_Car_%1",(round(random (1)))];
			};
			if (_vehicle isKindOf "Air") exitWith {
				_deathmsg = format ["STR_NOTF_Murdered_Air_%1",(round(random (2)))];
			};
			if (_vehicle isKindOf "Ship") exitWith {
				_deathmsg = format ["STR_NOTF_Murdered_Ship_%1",(round(random (1)))];
			};
		};
		if (isNull _vehicle) exitWith {
			_deathmsg = format ["STR_NOTF_Murdered_%1",(round(random (3)))];
		};
	};
	if (_mode isEqualTo "copkill") exitWith {
		if (!isNull _vehicle) exitWith {
			_vehicleName = FETCH_CONFIG2(getText,"CfgVehicles",(typeOf _vehicle),"displayName");
			if (_vehicle isKindOf "Car") exitWith {
				_deathmsg = format ["STR_NOTF_Copkill_Car_%1",(round(random (1)))];
			};
			if (_vehicle isKindOf "Air") exitWith {
				_deathmsg = format ["STR_NOTF_Copkill_Air_%1",(round(random (2)))];
			};
			if (_vehicle isKindOf "Ship") exitWith {
				_deathmsg = format ["STR_NOTF_Copkill_Ship_%1",(round(random (1)))];
			};
		};
		if (isNull _vehicle) exitWith {
			_deathmsg = format ["STR_NOTF_Copkill_%1",(round(random (2)))];
		};
	};
	if (_mode isEqualTo "suicide") exitWith {
		if (!isNull _vehicle) exitWith {
			_vehicleName = FETCH_CONFIG2(getText,"CfgVehicles",(typeOf _vehicle),"displayName");
			if (_vehicle isKindOf "Car") exitWith {
				_deathmsg = format ["STR_NOTF_Suicide_Car_%1",(round(random (2)))];
			};
			if (_vehicle isKindOf "Air") exitWith {
				_deathmsg = format ["STR_NOTF_Suicide_Air_%1",(round(random (3)))];
			};
			if (_vehicle isKindOf "Ship") exitWith {
				_deathmsg = format ["STR_NOTF_Suicide_Ship_%1",(round(random (1)))];
			};
		};
		if (isNull _vehicle) exitWith {
			_deathmsg = format ["STR_NOTF_Suicide_%1",(round(random (4)))];
		};
	};
};
if (_mode in ["killed","copkill"]) then {
	if (!isNull _vehicle) then {
		//[0,_deathmsg,true,[_unitName,_killerName,_vehicleName]] remoteExecCall ["life_fnc_broadcast",RCLIENT];
		[[0,_deathmsg,true,[_unitName, _killerName,_vehicleName]],"life_fnc_broadcast",true,false] spawn life_fnc_MP;
	} else {
		//[0,_deathmsg,true,[_unitName,_killerName]] remoteExecCall ["life_fnc_broadcast",RCLIENT];
		[[0,_deathmsg,true,[_unitName, _killerName]],"life_fnc_broadcast",true,false] spawn life_fnc_MP;
	};
} else {
	if (!isNull _vehicle) then {
		//[0,_deathmsg,true,[_unitName,_vehicleName]] remoteExecCall ["life_fnc_broadcast",RCLIENT];
		[[0,_deathmsg,true,[_unitName,_vehicleName]],"life_fnc_broadcast",true,false] spawn life_fnc_MP;
	} else {
		//[0,_deathmsg,true,[_unitName]] remoteExecCall ["life_fnc_broadcast",RCLIENT];
		[[0,_deathmsg,true,[_unitName]],"life_fnc_broadcast",true,false] spawn life_fnc_MP;
	};
};