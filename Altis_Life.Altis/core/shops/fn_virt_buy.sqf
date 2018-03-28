#include "..\..\script_macros.hpp"
/*
	File: fn_virt_buy.sqf
	Author: Bryan "Tonic" Boardwine
	
	Description:
	Buy a virtual item from the store.
*/
private["_type","_price","_amount","_diff","_name","_hideout"];
if(isNil "life_money_antiglitch") then {life_money_antiglitch = false;};
if(life_money_antiglitch) exitWith {
	//h/int "Der Haendler muss den Kram erstmal aus dem Lager holen!";
	[localize "STR_Shops_Buyspam","RED",10] spawn life_fnc_notification_system;
	ctrlShow[2001,true];
};
if((lbCurSel 2401) isEqualto -1) exitWith {
	//h/int localize "STR_Shop_Virt_Nothing"
	[localize "STR_Shop_Virt_Nothing","RED",10] spawn life_fnc_notification_system;
};
_type = lbData[2401,(lbCurSel 2401)];
_price = lbValue[2401,(lbCurSel 2401)];
_amount = ctrlText 2404;
if(!([_amount] call TON_fnc_isnumber)) exitWith {
	//h/int localize "STR_Shop_Virt_NoNum";
	[localize "STR_Shop_Virt_NoNum","RED",10] spawn life_fnc_notification_system;
};
_diff = [_type,parseNumber(_amount),life_carryWeight,life_maxWeight] call life_fnc_calWeightDiff;
_amount = parseNumber(_amount);
if(_amount >= 11) exitWith {
	//h/int "Du kannst nicht mehr als 10 Items auf einmal kaufen!";
	["Du kannst nicht mehr als 10 Items auf einmal kaufen!","RED",10] spawn life_fnc_notification_system;
};
if(_diff <= 0) exitWith {
	//h/int localize "STR_NOTF_NoSpace"
	[localize "STR_NOTF_NoSpace","RED",10] spawn life_fnc_notification_system;
};
_amount = _diff;
_hideout = (nearestObjects[getPosATL player,["Land_u_Barracks_V2_F","Land_i_Barracks_V2_F"],25]) select 0;
if((_price * _amount) > CASH && {!isNil "_hideout" && {!isNil {group player getVariable "gang_bank"}} && {(group player getVariable "gang_bank") <= _price * _amount}}) exitWith {
	//h/int localize "STR_NOTF_NotEnoughMoney"
	[localize "STR_NOTF_NotEnoughMoney","RED",10] spawn life_fnc_notification_system;
};

_name = M_CONFIG(getText,"VirtualItems",_type,"displayName");

if(([true,_type,_amount] call life_fnc_handleInv)) then
{
	if(!isNil "_hideout" && {!isNil {group player getVariable "gang_bank"}} && {(group player getVariable "gang_bank") >= _price}) then {
		_action = [
			format[(localize "STR_Shop_Virt_Gang_FundsMSG")+ "<br/><br/>" +(localize "STR_Shop_Virt_Gang_Funds")+ " <t color='#8cff9b'>$%1</t><br/>" +(localize "STR_Shop_Virt_YourFunds")+ " <t color='#8cff9b'>$%2</t>",
				[(group player getVariable "gang_bank")] call life_fnc_numberText,
				[CASH] call life_fnc_numberText
			],
			localize "STR_Shop_Virt_YourorGang",
			localize "STR_Shop_Virt_UI_GangFunds",
			localize "STR_Shop_Virt_UI_YourCash"
		] call BIS_fnc_guiMessage;
		if(_action) then {
			//h/int format[localize "STR_Shop_Virt_BoughtGang",_amount,_name,[(_price * _amount)] call life_fnc_numberText];
			[format[localize "STR_Shop_Virt_BoughtGang",_amount,(localize _name),[(_price * _amount)] call life_fnc_numberText],"GREEN",5] spawn life_fnc_notification_system;
			_funds = group player getVariable "gang_bank";
			_funds = _funds - (_price * _amount);
			group player setVariable["gang_bank",_funds,true];
			[[1,group player],"TON_fnc_updateGang",false,false] spawn life_fnc_MP;
		} else {
			if((_price * _amount) > CASH) exitWith {
				[false,_type,_amount] call life_fnc_handleInv;
				//h/int localize "STR_NOTF_NotEnoughMoney";
				[localize "STR_NOTF_NotEnoughMoney","RED",10] spawn life_fnc_notification_system;
			};
			//h/int format[localize "STR_Shop_Virt_BoughtItem",_amount,_name,[(_price * _amount)] call life_fnc_numberText];
			[format[localize "STR_Shop_Virt_BoughtItem",_amount,_name,[(_price * _amount)] call life_fnc_numberText],"GREEN",5] spawn life_fnc_notification_system;
			__SUB__(CASH,_price * _amount);
		};
	} else {
		if((_price * _amount) > CASH) exitWith {
			//h/int localize "STR_NOTF_NotEnoughMoney"; 
			[localize "STR_NOTF_NotEnoughMoney","RED",10] spawn life_fnc_notification_system;
			[false,_type,_amount] call life_fnc_handleInv;
		};
		//h/int format[localize "STR_Shop_Virt_BoughtItem",_amount,_name,[(_price * _amount)] call life_fnc_numberText];
		[format[localize "STR_Shop_Virt_BoughtItem",_amount,(localize _name),[(_price * _amount)] call life_fnc_numberText],"GREEN",5] spawn life_fnc_notification_system;
		__SUB__(CASH,(_price * _amount));
	};
	[] call life_fnc_virt_update;
};

[0] call SOCK_fnc_updatePartial;
[3] call SOCK_fnc_updatePartial;
[]spawn 
{
	life_money_antiglitch = true;
	uiSleep 0.5;
	life_money_antiglitch = false;
}