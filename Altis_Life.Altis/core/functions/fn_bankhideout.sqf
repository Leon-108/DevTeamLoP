#include "..\..\script_macros.hpp"
/*
	File: fn_bankhideout.sqf
	Author: Yannick "EvoPanker" Scheffer
	
	Description:
	Script for a Random Route.
*/
private["_item","_value","_robdelay","_civilian","_cops","_rip","_chance","_weight"];
params ["_shop","_robber","_action"];
_robdelay = 10; // 10 Sekunden Zeit die zwischen zwei Diebstählen vergehen muss.
if (side _robber in [west, independent]) exitwith {
		//h/intSilent "Bei Dir hackts wohl, Du kannst doch nix überfallen! Oder seit wann arbeitest Du nicht beim Staat!"
		["Bei Dir hackts wohl, Du kannst doch nix stehlen! Oder seit wann arbeitest Du nicht beim Staat!","RED",10] spawn life_fnc_notification_system;
};
if(servertime < life_bankhideout_wait) exitWith {
	["Jemand durchsucht schon ein Schließfach!","RED",5] spawn life_fnc_notification_system;
};
if(_robber distance _shop > 5) exitWith {
	["Dein Arme sind nicht so lang!","RED",5] spawn life_fnc_notification_system;
};
if (vehicle player != _robber) exitWith { 
	["Steig aus deinem Fahrzeug!","RED",10] spawn life_fnc_notification_system;
};
if !(alive _robber) exitWith {};
_civilian = (civilian countSide playableUnits);
_cops = (west countSide playableUnits);
if((_civilian + _cops) < 15) exitWith{
	//h/int "Es sind nicht genügend Polizeikräfte im Dienst!";
	["Niemand könnte dich stören und das wäre ja langweilig oder nicht?!","RED",10] spawn life_fnc_notification_system;
};
_rip = true;
_shop removeAction _action;
_chance = random(99);
if(_chance >= 0 && _chance < 10) then {_item = "goldBar"; _value = 1;};
if(_chance >= 10 && _chance < 20) then {_item = "cargo1_p"; _value = 2;};
if(_chance >= 20 && _chance < 25) then {_item = "cargo2_p"; _value = 5;};
if(_chance >= 25 && _chance < 30) then {_item = "probe_p"; _value = 5;};
if(_chance >= 30 && _chance < 35) then {_item = "pistol_c"; _value = 1;};
if(_chance >= 35 && _chance < 37) then {_item = "meth_p"; _value = 20;};
if(_chance >= 37 && _chance < 42) then {_item = "rifle_c"; _value = 1;};
if(_chance >= 42 && _chance < 44) then {_item = "kaviar_p"; _value = 20;};
if(_chance >= 44 && _chance < 64) then {_item = "papier_p"; _value = 5;};
if(_chance >= 64 && _chance < 69) then {_item = "whiskey_c"; _value = 10;};
if(_chance >= 69 && _chance < 71) then {_item = "pipe_c"; _value = 2;};
if(_chance >= 71 && _chance < 72) then {_item = "nuclear_p"; _value = 1;};
if(_chance >= 72 && _chance < 82) then {_item = "gold_p"; _value = 5;};
if(_chance >= 82 && _chance < 87) then {_item = "kupfer_p"; _value = 2;};
if(_chance >= 87 && _chance < 92) then {_item = "morphin_p"; _value = 10;};
if(_chance >= 92 && _chance < 94) then {_item = "heroin_p"; _value = 25;};
if(_chance >= 94 && _chance < 100) then {_item = "plastik_p"; _value = 15;};

disableSerialization;
5 cutRsc ["life_progress","PLAIN"];
_ui = uiNameSpace getVariable "life_progress";
_progress = _ui displayCtrl 38201;
_pgText = _ui displayCtrl 38202;
_pgText ctrlSetText format["Diebstahl im Gange, halte dich in der Nähe auf (5m) (1%1)...","%"];
_progress progressSetPosition 0.01;
_cP = 0.01;
if(_rip) then
{
	life_bankhideout_wait = servertime + _robdelay;
	publicVariable "life_bankhideout_wait";
	_chancemessage = random(100);
	if(servertime > life_bankhideout_messagewait && _chancemessage < 66) then {
		life_bankhideout_messagewait = (servertime + (10*60));
		publicVariable "life_bankhideout_messagewait";
		[[1,"Ein Schließfach wird geplündert!"],"life_fnc_broadcast",west,false] spawn life_fnc_MP;
		[[1,"Ein Schließfach wird geplündert!"],"life_fnc_broadcast",civilian,false] spawn life_fnc_MP;
	};
	while{true} do
	{
		sleep 0.5;
		_cP = _cP + 0.05;
		_progress progressSetPosition _cP;
		_pgText ctrlSetText format["Diebstahl im Gange, halte dich in der Nähe auf (5m) (%1%2)...",round(_cP * 100),"%"];
		if(_cP >= 1) exitWith {};
		if(_robber distance _shop > 5.5) exitWith { 
			["Du musst in 5m Nähe bleiben um zu stehlen! - Das Schließfach ist nun verschlossen.","RED",10] spawn life_fnc_notification_system;
			5 cutText ["","PLAIN"]; _rip = false; 
		};
		if!(alive _robber) exitWith {_rip = false; 5 cutText ["","PLAIN"];};
		if(life_istazed) exitWith {_rip = false; 5 cutText ["","PLAIN"];};
		if(player getVariable ["Re-strained",FALSE]) exitWith {_rip = false; 5 cutText ["","PLAIN"];};
		/*if (currentWeapon _robber isEqualTo "") exitWith {
			["Hier nen Snickers, du wirst immer zur Diva, wenn du hungrig bist!","RED",10] spawn life_fnc_notification_system;
			_rip = false; 5 cutText ["","PLAIN"]; 
		};*/
	};
	if!(alive _robber) exitWith { _rip = false;5 cutText ["","PLAIN"];};
	if(life_istazed) exitWith {_rip = false; 5 cutText ["","PLAIN"];};
	if(player getVariable ["Re-strained",FALSE]) exitWith {_rip = false; 5 cutText ["","PLAIN"];};
	//if (currentWeapon _robber isEqualTo "") exitWith {_rip = false; 5 cutText ["","PLAIN"]; };
	if(_robber distance _shop > 5.5) exitWith {5 cutText ["","PLAIN"]; _rip = false; };
	5 cutText ["","PLAIN"];
	_weight = ([_item] call life_fnc_itemWeight) * (_value);
	if((life_maxWeight - life_carryWeight) < _weight) then {
		_value = (floor((life_maxWeight - life_carryWeight) / ([_item] call life_fnc_itemWeight)));
		["Dein Inventar könnte voll sein!","RED",10] spawn life_fnc_notification_system;
	};
	[true,_item,_value] call life_fnc_handleInv;
	_type = M_CONFIG(getText,"VirtualItems",_item,"displayName");
	[format["Du hast %1 %2 gefunden!",_value,(localize _type)],"GREEN",5] spawn life_fnc_notification_system;
	_rip = false;
};
_action = _shop addAction["Schließfach durchsuchen",life_fnc_bankhideout,"",0,FALSE,FALSE,"",' vehicle player == player && player distance _target < 5 '];
