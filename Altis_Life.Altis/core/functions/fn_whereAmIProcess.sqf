#include "..\..\script_macros.hpp"
/*
    File: fn_whereAmI.sqf
    Author: Dardo

    Description:
    Return the nearest kind of resource field to the player

    mine
    resource
    nothing
*/

private ["_resourceCfg","_zone","_zoneSize","_nothing","_curConfigName","_resource"];
params ["_vehicle"];
_type = typeOf _vehicle;
_veh_data = _vehicle getVariable ["Trunk",[[],0]];
_items = [];
_zone = "";
_check = true;
call {
	if (count (_veh_data select 0) isEqualTo 0) exitWith {
		_check = true;
	};
	if (count (_veh_data select 0) isEqualTo 1) exitWith {
		_items = ((_veh_data select 0) select 0);
		_check = false;
	};
	if ((count (_veh_data select 0)) > 1) exitWith {
		{ _items pushback (_x select 0);} foreach (_veh_data select 0);
		_check = false;
	};
};
if (_check) exitWith { _nothing = "nothing";_nothing;};
_resourceCfg = missionConfigFile >> "ProcessAction";
for "_i" from 0 to count(_resourceCfg)-1 do {
    private ["_curConfig", "_resourceZones", "_requiredItem"];
	_curConfigName="";
    _curConfig = _resourceCfg select _i;
	_curConfigName = configName (_curConfig);
	_requiredItems = [];
	_resourceZones = getArray(_curConfig >> "zones");
	_zoneSize = getNumber(_curConfig >> "zoneSize");
	_device = getArray(_curConfig >> "device");
	{
        if (((player distance(getMarkerPos _x)) < _zoneSize) && (_type in _device)) then {
			_materialsRequired = [];
			_materialsRequired = getArray(_curConfig >> "MaterialsReq");
			call {
				if ((count _materialsRequired ) isEqualTo 1 ) exitWith { 
					_requiredItems = ((_materialsRequired select 0) select 0); 
				};
				if ((count _materialsRequired ) isEqualTo 0 ) exitWith {
					_requiredItems = "";
				};
				if ((count _materialsRequired ) > 1 ) exitWith {
					{ _requiredItems pushback (_x select 0)} foreach _materialsRequired;
				};
			};
			if (_requiredItems isEqualTo "") exitWith {};
			if ((_items isEqualType "") && (_requiredItems isEqualType "" )) then {
				if (_items isEqualTo _requiredItems) exitWith {
					_zone = _curConfigName;
				};
				if !(_zone isEqualTo "") exitWith {};
			};
			if ((_items isEqualType []) && (_requiredItems isEqualType "" )) then {
				if (_requiredItems in _items) exitWith {
					_zone = _curConfigName;
				};
				if !(_zone isEqualTo "") exitWith {};
			};
			if ((_items isEqualType []) && (_requiredItems isEqualType [] )) then {
				{
					if (_x in _items) exitWith {
						_zone = _curConfigName;
						hint format ["Zone %1",_zone];
					};
				} count (_requiredItems);
				if !(_zone isEqualTo "" ) exitWith {};
			};
		};
		if !(_zone isEqualTo "") exitWith {};
	} forEach _resourceZones;
	if !(_zone isEqualTo "") exitWith {};
};

if !(_zone isEqualTo "") exitWith {
     _resource = _curConfigName;
	 _resource;
};
 if (_zone isEqualTo "") exitWith {
    _nothing = "nothing";
    _nothing;
};
