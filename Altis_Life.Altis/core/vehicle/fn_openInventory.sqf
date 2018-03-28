/*
	File: fn_openInventory.sqf
	Author: Bryan "Tonic" Boardwine
	
	Description:
	Starts the initialization of vehicle virtual inventory menu.
*/
private["_vehicle","_veh_data","_unit"];
if(dialog) exitWith {};
params [
	["_vehicle",Objnull,[Objnull]],
	["_unit",ObjNull,[ObjNull]]
];
if(isNull _vehicle || !(_vehicle isKindOf "Car" || _vehicle isKindOf "Air" || _vehicle isKindOf "Ship" || _vehicle isKindOf "House_F")) exitWith {}; //Either a null or invalid vehicle type.

if((_vehicle getVariable ["trunk_in_use",false])) exitWith { [localize "STR_MISC_VehInvUse","RED",10] spawn life_fnc_notification_system;};
_vehicle setVariable["trunk_in_use",true,true];
_vehicle setVariable["trunk_in_use_by",player,true];
if(!createDialog "TrunkMenu") exitWith {[localize "STR_MISC_DialogError","RED",10] spawn life_fnc_notification_system}; //Couldn't create the menu?
disableSerialization;

if(_vehicle isKindOf "House_F") then {
	ctrlSetText[3501,format[(localize "STR_MISC_HouseStorage")+ " - %1",getText(configFile >> "CfgVehicles" >> (typeOf _vehicle) >> "displayName")]];
} else {
	ctrlSetText[3501,format[(localize "STR_MISC_VehStorage")+ " - %1",getText(configFile >> "CfgVehicles" >> (typeOf _vehicle) >> "displayName")]];
};

if(_vehicle isKindOf "House_F") then {
	private["_mWeight"];
	_mWeight = 0;
	{_mWeight = _mWeight + ([(typeOf _x)] call life_fnc_vehicleWeightCfg);} foreach (_vehicle getVariable["containers",[]]);
	_veh_data = [_mWeight,(_vehicle getVariable["Trunk",[[],0]]) select 1];
} else {
	_veh_data = [_vehicle] call life_fnc_vehicleWeight;
};

if(_vehicle isKindOf "House_F" && {count (_vehicle getVariable ["containers",[]]) isEqualto 0}) exitWith { 
	[localize "STR_MISC_NoStorageWarn","RED",10] spawn life_fnc_notification_system;
	closeDialog 0;
	_vehicle setVariable["trunk_in_use",false,true];
};

if(_veh_data select 0 isEqualto -1 && {!(_vehicle isKindOf "House_F")}) exitWith {closeDialog 0; _vehicle setVariable["trunk_in_use",false,true];
	//h/int localize "STR_MISC_NoStorageVeh";
	[localize "STR_MISC_NoStorageVeh","RED",10] spawn life_fnc_notification_system;
};

ctrlSetText[3504,format[(localize "STR_MISC_Weight")+ " %1/%2",_veh_data select 1,_veh_data select 0]];
[_vehicle] call life_fnc_vehInventory;
life_trunk_vehicle = _vehicle;

_vehicle spawn
{
	if( _this getVariable ["trunk_in_use_by",""] != player ) exitWith {_this setVariable["trunk_in_use",false,true]; closeDialog 0;
		//h/int "Bugusing wird mit Perma Bann bestraft!!!";
		["Bugusing wird mit Perma Bann bestraft!!!","RED",10] spawn life_fnc_notification_system;
		[[0,"STR_NOTF_kill1",true,[_unit getVariable["realname", name _unit], profileName]],"life_fnc_broadcast",civilian,false] spawn life_fnc_MP;
		[[0,"STR_NOTF_kill1",true,[_unit getVariable["realname", name _unit], profileName]],"life_fnc_broadcast",west,false] spawn life_fnc_MP;
		[[0,"STR_NOTF_kill1",true,[_unit getVariable["realname", name _unit], profileName]],"life_fnc_broadcast",independent,false] spawn life_fnc_MP;
		sleep 3;
		endMission "LOSER";
	};
	uiSleep 0.2;
	waitUntil {isNull (findDisplay 3500)};
	_this setVariable["trunk_in_use",false,true];
	if(_this isKindOf "House_F") then {
		[[_this],"TON_fnc_updateHouseTrunk",false,false] spawn life_fnc_MP;
	};
};