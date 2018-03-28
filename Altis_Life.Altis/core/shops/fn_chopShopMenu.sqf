#include "..\..\script_macros.hpp"
/*
	File: fn_chopShopMenu.sqf
	Author: Bryan "Tonic" Boardwine
	
	Description:
	Opens & initializes the chop shop menu.
*/
if(life_action_inUse) exitWith {
	//h/int localize "STR_NOTF_ActionInProc"
	[localize "STR_NOTF_ActionInProc","RED",10] spawn life_fnc_notification_system;
};
disableSerialization;
private["_nearVehicles","_control"];
_nearVehicles = nearestObjects [getMarkerPos (_this select 3),["Car","Truck"],25];

life_chopShop = (_this select 3);
//Error check
if(count _nearVehicles isEqualto 0) exitWith {
	//t/itleText[localize "STR_Shop_NoVehNear","PLAIN"];
	[localize "STR_Shop_NoVehNear","RED",10] spawn life_fnc_notification_system;
};
if(!(createDialog "Chop_Shop")) exitWith {
	//h/int localize "STR_Shop_ChopShopError"
	[localize "STR_Shop_ChopShopError","RED",10] spawn life_fnc_notification_system;
};

_control = ((findDisplay 39400) displayCtrl 39402);
{
	if(alive _x) then {
		_className = typeOf _x;
		_displayName = getText(configFile >> "CfgVehicles" >> _className >> "displayName");
		_picture = getText(configFile >> "CfgVehicles" >> _className >> "picture");
		_ind = [_className,(call life_garage_sell)] call TON_fnc_index;
		
		if(_ind != -1 && count crew _x isEqualto 0) then {
			_price = 1000;//((call life_garage_sell) select _ind) select 1;
			_control lbAdd _displayName;
			_control lbSetData [(lbSize _control)-1,str(_forEachIndex)];
			_control lbSetPicture [(lbSize _control)-1,_picture];
			_control lbSetValue [(lbSize _control)-1,_price];
		};
	};
} foreach _nearVehicles;