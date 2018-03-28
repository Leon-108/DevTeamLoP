private["_ui","_healthbar","_foodbar","_waterbar","_food","_water","_health","_realtime"];
disableSerialization;

_ui = uiNameSpace getVariable ["playerHUD",displayNull];
if(isNull _ui) then {[] call life_fnc_hudSetup;};
_food = _ui displayCtrl 23500;
_foodbar = _ui displayCtrl 23501;
_water = _ui displayCtrl 23510;
_waterbar = _ui displayCtrl 23511;
_health = _ui displayCtrl 23515;
_healthbar = _ui displayCtrl 23516;
_realtime = _ui displayCtrl 23517;
/*Update food*/
_food ctrlSetPosition [safeZoneX+safeZoneW-0.06,safeZoneY+safeZoneH-0.098];
_food ctrlSetText format["%1", life_hunger];
_food ctrlCommit 0;
_foodbar progressSetPosition (life_hunger / 100);
/*Update Water*/
_water ctrlSetPosition [safeZoneX+safeZoneW-0.06,safeZoneY+safeZoneH-0.142];
_water ctrlSetText format["%1", life_thirst];
_water ctrlCommit 0;
_waterbar progressSetPosition (life_thirst / 100);
/*Update Health*/
_health ctrlSetPosition [safeZoneX+safeZoneW-0.06,safeZoneY+safeZoneH-0.187];
_health ctrlSetText format["%1", round((1 - (damage player)) * 100)];
_health ctrlCommit 0;_healthbar progressSetPosition (-(damage player - 1));
/*Realtime*/
_Jahr = life_real_time select 0;
_Monat = life_real_time select 1;
_Tag = life_real_time select 2;
_Stunde = life_real_time select 3;
_Minute = life_real_time select 4;
_Tag = if (_Tag < 10) then {format ["0%1",_Tag]} else {_Tag};
_Minute = if (_Minute < 10) then {format ["0%1",_Minute]} else {_Minute};
_Monat = if (_Monat < 10) then {format ["0%1",_Monat]} else {_Monat};
_Stunde = if (_Stunde < 10) then {format ["0%1",_Stunde]} else {_Stunde};
_realtime ctrlSetPosition [safeZoneX+safeZoneW-0.298,safeZoneY+safeZoneH-0.048];
_realtime ctrlSetText format["Uhrzeit: %1:%2 Datum: %3.%4.%5",_Stunde,_Minute,_Tag,_Monat,_Jahr];
_realtime ctrlCommit 0;
