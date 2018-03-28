#include "..\..\script_macros.hpp"
/*
    File: fn_updateViewDistance.sqf
    Author: Bryan "Tonic" Boardwine
    
    Description:
    Updates the view distance dependant on whether the player is on foot, a car or an aircraft.
*/
call {
    if ((vehicle player) isKindOf "Man") exitWith {setViewDistance life_settings_viewDistanceFoot};
    if ((vehicle player) isKindOf "LandVehicle") exitWith {setViewDistance life_settings_viewDistanceCar};
    if ((vehicle player) isKindOf "Ship") exitWith {setViewDistance life_settings_viewDistanceCar};
    if ((vehicle player) isKindOf "Air") exitWith {setViewDistance life_settings_viewDistanceAir};
};