#include "..\..\script_macros.hpp"
/*
	File: fn_vehInvSearch.sqf
	Author: Bryan "Tonic" Boardwine
	
	Description:
	Searches the vehicle for illegal items.
*/
private["_vehicle","_vehicleInfo","_value","_data","_dataNew","_itemWeight"];
_vehicle = life_vInact_curTarget;
if(isNull _vehicle) exitWith {};
if(!((_vehicle isKindOf "Air") OR (_vehicle isKindOf "Ship") OR (_vehicle isKindOf "LandVehicle"))) exitWith {};
_dataNew = [];
_vehicleInfo = _vehicle getVariable ["Trunk",[]];
_data = _vehicleInfo select 0;
if(count _vehicleInfo isEqualTo 0) exitWith {
	[localize "STR_Cop_VehEmpty","GREEN",5] spawn life_fnc_notification_system;
};

private _value = 0;
_itemWeight=0;
{
	_var = _x select 0; 
	_val = _x select 1;
	_price = 0;
	_isIllegalItem = M_CONFIG(getNumber,"VirtualItems",_var,"illegal");
	if (_isIllegalItem isEqualTo 1) then {
		if (M_CONFIG(isNumber,"VirtualItems",_var,"sellPrice")) then {
				_price = M_CONFIG(getNumber,"VirtualItems",_var,"sellPrice");
		} else {
			_price = M_CONFIG(getText,"VirtualItems",_var,"sellPrice");
			_price = call compile _price;
		};
		if (!isNull (missionConfigFile >> "VirtualItems" >> _var >> "proccesedItem")) then {
            _processed = M_CONFIG(getText,"VirtualItems",_var,"proccesedItem");
			if !(_processed isEqualTo "") then {
				if (M_CONFIG(isNumber,"VirtualItems",_processed,"sellPrice")) then {
					_price = M_CONFIG(getNumber,"VirtualItems",_processed,"sellPrice");
				} else {
					_price = M_CONFIG(getText,"VirtualItems",_processed,"sellPrice");
					_price = call compile _price;
				};
			};
        };
		_value = _value + (_val * _price);
	} else {
		_itemWeight = _itemWeight + ([_var] call life_fnc_itemWeight) * _val;
		_dataNew pushBack [_var,_val];
	};
} foreach (_data);

if(_value > 0) then {
	[[0,"STR_NOTF_VehContraband",true,[[_value] call life_fnc_numberText]],"life_fnc_broadcast",true,false] spawn life_fnc_MP;
	_vehicle setVariable["Trunk",[_dataNew,_itemWeight],true];
} else {
	[localize "STR_Cop_NoIllegalVeh","GREEN",5] spawn life_fnc_notification_system;
};