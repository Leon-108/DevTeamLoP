#include "..\..\script_macros.hpp"
/*
	File: fn_dealerMarkers.sqf
	Author: moeck (Lost on Paradise
	
	Description:
	Marks random drug dealers on the map when it's open.
*/
private _dealers = [];

uisleep 0.25;
if(visibleMap) then {
	//Loop through and create markers.
	{
		_dealer = createMarkerLocal [(_x select 1), (_x select 2)];
		_dealer setMarkerColorLocal (_x select 4);
		_dealer setMarkerTypeLocal "mil_dot";
		_dealer setMarkerTextLocal (_x select 3);
		_dealers pushBack _dealer;
	} foreach life_dealerMarkers;
	
	waitUntil {!visibleMap};
	{deleteMarkerLocal _x;} foreach _dealers;
};