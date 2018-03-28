private["_unit"];
_unit = lbData[2902,lbCurSel (2902)];
_unit = call compile format["%1", _unit];
if(isNil "_unit") exitwith {};
if(isNull _unit) exitWith {};
if(name player isEqualTo name _unit) exitwith {};

(vehicle _unit) switchCamera "EXTERNAL";
//h/int "Drücke Numpad 5 um den Beobachtermodus zu beenden";
["Drücke Numpad 5 um den Beobachtermodus zu beenden","PINK",5] spawn life_fnc_notification_system;
//t/itleText ["Zuschauen...","PLAIN DOWN"];titleFadeOut 4;
["Zuschauen...","WHITE",5] spawn life_fnc_notification_system;
AH_TEMPBIND = (findDisplay 46) displayAddEventHandler ["KeyDown","if((_this select 1) isEqualTo 76) then {(findDisplay 46) displayRemoveEventHandler ['KeyDown',AH_TEMPBIND];player switchCamera 'INTERNAL';[""Beobachten beendet!"",""WHITE"",5] spawn life_fnc_notification_system;};false"];