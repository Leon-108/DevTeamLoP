#include "..\script_macros.hpp"
/*
	File: fn_initCop.sqf
	Author: Bryan "Tonic" Boardwine
	
	Description:
	Cop Initialization file.
*/
private["_end"];
player addRating 9999999;
waitUntil {!(isNull (findDisplay 46))};
_end = false;
if(life_blacklisted) exitWith
{
	["Blacklisted",false,true] call BIS_fnc_endMission;
	sleep 30;
};

if((__GETC__(life_coplevel) < 1) && (__GETC__(life_adminlevel) isEqualTo 0)) then {
		["NotWhitelisted",false,true] call BIS_fnc_endMission;
		sleep 35;
	};

player setVariable["rank",(__GETC__(life_coplevel)),true];
[] call life_fnc_spawnMenu;
waitUntil{!isNull (findDisplay 38500)}; //Wait for the spawn selection to be open.
waitUntil{isNull (findDisplay 38500)}; //Wait for the spawn selection to be done.
[player, uniform player] call life_fnc_equipGear;
[] execVM "welcome.sqf";
/*[] spawn
{
	private["_texture"];
	while {true} do
	{
		waitUntil{uniform player};
		if (uniform player isEqualTo "U_Rangemaster") then {player setObjectTextureGlobal [0,"textures\Person_Skins_Cop\PPD_Hemd.paa"]};
		if (uniform player isEqualTo "U_B_CombatUniform_mcam") then {player setObjectTextureGlobal [0,"textures\Person_Skins_Cop\PPD_Jacke.paa"]};
		if (uniform player isEqualTo "U_B_CTRG_1") then {player setObjectTextureGlobal [0,"textures\Person_Skins_Cop\SWAT.paa"]};
		waitUntil{uniform player !="U_B_CombatUniform_mcam"};

	};
	while {true} do
	{
		waitUntil{uniform player isEqualTo "U_B_CombatUniform_mcam"};
		_texture =
		switch (__GETC__(life_coplevel)) do
		{
			case 1: {"textures\Person_Skins_Cop\chief.paa"};
			case 2: {"textures\Person_Skins_Cop\chief.paa"};
			case 3: {"textures\Person_Skins_Cop\chief.paa"};
			case 4: {"textures\Person_Skins_Cop\chief.paa"};
			case 5: {"textures\Person_Skins_Cop\chief.paa"};
			case 6: {"textures\Person_Skins_Cop\chief.paa"};
			case 7: {"textures\Person_Skins_Cop\chief.paa"};
		};
		
		player setObjectTextureGlobal [0,_texture];
		waitUntil{uniform player != "U_B_CombatUniform_mcam"};
	};
};*/
//sleep 10;

//[] call life_fnc_disableRope;