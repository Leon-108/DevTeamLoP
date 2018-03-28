/*
	File: fn_storeVehicle.sqf
	Author: Bryan "Tonic" Boardwine
	
	Description:
	Stores the vehicle in the garage.
*/
private["_nearVehicles","_vehicle"];
if(vehicle player != player) then {
	_vehicle = vehicle player;
} else {
	_uid = getPlayerUID player;
	_nearVehicles = nearestObjects[getPos (_this select 0),["Car","Air","Ship","Tank"],30]; //Fetch vehicles within 30m.
	if(count _nearVehicles > 0) then {
		{
			if(!isNil "_vehicle") exitWith {}; //Kill the loop.
			_vehData = _x getVariable["vehicle_info_owners",[]];
			_index = [_uid,_vehData] call TON_fnc_index;
			if !(_index  isEqualto  -1) exitWith {_vehicle = _x;};
		} foreach _nearVehicles;
	};
};

if(isNil "_vehicle") exitWith {
	[localize "STR_Garage_NoNPC","RED",10] spawn life_fnc_notification_system;
};
if(isNull _vehicle) exitWith {};
[[_vehicle,false,(_this select 1)],"TON_fnc_vehicleStore",false,false] spawn life_fnc_MP;
[localize "STR_Garage_Store_Server","GREEN",5] spawn life_fnc_notification_system;
life_garage_store = true;