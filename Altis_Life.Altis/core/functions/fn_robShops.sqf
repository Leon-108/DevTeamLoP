#include "..\..\script_macros.hpp"
private["_robber","_shop","_kassa","_ui","_progress","_pgText","_cP","_rip","_pos", "_robdelay", "_delay","_onWanted"];
_shop = [_this,0,ObjNull,[ObjNull]] call BIS_fnc_param; //The object that has the action attached to it is _this. ,0, is the index of object, ObjNull is the default should there be nothing in the parameter or it's broken
_robber = [_this,1,ObjNull,[ObjNull]] call BIS_fnc_param; //Can you guess? Alright, it's the player, or the "caller". The object is 0, the person activating the object is 1
_kassa = 1000; //The amount the shop has to rob, you could make this a parameter of the call (https://community.bistudio.com/wiki/addAction). Give it a try and post below ;)
_action = [_this,2] call BIS_fnc_param;//Action name
if (side _robber in [west, independent]) exitwith {
		//h/intSilent "Bei Dir hackts wohl, Du kannst doch nix überfallen! Oder seit wann arbeitest Du nicht beim Staat!"
		["Bei Dir hackts wohl, Du kannst doch nix überfallen! Oder seit wann arbeitest Du nicht beim Staat!","RED",10] spawn life_fnc_notification_system;
	};
if (life_firstrob) exitWith {
	//h/int "Jo man es war gerade Weltuntergang und es ist noch kein Geld in der Kasse!"
	["Jo man es war gerade Weltuntergang und es ist noch kein Geld in der Kasse!","RED",10] spawn life_fnc_notification_system;
};
if (servertime < life_nextrob) exitWith {
	//h/intSilent format ["Es wurde gerade schon eine Tankstelle überfallen, komm in %1 Minuten wieder vorbei!", [(life_nextrob - servertime),"MM:SS"] call BIS_fnc_secondsToString]
	[format ["Es wurde gerade schon eine Tankstelle überfallen, komm in %1 Minuten wieder vorbei!", [(life_nextrob - servertime),"MM:SS"] call BIS_fnc_secondsToString],"RED",10] spawn life_fnc_notification_system;
};
_robdelay = 900; // 900 Zeit die zwischen zwei Überfällen vergehen muss.
if(side _robber != civilian) exitWith { 
	//h/int "Du kannst hier niemanden Überfallen!" 
	["Du kannst hier niemanden Überfallen!","RED",10] spawn life_fnc_notification_system;
};
if(_robber distance _shop > 5) exitWith { 
	//h/int "Du musst 5m von dem Kassierer entfernt sein, um ihn auszurauben!" 
	["Du musst 5m von dem Kassierer entfernt sein, um ihn auszurauben!","RED",10] spawn life_fnc_notification_system;
};
_ret=[[serverTime,0],"TON_fnc_robshops"] spawn life_fnc_MP;

