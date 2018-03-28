#include "..\..\script_macros.hpp"
/*
	File: fn_blackjack.sqf
	Author: Le Rebellion KRinK
	
	Description:
	Create the Blackjack Guy
*/
_store = blackjack;
_denied1 = false;
_price = 25000;
_robberycash = 0;

if(CASH < _price) exitWith {
	//h/int "Du hast nicht genug Geld dabei, eine Runde kostet $25000";
	["Du hast nicht genug Geld dabei, eine Runde kostet $25000","RED",10] spawn life_fnc_notification_system;
};
CASH = CASH - _price;
removeAllActions blackjack;
//h/int "Du bist am Zug!";
_number = ceil(random 10);
_pplayer = _this select 0;
life_action_inUse = true;
uisleep 2;
_timer = time + (1 * 10);	
_toFar = false;
_vault = [_this,0,ObjNull,[ObjNull]] call BIS_fnc_param;
["Du musst 5 Meter am Tisch bleiben und 10 Sekunden warten bis du dran bist!","PURPLE",5] spawn life_fnc_notification_system;
while {true} do
{
	//Timer display (TO BE REPLACED WITH A NICE GUI LAYER)
	//_countDown = if(round(_timer - time) > 60) then {format["%1 minute(s)",round(round(_timer - time) / 60)]} else {format["%1 second(s)",round(_timer - time)]};
	//h/intSilent format["Du musst am Tisch bleiben und warten bis du dran bist!\n\nTime Remaining:\n %1\n\nDistance: %2m",_countDown,round(player distance _vault)];
	if(player distance _vault > 5) exitWith {_toFar = true;};
	if((round(_timer - time)) < 1) exitWith {};
	if(!alive player) exitWith {};
	if(life_istazed) exitWith {};
	sleep 0.1;
};
call {
	if (_toFar) exitWith {
		["Du bist zu weit entfernt, bleib am Tisch","RED",10] spawn life_fnc_notification_system;
		_denied1 = false;
		life_action_inUse = false;
	};
	if (!alive player) exitWith	{
		["Das Spiel ist schiefgelaufen, weil du gestorben bist.","RED",10] spawn life_fnc_notification_system;
		_denied1 = false;
		life_action_inUse = false;
	};
	if (life_istazed) exitWith {
		["Du wurdest getazed, Spiel fehlgeschlagen!","RED",10] spawn life_fnc_notification_system;
		_denied1 = false;
		life_action_inUse = false;
	};
	if ((round(_timer - time)) < 1) exitWith {
		if (_number isEqualTo 0) then {_robberycash = 50000; ["19! Sauber, immerhin gewonnen!","PURPLE",5] spawn life_fnc_notification_system;};
		if (_number isEqualTo 1) then {_robberycash = 0; ["18! Leider verloren!","PURPLE",5] spawn life_fnc_notification_system;};
		if (_number isEqualTo 2) then {_robberycash = 0; ["8! Versager...","PURPLE",5] spawn life_fnc_notification_system;};						
		if (_number isEqualTo 3) then {_robberycash = 0; ["14! Das geht aber besser...","PURPLE",5] spawn life_fnc_notification_system;};
		if (_number isEqualTo 4) then {_robberycash = 0; ["16! Fast! Los, noch eine Runde..!","PURPLE",5] spawn life_fnc_notification_system;};
		if (_number isEqualTo 5) then {_robberycash = 0; ["12! Unfassbar, meine Oma spielt besser als du!","PURPLE",5] spawn life_fnc_notification_system;};
		if (_number isEqualTo 6) then {_robberycash = 0; ["13! Wieder verloren.. Wirklich schlecht..!","PURPLE",5] spawn life_fnc_notification_system;};
		if (_number isEqualTo 7) then {_robberycash = 75000; ["20! Fast perfekt! Du hast gewonnen!","PURPLE",5] spawn life_fnc_notification_system;};
		if (_number isEqualTo 8) then {_robberycash = 0; ["10! Damit gewinnst du... gar nichts!","PURPLE",5] spawn life_fnc_notification_system;};
		if (_number isEqualTo 9) then {_robberycash = 0; ["11! L wie Loooooser!","PURPLE",5] spawn life_fnc_notification_system;};
		if (_number isEqualTo 10) then {_robberycash = 100000; ["21!!! Jackpot!!","PURPLE",5] spawn life_fnc_notification_system;};
		[format["Du hast $%1 gewonnen.", _robberycash],"PURPLE",5] spawn life_fnc_notification_system;
		CASH = CASH + _robberycash;
		_denied1 = false;
		life_action_inUse = false;
	};	
};
blackjack addAction["Black Jack spielen ($25000)",life_fnc_blackjack,"blackjack"];
life_action_inUse = false;