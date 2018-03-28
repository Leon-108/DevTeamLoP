#include "..\..\script_macros.hpp"
/*
	File: fn_jail.sqf
	Author: Bryan "Tonic" Boardwine
	
	Description:
	Starts the initial process of jailing.
*/
params [
    ["_unit",objNull,[objNull]],
    ["_bad",false,[false]],
	["_time",15,[0]]
];

if (isNull _unit) exitWith {}; //Dafuq?
if !(_unit isEqualTo player) exitWith {}; //Dafuq?
if (life_is_arrested) exitWith {}; //Dafuq i'm already arrested

player setVariable["Re-strained",false,true];
player setVariable["Escorting",false,true];
player setVariable["transporting",false,true];

[localize "STR_Jail_Warn","PINK",5] spawn life_fnc_notification_system;
[localize "STR_Jail_LicenseNOTF","PINK",5] spawn life_fnc_notification_system;
player setPos (getMarkerPos "jail1_marker");

if(_bad) then
{
	waitUntil {alive player};
	sleep 1;
};

//Check to make sure they goto check
if(player distance (getMarkerPos "jail1_marker") > 40) then {
	player setPos (getMarkerPos "jail1_marker");
};

[1] call life_fnc_removeLicenses;

if (LIFE_SETTINGS(getNumber,"jail_seize_inventory") isEqualTo 1) then {
    [] spawn life_fnc_seizeClient;
} else {
    removeAllWeapons player;
    {player removeMagazine _x} forEach (magazines player);
};
player addUniform "U_Rangemaster";
_path = "textures\Gefaengniskleidung.paa";
player setObjectTextureGlobal [0,_path];
life_is_arrested = true;
{
	private _type = (configName _x);
	private _name = ITEM_NAME(_type);
	private _price = 0;
	_amount = ITEM_VALUE(_type);
	if (_amount > 0) then {
		[false,_type,_amount] call life_fnc_handleInv;
	};
} foreach ("getNumber(_x >> 'illegal') isEqualTo 1" configClasses (missionConfigFile >> "VirtualItems"));
diag_log format["life_arrested: %1, %2",(name player), life_is_arrested];

[] call life_fnc_saveGear;
[[player,_bad,_time],"life_fnc_jailSys",false,false] spawn life_fnc_MP;//-------------Changed-----------
[5] call SOCK_fnc_updatePartial;