//if !(_kassa) then { _kassa = 1000; };
if (vehicle player != _robber) exitWith { 
	//h/int "Steig aus deinem Fahrzeug!" 
	["Steig aus deinem Fahrzeug!","RED",10] spawn life_fnc_notification_system;
};
if !(alive _robber) exitWith {};
if (currentWeapon _robber isEqualTo "") exitWith { 
	//h/int "HaHa, willst du mich verarschen? Verzieh dich du Idiot!" 
	["HaHa, willst du mich verarschen? Verzieh dich du Idiot!","RED",10] spawn life_fnc_notification_system;
};
_cops = (west countSide playableUnits);
if(_cops < 4) exitWith{
	//h/int "Es sind nicht genügend Polizeikräfte im Dienst!";
	["Es sind nicht genügend Polizeikräfte im Dienst!","RED",10] spawn life_fnc_notification_system;
};
if (_kassa isEqualTo 0) exitWith { 
	//h/int "Es ist kein Geld in der Kasse!" 
	["Es ist kein Geld in der Kasse!","RED",10] spawn life_fnc_notification_system;
};
_rip = true;
_onWanted = false;
_kassa = 150000 + round(random 150000);
_shop removeAction _action;
_chance = random(100);
if (_chance >= 33 && _chance < 66) then { [[1,format["ALARM! - Tankstelle: %1 wird ausgeraubt!", _shop]],"life_fnc_broadcast",west,false] spawn life_fnc_MP; };
if(_chance >= 66) then { 
	//h/int "Der Kassierer hat den stillen Alarm ausgelöst!"; 
	["Der Kassierer hat den stillen Alarm ausgelöst!","PINK",5] spawn life_fnc_notification_system;
	[[1,format["ALARM! - Tankstelle: %1 wird ausgeraubt!", _shop]],"life_fnc_broadcast",west,false] spawn life_fnc_MP; 
};
disableSerialization;
5 cutRsc ["life_progress","PLAIN"];
_ui = uiNameSpace getVariable "life_progress";
_progress = _ui displayCtrl 38201;
_pgText = _ui displayCtrl 38202;
_pgText ctrlSetText format["Überfall im Gange, halte dich in der Nähe auf (10m) (1%1)...","%"];
_progress progressSetPosition 0.01;
_cP = 0.01;
if(_rip) then
{
	life_nextrob = servertime + _robdelay;
	publicVariable "life_nextrob";
	while{true} do
	{
		sleep 1.5;
		_cP = _cP + 0.01;
		_progress progressSetPosition _cP;
		_pgText ctrlSetText format["Überfall im Gange, halte dich in der Nähe auf (10m) (%1%2)...",round(_cP * 100),"%"];
		_Pos = position player; // by ehno: get player pos
		if (_chance >= 66) then {
			_marker = createMarker ["Marker200", _Pos]; //by ehno: Place a Maker on the map
			"Marker200" setMarkerColor "ColorRed";
			"Marker200" setMarkerText "!Achtung! Überfall !Achtung!";
			"Marker200" setMarkerType "mil_warning";
		};
		if(_cP >= 1) exitWith {};
		if(_robber distance _shop > 10.5) exitWith { 
			deleteMarker "Marker200"; 
			//h/int "Du musst in 10m Nähe bleiben um zu Überfallen! - Die Kasse ist nun verschlossen."; 
			["Du musst in 10m Nähe bleiben um zu Überfallen! - Die Kasse ist nun verschlossen.","RED",10] spawn life_fnc_notification_system;
			5 cutText ["","PLAIN"]; _rip = false; 
		};
		if!(alive _robber) exitWith {deleteMarker "Marker200"; _rip = false; 5 cutText ["","PLAIN"];};
		if(life_istazed) exitWith {deleteMarker "Marker200"; _rip = false; 5 cutText ["","PLAIN"];};
		if(player getVariable ["Re-strained",FALSE]) exitWith { deleteMarker "Marker200"; _rip = false; 5 cutText ["","PLAIN"];};
		if (currentWeapon _robber isEqualTo "") exitWith { 
			//h/int "Hier nen Snickers, du wirst immer zur Diva, wenn du hungrig bist!";
			["Hier nen Snickers, du wirst immer zur Diva, wenn du hungrig bist!","RED",10] spawn life_fnc_notification_system;
			deleteMarker "Marker200"; _rip = false; 5 cutText ["","PLAIN"]; 
		};
	};
	if!(alive _robber) exitWith { _rip = false; deleteMarker "Marker200"; 5 cutText ["","PLAIN"];};
	if(life_istazed) exitWith {deleteMarker "Marker200"; _rip = false; 5 cutText ["","PLAIN"];};
	if(player getVariable ["Re-strained",FALSE]) exitWith { deleteMarker "Marker200"; _rip = false; 5 cutText ["","PLAIN"];};
	if (currentWeapon _robber isEqualTo "") exitWith {deleteMarker "Marker200"; _rip = false; 5 cutText ["","PLAIN"]; };
	if(_robber distance _shop > 10.5) exitWith { deleteMarker "Marker200"; 5 cutText ["","PLAIN"]; _rip = false; };
	5 cutText ["","PLAIN"];
	//t/itleText[format["Du hast $%1 gestohlen, flüchte bevor die Polizei eintrifft!",[_kassa] call life_fnc_numberText],"PLAIN"];
	[format["Du hast $%1 gestohlen, flüchte bevor die Polizei eintrifft!",[_kassa] call life_fnc_numberText],"PINK",5] spawn life_fnc_notification_system;
	deleteMarker "Marker200"; // by ehno delete maker
	CASH = CASH + _kassa;
	_rip = false;
	_run = [] spawn {
		life_use_atm = false;
		uisleep (30 + random(180));
		life_use_atm = true;
	};
};
if !(_onWanted) then {
    if!(_chance < 10) then {
        _chance = random 100; 
        if(_chance < 40) then {
            [[getPlayerUID _robber,name _robber,"261A"],"life_fnc_wantedAdd",false,false] spawn life_fnc_MP;
        };
    };
};
_action = _shop addAction["Ausrauben",life_fnc_robShops];	