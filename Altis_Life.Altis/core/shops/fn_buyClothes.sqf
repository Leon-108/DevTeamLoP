#include "..\..\script_macros.hpp"
/*
	File: fn_buyClothes.sqf
	Author: Bryan "Tonic" Boardwine
	
	Description:
	Buys the current set of clothes and closes out of the shop interface.
*/
private _price=0;
if((lbCurSel 3101) isEqualto -1) exitWith {
	//t/itleText[localize "STR_Shop_NoClothes","PLAIN"];
	[localize "STR_Shop_NoClothes","RED",10] spawn life_fnc_notification_system;
};
{
    if (!(_x isEqualTo -1)) then {
        _price = _price + _x;
    };
} forEach life_clothing_purchase;

if(_price > CASH) exitWith {
	//t/itleText[localize "STR_Shop_NotEnoughClothes","PLAIN"];
	[localize "STR_Shop_NotEnoughClothes","RED",10] spawn life_fnc_notification_system;
};
CASH = CASH - _price;
[0] call SOCK_fnc_updatePartial;
life_clothesPurchased = true;
[] call life_fnc_playerSkins;
closeDialog 0;