#include "..\..\script_macros.hpp"
/*
    File: fn_processActionSingle.sqf
    Author: EvoPanker & moeck
    
    Description:
    Master handling for processing an item with drop chances.
*/
private ["_vendor","_type","_itemInfo","_totalConversions","_oldItem","_newItem","_newGivenItems","_cost","_hasLicense","_itemName","_ui","_progress","_pgText","_cP","_upp","_materialsRequired","_materialsGiven","_noLicenseCost","_text","_filter"];
params [["_vendor", ObjNull, [ObjNull]],
    "",
    "",
    ["_type","",[""]]
];
_maxprocess = 1; // set how much newItems should produced
//Error check
_license= call {
	if (_type in ["benzin","diesel"]) exitWith {"fuel"};
	if (_type in ["turtlecan","fishcan"]) exitWith {"cannedfood"};
	if (_type in ["nuclear","brennstoff"]) exitWith {"nuclearfuel"};
	if (_type in ["destille"]) exitWith {"whiskey"};
	_type;
};
if (vehicle player != player) exitWith {
    ["Du musst aussteigen.","RED",10] spawn life_fnc_notification_system;
    5 cutText ["","PLAIN"];
    life_is_processing = false;
};
if (isNUll _vendor || _type isEqualTo "" || (player distance _vendor > 10)) exitWith {};
life_action_inUse = true; //Lock out other actions during processing.

if (isClass (missionConfigFile >> "ProcessAction" >> _type)) then {
    _filter = false;
    _materialsRequired = M_CONFIG(getArray,"ProcessAction",_type,"MaterialsReq");
    _materialsGiven = M_CONFIG(getArray,"ProcessAction",_type,"MaterialsGive");
    _noLicenseCost = M_CONFIG(getNumber,"ProcessAction",_type,"NoLicenseCost");
    _text = M_CONFIG(getText,"ProcessAction",_type,"Text");
} else {_filter = true;};
if(_filter) exitWith {life_action_inUse = false;};
_itemInfo = [_materialsRequired, _materialsGiven,_noLicenseCost,(localize format ["%1",_text])];
if(count _itemInfo isEqualTo 0) exitWith {life_action_inUse = false;};

//Setup vars
_oldItem = _itemInfo select 0;
_newItem = _itemInfo select 1;
_cost = _itemInfo select 2;
_upp = _itemInfo select 3;
_exit = false;
if(count _oldItem isEqualTo 0) exitWith {life_action_inUse = false;};

_totalConversions = [];
{
    _var = ITEM_VALUE(_x select 0);
    if (_var isEqualTo 0) exitWith {_exit = true;};
    if (_var < (_x select 1)) exitWith {_exit = true;};
    _totalConversions pushBack (floor (_var/(_x select 1)));
} forEach _oldItem;

if (_exit) exitWith {life_is_processing = false;[localize "STR_NOTF_NotEnoughItemProcess","RED",10] spawn life_fnc_notification_system; life_action_inUse = false;};
_hasLicense = LICENSE_VALUE(_type,"civ");

_minimumConversions = _totalConversions call BIS_fnc_lowestNum;
if (_minimumConversions > _maxprocess) then {
	_minimumConversions = _maxprocess;
};
_cost = _cost * _minimumConversions;
_newGivenItems=[];
private _itemAdded = false;
for "_i" from 1 to _minimumConversions do {
    {
        private _chance = [1,1000] call BIS_fnc_randomInt;
		private _itemtemp = _x select 0;
        if((_chance > (_x select 1) && (_chance <= (_x select 2)))) exitWith {
			_itemAdded = false;
			for "_a" from 0 to (count _newGivenItems) step 1 do {
				if((_newGivenItems select _a select 0) isEqualTo _itemtemp) exitWith {
					_val = (_newGivenItems select _a select 1);
					_help = [[_itemtemp,_val]];
					_newGivenItems = (_newGivenItems - _help);
					_newGivenItems pushBack [_itemtemp,_val + 1];
					_itemAdded = true;
				};
			};
			if(!_itemAdded) then {
				_newGivenItems pushBack [_itemtemp,1];
			};
        };
    } forEach _newItem;
};
//hint format["_newGivenItems: %1",_newGivenItems];
_newItemWeight = 0;
{
    _weight = ([_x select 0] call life_fnc_itemWeight) * (_x select 1);
    _newItemWeight = _newItemWeight + _weight;
} forEach _newGivenItems;
_oldItemWeight = 0;
{
	_weight = (([_x select 0] call life_fnc_itemWeight) * (_x select 1) * _minimumConversions);
	_oldItemWeight = _oldItemWeight + _weight;
} forEach _oldItem;


