#include "..\..\script_macros.hpp"
/*
	File: fn_licenseCheck.sqf
	Author: Bryan "Tonic" Boardwine
	
	Description:
	Returns the licenses to the cop.
*/
params [["_cop",ObjNull,[ObjNull]]];
if(isNull _cop) exitWith {}; //Bad entry
private _licenses = [];
private _flag = call {
	if(playerSide isEqualTo civilian) exitWith {"civ"};
	if(playerSide isEqualTo west) exitWith {"cop"};
	if(playerSide isEqualTo independent) exitWith {"med"};
	"error";
};
//Licenses
private _licenses =[];
private _text = "";
_licensesConfigs = "getNumber(_x >> 'showPolice') isEqualTo 1" configClasses (missionConfigFile >> "Licenses");
{
	_string = "";
	private _license = (configName _x);
	private _name = getText(missionConfigFile >> "Licenses" >> _license >> "displayName");
	if(missionNamespace getVariable LICENSE_VARNAME(_license,_flag)) then {
		_string = format["<t size='1' color='#3ADF00'>%1: %2</t><br/>",(localize _name),(localize "STR_Global_Yes")];
	} else {
		_string = format["<t size='1' color='#FF0000'>%1: %2</t><br/>",(localize _name),(localize "STR_Global_No")];
	};
	_licenses pushback _string;
} foreach _licensesConfigs;
_text = _licenses joinString "";
[[profileName,_text],"life_fnc_licensesRead",_cop,FALSE] spawn life_fnc_MP;