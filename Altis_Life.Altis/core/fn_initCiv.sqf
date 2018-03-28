/*
	File: fn_initCiv.sqf
	Author: Bryan "Tonic" Boardwine
	
	Description:
	Initializes the civilian.
*/
private["_spawnPos","_slotName"];
_slotName = format["%1",player];
civ_spawn_1 = nearestObjects[getMarkerPos  "civ_spawn_1", ["Land_i_Shop_01_V1_F","Land_i_Shop_02_V1_F","Land_i_Shop_03_V1_F","Land_i_Stone_HouseBig_V1_F"],225];
civ_spawn_2 = nearestObjects[getMarkerPos  "civ_spawn_2", ["Land_i_Shop_01_V1_F","Land_i_Shop_02_V1_F","Land_i_Shop_03_V1_F","Land_i_Stone_HouseBig_V1_F"],250];
civ_spawn_3 = nearestObjects[getMarkerPos  "civ_spawn_3", ["Land_i_Shop_01_V1_F","Land_i_Shop_02_V1_F","Land_i_Shop_03_V1_F","Land_i_Stone_HouseBig_V1_F"],250];
civ_spawn_4 = nearestObjects[getMarkerPos  "civ_spawn_4", ["Land_i_Shop_01_V1_F","Land_i_Shop_02_V1_F","Land_i_Shop_03_V1_F","Land_i_Stone_HouseBig_V1_F"],250];
civ_spawn_7 = nearestObjects[getMarkerPos  "civ_spawn_7", ["Land_i_Shop_01_V1_F","Land_i_Shop_02_V1_F","Land_i_Shop_03_V1_F","Land_i_Stone_HouseBig_V1_F"],250];
rebel_spawn = nearestObjects[getMarkerPos  "rebel_spawn", ["Land_i_Shop_01_V1_F","Land_i_Shop_02_V1_F","Land_i_Shop_03_V1_F","Land_i_Stone_HouseBig_V1_F"],250];
pa_spawn = nearestObjects[getMarkerPos  "pa_spawn", ["Land_Offices_01_V1_F"],100];
waitUntil {!(isNull (findDisplay 46))};

if((_slotName in ["civ_91","civ_92","civ_93","civ_94","civ_95"]) && !((getPlayerUID player) in ["76561198079938959",	//Ewald
																								"76561198073604498",	//moeck
																								"76561198015730869",	//Richi
																								"76561198117772792",	//Phil Ace
																								"76561198125123009",	//Kemper
																								"76561198191039828"		//Tom
																								])) exitWith {
["Notwhitelisted",FALSE,TRUE] call BIS_fnc_endMission;
uiSleep 35;
};
if (life_is_alive && !life_is_arrested) then {
    /* Spawn at our last position */
    player setVehiclePosition [life_civ_position, [], 0, "CAN_COLLIDE"];
	private["_handle"];
	_handle = [] spawn life_fnc_initIntro;
	[] execVM "script\monitor.sqf";
} else {
	if (!life_is_alive && !life_is_arrested) then {
		[] call life_fnc_spawnMenu;
		waitUntil{!isNull (findDisplay 38500)}; //Wait for the spawn selection to be open.
		waitUntil{isNull (findDisplay 38500)}; //Wait for the spawn selection to be done.
	} else {
        if (life_is_arrested) then {
            life_is_arrested = false;
            [player,true] spawn life_fnc_jail;
        };
    };
};

player addRating 9999999;

player addEventHandler ["FiredMan", {
	params ["_unit", "_weapon", "", "", "", "", "_projectile",""];
	_DeleteProjectile = false;
	_SafeZones = ["peaches_1","peaches_2","peaches_3","apple_1","apple_2","apple_3","apple_4"];
	{
		_distance = _unit distance2D (getMarkerPos _x);
		if (_distance < 50) then {_DeleteProjectile = true;};
	} foreach _SafeZones;
	_distance = _unit distance2D (getMarkerPos "rebel area_3");
	if(_distance < 450 && !((_unit getVariable ["admin",0]) > 0)) then {_DeleteProjectile = true;};
	if (_DeleteProjectile) then {
		deleteVehicle _projectile;
		["Du verschwendest deine Kugeln, hier wird nicht geschossen!","PINK",5] spawn life_fnc_notification_system;
	};	
}];

if (license_civ_tazer) then {player setVariable ["tazer",1,true]; } else {player setVariable ["tazer",0,true];};
[player, uniform player] call life_fnc_equipGear;
[] execVM "welcome.sqf";
//sleep 10;
//[0,player] call life_fnc_vipinfo;
//sleep 10;
//[] execVM "welcomeNotification.sqf";
//sleep 2;
//[] call life_fnc_disableRope;