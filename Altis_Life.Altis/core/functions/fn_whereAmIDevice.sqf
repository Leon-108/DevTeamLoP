/*
    File: fn_whereAmI.sqf
    Author: Dardo

    Description:
    Return the nearest kind of resource field to the player

    mine
    resource
    nothing
*/

private ["_zonem", "_zone", "_mine", "_zoneSize", "_resource", "_nothing","_curConfigName"];
params ["_type"];
_resourceCfg = missionConfigFile >> "CfgGather" >> "Minerals";

for "_i" from 0 to count(_resourceCfg)-1 do {
    private ["_curConfig", "_resourceZones", "_requiredItem"];
    _zonem = "";
	_curConfigName="";
    _curConfig = _resourceCfg select _i;
	_curConfigName=configName (_curConfig);
    _resourceZones = getArray(_curConfig >> "zones");
    _zoneSize = getNumber(_curConfig >> "zoneSize");
	_device = getArray(_curConfig >> "device");
    {
        if (((player distance(getMarkerPos _x)) < _zoneSize)&& (_type in _device)) exitWith {
            _zonem = _x;
        };
    } forEach _resourceZones;
    if (!(_zonem isEqualTo "")) exitWith {};
};

if (!(_zonem isEqualTo "")) exitWith {
    _mine = _curConfigName;
    _mine;
};
if (_zonem isEqualTo "") exitWith {
    _nothing = "nothing";
    _nothing;
};
