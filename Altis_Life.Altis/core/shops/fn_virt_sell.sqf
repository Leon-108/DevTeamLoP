#include "..\..\script_macros.hpp"
/*
	File: fn_virt_sell.sqf
	Author: Bryan "Tonic" Boardwine
	
	Description:
	Sell a virtual item to the store / shop
*/
private["_type","_index","_price","_var","_amount","_name"];
if(isNil "life_money_antiglitch") then {life_money_antiglitch = false;};
if(life_money_antiglitch) exitWith {
	//h/int "Der Haendler muss den Kram erstmal verstauen!";
	[localize "STR_Shops_Sellspam","RED",10] spawn life_fnc_notification_system;
	ctrlShow[2001,true];
};
if((lbCurSel 2402) isEqualto -1) exitWith {};
_type = lbData[2402,(lbCurSel 2402)];
if (M_CONFIG(isNumber,"VirtualItems",_type,"sellPrice")) then {
	_price = M_CONFIG(getNumber,"VirtualItems",_type,"sellPrice");
} else {
	_price = M_CONFIG(getText,"VirtualItems",_type,"sellPrice");
	_price = call compile _price;
};
//_price = M_CONFIG(getNumber,"VirtualItems",_type,"sellPrice");
if(_price isEqualto -1) exitWith {};
//if (life_shop_type isEqualTo "gangheroin") then {_price = round (_price * 1.5)};

_amount = ctrlText 2405;
if(!([_amount] call TON_fnc_isnumber)) exitWith {
	//h/int localize "STR_Shop_Virt_NoNum";
	[localize "STR_Shop_Virt_NoNum","RED",10] spawn life_fnc_notification_system;
};
_amount = parseNumber (_amount);
if(_amount > (ITEM_VALUE(_type))) exitWith {
	//h/int localize "STR_Shop_Virt_NotEnough"
	[localize "STR_Shop_Virt_NotEnough","RED",10] spawn life_fnc_notification_system;
};

_price = (_price * _amount);
_name = M_CONFIG(getText,"VirtualItems",_type,"displayName");
if(([false,_type,_amount] call life_fnc_handleInv)) then
{
	//h/int format[localize "STR_Shop_Virt_SellItem",_amount,_name,[_price] call life_fnc_numberText];
	[format[localize "STR_Shop_Virt_SellItem",_amount,(localize _name),[_price] call life_fnc_numberText],"GREEN",5] spawn life_fnc_notification_system;
	CASH = CASH + _price;
	[0] call SOCK_fnc_updatePartial;
	[] call life_fnc_virt_update;
};

if(life_shop_type isEqualto "heroin") then
{
	private _array = life_shop_npc getVariable["sellers",[]];
	private _ind = [getPlayerUID player,_array] call TON_fnc_index;
	private _val = 0;
	if !(_ind isEqualTo -1) then
	{
		_val = (_array select _ind) select 2;
		_val = _val + _price;
		_array set[_ind,[getPlayerUID player,profileName,_val]];
		life_shop_npc setVariable["sellers",_array,true];
	} else{
		_array pushBack [getPlayerUID player,profileName,_price];
		life_shop_npc setVariable["sellers",_array,true];
	};
};
if (life_shop_type isEqualTo "gold" && (LIFE_SETTINGS(getNumber,"noatm_timer")) > 0) then {
    [] spawn {
        life_use_atm = false;
        uiSleep ((LIFE_SETTINGS(getNumber,"noatm_timer")) * 60); //muss noch gemacht werden!
        life_use_atm = true;
    };
};
[3] call SOCK_fnc_updatePartial;
[]spawn 
{
	life_money_antiglitch = true;
	uiSleep 0.5;
	life_money_antiglitch = false;
}