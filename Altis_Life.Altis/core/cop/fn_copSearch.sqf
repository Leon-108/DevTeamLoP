#include "..\..\script_macros.hpp"
/*
	File: fn_copSearch.sqf
	Author: Bryan "Tonic" Boardwine
	
	Description:
	Returns information on the search.
*/
life_action_inUse = false;
params [
	["_civ",objNull,[objNull]],
    ["_invs",[],[[]]],
    ["_robber",false,[false]]
];

if(isNull _civ) exitWith {};

private _price = 0;
private _illegal = 0;
private _inv = "";
if(count _invs > 0) then {
	{
		_displayName = M_CONFIG(getText,"VirtualItems",(_x select 0),"displayName");
		_var = _x select 0;
		_val = _x select 1;
        _inv = _inv + format ["%1 %2<br/>",_val,(localize _displayName)];
		if (M_CONFIG(isNumber,"VirtualItems",_var,"sellPrice")) then {
			_price = M_CONFIG(getNumber,"VirtualItems",(_var),"sellPrice");
		} else {
			_price = M_CONFIG(getText,"VirtualItems",_var,"sellPrice");
			_price = call compile _price;
		};
        if (!isNull (missionConfigFile >> "VirtualItems" >> _var >> "proccesedItem")) then {
            _processed = M_CONFIG(getText,"VirtualItems",_var,"proccesedItem");
			if !(_processed isEqualTo "") then {
				if (M_CONFIG(isNumber,"VirtualItems",_processed,"sellPrice")) then {
					_price = M_CONFIG(getNumber,"VirtualItems",_processed,"sellPrice");
				} else {
					_price = M_CONFIG(getText,"VirtualItems",_processed,"sellPrice");
					_price = call compile _price;
				};
			};
		};
		
        if (!(_price isEqualTo -1)) then {
            _illegal = _illegal + (_val * _price);
        };
	} foreach _invs;
	if(_illegal > 6000) then
	{
		[[getPlayerUID _civ,_civ getVariable["realname",name _civ],"482"],"life_fnc_wantedAdd",false,false] spawn life_fnc_MP;
	};
	[[getPlayerUID _civ,_civ getVariable["realname",name _civ],"481"],"life_fnc_wantedAdd",false,false] spawn life_fnc_MP;
	[[0,"STR_Cop_Contraband",true,[(_civ getVariable["realname",name _civ]),[_illegal] call life_fnc_numberText]],"life_fnc_broadcast",[west,civilian],false] spawn life_fnc_MP;
} else {
	_inv = localize "STR_Cop_NoIllegal";
};

if(!alive _civ || player distance _civ > 5) exitWith {[format[localize "STR_Cop_CouldntSearch",_civ getVariable["realname",name _civ]],"RED",10] spawn life_fnc_notification_system;};

[parseText format["<t color='#FF0000'><t size='2'>%1</t></t><br/><t color='#FFD700'><t size='1.5'><br/>" +(localize "STR_Cop_IllegalItems")+ "</t></t><br/>%2<br/><br/><br/><br/><t color='#FF0000'>%3</t>",(_civ getVariable["realname",name _civ]),_inv,if(_robber) then {"Robbed the bank"} else {""}],"GREEN",5] spawn life_fnc_notification_system;
if(_robber) then {
	[[0,"STR_Cop_Robber",true,[(_civ getVariable["realname",name _civ])]],"life_fnc_broadcast",true,false] spawn life_fnc_MP;
};