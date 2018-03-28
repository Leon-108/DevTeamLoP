#include "..\..\script_macros.hpp"
/*
	File: fn_syncData.sqf
	Author: Bryan "Tonic" Boardwine"
	
	Description:
	Used for player manual sync to the server.
*/
_fnc_scriptName = "Player Synchronization";
private["_exit"];
if(isNil "life_session_time") then {life_session_time = false;};
if(life_session_time) exitWith {
	//h/int localize "STR_Session_SyncdAlready";
	[localize "STR_Session_SyncdAlready","RED",10] spawn life_fnc_notification_system;
};

switch (typeName life_fnc_MP_packet) do
{
	case "ARRAY":
	{
		if(count life_fnc_MP_packet isEqualTo 0) exitWith
		{
			_exit = true;
		};
	};
	
	default {_exit = true;};
};

if(!isNil "_exit") exitWith {
	//h/int localize "STR_Session_SyncCheater";
	[localize "STR_Session_SyncCheater","RED",10] spawn life_fnc_notification_system;
};

[] call SOCK_fnc_updateRequest;
//h/int localize "STR_Session_SyncData";
[parseText localize "STR_Session_SyncData","YELLOW",5] spawn life_fnc_notification_system;
[] spawn
{
	life_session_time = true;
	sleep (3 * 60);
	life_session_time = false;
};
	