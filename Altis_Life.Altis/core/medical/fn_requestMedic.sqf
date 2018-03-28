#include "..\..\script_macros.hpp"
/*
	File: fn_requestMedic.sqf
	Author: Bryan "Tonic" Boardwine
	Edit: Sebi, lostofparadise.de
	Description:
	N/A
*/
private["_medicsOnline"];
_medicsOnline = {_x != player && {side _x isEqualto independent} && {alive _x}} count playableUnits > 0; //Check if medics (indep) are in the room.

if(_medicsOnline) then {
	//There is medics let's send them the request.
	[[life_corpse,profileName],"life_fnc_medicRequest",independent,FALSE] spawn life_fnc_MP;
};

//Create a thread to monitor duration since last request (prevent spammage).
[] spawn 
{
	((findDisplay 7300) displayCtrl 7303) ctrlEnable false;
	sleep (15 * 60);
	((findDisplay 7300) displayCtrl 7303) ctrlEnable true;
};