#include "..\..\script_macros.hpp"
/*
	File: fn_vInteractionMenu.sqf
	Author: Bryan "Tonic" Boardwine
	
	Description:
	Replaces the mass addactions for various vehicle actions
*/
#define Btn1 37450
#define Btn2 37451
#define Btn3 37452
#define Btn4 37453
#define Btn5 37454
#define Btn6 37455
#define Btn7 37456
#define Btn8 37457
#define Title 37401
private["_display","_curTarget","_Btn1","_Btn2","_Btn3","_Btn4","_Btn5","_Btn6","_Btn7","_Btn8","_vehItem","_whatIsIt"];
if(!dialog) then {
	createDialog "vInteraction_Menu";
};
disableSerialization;
_curTarget = [_this,0,ObjNull,[ObjNull]] call BIS_fnc_param;
_vehItem = 0;
if(isNull _curTarget) exitWith {closeDialog 0;}; //Bad target
_isVehicle = if((_curTarget isKindOf "landVehicle") OR (_curTarget isKindOf "Ship") OR (_curTarget isKindOf "Air")) then {true} else {false};
if(!_isVehicle) exitWith {closeDialog 0;};
_display = findDisplay 37400;
_Btn1 = _display displayCtrl Btn1;
_Btn2 = _display displayCtrl Btn2;
_Btn3 = _display displayCtrl Btn3;
_Btn4 = _display displayCtrl Btn4;
_Btn5 = _display displayCtrl Btn5;
_Btn6 = _display displayCtrl Btn6;
_Btn7 = _display displayCtrl Btn7;
_Btn8 = _display displayCtrl Btn8;
life_vInact_curTarget = _curTarget;
_Btn1 ctrlShow true;
_Btn2 ctrlShow false;
_Btn3 ctrlShow false;
_Btn4 ctrlShow false;
_Btn5 ctrlShow false;
_Btn6 ctrlShow false;
_Btn7 ctrlShow false;
_Btn8 ctrlShow false;
_Btn1 ctrlEnable true;
_Btn2 ctrlEnable false;
_Btn3 ctrlEnable false;
_Btn4 ctrlEnable false;
_Btn5 ctrlEnable false;
_Btn6 ctrlEnable false;
_Btn7 ctrlEnable false;
_Btn8 ctrlEnable false;

//Set Repair Action

_Btn1 ctrlSetText localize "STR_vInAct_Repair";
_Btn1 buttonSetAction "[life_vInact_curTarget] spawn life_fnc_repairTruck;";

if("ToolKit" in (items player) && (damage _curTarget < 1)) then {_Btn1 ctrlEnable true;} else {_Btn1 ctrlEnable false;};

