#include "..\..\script_macros.hpp"
/*
	File: fn_repairTruck.sqf
	Author: Bryan "Tonic" Boardwine
	Modified by: Play Germany
	
	Description:
	Main functionality for toolkits, to be revised in later version.
*/
private["_veh","_upp","_ui","_progress","_pgText","_cP","_displayName","_test"];
_veh = cursorTarget;
life_interrupted = false;
if(isNull _veh) exitwith {};
if((_veh isKindOf "Car") OR (_veh isKindOf "Ship") OR (_veh isKindOf "Air")) then
{
	if("ToolKit" in (items player)) then
	{
		life_action_inUse = true;
		_displayName = getText(configFile >> "CfgVehicles" >> (typeOf _veh) >> "displayName");
		_upp = format[localize "STR_NOTF_Repairing",_displayName];
		//Setup our progress bar.
		disableSerialization;
		5 cutRsc ["life_progress","PLAIN"];
		_ui = uiNameSpace getVariable "life_progress";
		_progress = _ui displayCtrl 38201;
		_pgText = _ui displayCtrl 38202;
		_pgText ctrlSetText format["%2 (1%1)...","%",_upp];
		_progress progressSetPosition 0.01;
		_cP = 0.01;
		
		while{true} do
		{
			if(animationState player != "Acts_carFixingWheel") then {
				player playMoveNow "Acts_carFixingWheel";
			};
			uiSleep 0.27;
			_cP = _cP + 0.01;
			_progress progressSetPosition _cP;
			_pgText ctrlSetText format["%3 (%1%2)...",round(_cP * 100),"%",_upp];
			if(_cP >= 1) exitWith {};
			if(!alive player) exitWith {};
			if(player != vehicle player) exitWith {};
			if(life_interrupted) exitWith {};
		};
		
		life_action_inUse = false;
		5 cutText ["","PLAIN"];
		player playMoveNow "AinvPknlMstpSnonWnonDnon_medic_1";
		uiSleep 0.1;
		player playActionNow "Stop";
		if(life_interrupted) exitWith {
			life_interrupted = false; 
			//t/itleText[localize "STR_NOTF_ActionCancel","PLAIN"]; 
			[localize "STR_NOTF_ActionCancel","RED",10] spawn life_fnc_notification_system;
			life_action_inUse = false;
		};
		if(player != vehicle player) exitWith {
			//t/itleText[localize "STR_NOTF_RepairingInVehicle","PLAIN"];
			[localize "STR_NOTF_RepairingInVehicle","RED",10] spawn life_fnc_notification_system;
		};
		if(playerSide in [civilian,east]) then {player removeItem "ToolKit"};
		_veh setDamage 0;
		//t/itleText[localize "STR_NOTF_RepairedVehicle","PLAIN"];
		[localize "STR_NOTF_RepairedVehicle","GREEN",5] spawn life_fnc_notification_system;
	};
};