if(((life_maxWeight - life_carryWeight) + _oldItemWeight) < _newItemWeight) exitWith {life_action_inUse = false; life_is_processing = false; [localize "STR_Process_Weight","RED",10] spawn life_fnc_notification_system;};

//Setup our progress bar.
disableSerialization;
"progressBar" cutRsc ["life_progress","PLAIN"];
_ui = uiNamespace getVariable "life_progress";
_progress = _ui displayCtrl 38201;
_pgText = _ui displayCtrl 38202;
_pgText ctrlSetText format ["%2 (1%1)...","%",_upp];
_progress progressSetPosition 0.01;
_cP = 0.01;

life_is_processing = true;
if (_cost isEqualTo 0) then {
	_hasLicense = true;
};
if(_hasLicense) then
{
    for "_i" from 0 to 1 step 0 do {
        sleep  0.28;
        _cP = _cP + 0.01;
        _progress progressSetPosition _cP;
        _pgText ctrlSetText format ["%3 (%1%2)...",round(_cP * 100),"%",_upp];
        if (_cP >= 1) exitWith {};
        if (player distance _vendor > 10) exitWith {};
    };
	
	if(player distance _vendor > 10) exitWith {
		[localize "STR_Process_Stay","RED",10] spawn life_fnc_notification_system;
		"progressBar" cutText ["","PLAIN"]; 
		life_is_processing = false;
		life_action_inUse = false;
	};
    
    {
        [false,(_x select 0),((_x select 1)*(_minimumConversions))] call life_fnc_handleInv;
    } count _oldItem;
    
    {
        [true,(_x select 0),(_x select 1)] call life_fnc_handleInv;
    } forEach _newGivenItems;
    "progressBar" cutText ["","PLAIN"];
    [localize "STR_NOTF_ItemProcess","GREEN",5] spawn life_fnc_notification_system;
    life_is_processing = false; life_action_inUse = false;
} else {
    if(CASH < _cost) exitWith {
        [format [localize "STR_Process_License",[_cost] call life_fnc_numberText],"YELLOW",5] spawn life_fnc_notification_system;
		"progressBar" cutText ["","PLAIN"];
		life_is_processing = false;
		life_action_inUse = false;
    };
    
    for "_i" from 0 to 1 step 0 do {
        sleep  0.9;
        _cP = _cP + 0.01;
        _progress progressSetPosition _cP;
        _pgText ctrlSetText format ["%3 (%1%2)...",round(_cP * 100),"%",_upp];
        if (_cP >= 1) exitWith {};
        if (player distance _vendor > 10) exitWith {};
    };

    if (player distance _vendor > 10) exitWith {hint localize "STR_Process_Stay"; "progressBar" cutText ["","PLAIN"]; life_is_processing = false; life_action_inUse = false;};
    if (CASH < _cost) exitWith {
		[format [localize "STR_Process_License",[_cost] call life_fnc_numberText],"YELLOW",5] spawn life_fnc_notification_system;
		"progressBar" cutText ["","PLAIN"];
		life_is_processing = false;
		life_action_inUse = false;
    };
    
    {
        [false,(_x select 0),((_x select 1)*(_minimumConversions))] call life_fnc_handleInv;
    } count _oldItem;
    
    {
        [true,(_x select 0),(_x select 1)] call life_fnc_handleInv;
    } forEach _newGivenItems;
    
    "progressBar" cutText ["","PLAIN"];
    [localize "STR_NOTF_ItemProcess","GREEN",5] spawn life_fnc_notification_system;
    CASH = CASH - _cost;
    [0] call SOCK_fnc_updatePartial;
    life_is_processing = false;
    life_action_inUse = false;
};
//add this at bottom of this file
_rscLayer = "osefStatusBar" call BIS_fnc_rscLayer;
_rscLayer cutRsc["osefStatusBar","PLAIN"];