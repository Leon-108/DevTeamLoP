private["_unit","_coords"];
_unit = lbData[2902,lbCurSel (2902)];
_unit = call compile format["%1", _unit];
if(isNil "_unit") exitwith {};
if(isNull _unit) exitWith {};
if(name player isEqualTo name _unit) exitwith {};


_coords = position _unit;
//Hat sich zu einem Spieler geportet!
_coords set [0,(_coords select 0) + 10];
player setPos [_coords select 0, _coords select 1, 0];		//player setPos [_coords]; ??
//h/int format["Teleportiert zu %1", name _unit];
[format["Teleportiert zu %1", name _unit],"WHITE",5] spawn life_fnc_notification_system;