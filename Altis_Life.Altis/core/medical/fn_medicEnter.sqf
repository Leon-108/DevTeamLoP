/*
File: fn_copmedicEnter.sqf
Author: I dunno, I do not care!
Description:
Allows Cops and Medics to enter locked Vehicles
*/
if !(playerSide in [west,independent]) exitWith {};
private _position = _this select 3;
switch (_position) do {
	case "driver": {
		cursorTarget lock false;
		player action ["getInDriver", cursorTarget];
		cursorTarget lock true;
	};
	case "passenger": {
		private _freeposition = 0;
		{
			if (cursorTarget isKindOf "Ship" || cursorTarget isKindOf "landVehicle" || cursorTarget isKindOf "Air") then {
				_freeposition = cursorTarget emptyPositions _x;
				if (_freeposition > 0) exitWith {
					cursorTarget lock false;
					_pos = call {
						if (_x isEqualTo "Commander") exitWith {moveInCommander};
						if (_x isEqualTo "Gunner") exitWith {moveInGunner};
						if (_x isEqualTo "Cargo") exitWith {moveInCargo};
					};
					player _pos cursorTarget;
					cursorTarget lock true;
				};
			};
		} foreach ["Commander", "Gunner", "Cargo"];
	};
	case "exit": {
		_veh = vehicle player;
		_veh lock false;
		player moveOut _veh;
		_veh lock true;
	};
};