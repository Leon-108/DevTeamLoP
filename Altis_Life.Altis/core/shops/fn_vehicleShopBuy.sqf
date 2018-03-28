#include "..\..\script_macros.hpp"
/*
	File: fn_vehicleShopBuy.sqf
	Author: Bryan "Tonic" Boardwine
	
	Description:
	Does something with vehicle purchasing.
*/
params [["_mode",true,[true]]];

if((lbCurSel 2302) isEqualto -1) exitWith {
	//h/int localize "STR_Shop_Veh_DidntPick"
	[localize "STR_Shop_Veh_DidntPick","RED",10] spawn life_fnc_notification_system;
};

private _className = lbData[2302,(lbCurSel 2302)];
private _vIndex = lbValue[2302,(lbCurSel 2302)];
private _vehicleList = M_CONFIG(getArray,"CarShops",(life_veh_shop select 0),"vehicles");
private _shopSide = M_CONFIG(getText,"CarShops",(life_veh_shop select 0),"side");

private _initalPrice = M_CONFIG(getNumber,"LifeCfgVehicles",_className,"price");

private "_buyMultiplier";
private "_rentMultiplier";

call {
    if(playerSide isEqualTo west) exitWith {
        _initalPrice = M_CONFIG(getNumber,"LifeCfgVehicles",_className,"copprice");
        _rentMultiplier = LIFE_SETTINGS(getNumber,"vehicle_rental_multiplier_COP");
    };
    if(playerSide isEqualTo independent) exitWith {
        _initalPrice = M_CONFIG(getNumber,"LifeCfgVehicles",_className,"medprice");
        _rentMultiplier = LIFE_SETTINGS(getNumber,"vehicle_rental_multiplier_MEDIC");
    };
    if(playerSide isEqualTo east) exitWith {
        _buyMultiplier = LIFE_SETTINGS(getNumber,"vehicle_purchase_multiplier_OPFOR");
        _rentMultiplier = LIFE_SETTINGS(getNumber,"vehicle_rental_multiplier_OPFOR");
    };
	if(playerSide isEqualTo civilian) exitWith {
        _buyMultiplier = LIFE_SETTINGS(getNumber,"vehicle_purchase_multiplier_CIVILIAN");
        _rentMultiplier = LIFE_SETTINGS(getNumber,"vehicle_rental_multiplier_CIVILIAN");
    };
};

private "_purchasePrice";

if (_mode) then {
    _purchasePrice = _initalPrice;
} else {
    _purchasePrice = round(_initalPrice * _rentMultiplier);
};

private _conditions = M_CONFIG(getText,"LifeCfgVehicles",_className,"conditions");

if !([_conditions] call life_fnc_levelCheck) exitWith {[localize "STR_Shop_Veh_NoLicense","RED",10] spawn life_fnc_notification_system;};

private _colorIndex = lbValue[2304,(lbCurSel 2304)];


if (_purchasePrice < 0) exitWith {closeDialog 0;}; //Bad price entry
if (CASH < _purchasePrice) exitWith {
	[format[localize "STR_Shop_Veh_NotEnough",[_purchasePrice - CASH] call life_fnc_numberText],"RED",10] spawn life_fnc_notification_system;
	closeDialog 0;
};

private _spawnPoints = life_veh_shop select 1;
private _spawnPoint = "";

if((life_veh_shop select 0) isEqualto "med_air_hs") then {
	if(count(nearestObjects[(getMarkerPos _spawnPoints),["Air"],35]) isEqualto 0) exitWith {_spawnPoint = _spawnPoints};
} else {
	//Check if there is multiple spawn points and find a suitable spawnpoint.
	if (_spawnPoints isEqualType []) then {
        //Find an available spawn point.
        {
            if ((nearestObjects[(getMarkerPos _x),["Car","Ship","Air"],5]) isEqualTo []) exitWith {_spawnPoint = _x};
            true
        } count _spawnPoints;
    } else {
        if (nearestObjects[(getMarkerPos _spawnPoints),["Car","Ship","Air"],5] isEqualTo []) exitWith {_spawnPoint = _spawnPoints};
    };
};


if(_spawnPoint isEqualto "") exitWith {
	[localize "STR_Shop_Veh_Block","RED",10] spawn life_fnc_notification_system;
};
CASH = CASH - _purchasePrice;
[0] call SOCK_fnc_updatePartial;
[format[localize "STR_Shop_Veh_Bought",getText(configFile >> "CfgVehicles" >> _className >> "displayName"),[_purchasePrice] call life_fnc_numberText],"GREEN",5] spawn life_fnc_notification_system;

