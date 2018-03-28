#include "..\..\script_macros.hpp"
/*
	File: fn_wantedInfo.sqf
	Author: Bryan "Tonic" Boardwine
	
	Description:
	Pulls back information about the wanted criminal.
*/
private["_display","_list","_crimes","_bounty","_mylist"];
disableSerialization;

_display = findDisplay 2400;
_list = _display displayCtrl 2402;
_data = lbData[2401,(lbCurSel 2401)];
_mylist = [];
_data = call compile format["%1", _data];
if(isNil "_data") exitWith {_list lbAdd " ";};
if(typeName _data != "ARRAY") exitWith {_list lbAdd " ";};
if(count _data isEqualto 0) exitWith {_list lbAdd " ";};
lbClear _list;

_crimes = _data select 2;
_bounty = _data select 3;
	
{
	_crime = _x;
	if(!(_crime in _mylist)) then
	{
		_mylist pushBack _crime;
		_list lbAdd format["%1x %2",{_x isEqualto _crime} count _crimes,_crime];
	};
} foreach _crimes;
lbSort _list;

ctrlSetText[2403,format["Kopfgeld: $%1",[_bounty] call life_fnc_numberText]];