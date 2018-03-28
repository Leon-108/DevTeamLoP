#include "..\..\script_macros.hpp"
/*
	File: fn_buyLicenses_ext.sqf
	Autor: moeck (LoP)
	
	[legal] life_fnc_buyLicences_extended;
	[illegal] life_fnc_buyLicences_extended;
	
	Action: 
	this addAction["Lizenzen und Fähigkeiten",life_fnc_buyLicences_extended,["cair","swat","cg","gun"],0,false,false,"",' playerSide == west '];
*/
private["_display","_listbox","_shortname","_longname","_price","_hasLicense","_displayname"];

private _licenses = _this select 3; //called from action => select 3rd argument

private _flag = call {
	if (playerSide isEqualTo civilian) exitWith {"civ"};
	if (playerSide isEqualTo west) exitWith {"cop"};
	if (playerSide isEqualTo independent) exitWith {"med"};
};
//hint format ["Der Händer verkauft %1 Lizenzen/Fähigkeiten.", count _buyables];

if(!dialog) then {
	if(!(createDialog "LicenseShop")) exitWith {};
};
disableSerialization;
_display = findDisplay 5546;  
if(isNull _display) exitWith {};  
_listbox = _display displayCtrl 55126;  
_mylic = _display displayCtrl 55131;  
_struct = "";  
{
	private _license = (configName _x);
	private _name = getText(missionConfigFile >> "Licenses" >> _license >> "displayName");
	private _price = M_CONFIG(getNumber,"Licenses",_license,"price");
	if (!(_price isEqualTo -1) &&((M_CONFIG(getText,"Licenses",_license,"side")) isEqualTo _flag)) then {
		if (_licenses isEqualType "") then {
			_illegal = 0;
			if (_licenses isEqualTo "legal") then {_illegal = 0};
			if (_licenses isEqualTo "illegal") then {_illegal = 1};
			if ((M_CONFIG(getNumber,"Licenses",_license,"illegal")) isEqualTo _illegal) then {
				if(missionNamespace getVariable LICENSE_VARNAME(_license,_flag)) then {
					_mylic lbAdd format["%1", (localize _name)];
					_mylic lbSetData [(lbSize _listbox) - 1, ""];
				} else {
					_listbox lbAdd format["%1 ($%2)", (localize _name), [_price] call life_fnc_numberText];
					_listbox lbSetData [(lbSize _listbox) - 1, _license];
				};
			};
		};
		if (_licenses isEqualType []) then {
			if (_license in _licenses) then {
				if(missionNamespace getVariable LICENSE_VARNAME(_license,_flag)) then {
					_mylic lbAdd format["%1", (localize _name)];
					_mylic lbSetData [(lbSize _listbox) - 1, ""];
				} else {
					_listbox lbAdd format["%1 ($%2)", (localize _name), [_price] call life_fnc_numberText];
					_listbox lbSetData [(lbSize _listbox) - 1, _license];
				};
			};
		};
	};
} forEach ("true" configClasses (missionConfigFile >> "Licenses"));
lbSort _mylic;
lbSort _listbox;