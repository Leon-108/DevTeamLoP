#include "..\..\script_macros.hpp"
/*
    File: fn_handleDamage.sqf
    Author: Bryan "Tonic" Boardwine

    Description:
    Handles damage, specifically for handling the 'tazer' pistol and nothing else.
*/
params [
    ["_unit",objNull,[objNull]],
    ["_part","",[""]],
    ["_damage",0,[0]],
    ["_source",objNull,[objNull]],
    ["_projectile","",[""]],
    ["_index",0,[0]]
];

//Handle the tazer first (Top-Priority).
if (!isNull _source) then {
    if (_source != _unit) then {
        if (currentWeapon _source in ["hgun_Pistol_heavy_01_F","arifle_TRG20_F","LMG_03_F"] && _projectile in ["B_45ACP_Ball","B_556x45_Ball_Tracer_Yellow"] && (side _source isEqualTo west || ((_source getVariable ["admin",0]) > 0) ||((_source getVariable ["tazer",0]) isEqualTo 1))) then {
            if (((side _source isEqualTo west || ((_source getVariable ["tazer",0]) isEqualTo 1))&& playerSide != west) || ((_source getVariable ["admin",0]) > 0)) then {
                _damage = 0;
                if(!life_istazed && !(_unit getVariable["Re-strained",false]) && ((_unit getVariable ["admin",0]) isEqualTo 0)) then {
                    private ["_distance"];
                    _distance = 200;
                    //if (_projectile isEqualTo "B_556x45_dual") then {_distance = 200;};
                    if (_unit distance _source < _distance) then {
                        if !(isNull objectParent player) then {
                            if (typeOf (vehicle player) in ["B_Quadbike_01_F","C_Kart_01_Blu_F","C_Kart_01_Fuel_F","C_Kart_01_Red_F","C_Kart_01_Vrana_F","C_Kart_01_F","B_Heli_Light_01_F"]) then {
								moveOut _unit;
								[_unit,_source] spawn life_fnc_tazed;
                            };
							if (typeOf (vehicle player) in ["O_T_LSV_02_unarmed_F","B_LSV_01_unarmed_F","C_Offroad_02_unarmed_F"]) then {
								[_unit,_source] spawn life_fnc_tazed;
                            };
                        } else {
                            [_unit,_source] spawn life_fnc_tazed;
                        };
                    };
                };
            };

            //Temp fix for super tasers on cops.
            if (side _source isEqualTo west && (playerSide isEqualTo west || playerSide isEqualTo independent)) then {
                _damage = 0;
            };
        };
    };
};
if (vehicle _unit isEqualTo _unit) then
{
    if ( _source isKindOf "Car" OR _source isKindOf "Boat" ) then {
        _damage = 0;
        [_unit,_source] spawn life_fnc_vdmed; //_Source is Vehicle, Not a player driving a vehicle
    } else {    
        _vehicle = vehicle _source;
        if (driver _vehicle isEqualTo _source) then {
            if (_vehicle isKindOf "Car" OR _vehicle isKindOf "Boat") then {
                _damage = 0;
                [_unit,_source] spawn life_fnc_vdmed;
            };
        };
    };
};
[] spawn life_fnc_hudUpdate;
_damage;