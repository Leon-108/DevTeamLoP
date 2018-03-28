#include "..\..\script_macros.hpp"
/*
	File: fn_priceASK1.sqf
	Author: Sebastian Reddeck
	
	Description:
	Zeigt die aktuellen illegalen Preise...
*/
if (license_civ_rebel) then {
	["Die Abfrage kostet $ 50.000 dieses wird von deinem Konto abgebucht. Preis Übersicht wird geladen...","PINK",5] spawn life_fnc_notification_system;
	BANK = BANK - 50000;
	sleep 5;
	private _message = [];
	_message pushBack "<t size='1.50'color='#ff0000'  align='center'>Handelspreise (Illegal)</t><br /><br />";
	private _price = 0;
	{
		private _string = "";
		private _type = (configName _x);
		private _name = ITEM_NAME(_type);
		if ((ITEM_ILLEGAL(_type)) isEqualTo 1) then {
			if (M_CONFIG(isNumber,"VirtualItems",_type,"sellPrice")) then {
				_price = M_CONFIG(getNumber,"VirtualItems",_type,"sellPrice");
			} else {
				_price = M_CONFIG(getText,"VirtualItems",_type,"sellPrice");
				_price = call compile _price;
			};
			_string = format["<t color='#00FF00' size='0.8' align='left'>%1: </t><t size='0.8' 'align='left'>$%2 pro Stück</t><br />",(localize _name),_price];
			_message pushback _string;
		};
	} forEach ("getNumber(_x >> 'showPrice') isEqualTo 1" configClasses (missionConfigFile >> "VirtualItems"));
	_message = _message joinString "";
[parseText _message,"PINK",30] spawn life_fnc_notification_system;

}
else 
{["Du hast keine Rebellenlizenz!","RED",10] spawn life_fnc_notification_system; };