#include "..\..\script_macros.hpp"
/*
	File: fn_sendChannel.sqf
	Author: alleskapot & Lifted
	Thanks again for all the help alleskapot!
	Description:
	Ermöglicht senden bzw. die Abfrage des Geschriebenen.

*/

private["_message"];
disableSerialization;

waitUntil {!isnull (findDisplay 9000)};

if ( BANK < 250000 ) exitWith { 
	//s/ystemChat "Du benötigst 250000€ um eine Nachricht zu senden!"; 
	["Du benötigst 250000€ um eine Nachricht zu senden!","RED",10] spawn life_fnc_notification_system;
}; // Hint if person haves no 50000 dollar
if !( life_channel_send ) exitWith { 
	//s/ystemChat "Warte 10 Minuten bevor du eine neue Nachricht sendest!"; 
	["Warte 10 Minuten bevor du eine neue Nachricht sendest!","RED",10] spawn life_fnc_notification_system;
}; //Gives Player the Hint to Wait 10 mins
if (playerSide isEqualTo civilian) then {
	BANK = BANK - 250000;
};
if (playerSide in [west,independent]) then {
	BANK = BANK - 25000;
};

_message = ctrlText 9001;
[[3,format ["Paradise News: %2",name player,_message]],"life_fnc_broadcast",true,false] call life_fnc_MP;
life_channel_send = false;

[] spawn
{
	sleep 600;
	life_channel_send = true;
};