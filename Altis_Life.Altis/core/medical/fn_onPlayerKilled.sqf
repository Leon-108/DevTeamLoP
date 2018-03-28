#include "..\..\script_macros.hpp"
/*
	File: fn_onPlayerKilled.sqf
	Author: Bryan "Tonic" Boardwine
	
	Description:
	When the player dies collect various information about that player
	and pull up the death dialog / camera functionality.
*/
private["_unit","_killer","_medicsOnline"];

params [
	["_unit",ObjNull,[ObjNull]]
	,["_killer",ObjNull,[ObjNull]]
];
disableSerialization;
private _unitName = _unit getVariable ["realname",name _unit];
private _killerName = "";
private _vehicle = ObjNull;

if (!isNull _killer && {!(_killer isEqualTo _unit)}) then {
	_killerName = _killer getVariable ["realname",name _killer];
	if !(objectParent _killer isEqualTo _killer) then {_vehicle = objectParent _killer};
};

if !((vehicle _unit) isEqualTo _unit) then {
	if (isNull _vehicle) then {_vehicle = vehicle _unit};
	UnAssignVehicle _unit;
	_unit action ["getOut", vehicle _unit];
	_unit setPosATL [(getPosATL _unit select 0) + 3, (getPosATL _unit select 1) + 1, 0];
};

private _side = side _unit;
//Set some vars
_unit setVariable["Revive",FALSE,TRUE]; //Set the corpse to a revivable state.
_unit setVariable["name",profileName,TRUE]; //Set my name so they can say my name.
_unit setVariable["Re-strained",FALSE,TRUE];
_unit setVariable["Escorting",FALSE,TRUE];
_unit setVariable["transporting",FALSE,TRUE]; //Why the fuck do I have this? Is it used?
_unit setVariable["steam64id",(getPlayerUID player),true]; //Set the UID.
_unit setVariable["missingOrgan",FALSE,TRUE];
_unit setVariable["hasOrgan",FALSE,TRUE];

//Setup our camera view
life_deathCamera  = "CAMERA" camCreate (getPosATL _unit);
showCinemaBorder TRUE;
life_deathCamera cameraEffect ["Internal","Back"];
createDialog "DeathScreen";
life_deathCamera camSetTarget _unit;
life_deathCamera camSetRelPos [0,3.5,4.5];
life_deathCamera camSetFOV .5;
life_deathCamera camSetFocus [50,0];
life_deathCamera camCommit 0;

(findDisplay 7300) displaySetEventHandler ["KeyDown","if((_this select 1) isEqualto 1) then {true}"]; //Block the ESC menu

//Create a thread for something?
[_unit] spawn
{
	private["_maxTime","_RespawnBtn","_Timer","_unit"];
	disableSerialization;
	_unit = _this select 0;
	_RespawnBtn = ((findDisplay 7300) displayCtrl 7302);
	_Timer = ((findDisplay 7300) displayCtrl 7301);
	
//Anfang Medic Timer
	_medicsOnline = {_x != player && side _x isEqualto independent} count playableUnits;
	if(_medicsOnline > 0)then{
		life_respawn_timer = 3; //3 Minuten, kann beliebig editiert werden!
	}else{
		life_respawn_timer = 1; //1 Minuten, kann beliebig editiert werden!
		if ( playerSide isEqualTo independent) then {life_respawn_timer = 0.16667;};
	};
	
//Ende Medic Timer
	
	_maxTime = time + (life_respawn_timer * 60);
	_RespawnBtn ctrlEnable false;
	waitUntil {_Timer ctrlSetText format[localize "STR_Medic_Respawn",[(_maxTime - time),"MM:SS"] call BIS_fnc_secondsToString]; 
	round(_maxTime - time) <= 0 OR isNull _unit};
	_RespawnBtn ctrlEnable true;
	_Timer ctrlSetText localize "STR_Medic_Respawn_2";
};

0 spawn life_fnc_deathScreen;

//Create a thread to follow with some what precision view of the corpse.
[_unit] spawn
{
	private["_unit"];
	_unit = _this select 0;
	waitUntil {if(speed _unit isEqualto 0) exitWith {true}; life_deathCamera camSetTarget _unit; life_deathCamera camSetRelPos [0,3.5,4.5]; life_deathCamera camCommit 0;};
};

//Make the killer wanted
if(!isNull _killer && {!(_killer isEqualTo _unit)} && {!(side _killer isEqualTo west)} && {alive _killer}) then {
	if(vehicle _killer isKindOf "LandVehicle") then {
		[[getPlayerUID _killer,_killer getVariable["realname",name _killer],"187V"],"life_fnc_wantedAdd",false,false] spawn life_fnc_MP;
		//Get rid of this if you don't want automatic vehicle license removal.
		if(!local _killer) then {
			[[2],"life_fnc_removeLicenses",_killer,FALSE] spawn life_fnc_MP;
		};
	} else {
        if (!(_killer distance (getMarkerPos "gang_area_1") < 2000) && !(_unit distance (getMarkerPos "gang_area_1") < 2000)) then {
            [[getPlayerUID _killer,_killer getVariable["realname",name _killer],"187"],"life_fnc_wantedAdd",false,false] spawn life_fnc_MP;
            if(!local _killer) then {
                [[3],"life_fnc_removeLicenses",_killer,FALSE] spawn life_fnc_MP;
            };
        };
	};
	["killed",_unitName,_killerName,_vehicle] call life_fnc_deathmessage;
} else {
	if(side _killer isEqualTo west && !(playerSide isEqualTo west)) then {
		["copkill",_unitName,_killerName,_vehicle] call life_fnc_deathmessage;
	} else {
		["suicide",_unitName,_killerName,_vehicle] call life_fnc_deathmessage;
	};
};

//Killed by cop stuff...
if(side _killer isEqualto west && !(playerSide isEqualTo west)) then {
	life_copRecieve = _killer;
	//Did I rob the federal reserve?
	if(!life_use_atm && {CASH > 0}) then {
		[format[localize "STR_Cop_RobberDead",[CASH] call life_fnc_numberText],"life_fnc_broadcast",true,false] spawn life_fnc_MP;
		CASH = 0;
	};
};

if(!isNull _killer && {_killer != _unit}) then {
	life_removeWanted = true;
};
_unit enableFatigue false;
_unit enableStamina false;
//_unit setCustomAimCoef 0;
[_unit] call life_fnc_dropItems;
life_save_gear = [player] call life_fnc_fetchDeadGear;
life_hunger = 100;
life_thirst = 100;
life_carryWeight = 0;
CASH = 0;

[] call life_fnc_hudUpdate; //Get our HUD updated.
[[player,life_settings_enableSidechannel,playerSide],"TON_fnc_managesc",false,false] spawn life_fnc_MP;
if (playerSide isEqualTo west) then {_side="west"};
if (playerSide isEqualTo independent) then {_side="independent"};
if (playerSide isEqualTo civilian) then {_side="civilian"};
[[player,(name player),(getPlayerUID player),_side],"DB_fnc_logDeath",false,false] spawn life_fnc_MP;

[0] call SOCK_fnc_updatePartial;
life_gear =[];
[7] call SOCK_fnc_updatePartial;