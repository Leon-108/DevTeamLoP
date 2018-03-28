#include "..\..\script_macros.hpp"
/*
	file: fn_initgenerate.sqf
	autor: moeck
	
	Description: generates the addActions for a NPC or item
	Call: [["ProcessAction","civ","copper"],["ProcessAction","civ","silver"]] call life_fnc_initgenerate;
	genericCall: [["ConfigClass","side","what to do"]] call initgenerate;
	
	Supports only process stuff at the moment
	
*/
params [
	["_obj",objNull,[objNull]],
	["_params",[[]],[[]]]
];
private _addAction = "";
if ((isNull _obj) || (count _params isEqualTo 0)) exitWith {}; //nothing to do
private _exit =false;
for _i in 0 to (count _params) do {
	private _config = "";
	private _configclass = "";
	if !(count _x isEqualTo 0 ) then {
		private _configclass = _x select 0;
		if !(_configclass isEqualTo "ProcessAction") exitWith {_exit = true};
		private _side = if (count _x > 1) then {_x select 1;} else { _exit = true};
		if (_exit) exitWith {};
		if (isClass (missionConfigFile >> _configclass) exitWith {
			_config = inheritsFrom (missionConfigFile >> _configclass);	
		};
		if (isClass (configFile >> _configclass) exitWith {
			_config = inheritsFrom (configFile >> _configclass);
			//ToDo
		};
	};
	if (_exit) exitWith {};
	if (_configclass in ["ProcessAction"] && (count _x isEqualTo 3)) then {
		_process = (_x select 2);
		if (isClass (missionConfigFile >> "ProcessAction" >> _process)) then {
			_materialsRequired = M_CONFIG(getArray,"ProcessAction",_process,"MaterialsReq");
			_text = M_CONFIG(getText,"ProcessAction",_process,"Text");
		};
		_materials = [];
		if (count _materialsRequired > 1) then {
			for "_a" in 0 to (count _materialsRequired)-1 {
				_string = if (_a isEqualTo 0) then {_string = format ["%1 > 0",ITEM_VARNAME(_a select 0)]} else { format [" && %1 > 0",ITEM_VARNAME(_a select 0)]};
				_materials pushBack _string;
			};
			_materials joinString "";
		} else {
			_materials = format ["%1 > 0",ITEM_VARNAME(_a select 0)];
		};
		_addAction=format ["this addAction[localize""%1"",life_fnc_processAction,""%2"",0,false,false,"""",'%3 && !life_is_processing && !life_action_inUse'];",_text,_proces,_materials];
		_license = format[ "this addAction[format [""%1 ($%2)"",localize (getText(missionConfigFile >> ""Licenses"" >> ""%1"" >> ""displayName"")), [(getNumber(missionConfigFile >> ""Licenses"" >> ""%1"" >> ""price""))] call life_fnc_numberText],life_fnc_buyLicense,""%1"",0,false,false,"""",' !license_civ_%1 && playerSide isEqualTo civilian '];",_process];
		_addAction = _addAction + _license;
	} else {_exit = true};
	if (_exit) exitWith {};
};
if (_exit) exitWith {hint "Error!"};

_obj call compile _addAction;