if(playerSide isEqualto west) then {
	_Btn2 ctrlSetText localize "STR_vInAct_Registration";
	_Btn2 buttonSetAction "[life_vInact_curTarget] spawn life_fnc_searchVehAction;closeDialog 0;";
	_Btn2 ctrlShow true;
	_Btn2 ctrlEnable true;
	
	_Btn3 ctrlSetText localize "STR_vInAct_SearchVehicle";
	_Btn3 buttonSetAction "[life_vInact_curTarget] spawn life_fnc_vehInvSearch;closeDialog 0;";
	_Btn3 ctrlShow true;
	_Btn3 ctrlEnable true;
	
	_Btn4 ctrlSetText localize "STR_vInAct_PullOut";
	_Btn4 buttonSetAction "[life_vInact_curTarget] spawn life_fnc_pulloutAction;closeDialog 0;";
	_Btn4 ctrlShow true;
	if(!(count crew _curTarget isEqualto 0)) then {_Btn4 ctrlEnable true;};
	
	_Btn5 ctrlSetText localize "STR_vInAct_tow_away";
	_Btn5 buttonSetAction "[life_vInact_curTarget,0] spawn life_fnc_impoundAction;closeDialog 0;";
	_Btn5 ctrlShow true;
	_Btn5 ctrlEnable true;
	
	if(_curTarget isKindOf "Ship") then {
		_Btn6 ctrlSetText localize "STR_vInAct_PushBoat";
		_Btn6 buttonSetAction "[] spawn life_fnc_pushObject; closeDialog 0;";
		if(_curTarget isKindOf "Ship" && {local _curTarget} && {count crew _curTarget isEqualto 0}) then { _Btn6 ctrlEnable true;} else {_Btn6 ctrlEnable false};
	} else {
		if(typeOf (_curTarget) in ["C_Kart_01_Blu_F","C_Kart_01_Red_F","C_Kart_01_Fuel_F","C_Kart_01_Vrana_F"]) then {
			_Btn6 ctrlSetText localize "STR_vInAct_GetInKart";
			_Btn6 buttonSetAction "player moveInDriver life_vInact_curTarget; closeDialog 0;";
			if(count crew _curTarget isEqualto 0 && {canMove _curTarget} && {locked _curTarget isEqualto 0}) then {_Btn6 ctrlEnable true;} else {_Btn6 ctrlEnable false};
		} else {
			_Btn6 ctrlSetText localize "STR_vInAct_Unflip";
			_Btn6 buttonSetAction "life_vInact_curTarget setPos [getPos life_vInact_curTarget select 0, getPos life_vInact_curTarget select 1, (getPos life_vInact_curTarget select 2)+0.5]; closeDialog 0;";
			if(count crew _curTarget isEqualto 0 && {canMove _curTarget}) then { _Btn6 ctrlEnable false;} else {_Btn6 ctrlEnable true;};
		};
	};
	_Btn6 ctrlShow true;
	
	_Btn7 ctrlSetText localize "STR_vInAct_Impound";
	_Btn7 buttonSetAction "[life_vInact_curTarget,1] spawn life_fnc_impoundAction;closeDialog 0;";
	_Btn7 ctrlShow true;
	_Btn7 ctrlEnable true;
	if(!((player distance (getMarkerPos "police_hq_1") < 30) OR  (player distance (getMarkerPos "police_hq_2") < 30) OR (player distance (getMarkerPos "cop_spawn_3") < 30) OR (player distance (getMarkerPos "cop_spawn_5") < 30) OR (player distance (getMarkerPos "cop_spawn_7") < 30) OR (player distance (getMarkerPos "jail1_marker")) < 100 OR (player distance (getMarkerPos "cop_spawn_4") < 40))) then
	{
		_Btn7 ctrlEnable false;
	};
	_Btn8 ctrlShow false;
	_Btn8 ctrlEnable false;
} else {
	if(_curTarget isKindOf "Ship") then {
		_Btn2 ctrlSetText localize "STR_vInAct_PushBoat";
		_Btn2 buttonSetAction "[] spawn life_fnc_pushObject; closeDialog 0;";
		if(_curTarget isKindOf "Ship" && {local _curTarget} && {count crew _curTarget isEqualto 0}) then { _Btn2 ctrlEnable true;} else {_Btn2 ctrlEnable false};
	} else {
		if(typeOf (_curTarget) in ["C_Kart_01_Blu_F","C_Kart_01_Red_F","C_Kart_01_Fuel_F","C_Kart_01_Vrana_F"]) then {
			_Btn2 ctrlSetText localize "STR_vInAct_GetInKart";
			_Btn2 buttonSetAction "player moveInDriver life_vInact_curTarget; closeDialog 0;";
			if(count crew _curTarget isEqualto 0 && {canMove _curTarget} && {locked _curTarget isEqualto 0}) then {_Btn2 ctrlEnable true;} else {_Btn2 ctrlEnable false};
		} else {
			_Btn2 ctrlSetText localize "STR_vInAct_Unflip";
			_Btn2 buttonSetAction "life_vInact_curTarget setPos [getPos life_vInact_curTarget select 0, getPos life_vInact_curTarget select 1, (getPos life_vInact_curTarget select 2)+0.5]; closeDialog 0;";
			if(count crew _curTarget isEqualto 0 && {canMove _curTarget}) then { _Btn2 ctrlEnable false;} else {_Btn2 ctrlEnable true;};
		};
	};
	_Btn2 ctrlShow true;

	if(playerSide isEqualto civilian) then {
		_Btn4 ctrlShow true;
		_Btn4 ctrlSetText localize "STR_vInAct_PullOut";
		_Btn4 buttonSetAction "[life_vInact_curTarget] spawn life_fnc_pulloutAction;closeDialog 0;";
		if !(count crew _curTarget isEqualto 0) then {_Btn4 ctrlEnable true;};
	};

	if(playerSide isEqualto independent) then {
		_Btn5 ctrlShow true;
		_Btn5 ctrlEnable true;
		_Btn5 ctrlSetText localize "STR_vInAct_PullOut";
		_Btn5 buttonSetAction "[life_vInact_curTarget] spawn life_fnc_pulloutAction;closeDialog 0;";
		//if(count crew _curTarget isEqualto 0) then {_Btn5 ctrlEnable false;};
		_Btn4 ctrlSetText localize "STR_vInAct_tow_away";
		_Btn4 buttonSetAction "[life_vInact_curTarget,0] spawn life_fnc_impoundAction;closeDialog 0;";
		_Btn4 ctrlShow true;
		_Btn4 ctrlEnable true;
	};

	if (!(M_CONFIG(getNumber,"LifeCfgVehicles",typeOf (_curTarget),"gatherWeight") isEqualTo -1)) then {
		_Btn3 ctrlShow true;
		_Btn3 ctrlSetText localize "STR_vInAct_DeviceMine";
		_Btn3 buttonSetAction "[life_vInact_curTarget] spawn life_fnc_deviceMine; closeDialog 0;";
		life_whatIsIt ="nothing";
		life_whatIsIt = [typeOf (_curTarget)] call life_fnc_whereAmIDevice;
		if (!(life_whatIsIt isEqualTo "nothing")) then {
			if(!isNil {(_curTarget getVariable "mining")} OR !local _curTarget && {_curTarget in life_2vehicles}) then {
				_Btn3 ctrlEnable false;
			} else {
				_Btn3 ctrlEnable true;
			};
		} else {_Btn3 ctrlEnable false};
		life_whatprocess ="nothing";
		life_whatprocess = [_curTarget] call life_fnc_whereAmIProcess;
		if (!(life_whatprocess isEqualTo "nothing")) then {
			_veh_data = life_vInact_curTarget getVariable ["Trunk",[[],0]];
			_inv = _veh_data select 0;
			if (count _inv isEqualTo 0) then {_vehItem = 0} else {_vehItem = _inv select 0 select 1;};
			if ((typeOf (_curTarget) in M_CONFIG(getArray,"ProcessAction", life_whatprocess ,"device")) && _vehItem > 0 ) then {	
				_Btn3 ctrlSetText "Verarbeiten";
				_Btn3 buttonSetAction "[life_whatprocess] spawn life_fnc_vehprocessAction; closeDialog 0;";
				if(!isNil {(_curTarget getVariable "mining")} OR !local _curTarget && {_curTarget in life_2vehicles}) then {
					_Btn3 ctrlEnable false;
				} else {
					_Btn3 ctrlEnable true;
				};
			};
		};
	};
};