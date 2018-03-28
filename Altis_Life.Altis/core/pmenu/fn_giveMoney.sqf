#include "..\..\script_macros.hpp"
/*
	File: fn_giveMoney.sqf
	Author: Bryan "Tonic" Boardwine
	
	Description:
	Gives the selected amount of money to the selected player.
*/
if(isNil "life_money_antiglitch") then {life_money_antiglitch = false;};
if(life_money_antiglitch) exitWith {
	//h/int "Geldspam verboten";
	["Geldspam verboten","RED",10] spawn life_fnc_notification_system;
	ctrlShow[2001,true];
};
private["_unit","_amount"];
_amount = ctrlText 2018;
ctrlShow[2001,false];
if((lbCurSel 2022) isEqualto -1) exitWith {
	//h/int "No one was selected!";
	[localize "STR_NOTF_noOneSelected","RED",10] spawn life_fnc_notification_system;
	ctrlShow[2001,true];
};
_unit = lbData [2022,lbCurSel 2022];
_unit = call compile format["%1",_unit];
if(isNil "_unit") exitWith {ctrlShow[2001,true];};
if(_unit isEqualto player) exitWith {ctrlShow[2001,true];};
if(isNull _unit) exitWith {ctrlShow[2001,true];};

//A series of checks *ugh*
if(!life_use_atm) exitWith {
	//h/int "You recently robbed the bank! You can't give money away just yet.";
	["You recently robbed the bank! You can't give money away just yet.","RED",10] spawn life_fnc_notification_system;
	ctrlShow[2001,true];
};
if(!([_amount] call TON_fnc_isnumber)) exitWith {
	//h/int "You didn't enter an actual number format.";
	["You didn't enter an actual number format.","RED",10] spawn life_fnc_notification_system;
	ctrlShow[2001,true];
};
if(parseNumber(_amount) <= 0) exitWith {
	//h/int "You need to enter an actual amount you want to give.";
	["You need to enter an actual amount you want to give.","RED",10] spawn life_fnc_notification_system;
	ctrlShow[2001,true];
};
if(parseNumber(_amount) > CASH) exitWith {
	//h/int "You don't have that much to give!";
	["You don't have that much to give!","RED",10] spawn life_fnc_notification_system;
	ctrlShow[2001,true];
};
if(isNull _unit) exitWith {ctrlShow[2001,true];};
if(isNil "_unit") exitWith {ctrlShow[2001,true];
	//h/int "The selected player is not within range";
	["The selected player is not within range","RED",10] spawn life_fnc_notification_system;
};
//h/int format["You gave $%1 to %2",[(parseNumber(_amount))] call life_fnc_numberText,_unit getVariable["realname",name _unit]];
[format["You gave $%1 to %2",[(parseNumber(_amount))] call life_fnc_numberText,_unit getVariable["realname",name _unit]],"PINK",5] spawn life_fnc_notification_system;
CASH = CASH - (parseNumber(_amount));
[0] call SOCK_fnc_updatePartial;
[[_unit,_amount,player],"life_fnc_receiveMoney",_unit,false] spawn life_fnc_MP;
[[player, _unit, _amount, 1, BANK, CASH],"TON_fnc_handleDBLog",false] spawn life_fnc_MP; //By Nukefliege
[] call life_fnc_p_updateMenu;
ctrlShow[2001,true];
[]spawn 
{
	life_money_antiglitch = true;
	uiSleep 2;
	life_money_antiglitch = false;
}
