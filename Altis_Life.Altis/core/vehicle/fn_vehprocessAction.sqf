#include "..\..\script_macros.hpp"
/*
	File: fn_vehprocessAction.sqf
	Author: moeck & evopanker
	
	Description:
	Processes Items in the Trunk!
*/
_randomMinChance = 1000; //Kleinste Chance = 1000 für bis zu 0,1%
life_action_inUse = true;//Lock out other actions during processing.
private _itemInfo = [];
private _veh_data = life_vInact_curTarget getVariable ["Trunk",[[],0]];
private _target = life_vInact_curTarget;
private _inv = _veh_data select 0;
private _vehMaxWeight= [typeOf life_vInact_curTarget] call life_fnc_vehicleWeightCfg;
private _filter = false;
private _materialsRequired = [];
private _materialsGiven = [];
private _noLicenseCost = 0;
private _itemWeight = 0;
private _itemAdded = false;
private _newItemsAmount = 0;
private _invItemsName = [];
private _invItemsRequired = [];
private _tmp = [];
private _error = false;
private _upp = "";
private _newItem = "";
private _trunkNew = [];
private _itemName = "";
private _itemAmount = 0;
private _text = "";
private _zones = [];
private _toofar = true;
private _zoneSize = 0;

if (isClass (missionConfigFile >> "ProcessAction" >> life_whatprocess)) then {
    _filter = false;
    _materialsRequired = M_CONFIG(getArray,"ProcessAction",life_whatprocess,"MaterialsReq");
    _materialsGiven = M_CONFIG(getArray,"ProcessAction",life_whatprocess,"MaterialsGive");
    _noLicenseCost = M_CONFIG(getNumber,"ProcessAction",life_whatprocess,"NoLicenseCost");
    _text = M_CONFIG(getText,"ProcessAction",life_whatprocess,"Text");
	_zones = M_CONFIG(getArray,"ProcessAction",life_whatprocess,"zones");
	_zoneSize = M_CONFIG(getNumber,"ProcessAction",life_whatprocess,"zoneSize");
} else {_filter = true;};
if (_filter) exitWith {life_action_inUse = false;};
_itemInfo = [_materialsRequired,_materialsGiven,_noLicenseCost,(localize format ["%1",_text])];
_upp = _itemInfo select 3;
if (count _itemInfo isEqualTo 0) exitWith {
	//h/int "Keine Items";
	["Keine Items","RED",10] spawn life_fnc_notification_system;
	life_action_inUse = false;
};
//Error check
if ( vehicle player != player ) exitWith {
	["Du musst aussteigen.","RED",10] spawn life_fnc_notification_system;
	life_is_processing = false;
};
if (count _materialsRequired isEqualTo 0) exitWith {life_action_inUse = false;};
//Check whether required Items are in Trunk
{
	_tmp pushBack (_x select 0);
} foreach _materialsRequired;
private _materialsRequiredNames = _tmp;
private _invItemsName = [];
{
	_invItemsName pushBack (_x select 0);
} forEach _inv;
{
	if !(_x in _invItemsName) then {_error = true;};
} forEach _materialsRequiredNames;
if (_error) exitWith { 
	//h/int "Ohne die Richtigen Objekte kannst du nichts produzieren!";
	["Ohne die Richtigen Objekte kannst du nichts produzieren!","RED",10] spawn life_fnc_notification_system;
	life_is_processing = false; life_action_inUse = false;
};
_license= call {
	if (life_whatprocess in ["benzin","diesel"]) exitWith {"fuel"};
	if (life_whatprocess in ["turtlecan","fishcan"]) exitWith {"cannedfood"};
	if (life_whatprocess in ["nuclear","brennstoff"]) exitWith {"nuclearfuel"};
	if (life_whatprocess in ["destille"]) exitWith {"whiskey"};
	life_whatprocess;
};
_hasLicense = LICENSE_VALUE(_license,"civ");
if !(_hasLicense) exitWith {
	["Ohne Lizenz kannst du nichts produzieren!","RED",10] spawn life_fnc_notification_system;
	life_is_processing = false; life_action_inUse = false;};
//Check whether the right amount of items is in the Trunk
{
	if ((_x select 0) in _materialsRequiredNames) then { _invItemsRequired pushBack _x;};
} foreach _inv;
_tmp = 0;
{
	for "_i" from 0 to ((count _materialsRequired)-1) do {
		if (_tmp isEqualTo 0) then {
			_tmp = ((_x select 1) / (_materialsRequired select _i select 1));
		};
		if !(_tmp isEqualTo (round(_tmp))) exitWith {_error = true;};
		if !(((_x select 1) / (_materialsRequired select _i select 1)) isEqualTo _tmp) exitWith {_error = true;}
	};
} foreach _invItemsRequired;
_newItemsAmount = _tmp;
if (_error) exitWith {
	//h/int "Du brauchst schon das richtige Verhältnis an Rohstoffen!"
	["Du brauchst schon das richtige Verhältnis an Rohstoffen!","RED",10] spawn life_fnc_notification_system;
	life_is_processing = false; life_action_inUse = false;
};

