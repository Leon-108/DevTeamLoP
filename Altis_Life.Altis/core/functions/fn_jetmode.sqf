/*
	File: fn_jetmode.sqf
	Author: Sebi /  mdf_feindflug ::: lostofparadise.de / global-gamer.com
	
	Description:
	Gibt dem Piloten Godmode und repariert den Jet
*/
_array = ["O_Plane_CAS_02_F","B_Plane_Fighter_01_Stealth_F"];
if ((player getVariable ["admin",0]) > 0) exitWith {};
while{true} do
{
    waitUntil{sleep 1; typeOf (vehicle player) in _array};
    player allowDamage false;
    //h/int "GODMODE AKTIV";
	["GODMODE AKTIV","PINK",5] spawn life_fnc_notification_system;
    // Position auslesen
    _setPos = [];
    if(surfaceIsWater position player) then {_setPos = getPosASL player} else {_setPos = getPosATL player};
    _near = nearestObjects[_setPos,_array,10];
    _nearJet = (_near select 0);
    if(!isNil "_nearJet") then {_nearJet setDamage 0};
    
    waitUntil{sleep 6; vehicle player isEqualTo player};
    player allowDamage true;
    //h/int "GODMODE INAKTIV";
	["GODMODE INAKTIV","PINK",5] spawn life_fnc_notification_system;
};