#include "..\..\script_macros.hpp"
/*
File: fn_RepaintVehicle.sqf
Author: MooN-Gaming modified by moeck


Description: Does the active repaint man....read the title!
*/
private["_index","_veh","_color","_color_index","_vehicle","_ctype","_texture"];
if(!isNull (findDisplay 2300)) then {

	_vehicle=lbdata [2302,lbcursel 2302];
	_veh = nearestObject [position player, _vehicle];
	_color = lbcursel 2303;
	_color_index = lbValue[2303,_color];
	if ((lbSize 2303)-1 isEqualto -1) exitWith {
		//h/int format["Du willst ernsthaft ein Fahrzeug ohne Farbe lackieren? Das lassen wir mal lieber!"];
		["Du willst ernsthaft ein Fahrzeug ohne Farbe lackieren? Das lassen wir mal lieber!","RED",10] spawn life_fnc_notification_system;	
	};
	closeDialog 0;


	_baseprice = 20000;
	if (side player isEqualto civilian) then {
		_baseprice = M_CONFIG(getNumber,"LifeCfgVehicles",typeOf (_veh),"repaintprice");
	};
	if (cheaprepaint) then {_baseprice = 100;};
	_vehicleData = _veh getVariable["vehicle_info_owners",[]];
	_vehOwner = (_vehicleData select 0) select 0;
	if(CASH < _basePrice) exitWith {
		//h/int format["Du hast keine %1$ um den Lackierer zu bezahlen.",_baseprice];
		[format["Du hast keine %1$ um den Lackierer zu bezahlen.",_baseprice],"RED",10] spawn life_fnc_notification_system;	
	};


	if(isNil {_vehicleData}) exitWith {
		//h/int "Es gibt keine Infos zu diesem Fahrzeug, es ist entweder gemietet oder gecheated."
		["Es gibt keine Infos zu diesem Fahrzeug, es ist entweder gemietet oder gecheated.","RED",10] spawn life_fnc_notification_system;	
	};
	if ((getPlayerUID player) != _vehOwner) exitWith {
		//h/int "Du bist nicht der Besitzer des Fahrzeugs das lackiert werden soll."
		["Du bist nicht der Besitzer des Fahrzeugs das lackiert werden soll.","RED",10] spawn life_fnc_notification_system;	
	};


	life_action_inUse = true;


	//[player,"spraycan"] call life_fnc_globalSound;


	_displayName = getText(configFile >> "CfgVehicles" >> (typeOf _veh) >> "displayName");
	_upp = format["Lackiere %1",_displayName];
	//Setup our progress bar.
	disableSerialization;
	5 cutRsc ["life_progress","PLAIN"];
	_ui = uiNameSpace getVariable "life_progress";
	_progress = _ui displayCtrl 38201;
	_pgText = _ui displayCtrl 38202;
	_pgText ctrlSetText format["%2 (1%1)...","%",_upp];
	_progress progressSetPosition 0.01;
	_cP = 0.01;


	while{true} do {
		if(animationState player != "AinvPknlMstpSnonWnonDnon_medic_1") then {
			[[player,"AinvPknlMstpSnonWnonDnon_medic_1"],"life_fnc_animSync",true,false] spawn life_fnc_MP;
			player playMoveNow "AinvPknlMstpSnonWnonDnon_medic_1";
		}; 
		sleep 0.29;
		_cP = _cP + 0.01;
		_progress progressSetPosition _cP;
		_pgText ctrlSetText format["%3 (%1%2)...",round(_cP * 100),"%",_upp]; 
		if(_cP >= 1) exitWith {};
		if(!alive player) exitWith {};
		if(player != vehicle player) exitWith {};
		if(life_interrupted) exitWith {};
	};


	life_action_inUse = false;
	5 cutText ["","PLAIN"];
	player playActionNow "stop";
	if(life_interrupted) exitWith {
		life_interrupted = false; 
		["Abgebrochen!","RED",10] spawn life_fnc_notification_system;	
		life_action_inUse = false;
	};

	life_action_inUse = false;
	5 cutText ["","PLAIN"];
	player playActionNow "stop";
	if(life_interrupted) exitWith {
		life_interrupted = false; 
		["Abgebrochen!","RED",10] spawn life_fnc_notification_system;	
		life_action_inUse = false;
	};
	if(player != vehicle player) exitWith {
		["Du musst aus dem Fahrzeug aussteigen, um es lackieren zu können!","RED",10] spawn life_fnc_notification_system;
	};
	CASH = CASH - _basePrice;
	//Send toDB
	_texture = M_CONFIG(getArray,"LifeCfgVehicles",(typeOf _veh),"textures");
	_ctype = ((_texture select _color_index) select 1)select 0;
	[[_veh,_color_index,_ctype],"TON_fnc_vehicleRepaint",false,false] spawn life_fnc_MP;


	//Color vehicle locally
	[_veh,_color_index] call life_fnc_colorVehicle;


	[] call SOCK_fnc_updateRequest; //Sync silently because it's obviously silently..

	[format["Dein Fahrzeug hat jetzt einen neuen Lack. Bitte parke das Fahrzeug zum trockenen nochmal mal ein und wieder aus! Der neue Lack wird erst nach dem Ausparken für alle sichtbar."],"RED",10] spawn life_fnc_notification_system;	

};