//Setup our progress bar.
disableSerialization;
"progressBar" cutRsc ["life_progress","PLAIN"];
_ui = uiNameSpace getVariable "life_progress";
_progress = _ui displayCtrl 38201;
_pgText = _ui displayCtrl 38202;
_pgText ctrlSetText format["%2 (1%1)...","%",_upp];
_progress progressSetPosition 0.01;
_cP = 0.01;

life_is_processing = true;
life_vInact_curTarget setVariable["mining",true,true];
life_vInact_curTarget setVariable["trunk_in_use",true,true];

for "_i" from 0 to 1 step 0 do {

	uiSleep  0.56;
	_cP = _cP + 0.01;
	_progress progressSetPosition _cP;
	_pgText ctrlSetText format["%3 (%1%2)...",round(_cP * 100),"%",_upp];
	if(_cP >= 1) exitWith {};
	_toofar = true;
	{
		if (player distance (getMarkerPos _x) <= _zoneSize) exitWith {_toofar = false};
	}forEach _zones;
	if (_toofar) exitWith {};
};
if (_toofar) exitWith {
	[localize "STR_Process_Stay","RED",10] spawn life_fnc_notification_system;
	"progressBar" cutText ["","PLAIN"]; 
	life_is_processing = false;
	life_action_inUse = false;
	life_vInact_curTarget setVariable["mining",nil,true];
	life_vInact_curTarget setVariable["trunk_in_use",false,true];
};
"progressBar" cutText ["","PLAIN"];
life_is_processing = false;
//Check whether items are still there!
_invItemsRequired = [];
_veh_data = (_target getVariable ["Trunk",[[],0]]);
_inv = (_veh_data select 0);
{
	if ((_x select 0) in _materialsRequiredNames) then { _invItemsRequired pushBack _x;};
} foreach _inv;
{
	for "_i" from 0 to ((count _materialsRequired)-1) do {
		if !(((_x select 1) / (_materialsRequired select _i select 1)) isEqualTo _newItemsAmount) exitWith {_error = true;}
	};
} foreach _invItemsRequired;
if (_error) exitWith {
	["Nimm keine Items raus! Daran haben wir gedacht!","RED",10] spawn life_fnc_notification_system;
	life_is_processing = false; life_action_inUse = false;life_vInact_curTarget setVariable["mining",nil,true];life_vInact_curTarget setVariable["trunk_in_use",false,true];
};
//Calcualte New Item and Add them to Inventory
for "_i" from 1 to (_newItemsAmount) do {
	_newItem = "";
	_itemAdded = false;
	_trunkNew = [];
	_itemWeight = 0;
	private _chance = [1,1000] call BIS_fnc_randomInt;
	{
		 if((_chance > (_x select 1) && (_chance <= (_x select 2)))) exitWith {_newItem = _x select 0;};
	} forEach _materialsGiven;
	if ((_itemWeight + ([_newItem] call life_fnc_itemWeight)) > _vehMaxWeight) exitWith {
		//h/int "Dein Kofferraum ist voll!";
		["Dein Kofferraum ist voll!","RED",10] spawn life_fnc_notification_system;
	};
	{
		_itemName = _x select 0;
		_itemAmount = _x select 1;
		if !(_itemName in _materialsRequiredNames) then {
			_trunkNew pushBack [_itemName,_itemAmount];
			_itemWeight = _itemWeight + (([_itemName] call life_fnc_itemWeight) * _itemAmount);
		};
		if (_itemName isEqualTo _newItem && !_itemAdded) then {
			_tmp = [[_itemName,_itemAmount]];
			_itemAmount = _itemAmount + 1;
			_trunkNew = (_trunkNew - _tmp);
			_trunkNew pushBack [_itemName,_itemAmount];
			_itemWeight = _itemWeight + ([_itemName] call life_fnc_itemWeight);
			_itemAdded = true;
		};
	} foreach _inv;
	if ((_itemWeight + ([_newItem] call life_fnc_itemWeight)) > _vehMaxWeight) exitWith {};
	if !(_itemAdded) then {
		_trunkNew pushBack [_newItem,1];
		_itemWeight = _itemWeight + ([_newItem] call life_fnc_itemWeight);
	};
	_inv = _trunkNew;
};
life_vInact_curTarget setVariable["Trunk",[_trunkNew,_itemWeight],true];
//t/itleText[format["Du hast den Kram hergestellt."],"PLAIN"];
["Du hast den Kram hergestellt.","BLUE",5] spawn life_fnc_notification_system;
life_is_processing = false;
life_vInact_curTarget setVariable["mining",nil,true];
life_vInact_curTarget setVariable["trunk_in_use",false,true];
life_action_inUse = false;
life_whatIsIt="";
//add this at bottom of this file
_rscLayer = "osefStatusBar" call BIS_fnc_rscLayer;
_rscLayer cutRsc["osefStatusBar","PLAIN"];