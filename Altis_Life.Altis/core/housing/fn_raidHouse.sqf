#include "..\..\script_macros.hpp"
/*
	Author: Bryan "Tonic" Boardwine
	
	Description:
	Raids the players house?
*/
private["_house","_uid","_cpRate","_cP","_title","_titleTxt","_ui","_houseInv","_houseInvData","_houseInvVal"];
_house = [_this,0,ObjNull,[ObjNull]] call BIS_fnc_param;
if(isNull _house OR !(_house isKindOf "House_F")) exitWith {};
if(isNil {(_house getVariable "house_owner")}) exitWith {
	//h/int localize "STR_House_Raid_NoOwner"
	[localize "STR_House_Raid_NoOwner","RED",10] spawn life_fnc_notification_system;
};

_uid = (_house getVariable "house_owner") select 0;
if(!([_uid] call life_fnc_isUIDActive)) exitWith {
	[localize "STR_House_Raid_OwnerOff","RED",10] spawn life_fnc_notification_system;
};
_houseInv = _house getVariable ["Trunk",[[],0]];
if(_houseInv isEqualTo [[],0]) exitWith {
	[localize "STR_House_Raid_Nothing","RED",10] spawn life_fnc_notification_system;
};
life_action_inUse = true;

//Setup the progress bar
disableSerialization;
_title = localize "STR_House_Raid_Searching";
5 cutRsc ["life_progress","PLAIN"];
_ui = uiNamespace getVariable "life_progress";
_progressBar = _ui displayCtrl 38201;
_titleTxt = _ui displayCtrl 38202;
_titleTxt ctrlSetText format["%2 (1%1)...","%",_title];
_progressBar progressSetPosition 0.01;
_cP = 0.01;
_cpRate = 0.0075;

while {true} do
{
	sleep 0.26;
	if(isNull _ui) then {
		5 cutRsc ["life_progress","PLAIN"];
		_ui = uiNamespace getVariable "life_progress";
	};
	_cP = _cP + _cpRate;
	_progressBar progressSetPosition _cP;
	_titleTxt ctrlSetText format["%3 (%1%2)...",round(_cP * 100),"%",_title];
	if(_cP >= 1 OR !alive player) exitWith {};
	if(player distance _house > 13) exitWith {};
};

//Kill the UI display and check for various states
5 cutText ["","PLAIN"];
if(player distance _house > 13) exitWith {
	life_action_inUse = false; 
	//t/itleText[localize "STR_House_Raid_TooFar","PLAIN"]
	[localize "STR_House_Raid_TooFar","RED",10] spawn life_fnc_notification_system;
};
if(!alive player) exitWith {life_action_inUse = false;};
life_action_inUse = false;

_data = _houseInv select 0;
_itemWeight = 0;
_value = 0;
_dataNew = [];
{
	_var = _x select 0;
	_val = _x select 1;
	if ((M_CONFIG(getNumber,"VirtualItems",_var,"illegal")) isEqualTo 1) then {
		_price = M_CONFIG(getNumber,"VirtualItems",_var,"sellPrice");
		if (!isNull (missionConfigFile >> "VirtualItems" >> _var >> "processedItem")) then {
            _processed = M_CONFIG(getText,"VirtualItems",_var,"processedItem");
            _price = M_CONFIG(getNumber,"VirtualItems",_processed,"sellPrice");
        };
		_value = _value + (_val * _price);
	} else {
		_itemWeight = _itemWeight + (([_var] call life_fnc_itemWeight) * _val);
		_dataNew pushBack [_var,_val];
	};
} count (_data);

if (_value > 0) then {
	[[0,"STR_House_Raid_Successful",true,[[_value] call life_fnc_numberText]],"life_fnc_broadcast",true,false] spawn life_fnc_MP;
	_house setVariable["Trunk",[_dataNew,_itemWeight],true];
	[[_house],"TON_fnc_updateHouseTrunk",false,false] spawn life_fnc_MP;
} else {
	[localize "STR_House_Raid_NoIllegal","RED",10] spawn life_fnc_notification_system;
};