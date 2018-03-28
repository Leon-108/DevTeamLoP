#include "..\..\script_macros.hpp"
/*
File: fn_unimpound.sqf
Author: Bryan "Tonic" Boardwine

Description:
Yeah... Gets the vehicle from the garage.
*/
disableSerialization;
if(lbCurSel 2802 isEqualto -1) exitWith {
	[localize "STR_Global_NoSelection","RED",10] spawn life_fnc_notification_system;
};
private _dataArr = lbData[2802,(lbCurSel 2802)];
_dataArr = call compile format["%1",_dataArr];

private _vehicle = _dataArr select 0;
private _vehicleLife = _vehicle;
private _vid = lbValue[2802,(lbCurSel 2802)];
private _type = _dataArr select 2;
private _colorindex = _dataArr select 1;
private _pid = getPlayerUID player;
private _unit = player;
private _ctype = call {
	if (playerSide isEqualTo west) exitWith {"cop"};
	if (playerSide isEqualTo civilian) exitWith {"civ"};
	if (playerSide isEqualTo independent) exitWith {"med"};
};
private _price = M_CONFIG(getNumber,"LifeCfgVehicles",_vehicleLife,"garageprice");

private _textures = (M_CONFIG(getArray,"LifeCfgVehicles",_vehicleLife,"textures"));
_counter = count _textures;
if (_counter > 0 && (_counter > _colorindex)) then { 
	_ctype = ((_textures select _colorindex ) select 1) select 0;
};

private _markerDir = 0;

_cooldown = 300; // alle 5 min kann das Taxi gerufen werden.
private _spCfg = [(side _unit)] call life_fnc_spawnPointCfg; // Spawnpunkte prüfen

if(isNil "_vehicle") exitWith {
	[localize "STR_Garage_Selection_Error","RED",10] spawn life_fnc_notification_system;
};

//_price = _purchasePrice * _storageFee;
if (!(_price isEqualType 0) || _price < 1) then {_price = 1000;};

if (_type isEqualTo "jail") then {
	_price = _dataArr select 3;
};
if(BANK < _price) exitWith {
	[format[(localize "STR_Garage_CashError"),[_price] call life_fnc_numberText],"RED",10] spawn life_fnc_notification_system;
};

if( life_garage_sp isEqualType []) then {
	[[_vid,_pid,life_garage_sp select 0,_unit,_price,life_garage_sp select 1,_ctype,_type],"TON_fnc_spawnVehicle",false,false] spawn life_fnc_MP;
} else {
	if (life_garage_sp != "taxi") then {_markerDir = markerDir life_garage_sp} else {_markerDir = 0};
	if(life_garage_sp in ["medic_spawn_1","medic_spawn_2","medic_spawn_3"]) then {
		[[_vid,_pid,life_garage_sp,_unit,_price,_ctype,_type],"TON_fnc_spawnVehicle",false,false] spawn life_fnc_MP;
	} else {
		_pos = getMarkerPos life_garage_sp;
		//Kartell
		if (life_garage_sp isEqualTo "air_g_2") then {_pos = [_pos select 0,_pos select 1,2.12];};
		if (life_garage_sp isEqualTo "air_g_1_7") then {_pos = [_pos select 0,_pos select 1,15.0];}; //Priester
		if (life_garage_sp isEqualTo "air_med_1") then {_pos = [_pos select 0,_pos select 1,2];};//PRS Aussenposten
		if (life_garage_sp isEqualTo "air_g_med") then {_pos = [_pos select 0,_pos select 1,1.8];};//Kavala PRS
		if (life_garage_sp isEqualTo "car_g_1") then {_pos = [_pos select 0,_pos select 1,1.5];};//Kavala Garage
		if (life_garage_sp isEqualTo "cop_air_1") then {_pos = [_pos select 0,_pos select 1,3.96];};//Kavala
		if (life_garage_sp isEqualTo "cop_car_1") then {_pos = [_pos select 0,_pos select 1,5.55];};//Kavala
		if (life_garage_sp isEqualTo "dd_air_garage") then {_pos = [_pos select 0,_pos select 1,1.472];};
		if (life_garage_sp isEqualTo "dd_shop_spawn") then {_pos = [_pos select 0,_pos select 1,1.563];};
		if (life_garage_sp isEqualTo "bhg_air_garage") then {_pos = [_pos select 0,_pos select 1,2.181];};
		if (life_garage_sp isEqualTo "taxi") then {
			_pos = [];
			if ( life_taxi_useTime > time ) exitWith {
				[format ["Du hast erst den Lieferservice genutzt. Bitte warte noch %1 Minuten.", round((life_taxi_useTime - serverTime)/60)],"YELLOW",5] spawn life_fnc_notification_system;
			};
			if ((getPosATL _unit) findEmptyPositionReady [50,50]) then {
				_pos = (getPosATL _unit) findEmptyPosition [10,50,_vehicle];
			} else {_pos = []};
			if !(count _pos isEqualTo 3) exitWith {
				["Leider wurde kein passender Platz gefunden! Versuche es wo anders nochmal!","RED",10] spawn life_fnc_notification_system; 
				_pos = [];
			};
			{
				if (_x select 0 find "house_" isEqualTo -1) then {
					if (count _pos isEqualTo 3) then {
						if (_pos distance (getMarkerPos (_x select 0)) < 500) exitWith {
							["Du kannst hier kein Taxi rufen, da in der Nähe eine Garage ist!","RED",10] spawn life_fnc_notification_system;
							_pos = [];
						};
					};
				};
			} forEach _spCfg;
			if (count _pos isEqualTo 3) then {
				if (_pos distance (getMarkerPos "jail1_marker") < 100) exitWith {
					["Du kannst hier kein Taxi rufen, der Mechaniker liefert keine Fahrzeuge zum Knast!","RED",10] spawn life_fnc_notification_system;
					_pos = [];
				};
			};
			
			if (count _pos isEqualTo 3) then {
				life_taxi_useTime = time + _cooldown;
				[[_vid,_pid,_pos,_unit,_price,_markerDir,_ctype,_type],"TON_fnc_spawnVehicle",false,false] spawn life_fnc_MP;
				[localize "STR_Garage_SpawningVeh","GREEN",5] spawn life_fnc_notification_system;
				BANK = BANK - _price;
				[1] call SOCK_fnc_updatePartial;
				closeDialog 0;
			};
		};
		if !(life_garage_sp isEqualTo "taxi") then {
			[[_vid,_pid,_pos,_unit,_price,_markerDir,_ctype,_type],"TON_fnc_spawnVehicle",false,false] spawn life_fnc_MP;
		};
	};
};
if !(life_garage_sp isEqualTo "taxi") then {
	[localize "STR_Garage_SpawningVeh","GREEN",5] spawn life_fnc_notification_system;
	BANK = BANK - _price;
	[1] call SOCK_fnc_updatePartial;
	closeDialog 0;
};
