#include "..\..\script_macros.hpp"
/*
	File: fn_requestReceived.sqf
	Author: Bryan "Tonic" Boardwine
	
	Description:
	Called by the server saying that we have a response so let's 
	sort through the information, validate it and if all valid 
	set the client up.
*/
life_session_tries = life_session_tries + 1;
if(life_session_completed) exitWith {}; //Why did this get executed when the client already initialized? Fucking arma...
if(life_session_tries > 3) exitWith {cutText[localize "STR_Session_Error","BLACK FADED"]; 0 cutFadeOut 999999999;};

0 cutText [localize "STR_Session_Received","BLACK FADED"];
0 cutFadeOut 9999999;

//Error handling and  junk..
if(isNil "_this") exitWith {[] call SOCK_fnc_insertPlayerInfo;};
if(typeName _this isEqualto "STRING") exitWith {[] call SOCK_fnc_insertPlayerInfo;};
if(count _this isEqualto 0) exitWith {[] call SOCK_fnc_insertPlayerInfo;};
if((_this select 0) isEqualto "Error") exitWith {[] call SOCK_fnc_insertPlayerInfo;};
if((getPlayerUID player) != _this select 0) exitWith {[] call SOCK_fnc_dataQuery;};
/*for "_i" from 0 to (count _this)-1 do {
	diag_log format["%1: %2",_i,_this select _i];
};*/
//Parse basic player information.
CASH = parseNumber (_this select 2);
BANK = parseNumber (_this select 3);
__CONST__(life_adminlevel,(_this select 4));
life_vipdate = _this select 5;
__CONST__(life_donator,0);

//Loop through licenses
if(count (_this select 7) > 0) then {
	{missionNamespace setVariable [(_x select 0),(_x select 1)];} foreach (_this select 7);
};

life_gear = _this select 9;
[] call life_fnc_loadGear;

//Parse side specific information.
switch(playerSide) do {
	case west: {
		//diag_log format["8: %1",_this select 7];
		__CONST__(life_coplevel, (_this select 8));
		__CONST__(life_medicLevel,0);
		life_blacklisted = _this select 10;
	};
	
	case civilian: {
		life_is_arrested = _this select 8;
		__CONST__(life_coplevel, 0);
		__CONST__(life_medicLevel, 0);
		life_is_alive = _this select 10; //muss noch geändert werden!
        life_civ_position = _this select 11; // muss noch geändert werden!
        if (life_is_alive) then {
			if !(count life_civ_position isEqualTo 3) then {diag_log format ["[requestReceived] Bad position received. Data: %1",life_civ_position];life_is_alive =false;};
			if (life_civ_position distance (getMarkerPos "respawn_civilian") < 300) then {life_is_alive = false;};
        };
				
		life_houses = _this select 12;
		{
			_house = nearestBuilding (call compile format["%1", _x select 0]);
			//_house = (nearestObjects[(call compile format["%1", SEL(_x,0)]),["House_F"],12] select 0);
			life_2vehicles pushBack _house;
		} foreach life_houses;
		
		life_gangData = _this select 13;
		if(count life_gangData != 0) then {
			[] spawn life_fnc_initGang;
		};
		[] spawn life_fnc_initHouses;
	};
	
	case independent: {
		__CONST__(life_medicLevel, (_this select 8));
		__CONST__(life_coplevel,0);
	};
};

if(count (_this select 15) > 0) then {
	{life_2vehicles pushBack _x;} foreach (_this select 15);
};

life_session_completed = true;