//Spawn the vehicle and prep it.
private "_vehicle";

if((life_veh_shop select 0) isEqualto "med_air_hs") then {
	_vehicle = createVehicle [_className,[0,0,999],[], 0, "NONE"];
	waitUntil {!isNil "_vehicle" && {!isNull _vehicle}}; //Wait?
	_vehicle allowDamage false;
	_hs = nearestObjects[getMarkerPos _spawnPoint,["Land_Hospital_side2_F"],50] select 0;
	if (_spawnPoint isEqualTo "air_g_med_pyrgos" || _spawnPoint isEqualTo "air_med" || _spawnPoint isEqualTo "air_med_ag") then {
			_hs = getMarkerPos _spawnPoint;
			_vehicle setDir (markerDir _spawnPoint);
			_vehicle setPos _hs;
	} else {	
		_vehicle setPosATL (_hs modelToWorld [-0.4,-4,12.65]);
	};
	sleep 0.6;
		
} else {
	//Kavala Carshop
	_pos = getMarkerPos _spawnPoint;
	if (_spawnPoint isEqualTo "carshop_0") then {
		_pos = [_pos select 0,_pos select 1,1.6];
	};
	//Priester Spawn 
	if (_spawnPoint isEqualTo "air_g_1_7") then {
		_pos = [_pos select 0,_pos select 1,15.0];
	};
	//SSG Spawnpunkt
	if (_spawnPoint isEqualTo "air_med_1") then {
			_pos = [_pos select 0,_pos select 1,2.0];
	};
	//COP Kavala Heliport
	if (_spawnPoint isEqualTo "cop_air_1") then {
			_pos = [_pos select 0,_pos select 1,3.96];
	};
	//COP Kavala Shop
	if (_spawnPoint isEqualTo "cop_car_1") then {
			_pos = [_pos select 0,_pos select 1,5.55];
	};
	if (_spawnPoint isEqualTo "dd_shop_spawn") then {
			_pos = [_pos select 0,_pos select 1,1.563];
	};
	_vehicle = createVehicle [_className, [0,0,999], [], 0, "NONE"];
	waitUntil {!isNil "_vehicle" && {!isNull _vehicle}}; //Wait?
	_vehicle allowDamage false; //Temp disable damage handling..<
	_vehicle setVectorUp (surfaceNormal (getMarkerPos _spawnPoint));
	_vehicle setDir (markerDir _spawnPoint);
	if !( _vehicle isKindOf "Ship") then {_vehicle setPosATL _pos;} else {_vehicle setPosASL _pos;};	
};
_vehicle lock 2;

[[_vehicle,_colorIndex],"life_fnc_colorVehicle",true,false] spawn life_fnc_MP;
[_vehicle] call life_fnc_clearVehicleAmmo;
[[_vehicle,"trunk_in_use",false,true],"TON_fnc_setObjVar",false,false] spawn life_fnc_MP;
[[_vehicle,"vehicle_info_owners",[[getPlayerUID player,profileName]],true],"TON_fnc_setObjVar",false,false] spawn life_fnc_MP;

_vehicle disableTIEquipment false; //No Thermals.. They're cheap but addictive.
_ctype = life_veh_shop select 2;


//Side Specific actions.
switch(playerSide) do {
	case west: {
		[_vehicle,"cop_offroad",true] spawn life_fnc_vehicleAnimate;
	};
	
	case civilian: {
		if((life_veh_shop select 2) in ["civ","reb"] && {_className isEqualto "B_Heli_Light_01_F"}) then {
			[_vehicle,"civ_littlebird",true] spawn life_fnc_vehicleAnimate;
		};
	};
	case independent: {
		[_vehicle,"med_offroad",true] spawn life_fnc_vehicleAnimate;
	};
};

_vehicle allowDamage true;

//life_2vehicles set[count life_2vehicles,_vehicle]; //Add err to the chain.
life_2vehicles pushBack _vehicle;

[[getPlayerUID player,playerSide,_vehicle,1],"TON_fnc_keyManagement",false,false] spawn life_fnc_MP;

if(_mode) then {
	if !(_className in LIFE_SETTINGS(getArray,"vehicleShop_rentalOnly")) then {
		[[(getPlayerUID player),playerSide,_vehicle,_colorIndex,_ctype],"TON_fnc_vehicleCreate",false,false] spawn life_fnc_MP;
	};
};

closeDialog 0; //Exit the menu.
true;