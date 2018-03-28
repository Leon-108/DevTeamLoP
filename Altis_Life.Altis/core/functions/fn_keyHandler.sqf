#include "..\..\script_macros.hpp"
/*
	File: fn_keyHandler.sqf
	Author: Bryan "Tonic" Boardwine

	Description:
	Main key handler for event 'keyDown'
*/
private ["_handled","_shift","_alt","_code","_ctrl","_alt","_ctrlKey","_veh","_locked","_interactionKey","_mapKey","_interruptionKeys","_speakKey"];
params [
	"_ctrl",
	"_code",
	"_shift",
	"_ctrlKey",
	"_alt"
];
_speed = speed cursorTarget;
_handled = false;
_interactionKey = if(count (actionKeys "User10") isEqualto 0) then {219} else {(actionKeys "User10") select 0};
_mapKey = actionKeys "ShowMap" select 0;
_interruptionKeys = [17,30,31,32]; //A,S,W,D

//Vault handling...
if((_code in (actionKeys "GetOver") || _code in (actionKeys "salute")) && {(player getVariable ["Re-strained",false])}) exitWith {
	true;
};
//Sidechat
if((_code in (actionKeys "PushToTalk") || _code in (actionKeys "PushToTalkSide") || _code in (actionKeys "PushToTalkAll") || _code in (actionKeys "PushToTalkDirect") || _code in (actionKeys "VoiceOverNet"))) exitWith {
	if (currentChannel in [life_radio_civ,7]) then {
		setCurrentChannel 5; 
		["••• Du musst auf Direct Communication stellen damit man dich hören kann •••","RED",10] spawn life_fnc_notification_system;
	};
};

if(life_action_inUse) exitWith {
	if(!life_interrupted && _code in _interruptionKeys) then {life_interrupted = true;};
	_handled;
};

