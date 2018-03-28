private["_unit","_coords"];
_unit = lbData[2902,lbCurSel (2902)];
_unit = call compile format["%1", _unit];
if(isNil "_unit") exitwith {};
if(isNull _unit) exitWith {};
if(name player isEqualto name _unit) exitwith {};

_coords = position player;
//Hat einen Spieler zu sich geportet
_coords set [0,(_coords select 0) + 3];
if(vehicle player isEqualto player) then 
{
_unit setPos [_coords select 0, _coords select 1, 0];
} else {
vehicle _unit setPos [_coords select 0, _coords select 1, 0];	
_unit setPos [_coords select 0, _coords select 1, 0];
};
//h/int format["Du hast %1 zu dir teleportiert!", name _unit];
[format["Du hast %1 zu dir teleportiert!", name _unit],"WHITE",5] spawn life_fnc_notification_system;