//Hotfix for Interaction key not being able to be bound on some operation systems.
if(count (actionKeys "User10") != 0 && {(inputAction "User10" > 0)}) exitWith {
	//Interaction key (default is Left Windows, can be mapped via Controls -> Custom -> User Action 10)
	if(!life_action_inUse) then {
		[] spawn{
			private["_handle"];
			_handle = [] spawn life_fnc_actionKeyHandler;
			waitUntil {scriptDone _handle};
			life_action_inUse = false;
			};
	};
	true;
};
switch (_code) do
{
	//Space key for Jumping
	case 57: {
		if(isNil "jumpActionTime") then {jumpActionTime = 0;};
		if(_shift && {animationState player != "AovrPercMrunSrasWrflDf"} && {isTouchingGround player} && {stance player isEqualto "STAND"} && {speed player > 2} && {!life_is_arrested} && {(velocity player) select 2 < 2.5} && {time - jumpActionTime > 1.5}) then {
			jumpActionTime = time; //Update the time.
			[player,true] spawn life_fnc_jumpFnc; //Local execution
			[[player,false],"life_fnc_jumpFnc",nil,FALSE] call life_fnc_MP; //Global execution 
			_handled = true;
		};
	};
	
	//Map Key
	case _mapKey: {	
		if (life_action_gathering || life_action_inUse || life_is_processing ) exitWith {openMap false};
		call {
			if (playerSide isEqualTo west) exitWith {if(!visibleMap) then {[] spawn life_fnc_copMarkers;}};
			if (playerSide isEqualTo civilian) exitWith {if(!visibleMap) then {[] spawn life_fnc_groupMarkers;[] spawn life_fnc_dealerMarkers;}};
			if (playerSide isEqualTo independent) exitWith {if(!visibleMap) then {[] spawn life_fnc_teamMarkers;[] spawn life_fnc_medicMarkers;[] spawn life_fnc_dealerMarkers;}};
		};
	};
	
	// O, police gate opener
	case 24: {
		if (!_shift && !_alt && !_ctrlKey &&( (playerSide isEqualto west) || (getPlayerUID player) in life_team_bhc) || (playerSide isEqualto independent) || (playerSide isEqualto east)&& (vehicle player != player)) then {
			[] call life_fnc_Opener;
		};
	};
		
	//Holster / recall weapon.
	case 35: {
		if(_shift && !_ctrlKey && currentWeapon player != "") then {
			life_curWep_h = currentWeapon player;
			player action ["SwitchWeapon", player, player, 100];
			player switchcamera cameraView;
		};
		if(!_shift && _ctrlKey && !isNil "life_curWep_h" && {(life_curWep_h != "")}) then {
			if(life_curWep_h in [primaryWeapon player,secondaryWeapon player,handgunWeapon player]) then {
				player selectWeapon life_curWep_h;
			};
		};
	};
	
	//Interaction key (default is Left Windows, can be mapped via Controls -> Custom -> User Action 10)
	case _interactionKey: {
		if(!life_action_inUse) then {
			[] spawn {
				private["_handle"];
				_handle = [] spawn life_fnc_actionKeyHandler;
				waitUntil {scriptDone _handle};
				life_action_inUse = false;
			};
		};
	};
	
	//Shift+P = Faded Sound
	case 25: {
		if(_shift) then	{
			playSound "earplug";
			[] call life_fnc_fadeSound;
			_handled = true;
		};
	};
	
	case 2: {    
		if(_shift) then {_handled = true;};
		if (_shift) then {
			if (vehicle player isEqualto player && !(player getVariable ["Re-strained", false]) && (animationState player) != "incapacitated" && !life_istazed) then {
				if (player getVariable ["surrender", false]) then {
					player setVariable ["surrender", false, true];
				} else {
					[] spawn life_fnc_surrender;
				};
			};
		};
	};
	
	//Restraining (Shift + R)
	case 19: {
		if(_shift) then {_handled = true;};
		if(_shift && playerSide in [west,independent] && !isNull cursorTarget && cursorTarget isKindOf "Man" && (isPlayer cursorTarget) && (side cursorTarget in [civilian,independent]) && alive cursorTarget && cursorTarget distance player < 3.5 && !(cursorTarget getVariable "Escorting") && !(cursorTarget getVariable "Re-strained") && (speed cursorTarget < 1) && ((cursorTarget getVariable ["admin",0]) isEqualTo 0)) then
		{
			[] call life_fnc_restrainAction;
		};
		if (license_civ_rebel) then {
		if(_shift) then {_handled = true;};
		if(_shift && playerSide isEqualto civilian && !isNull cursorTarget && cursorTarget isKindOf "Man" && (isPlayer cursorTarget) && alive cursorTarget && cursorTarget distance player < 3.5 && isPlayer cursorTarget && (animationState cursorTarget == "Incapacitated" || animationState cursorTarget == "AinjPfalMstpSnonWnonDf_carried_fallwc" || animationState cursorTarget == "AmovPercMstpSsurWnonDnon") && !(cursorTarget getVariable "Escorting") && !(cursorTarget getVariable "Re-strained") && (speed cursorTarget < 1) && ((cursorTarget getVariable ["admin",0]) isEqualTo 0)) then
		{
			[] call life_fnc_restrainAction;
		};
		};
		if(playerSide in [west,independent] && vehicle player != player && !life_siren_active && ((driver vehicle player) isEqualto player)) then {
			[] spawn {
				life_siren_active = true;
				sleep 1;
				life_siren_active = false;
			};
			_veh = vehicle player;
			if(isNil {_veh getVariable "siren"}) then {_veh setVariable["siren",false,true];};
			if((_veh getVariable "siren")) then	{
				["Yelp AUS","RED",2] spawn life_fnc_notification_system;
				_veh setVariable["siren",false,true];
			} else {
				["Yelp AN","BLUE",2] spawn life_fnc_notification_system;
				_veh setVariable["siren",true,true];
				if(playerSide isEqualto west) then {
					[[_veh,"yelp"],"life_fnc_copSiren",nil,true] spawn life_fnc_MP;
				};
			};
		};
	};
	
	//Knock out, this is experimental and yeah...
	case 34: {
		if (playerSide isEqualTo civilian) then {
			if (license_civ_rebel) then {
				if(_shift) then {_handled = true;};
				if(_shift && playerSide isEqualto civilian && !isNull cursorTarget && cursorTarget isKindOf "Man" && isPlayer cursorTarget && alive cursorTarget && cursorTarget distance player < 4 && speed cursorTarget < 1) then {
					if((animationState cursorTarget) != "incapacitated" && (currentWeapon player isEqualto primaryWeapon player || currentWeapon player isEqualto handgunWeapon player) && currentWeapon player != "" && !life_knockout && !(player getVariable["Re-strained",false]) && !life_istazed && ((cursorTarget getVariable ["admin",0]) isEqualTo 0)) then { 
						[cursorTarget] spawn life_fnc_knockoutAction;
						player say3D "schlag";
					};
				};
			} else { 
				["Du brauchst eine Rebellenlizenz!","RED",10] spawn life_fnc_notification_system;
			};
		};
		if(_shift) then {_handled = true;};
		if(_shift && playerSide isEqualto west && !isNull cursorTarget && cursorTarget isKindOf "Man" && isPlayer cursorTarget && alive cursorTarget && cursorTarget distance player < 4 && speed cursorTarget < 1) then {
			if((animationState cursorTarget) != "incapacitated" && (currentWeapon player isEqualto primaryWeapon player OR currentWeapon player isEqualto handgunWeapon player) && currentWeapon player != "" && !life_knockout && !(player getVariable["Re-strained",false]) && !life_istazed && ((cursorTarget getVariable ["admin",0]) isEqualTo 0)) then {
				[cursorTarget] spawn life_fnc_knockoutAction;
				player say3D "schlag";
			};
		};
	};

	//T Key (Trunk)
	case 20: {
		if(!_alt && !_ctrlKey) then	{
			if(vehicle player != player && alive vehicle player) then {
				if((vehicle player) in life_2vehicles) then	{
					[vehicle player] call life_fnc_openInventory;
				};
			} else {
				if((cursorTarget isKindOf "Car" OR cursorTarget isKindOf "Air" OR cursorTarget isKindOf "Ship" OR cursorTarget isKindOf "House_F") && player distance cursorTarget < 7 && vehicle player isEqualto player && alive cursorTarget) then {
					if(cursorTarget in life_2vehicles OR {!(cursorTarget getVariable ["locked",true])}) then {
						[cursorTarget] call life_fnc_openInventory;
					};
				};
			};
		};
	};
	//L Key?
	case 38: {
		if(_shift && playerSide in [west,independent]) then {
			if(vehicle player != player && (((typeOf vehicle player) in life_cop_veh) or ((typeOf vehicle player) in life_medic_veh))) then {
				if(!isNil {vehicle player getVariable "lights"}) then {
					if(playerSide isEqualto west) then {
						[vehicle player] call life_fnc_sirenLights;
					} else {
						[vehicle player] call life_fnc_medicSirenLights;
					};
					_handled = true;
				};
			};
		};
		if(!_alt && !_ctrlKey) then { [] call life_fnc_radar; };
	};
	//Z Player Menu
	case 21: {
		if(!_alt && !_ctrlKey && !dialog) then {
			[] call life_fnc_p_openMenu;
		};
	};
	
//F Key
	case 33: {
		if(playerSide in [west,independent] && vehicle player != player && !life_siren_active && ((driver vehicle player) isEqualto player)) then {
			[] spawn {
				life_siren_active = true;
				sleep 1;
				life_siren_active = false;
			};
			_veh = vehicle player;
			if(isNil {_veh getVariable "siren"}) then {_veh setVariable["siren",false,true];};
			if((_veh getVariable "siren")) then	{
				["Sirene AUS","RED",2] spawn life_fnc_notification_system;
				_veh setVariable["siren",false,true];
			} else {
				["Sirene AN","BLUE",2] spawn life_fnc_notification_system;
				_veh setVariable["siren",true,true];
				if(playerSide isEqualto west) then {
					[[_veh,"siren"],"life_fnc_copSiren",nil,true] spawn life_fnc_MP;
				} else {
					[[_veh],"life_fnc_medicSiren",nil,true] spawn life_fnc_MP;
				};
			};
		};
	};
// G Key
	case 34: {
		if(playerSide in [west,independent] && vehicle player != player && !life_siren_active && ((driver vehicle player) isEqualto player)) then {
			[] spawn {
				life_siren_active = true;
				sleep 1;
				life_siren_active = false;
			};
			_veh = vehicle player;
			if(isNil {_veh getVariable "siren"}) then {_veh setVariable["siren",false,true];};
			if((_veh getVariable "siren")) then	{
				["Sirene AUS","RED",2] spawn life_fnc_notification_system;
				_veh setVariable["siren",false,true];
			} else {
				["Sirene AN","BLUE",2] spawn life_fnc_notification_system;
				_veh setVariable["siren",true,true];
				if(playerSide isEqualto west) then {
					[[_veh,"yelp"],"life_fnc_copSiren",nil,true] spawn life_fnc_MP;
				};
			};
		};
	};
//Ä
	case 40: {
		if(playerSide in [west,independent] && vehicle player != player && !life_siren_active && ((driver vehicle player) isEqualto player)) then {
			[] spawn {
				life_siren_active = true;
				sleep 1;
				life_siren_active = false;
			};
			_veh = vehicle player;
			if(isNil {_veh getVariable "siren"}) then {_veh setVariable["siren",false,true];};
			if((_veh getVariable "siren")) then	{
				["Durchsage AUS","RED",2] spawn life_fnc_notification_system;
				_veh setVariable["siren",false,true];
			} else {
				["Durchsage AN","BLUE",2] spawn life_fnc_notification_system;
				_veh setVariable["siren",true,true];
				if(playerSide isEqualto west) then {
					[[_veh],"life_fnc_copBroadcast",nil,true] spawn life_fnc_MP;
				} else {
					[[_veh],"life_fnc_medicBroadcast",nil,true] spawn life_fnc_MP;
				};
			};
		};
	};
	//Sammeln Q
	case 16: {
		_whatIsIt = "nothing";
		if (!life_action_gathering) exitWith {
			_whatIsIt = [] call life_fnc_whereAmI;
			if (life_action_gathering) exitWith {};                 //Action is in use, exit to prevent spamming.
			if !(_whatIsIt isEqualTo "nothing") then {
				life_action_gathering = true;
				[_whatIsIt] spawn {
					private["_handle"];
					params ["_whatIsIt"];
					_handle = [_whatIsIt] spawn life_fnc_mine;
					waitUntil {scriptDone _handle};
					life_action_gathering = false;
				};
			};
		};
	};
	
	//Tactical View Entfernt
    case 83:
    {
        if(playerSide isEqualto civilian) then 
        {
            _handled = true;
        };
    };
	//Num + 0 Skin load
	case 82:{
		if(_shift) then {_handled = true;};
		if ((_shift) && (vehicle player isEqualto player)) then {
			if ((license_civ_dm) || (license_civ_srevers) || (license_civ_kartell) || (license_civ_bhg) || (license_civ_pa) || (license_civ_presse) || (license_civ_king) || (playerSide in [west,independent])) then {
				[player, uniform player] call life_fnc_equipGear;
				["Dein Anzug Skin wurde geladen!","PINK",5] spawn life_fnc_notification_system;
			};
		};
	};
	//Num 1 Pissing
	case 79:
	{
		if(_shift) then {_handled = true;};
			if ((_shift) && (vehicle player isEqualto player)) then
			{
				cutText [format["Urinieren"], "PLAIN DOWN"];
				//player playMove "AmovPercMstpSnonWnonDnon_exerciseKata";
				player playMove"Acts_AidlPercMstpSlowWrflDnon_pissing";
			};
	};

	// ^ Entfernt
   case 41:
  {
		  if(playerSide in [west,independent,civilian]) then
        {
            _handled = true;
       };
    };

	//Kneebend Slow(Shift + Num 2)
	case 80:
	{
		if(_shift) then {_handled = true;};
			if ((_shift) && (vehicle player isEqualto player)) then
			{
				cutText [format["Kniebeugen Langsam"], "PLAIN DOWN"];
				player playMove "AmovPercMstpSnonWnonDnon_exercisekneeBendA";
				player playMove "AmovPercMstpSnonWnonDnon_exercisekneeBendA";
			};
	};

	//Teakwondo(Shift + Num 3)
	case 81:
	{
		if(_shift) then {_handled = true;};
			if ((_shift) && (vehicle player isEqualto player)) then
			{
				cutText [format["Taekwondo"], "PLAIN DOWN"];
				player playMove "AmovPercMstpSnonWnonDnon_exerciseKata";
			};
	};

	//Num 4 Winken
	case 75: 
	{
		if(_shift) then {_handled = true;};
			if ((_shift) && (vehicle player isEqualto player)) then
			{
				cutText [format["Winken"], "PLAIN DOWN"];
				player playactionnow 'GestureCeaseFire';
				
			};
	};
	//Num 5 Hi
	case 76:{
		if(_shift) then {_handled = true;};
			if ((_shift) && (vehicle player isEqualto player)) then
			{
				cutText [format["Hi"], "PLAIN DOWN"];
				//player playMove "AmovPercMstpSnonWnonDnon_exercisePushup";
				//player playactionnow 'GestureHi';
				player playactionnow 'gestureFreeze';
			};
	};
	//Num 6 Kopfschuetteln
	case 77:{
		if(_shift) then {_handled = true;};
			if ((_shift) && (vehicle player isEqualto player)) then
			{
				cutText [format["Nein"], "PLAIN DOWN"];
				player playactionnow 'gestureNo';
			};
	};
	//Num 7 Kopfnicken
	case 71:{
		if(_shift) then {_handled = true;};
			if ((_shift) && (vehicle player isEqualto player)) then
			{
				cutText [format["Ja"], "PLAIN DOWN"];
				player playactionnow 'gestureNod';
			};
	};
	//Num 8 nach vorn Zeigen
	case 72:{
		if(_shift) then {_handled = true;};
			if ((_shift) && (vehicle player isEqualto player)) then
			{
				cutText [format["Go Go"], "PLAIN DOWN"];
				player playactionnow 'GestureGo';
			};
	};
	//Num 9 Deckung
	case 73:{
		if(_shift) then {_handled = true;};
			if ((_shift) && (vehicle player isEqualto player)) then
			{
				cutText [format["Deckung suchen"], "PLAIN DOWN"];
				player playactionnow 'GestureCover';
			};
	};
	case 59: //Schlüssel generieren
	{
		if ((license_civ_admin1) or (license_cop_admin2)) then {
			life_2vehicles set[count life_2vehicles,cursorTarget];
			//h/int "Du hast dir einen Schlüssel generiert!";
			["Du hast dir einen Schlüssel generiert!","WHITE",5] spawn life_fnc_notification_system;
		};
	};
	case 60: //Wiederbeleben
	{
		if ((license_civ_admin1) or (license_cop_admin2)) then {
			[[name player],"life_fnc_revived",cursorTarget,FALSE] spawn life_fnc_MP;
			//h/int "Du hast jemanden wiederbelebt!";
			["Du hast jemanden wiederbelebt!","WHITE",5] spawn life_fnc_notification_system;
		};
	};
	case 61: //Fahndungsliste
	{
		if ((license_civ_admin1) or (license_cop_admin2)) then {
			[] call life_fnc_wantedMenu;
			//h/int "Fahndungsliste geöffnet!";
			["Fahndungsliste geöffnet!","WHITE",5] spawn life_fnc_notification_system;
		};
	};
	case 62: //Ziel zerstören
	{
		if ((license_civ_admin1) or (license_cop_admin2)) then {
			cursorTarget setDamage 1;
			//h/int "Ziel zerstört!";
			["Ziel zerstört!","WHITE",5] spawn life_fnc_notification_system;
		};
	};
	case 63: //Haus Besitzer checken
	{
		if ((license_civ_admin1) or (license_cop_admin2)) then {
			cursorTarget call life_fnc_copHouseOwner;
		};
	};
	case 64: //Auto Besitzer
	{
		if ((license_civ_admin1) or (license_cop_admin2) or (playerSide isEqualto independent)) then {
			[] spawn life_fnc_searchVehAction;
		};
	};
	case 65: //100% heilen
	{
		if ((license_civ_admin1) or (license_cop_admin2)) then {
			player setDamage 0;
			//h/int "Du hast dich geheilt!";
			["Du hast dich geheilt!","WHITE",5] spawn life_fnc_notification_system;
		};
	};
	case 66: //löschen
	{
		if ((license_civ_admin1) or (license_cop_admin2)) then {
			deleteVehicle cursorTarget;
			//h/int "Objekt gelöscht!";
			["Objekt gelöscht!","WHITE",5] spawn life_fnc_notification_system;
		};
	};
	// F9, Erdbeben ^^
	case 67:
		{
			if (((license_civ_admin1) or (license_cop_admin2)) && ((getPlayerUID player) in ["76561198073604498","76561198015730869","76561198125123009"])) then {
				[4,"life_fnc_earthquake",nil,true] call life_fnc_MP;
			} else {
				if ((license_civ_admin1) or (license_cop_admin2)) then { 
					//h/int "Diese Funktion ist für Dich nicht freigeschaltet!"
					["Diese Funktion ist für Dich nicht freigeschaltet!","RED",10] spawn life_fnc_notification_system;
				};
			};
		};
	// F10, Objekt reparieren
	case 68:
	{
		if ((license_civ_admin1) or (license_cop_admin2)) then {
			cursorObject setDamage 0;
			//h/int "Objekt repariert!";
			["Objekt repariert!","WHITE",5] spawn life_fnc_notification_system;
		};
	};
	case 184: //Admin Info
	{
		if ((license_civ_admin1) or (license_cop_admin2)) then {
			//h/int "F1 = Schlüssel erzeugen \nF2 = Wiederbeleben \nF3 = Fahndungsliste \nF4 = Zerstören \nF5 = Hausbesitzer \nF6 = Autobesitzer \nF7 = 100% Heilen \nF8 = Löschen \nF9 = Erdbeben (restricted) \nF10 = Objekt reparieren";
			[parseText "F1 = Schlüssel erzeugen <br/>F2 = Wiederbeleben <br/>F3 = Fahndungsliste <br/>F4 = Zerstören <br/>F5 = Hausbesitzer <br/>F6 = Autobesitzer <br/>F7 = 100% Heilen <br/>F8 = Löschen <br/>F9 = Erdbeben (restricted) <br/>F10 = Objekt reparieren","WHITE",8] spawn life_fnc_notification_system;
		};
	};
	case 54: //paradisenews
	{
		if (playerSide in [west,independent]) then {
			[] call life_fnc_calldialog;
			["Paradise News","PINK",5] spawn life_fnc_notification_system;
		};
	};

		//U Key
	case 22:
	{
		if(!_alt && !_ctrlKey && !_shift) then {
			if(vehicle player isEqualto player) then {
				_veh = cursorTarget;
			} else {
			_veh = vehicle player;
			};
			if(_veh isKindOf "House_F" && playerSide isEqualto civilian) then {
				if(_veh in life_2vehicles && player distance _veh < 8) then {
					_door = [_veh] call life_fnc_nearestDoor;
					if(_door isEqualto 0) exitWith {
						//h/int localize "STR_House_Door_NotNear"
						[localize "STR_House_Door_NotNear","RED",10] spawn life_fnc_notification_system;
					};
					_locked = _veh getVariable [format["bis_disabled_Door_%1",_door],0];
					if(_locked isEqualto 0) then {
						_veh setVariable[format["bis_disabled_Door_%1",_door],1,true];
						_veh animate [format["door_%1_rot",_door],0];
						//s/ystemChat localize "STR_House_Door_Lock";
						[localize "STR_House_Door_Lock","GREEN",5] spawn life_fnc_notification_system;
					} else {
						_veh setVariable[format["bis_disabled_Door_%1",_door],0,true];
						_veh animate [format["door_%1_rot",_door],1];
						//s/ystemChat localize "STR_House_Door_Unlock";
						[localize "STR_House_Door_Unlock","YELLOW",5] spawn life_fnc_notification_system;
					};
				};
			} else {
				_locked = locked _veh;
				if(_veh in life_2vehicles && (player distance _veh < 8||((typeOf _veh in ["B_T_VTOL_01_infantry_F","B_T_VTOL_01_vehicle_F"])&&(player distance _veh < 16)))) then {
					if(_locked isEqualto 2) then {
						if(local _veh) then {
							_veh lock 0;
							if(typeOf _veh isEqualTo "C_Offroad_01_F") then {
								_veh animateDoor ['Doors',1];
							};
							if(typeOf _veh isEqualTo "O_MRAP_02_F") then {
								//_veh animateDoor ['Door_rear',1];
								_veh animateDoor ['Door_LM',1];
								_veh animateDoor ['Door_RM',1];
								_veh animateDoor ['Door_LF',1];
								_veh animateDoor ['Door_RF',1];
							};
							if(typeOf _veh isEqualTo "B_MRAP_01_F") then {
								_veh animateDoor ['Door_LF',1];
								_veh animateDoor ['Door_RF',1];
								_veh animateDoor ['Door_LB',1];
								_veh animateDoor ['Door_RB',1];
							};
							if(typeOf _veh in ["I_MRAP_03_F","O_Truck_02_covered_F","O_Truck_02_transport_F","O_Truck_02_box_F","O_Truck_02_medical_F","O_Truck_02_Ammo_F","O_Truck_02_fuel_F","I_Truck_02_covered_F","I_Truck_02_transport_F","I_Truck_02_ammo_F","I_Truck_02_box_F","I_Truck_02_medical_F","I_Truck_02_fuel_F"]) then {
								_veh animateDoor ['Door_LF',1];
								_veh animateDoor ['Door_RF',1];
							};
							if(typeOf _veh isEqualTo "B_Heli_Transport_03_F") then {
								//_veh animateDoor ['Door_R_source',1];
							};
							if(typeOf _veh in ["O_Heli_Transport_04_box_F","O_Heli_Transport_04_F","O_Heli_Transport_04_fuel_F","O_Heli_Transport_04_medevac_F","O_Heli_Transport_04_ammo_F","O_Heli_Transport_04_bench_F","O_Heli_Transport_04_covered_F","O_Heli_Transport_04_repair_F"]) then {
								_veh animateDoor ['Door_1_source',1];
								_veh animateDoor ['Door_2_source',1];
								//_veh animateDoor ['Door_3_source',1];
							};
							if(typeOf _veh isEqualTo "C_Offroad_02_unarmed_F") then {
								_veh animateDoor ['Door_1_source',1];
								_veh animateDoor ['Door_2_source',1];
								//_veh animateDoor ['Door_3_source',1];
							};
							if(typeOf _veh in ["C_Van_02_transport_F","C_Van_02_vehicle_F","C_Van_02_medevac_F","C_Van_02_service_F"]) then {
								_veh animateDoor ['Door_1_source',1];
								_veh animateDoor ['Door_2_source',1];
								/*_veh animateDoor ['Door_3_source',1];
								_veh animateDoor ['Door_4_source',1];*/
							};
							if(typeOf _veh isEqualTo "I_Heli_Transport_02_F") then {
								_veh animateDoor ['Door_Back_L',1];
								//_veh animateDoor ['Door_Back_R',1];
							};
							if(typeOf _veh isEqualTo "B_Heli_Transport_03_unarmed_F") then {
								_veh animateDoor ['Door_L_source',1];
								_veh animateDoor ['Door_R_source',1];
								//_veh animateDoor ['Door_rear_source',1];
							};
							if(typeOf _veh in ["B_T_VTOL_01_infantry_F","B_T_VTOL_01_vehicle_F","O_T_VTOL_02_infantry_F"]) then {
								//_veh animateDoor ['Door_1_source',1];
							};
						} else {
							[[_veh,0],"life_fnc_lockVehicle",_veh,false] spawn life_fnc_MP;
							if(typeOf _veh isEqualTo "C_Offroad_01_F") then {
								_veh animateDoor ['Doors',1];
							};
							if(typeOf _veh isEqualTo "O_MRAP_02_F") then {
								//_veh animateDoor ['Door_rear',1];
								_veh animateDoor ['Door_LM',1];
								_veh animateDoor ['Door_RM',1];
								_veh animateDoor ['Door_LF',1];
								_veh animateDoor ['Door_RF',1];
							};
							if(typeOf _veh isEqualTo "B_MRAP_01_F") then {
								_veh animateDoor ['Door_LF',1];
								_veh animateDoor ['Door_RF',1];
								_veh animateDoor ['Door_LB',1];
								_veh animateDoor ['Door_RB',1];
							};
							if(typeOf _veh in ["I_MRAP_03_F","O_Truck_02_covered_F","O_Truck_02_transport_F","O_Truck_02_box_F","O_Truck_02_medical_F","O_Truck_02_Ammo_F","O_Truck_02_fuel_F","I_Truck_02_covered_F","I_Truck_02_transport_F","I_Truck_02_ammo_F","I_Truck_02_box_F","I_Truck_02_medical_F","I_Truck_02_fuel_F"]) then {
								_veh animateDoor ['Door_LF',1];
								_veh animateDoor ['Door_RF',1];
							};
							if(typeOf _veh isEqualTo "B_Heli_Transport_03_F") then {
								//_veh animateDoor ['Door_R_source',1];
							};
							if(typeOf _veh in ["O_Heli_Transport_04_box_F","O_Heli_Transport_04_F","O_Heli_Transport_04_fuel_F","O_Heli_Transport_04_medevac_F","O_Heli_Transport_04_ammo_F","O_Heli_Transport_04_bench_F","O_Heli_Transport_04_covered_F","O_Heli_Transport_04_repair_F"]) then {
								_veh animateDoor ['Door_1_source',1];
								_veh animateDoor ['Door_2_source',1];
								//_veh animateDoor ['Door_3_source',1];
							};
							if(typeOf _veh isEqualTo "C_Offroad_02_unarmed_F") then {
								_veh animateDoor ['Door_1_source',1];
								_veh animateDoor ['Door_2_source',1];
								//_veh animateDoor ['Door_3_source',1];
							};
							if(typeOf _veh in ["C_Van_02_transport_F","C_Van_02_vehicle_F","C_Van_02_medevac_F","C_Van_02_service_F"]) then {
								_veh animateDoor ['Door_1_source',1];
								_veh animateDoor ['Door_2_source',1];
								/*_veh animateDoor ['Door_3_source',1];
								_veh animateDoor ['Door_4_source',1];*/
							};
							if(typeOf _veh isEqualTo "I_Heli_Transport_02_F") then {
								_veh animateDoor ['Door_Back_L',1];
								//_veh animateDoor ['Door_Back_R',1];
							};
							if(typeOf _veh isEqualTo "B_Heli_Transport_03_unarmed_F") then {
								_veh animateDoor ['Door_L_source',1];
								_veh animateDoor ['Door_R_source',1];
								//_veh animateDoor ['Door_rear_source',1];
							};
							if(typeOf _veh in ["B_T_VTOL_01_infantry_F","B_T_VTOL_01_vehicle_F","O_T_VTOL_02_infantry_F"]) then {
								//_veh animateDoor ['Door_1_source',1];
							};
						};
						//s/ystemChat "Du hast dein Fahrzeug aufgeschlossen.";
						["Du hast dein Fahrzeug aufgeschlossen.","PINK",5] spawn life_fnc_notification_system;
						player say3D "unlock";
					} else {
						if(local _veh) then {
							_veh lock 2;
							if(typeOf _veh isEqualTo "C_Offroad_01_F") then {
								_veh animateDoor ['Doors',0];
							};
							if(typeOf _veh isEqualTo "O_MRAP_02_F") then {
								//_veh animateDoor ['Door_rear',0];
								_veh animateDoor ['Door_LM',0];
								_veh animateDoor ['Door_RM',0];
								_veh animateDoor ['Door_LF',0];
								_veh animateDoor ['Door_RF',0];
							};
							if(typeOf _veh isEqualTo "B_MRAP_01_F") then {
								_veh animateDoor ['Door_LF',0];
								_veh animateDoor ['Door_RF',0];
								_veh animateDoor ['Door_LB',0];
								_veh animateDoor ['Door_RB',0];
							};
							if(typeOf _veh in ["I_MRAP_03_F","O_Truck_02_covered_F","O_Truck_02_transport_F","O_Truck_02_box_F","O_Truck_02_medical_F","O_Truck_02_Ammo_F","O_Truck_02_fuel_F","I_Truck_02_covered_F","I_Truck_02_transport_F","I_Truck_02_ammo_F","I_Truck_02_box_F","I_Truck_02_medical_F","I_Truck_02_fuel_F"]) then {
								_veh animateDoor ['Door_LF',0];
								_veh animateDoor ['Door_RF',0];
							};
							if(typeOf _veh in ["O_Heli_Transport_04_box_F","O_Heli_Transport_04_F","O_Heli_Transport_04_fuel_F","O_Heli_Transport_04_medevac_F","O_Heli_Transport_04_ammo_F","O_Heli_Transport_04_bench_F","O_Heli_Transport_04_covered_F","O_Heli_Transport_04_repair_F"]) then {
								_veh animateDoor ['Door_1_source',0];
								_veh animateDoor ['Door_2_source',0];
								_veh animateDoor ['Door_3_source',0];
							};
							if(typeOf _veh isEqualTo "C_Offroad_02_unarmed_F") then {
								_veh animateDoor ['Door_1_source',0];
								_veh animateDoor ['Door_2_source',0];
								_veh animateDoor ['Door_3_source',0];
							};
							if(typeOf _veh in ["C_Van_02_transport_F","C_Van_02_vehicle_F","C_Van_02_medevac_F","C_Van_02_service_F"]) then {
								_veh animateDoor ['Door_1_source',0];
								_veh animateDoor ['Door_2_source',0];
								_veh animateDoor ['Door_3_source',0];
								_veh animateDoor ['Door_4_source',0];
							}; //Blackfish, Taru, Huron
							if(typeOf _veh isEqualTo "I_Heli_Transport_02_F") then {
								_veh animateDoor ['Door_Back_L',0];
								_veh animateDoor ['Door_Back_R',0];
							};
							if(typeOf _veh isEqualTo "B_Heli_Transport_03_unarmed_F") then {
								_veh animateDoor ['Door_L_source',0];
								_veh animateDoor ['Door_R_source',0];
								_veh animateDoor ['Door_rear_source',0];
							};
							if(typeOf _veh in ["B_T_VTOL_01_infantry_F","B_T_VTOL_01_vehicle_F","O_T_VTOL_02_infantry_F"]) then {
								_veh animateDoor ['Door_1_source',0];
							};
						} else {
							[[_veh,2],"life_fnc_lockVehicle",_veh,false] spawn life_fnc_MP;
							if(typeOf _veh isEqualTo "C_Offroad_01_F") then {_veh animateDoor ['Doors',0];};
							if(typeOf _veh isEqualTo "O_MRAP_02_F") then {
								//_veh animateDoor ['Door_rear',0];
								_veh animateDoor ['Door_LM',0];
								_veh animateDoor ['Door_RM',0];
								_veh animateDoor ['Door_LF',0];
								_veh animateDoor ['Door_RF',0];
							};
							if(typeOf _veh isEqualTo "B_MRAP_01_F") then {
								_veh animateDoor ['Door_LF',0];
								_veh animateDoor ['Door_RF',0];
								_veh animateDoor ['Door_LB',0];
								_veh animateDoor ['Door_RB',0];
							};
							if(typeOf _veh in ["I_MRAP_03_F","O_Truck_02_covered_F","O_Truck_02_transport_F","O_Truck_02_box_F","O_Truck_02_medical_F","O_Truck_02_Ammo_F","O_Truck_02_fuel_F","I_Truck_02_covered_F","I_Truck_02_transport_F","I_Truck_02_ammo_F","I_Truck_02_box_F","I_Truck_02_medical_F","I_Truck_02_fuel_F"]) then {
								_veh animateDoor ['Door_LF',0];
								_veh animateDoor ['Door_RF',0];
							};
							if(typeOf _veh isEqualTo "B_Heli_Transport_03_F") then {
								_veh animateDoor ['Door_R_source',0];
							};
							if(typeOf _veh in ["O_Heli_Transport_04_box_F","O_Heli_Transport_04_F","O_Heli_Transport_04_fuel_F","O_Heli_Transport_04_medevac_F","O_Heli_Transport_04_ammo_F","O_Heli_Transport_04_bench_F","O_Heli_Transport_04_covered_F","O_Heli_Transport_04_repair_F"]) then {
								_veh animateDoor ['Door_1_source',0];
								_veh animateDoor ['Door_2_source',0];
								_veh animateDoor ['Door_3_source',0];
							};
							if(typeOf _veh isEqualTo "C_Offroad_02_unarmed_F") then {
								_veh animateDoor ['Door_1_source',0];
								_veh animateDoor ['Door_2_source',0];
								_veh animateDoor ['Door_3_source',0];
							};
							if(typeOf _veh in ["C_Van_02_transport_F","C_Van_02_vehicle_F","C_Van_02_medevac_F","C_Van_02_service_F"]) then {
								_veh animateDoor ['Door_1_source',0];
								_veh animateDoor ['Door_2_source',0];
								_veh animateDoor ['Door_3_source',0];
								_veh animateDoor ['Door_4_source',0];
							};
							if(typeOf _veh isEqualTo "I_Heli_Transport_02_F") then {
								_veh animateDoor ['Door_Back_L',0];
								_veh animateDoor ['Door_Back_R',0];
							};
							if(typeOf _veh isEqualTo "B_Heli_Transport_03_unarmed_F") then {
								_veh animateDoor ['Door_L_source',0];
								_veh animateDoor ['Door_R_source',0];
								_veh animateDoor ['Door_rear_source',0];
							};
							if(typeOf _veh in ["B_T_VTOL_01_infantry_F","B_T_VTOL_01_vehicle_F","O_T_VTOL_02_infantry_F"]) then {
								_veh animateDoor ['Door_1_source',0];
							};
						};	
						//s/ystemChat "Du hast dein Fahrzeug abgeschlossen.";
						["Du hast dein Fahrzeug abgeschlossen.","GREEN",5] spawn life_fnc_notification_system;
						player say3D "car_lock";
					};
				};
			};
		}; 
		if(!_alt && !_ctrlKey && _shift) then {
			if(vehicle player isEqualto player) then {
				_veh = cursorTarget;
			} else {
			_veh = vehicle player;
			};
			if(_veh isKindOf "House_F" && playerSide isEqualto civilian) then {
			
			} else {
				_locked = locked _veh;
				if(_veh in life_2vehicles && (player distance _veh < 8||((typeOf _veh in ["B_T_VTOL_01_infantry_F","B_T_VTOL_01_vehicle_F"])&&(player distance _veh < 16)))) then {
					if(_locked isEqualto 2) then {
						if(local _veh) then {
							_veh lock 0;
							if(typeOf _veh isEqualTo "C_Offroad_01_F") then {
								//_veh animateDoor ['Doors',1];
							};
							if(typeOf _veh isEqualTo "O_MRAP_02_F") then {
								_veh animateDoor ['Door_rear',1];
								/*_veh animateDoor ['Door_LM',1];
								_veh animateDoor ['Door_RM',1];
								_veh animateDoor ['Door_LF',1];
								_veh animateDoor ['Door_RF',1];*/
							};
							if(typeOf _veh isEqualTo "B_MRAP_01_F") then {
								/*_veh animateDoor ['Door_LF',1];
								_veh animateDoor ['Door_RF',1];
								_veh animateDoor ['Door_LB',1];
								_veh animateDoor ['Door_RB',1];*/
							};
							if(typeOf _veh in ["I_MRAP_03_F","O_Truck_02_covered_F","O_Truck_02_transport_F","O_Truck_02_box_F","O_Truck_02_medical_F","O_Truck_02_Ammo_F","O_Truck_02_fuel_F","I_Truck_02_covered_F","I_Truck_02_transport_F","I_Truck_02_ammo_F","I_Truck_02_box_F","I_Truck_02_medical_F","I_Truck_02_fuel_F"]) then {
								/*_veh animateDoor ['Door_LF',1];
								_veh animateDoor ['Door_RF',1];*/
							};
							if(typeOf _veh isEqualTo "B_Heli_Transport_03_F") then {
								_veh animateDoor ['Door_R_source',1];
							};
							if(typeOf _veh in ["O_Heli_Transport_04_box_F","O_Heli_Transport_04_F","O_Heli_Transport_04_fuel_F","O_Heli_Transport_04_medevac_F","O_Heli_Transport_04_ammo_F","O_Heli_Transport_04_bench_F","O_Heli_Transport_04_covered_F","O_Heli_Transport_04_repair_F"]) then {
								/*_veh animateDoor ['Door_1_source',1];
								_veh animateDoor ['Door_2_source',1];*/
								_veh animateDoor ['Door_3_source',1];
							};
							if(typeOf _veh isEqualTo "C_Offroad_02_unarmed_F") then {
								/*_veh animateDoor ['Door_1_source',1];
								_veh animateDoor ['Door_2_source',1];*/
								_veh animateDoor ['Door_3_source',1];
							};
							if(typeOf _veh in ["C_Van_02_transport_F","C_Van_02_vehicle_F","C_Van_02_medevac_F","C_Van_02_service_F"]) then {
								/*_veh animateDoor ['Door_1_source',1];
								_veh animateDoor ['Door_2_source',1];*/
								_veh animateDoor ['Door_3_source',1];
								_veh animateDoor ['Door_4_source',1];
							};
							if(typeOf _veh isEqualTo "I_Heli_Transport_02_F") then {
								//_veh animateDoor ['Door_Back_L',1];
								_veh animateDoor ['Door_Back_R',1];
							};
							if(typeOf _veh isEqualTo "B_Heli_Transport_03_unarmed_F") then {
								/*_veh animateDoor ['Door_L_source',1];
								_veh animateDoor ['Door_R_source',1];*/
								_veh animateDoor ['Door_rear_source',1];
							};
							if(typeOf _veh in ["B_T_VTOL_01_infantry_F","B_T_VTOL_01_vehicle_F","O_T_VTOL_02_infantry_F"]) then {
								_veh animateDoor ['Door_1_source',1];
							};
						} else {
							if(typeOf _veh isEqualTo "C_Offroad_01_F") then {
								//_veh animateDoor ['Doors',1];
							};
							if(typeOf _veh isEqualTo "O_MRAP_02_F") then {
								_veh animateDoor ['Door_rear',1];
								/*_veh animateDoor ['Door_LM',1];
								_veh animateDoor ['Door_RM',1];
								_veh animateDoor ['Door_LF',1];
								_veh animateDoor ['Door_RF',1];*/
							};
							if(typeOf _veh isEqualTo "B_MRAP_01_F") then {
								/*_veh animateDoor ['Door_LF',1];
								_veh animateDoor ['Door_RF',1];
								_veh animateDoor ['Door_LB',1];
								_veh animateDoor ['Door_RB',1];*/
							};
							if(typeOf _veh in ["I_MRAP_03_F","O_Truck_02_covered_F","O_Truck_02_transport_F","O_Truck_02_box_F","O_Truck_02_medical_F","O_Truck_02_Ammo_F","O_Truck_02_fuel_F","I_Truck_02_covered_F","I_Truck_02_transport_F","I_Truck_02_ammo_F","I_Truck_02_box_F","I_Truck_02_medical_F","I_Truck_02_fuel_F"]) then {
								/*_veh animateDoor ['Door_LF',1];
								_veh animateDoor ['Door_RF',1];*/
							};
							if(typeOf _veh isEqualTo "B_Heli_Transport_03_F") then {
								_veh animateDoor ['Door_R_source',1];
							};
							if(typeOf _veh in ["O_Heli_Transport_04_box_F","O_Heli_Transport_04_F","O_Heli_Transport_04_fuel_F","O_Heli_Transport_04_medevac_F","O_Heli_Transport_04_ammo_F","O_Heli_Transport_04_bench_F","O_Heli_Transport_04_covered_F","O_Heli_Transport_04_repair_F"]) then {
								/*_veh animateDoor ['Door_1_source',1];
								_veh animateDoor ['Door_2_source',1];*/
								_veh animateDoor ['Door_3_source',1];
							};
							if(typeOf _veh isEqualTo "C_Offroad_02_unarmed_F") then {
								/*_veh animateDoor ['Door_1_source',1];
								_veh animateDoor ['Door_2_source',1];*/
								_veh animateDoor ['Door_3_source',1];
							};
							if(typeOf _veh in ["C_Van_02_transport_F","C_Van_02_vehicle_F","C_Van_02_medevac_F","C_Van_02_service_F"]) then {
								/*_veh animateDoor ['Door_1_source',1];
								_veh animateDoor ['Door_2_source',1];*/
								_veh animateDoor ['Door_3_source',1];
								_veh animateDoor ['Door_4_source',1];
							};
							if(typeOf _veh isEqualTo "I_Heli_Transport_02_F") then {
								//_veh animateDoor ['Door_Back_L',1];
								_veh animateDoor ['Door_Back_R',1];
							};
							if(typeOf _veh isEqualTo "B_Heli_Transport_03_unarmed_F") then {
								/*_veh animateDoor ['Door_L_source',1];
								_veh animateDoor ['Door_R_source',1];*/
								_veh animateDoor ['Door_rear_source',1];
							};
							if(typeOf _veh in ["B_T_VTOL_01_infantry_F","B_T_VTOL_01_vehicle_F","O_T_VTOL_02_infantry_F"]) then {
								_veh animateDoor ['Door_1_source',1];
							};
						};
						//s/ystemChat "Du hast dein Fahrzeug aufgeschlossen.";
						["Du hast dein Fahrzeug aufgeschlossen.","PINK",5] spawn life_fnc_notification_system;
						player say3D "unlock";
					} else {
						if(local _veh) then {
							_veh lock 2;
							if(typeOf _veh isEqualTo "C_Offroad_01_F") then {
								//_veh animateDoor ['Doors',0];
							};
							if(typeOf _veh isEqualTo "O_MRAP_02_F") then {
								_veh animateDoor ['Door_rear',0];
								/*_veh animateDoor ['Door_LM',0];
								_veh animateDoor ['Door_RM',0];
								_veh animateDoor ['Door_LF',0];
								_veh animateDoor ['Door_RF',0];*/
							};
							if(typeOf _veh isEqualTo "B_MRAP_01_F") then {
								/*_veh animateDoor ['Door_LF',0];
								_veh animateDoor ['Door_RF',0];
								_veh animateDoor ['Door_LB',0];
								_veh animateDoor ['Door_RB',0];*/
							};
							if(typeOf _veh in ["I_MRAP_03_F","O_Truck_02_covered_F","O_Truck_02_transport_F","O_Truck_02_box_F","O_Truck_02_medical_F","O_Truck_02_Ammo_F","O_Truck_02_fuel_F","I_Truck_02_covered_F","I_Truck_02_transport_F","I_Truck_02_ammo_F","I_Truck_02_box_F","I_Truck_02_medical_F","I_Truck_02_fuel_F"]) then {
								/*_veh animateDoor ['Door_LF',0];
								_veh animateDoor ['Door_RF',0];*/
							};
							if(typeOf _veh isEqualTo "B_Heli_Transport_03_F") then {
								_veh animateDoor ['Door_R_source',0];
							};
							if(typeOf _veh in ["O_Heli_Transport_04_box_F","O_Heli_Transport_04_F","O_Heli_Transport_04_fuel_F","O_Heli_Transport_04_medevac_F","O_Heli_Transport_04_ammo_F","O_Heli_Transport_04_bench_F","O_Heli_Transport_04_covered_F","O_Heli_Transport_04_repair_F"]) then {
								/*_veh animateDoor ['Door_1_source',0];
								_veh animateDoor ['Door_2_source',0];*/
								_veh animateDoor ['Door_3_source',0];
							};
							if(typeOf _veh isEqualTo "C_Offroad_02_unarmed_F") then {
								/*_veh animateDoor ['Door_1_source',0];
								_veh animateDoor ['Door_2_source',0];*/
								_veh animateDoor ['Door_3_source',0];
							};
							if(typeOf _veh in ["C_Van_02_transport_F","C_Van_02_vehicle_F","C_Van_02_medevac_F","C_Van_02_service_F"]) then {
								/*_veh animateDoor ['Door_1_source',0];
								_veh animateDoor ['Door_2_source',0];*/
								_veh animateDoor ['Door_3_source',0];
								_veh animateDoor ['Door_4_source',0];
							}; //Blackfish, Taru, Huron
							if(typeOf _veh isEqualTo "I_Heli_Transport_02_F") then {
								//_veh animateDoor ['Door_Back_L',0];
								_veh animateDoor ['Door_Back_R',0];
							};
							if(typeOf _veh isEqualTo "B_Heli_Transport_03_unarmed_F") then {
								/*_veh animateDoor ['Door_L_source',0];
								_veh animateDoor ['Door_R_source',0];*/
								_veh animateDoor ['Door_rear_source',0];
							};
							if(typeOf _veh in ["B_T_VTOL_01_infantry_F","B_T_VTOL_01_vehicle_F","O_T_VTOL_02_infantry_F"]) then {
								_veh animateDoor ['Door_1_source',0];
							};
						} else {
							if(typeOf _veh isEqualTo "C_Offroad_01_F") then {
								//_veh animateDoor ['Doors',0];
							};
							if(typeOf _veh isEqualTo "O_MRAP_02_F") then {
								//_veh animateDoor ['Door_rear',0];
								/*_veh animateDoor ['Door_LM',0];
								_veh animateDoor ['Door_RM',0];
								_veh animateDoor ['Door_LF',0];
								_veh animateDoor ['Door_RF',0];*/
							};
							if(typeOf _veh isEqualTo "B_MRAP_01_F") then {
								/*_veh animateDoor ['Door_LF',0];
								_veh animateDoor ['Door_RF',0];
								_veh animateDoor ['Door_LB',0];
								_veh animateDoor ['Door_RB',0];*/
							};
							if(typeOf _veh in ["I_MRAP_03_F","O_Truck_02_covered_F","O_Truck_02_transport_F","O_Truck_02_box_F","O_Truck_02_medical_F","O_Truck_02_Ammo_F","O_Truck_02_fuel_F","I_Truck_02_covered_F","I_Truck_02_transport_F","I_Truck_02_ammo_F","I_Truck_02_box_F","I_Truck_02_medical_F","I_Truck_02_fuel_F"]) then {
								/*_veh animateDoor ['Door_LF',0];
								_veh animateDoor ['Door_RF',0];*/
							};
							if(typeOf _veh isEqualTo "B_Heli_Transport_03_F") then {
								_veh animateDoor ['Door_R_source',0];
							};
							if(typeOf _veh in ["O_Heli_Transport_04_box_F","O_Heli_Transport_04_F","O_Heli_Transport_04_fuel_F","O_Heli_Transport_04_medevac_F","O_Heli_Transport_04_ammo_F","O_Heli_Transport_04_bench_F","O_Heli_Transport_04_covered_F","O_Heli_Transport_04_repair_F"]) then {
								/*_veh animateDoor ['Door_1_source',0];
								_veh animateDoor ['Door_2_source',0];*/
								_veh animateDoor ['Door_3_source',0];
							};
							if(typeOf _veh isEqualTo "C_Offroad_02_unarmed_F") then {
								/*_veh animateDoor ['Door_1_source',0];
								_veh animateDoor ['Door_2_source',0];*/
								_veh animateDoor ['Door_3_source',0];
							};
							if(typeOf _veh in ["C_Van_02_transport_F","C_Van_02_vehicle_F","C_Van_02_medevac_F","C_Van_02_service_F"]) then {
								/*_veh animateDoor ['Door_1_source',0];
								_veh animateDoor ['Door_2_source',0];*/
								_veh animateDoor ['Door_3_source',0];
								_veh animateDoor ['Door_4_source',0];
							};
							if(typeOf _veh isEqualTo "I_Heli_Transport_02_F") then {
								//_veh animateDoor ['Door_Back_L',0];
								_veh animateDoor ['Door_Back_R',0];
							};
							if(typeOf _veh isEqualTo "B_Heli_Transport_03_unarmed_F") then {
								/*_veh animateDoor ['Door_L_source',0];
								_veh animateDoor ['Door_R_source',0];*/
								_veh animateDoor ['Door_rear_source',0];
							};
							if(typeOf _veh in ["B_T_VTOL_01_infantry_F","B_T_VTOL_01_vehicle_F","O_T_VTOL_02_infantry_F"]) then {
								_veh animateDoor ['Door_1_source',0];
							};
						};	
						//s/ystemChat "Du hast dein Fahrzeug abgeschlossen.";
						["Du hast dein Fahrzeug abgeschlossen.","GREEN",5] spawn life_fnc_notification_system;
						player say3D "car_lock";
					};
				};
			};
		};
	};
};

_handled;