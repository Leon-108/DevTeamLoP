#include "..\..\script_macros.hpp"
/* 
 File:fn_radarCam.sqf
 author: [midgetgrimm]
 Flash/Basic premise idea from preller, trigger function from shems and Yuka for the waitUntil <3
 Runs cams on map for speeders, if speed too many times diff shit happens
*/
waitUntil {(!isNil "life_fnc_moveIn") && !isNull (findDisplay 46)};
if((vehicle player isKindOf "Ship") OR (vehicle player isKindOf "Air")) exitWith {};//exit if not a freaking car
private ["_limit","_speed","_driver","_ticket","_ticketWL"];
private _cars = ["C_Kart_01_F","C_Kart_01_Blu_F","B_Quadbike_01_F","C_Hatchback_01_F","C_Offroad_01_F","C_Offroad_01_repair_F","B_G_Offroad_01_F","C_Offroad_02_unarmed_F","B_T_LSV_01_unarmed_F","O_T_LSV_02_unarmed_F","C_SUV_01_F","C_Hatchback_01_sport_F","C_Van_01_transport_F","C_Van_01_box_F","C_Van_02_transport_F","C_Van_02_vehicle_F","C_Van_02_medevac_F","C_Van_02_service_F"];
params [
	["_driver",objNull,[objNull]],
	["_speed",0,[0]],
	["_limit",50,[0]]
];
//_ticket = 1500;//perm set amount ticket
_ticket = (_speed - _limit) * 10;//variable ticket for licensed driver
_ticketWL = (_speed - _limit) * 20;//variable ticket for unlicensed driver
if (_speed > (_limit +5)) then {
	if (!((objectParent _driver) getVariable ["sirene",false]) && !((objectParent _driver) getVariable ["lights",false])) then {
        if(isNil "life_speedTicket") then {life_speedTicket = 0;};
        if(isNil "life_speedCaught") then {life_speedCaught = 0;};
        player say3d ["PhotoSound",10,1];//photosound and ppEffects from prellers radar script
        sleep 0.05;
        "colorCorrections" ppEffectEnable true; 
        "colorCorrections" ppEffectAdjust [1, 15, 0, [0.5, 0.5, 0.5, 0], [0.0, 0.5, 0.0, 1],[0.3, 0.3, 0.3, 0.05]]; 
        "colorCorrections" ppEffectCommit 0; 
        sleep 0; 
        "colorCorrections" ppEffectAdjust [1, 1, 0, [1, 1, 1, 0.0], [1, 1, 1, 1], [1, 1, 1, 1]]; 
        "colorCorrections" ppEffectCommit 0.05; 
        sleep 0.05; 
        "colorCorrections" ppEffectEnable false;
        sleep 0.1;
        "colorCorrections" ppEffectEnable true; 
        "colorCorrections" ppEffectAdjust [1, 15, 0, [0.5, 0.5, 0.5, 0], [0.0, 0.5, 0.0, 1],[0.3, 0.3, 0.3, 0.05]]; 
        "colorCorrections" ppEffectCommit 0; 
        sleep 0; 
        "colorCorrections" ppEffectAdjust [1, 1, 0, [1, 1, 1, 0.0], [1, 1, 1, 1], [1, 1, 1, 1]]; 
        "colorCorrections" ppEffectCommit 0.05; 
        sleep 0.05; 
        "colorCorrections" ppEffectEnable false;
        if(license_civ_driver OR license_civ_truck OR (side _driver in [west, independent])) then {
            life_speedTicket = life_speedTicket + 1;
            if(life_speedTicket <= 3) then {
				//s/ystemChat format["Dies ist Ticket Nummer %1 fuer dich! Achte auf deine Fahrweise!",life_speedTicket];
				[format["Dies ist Ticket Nummer %1 fuer dich! Achte auf deine Fahrweise!",life_speedTicket],"RED",10] spawn life_fnc_notification_system;
			};
            if(life_speedTicket isEqualTo 4) then {
				//s/ystemChat format["Dies ist Ticket Nummer %1 ! Noch eines und du verlierst jegliche Fahrlizenzen!",life_speedTicket];
				[format["Dies ist Ticket Nummer %1 ! Noch eines und du verlierst jegliche Fahrlizenzen!",life_speedTicket],"RED",10] spawn life_fnc_notification_system;
			};
            if(life_speedTicket > 4 && life_speedTicket < 8) then {
                //s/ystemChat format["Dies ist dein %1 Ticket",life_speedTicket];
				[format["Dies ist dein %1 Ticket",life_speedTicket],"RED",10] spawn life_fnc_notification_system;
                //h/int parseText format ["<t color='#ffffff'><t size='2'><t align='center'>Speed Radar<br/><t color='#ff0000'><t align='center'><t size='1.5'>Speed: %1 km/h<br/><t color='#ffffff'><t align='center'><t size='1'>Speed Limit: %2 km/h<br/><t color='#ffffff'><t align='center'><t size='1'>Fahrer: %3<br/><t color='#ffffff'><t align='center'><t size='1'>Du bist ein Wiederholungstaeter! Du verlierst jegliche Fahrlizenzen! Zudem wird nach dir gefahndet",round _speed,_limit,name _driver];
				if(playerside isEqualTo civilian) then {
					[parseText format ["<t color='#ffffff'><t align='center'><t size='1'>Du bist ein Wiederholungstaeter! Du verlierst jegliche Fahrlizenzen! Zudem wird jetzt nach dir gefahndet",round _speed,_limit,name _driver],"RED",10] spawn life_fnc_notification_system;
				} else {
					[parseText format ["<t color='#ffffff'><t align='center'><t size='1'>Du bist ein Wiederholungstaeter! Wenn du nicht im Einsatz bist musst auch du dich an die Regeln halten! Zudem wird jetzt nach dir gefahndet",round _speed,_limit,name _driver],"RED",10] spawn life_fnc_notification_system;
				};
				if (playerside isEqualTo civilian) then {
                    [[10],"life_fnc_removeLicenses",_driver,FALSE] spawn life_fnc_MP;
                    [[11],"life_fnc_removeLicenses",_driver,FALSE] spawn life_fnc_MP;
                };
                [2] call SOCK_fnc_updatePartial;
            };
            if(life_speedTicket > 8) then {
                //s/ystemChat format["Dein %1th TICKET! Halt dich an die Verkehrsregeln!",life_speedTicket];
				[format["Dein %1th TICKET! Halt dich an die Verkehrsregeln!",life_speedTicket],"RED",10] spawn life_fnc_notification_system;
                //h/int parseText format ["<t color='#ffffff'><t size='2'><t align='center'>Speed Radar<br/><t color='#ff0000'><t align='center'><t size='1.5'>Speed: %1 km/h<br/><t color='#ffffff'><t align='center'><t size='1'>Speed Limit: %2 km/h<br/><t color='#ffffff'><t align='center'><t size='1'>Fahrer: %3<br/>You are now wanted for Felony Speeding and are arrest-on-site",round _speed,_limit,name _driver];
                if(playerside isEqualTo civilian) then {
					[parseText format ["<t color='#ffffff'><t align='center'><t size='1'>Du bist ein Wiederholungstaeter! Du verlierst jegliche Fahrlizenzen! Zudem wird jetzt nach dir gefahndet",round _speed,_limit,name _driver],"RED",10] spawn life_fnc_notification_system;
                } else {
					[parseText format ["<t color='#ffffff'><t align='center'><t size='1'>Du bist ein Wiederholungstaeter! Wenn du nicht im Einsatz bist musst auch du dich an die Regeln halten! Zudem wird jetzt nach dir gefahndet",round _speed,_limit,name _driver],"RED",10] spawn life_fnc_notification_system;
				};
                if (playerside isEqualTo civilian) then {
                    [[10],"life_fnc_removeLicenses",_driver,FALSE] spawn life_fnc_MP;
                    [[11],"life_fnc_removeLicenses",_driver,FALSE] spawn life_fnc_MP;
                };
                [2] call SOCK_fnc_updatePartial;
            };
			if(((_speed - _limit) >= 10) && ((_speed - _limit) < 20)) then {
				[[getPlayerUID _driver,name _driver,"10"],"life_fnc_wantedAdd",false,false] spawn life_fnc_MP;
			};
			if (((_speed - _limit) >= 20) && ((_speed - _limit) < 30)) then {
				[[getPlayerUID _driver,name _driver,"11"],"life_fnc_wantedAdd",false,false] spawn life_fnc_MP;
			};
			if ((_speed - _limit) >= 30) then {
				[[getPlayerUID _driver,name _driver,"12"],"life_fnc_wantedAdd",false,false] spawn life_fnc_MP;
			};
			[parseText format ["<t color='#ffffff'><t size='2'><t align='center'>Speed Radar<br/><t color='#ff0000'><t align='center'><t size='1.5'>Speed: %1 km/h<br/><t color='#ffffff'><t align='center'><t size='1'>Speed Limit: %2 km/h<br/><t color='#ffffff'><t align='center'><t size='1'>Fahrer: %3",round _speed,_limit,name _driver],"RED",10] spawn life_fnc_notification_system;
            /*if(CASH <= _ticket) then {
                if(BANK <= _ticket) exitWith {
                    //h/int parseText format ["<t color='#ffffff'><t size='2'><t align='center'>Speed Radar<br/><t color='#ff0000'><t align='center'><t size='1.5'>Speed: %1 km/h<br/><t color='#ffffff'><t align='center'><t size='1'>Speed Limit: %2 km/h<br/><t color='#ffffff'><t align='center'><t size='1'>Driver: %3<br/><t color='#ffffff'><t align='center'><t size='1'>Fine: $%4<br/>Since you are broke and cannot pay, you now have a warrant out for you instead",round _speed,_limit,name _driver,[_ticket] call life_fnc_numberText];
                    [parseText format ["<t color='#ffffff'><t size='2'><t align='center'>Speed Radar<br/><t color='#ff0000'><t align='center'><t size='1.5'>Speed: %1 km/h<br/><t color='#ffffff'><t align='center'><t size='1'>Speed Limit: %2 km/h<br/><t color='#ffffff'><t align='center'><t size='1'>Fahrer: %3<br/><t color='#ffffff'><t align='center'><t size='1'>Strafe: $%4<br/>Da du kein Geld mehr hast, wird nun nach dir gefahndet!",round _speed,_limit,name _driver,[_ticket] call life_fnc_numberText],"RED",10] spawn life_fnc_notification_system;
					[[getPlayerUID _driver,name _driver,"139"],"life_fnc_wantedAdd",false,false] spawn life_fnc_MP;
                };
                BANK = BANK - _ticket;
                //h/int parseText format ["<t color='#ffffff'><t size='2'><t align='center'>Speed Radar<br/><t color='#ff0000'><t align='center'><t size='1.5'>Speed: %1 km/h<br/><t color='#ffffff'><t align='center'><t size='1'>Speed Limit: %2 km/h<br/><t color='#ffffff'><t align='center'><t size='1'>Driver: %3<br/><t color='#ffffff'><t align='center'><t size='1'>Fine: $%4",round _speed,_limit,name _driver,[_ticket] call life_fnc_numberText];
                [parseText format ["<t color='#ffffff'><t size='2'><t align='center'>Speed Radar<br/><t color='#ff0000'><t align='center'><t size='1.5'>Speed: %1 km/h<br/><t color='#ffffff'><t align='center'><t size='1'>Speed Limit: %2 km/h<br/><t color='#ffffff'><t align='center'><t size='1'>Fahrer: %3<br/><t color='#ffffff'><t align='center'><t size='1'>Strafe: $%4",round _speed,_limit,name _driver,[_ticket] call life_fnc_numberText],"RED",10] spawn life_fnc_notification_system;
				//diag_log "Ticket paid from player bank";
                [1] call SOCK_fnc_updatePartial;
            } else {
                CASH = CASH - _ticket;
                //h/int parseText format ["<t color='#ffffff'><t size='2'><t align='center'>Speed Radar<br/><t color='#ff0000'><t align='center'><t size='1.5'>Speed: %1 km/h<br/><t color='#ffffff'><t align='center'><t size='1'>Speed Limit: %2 km/h<br/><t color='#ffffff'><t align='center'><t size='1'>Driver: %3<br/><t color='#ffffff'><t align='center'><t size='1'>Fine: $%4",round _speed,_limit,name _driver,[_ticket] call life_fnc_numberText];	
                [parseText format ["<t color='#ffffff'><t size='2'><t align='center'>Speed Radar<br/><t color='#ff0000'><t align='center'><t size='1.5'>Speed: %1 km/h<br/><t color='#ffffff'><t align='center'><t size='1'>Speed Limit: %2 km/h<br/><t color='#ffffff'><t align='center'><t size='1'>Fahrer: %3<br/><t color='#ffffff'><t align='center'><t size='1'>Strafe: $%4",round _speed,_limit,name _driver,[_ticket] call life_fnc_numberText],"RED",10] spawn life_fnc_notification_system;
				//diag_log "Ticket paid from player cash";
                [0] call SOCK_fnc_updatePartial;
            };*/
        } else {
            life_speedCaught = life_speedCaught + 1;
            if(life_speedCaught <= 3) then {
				//s/ystemChat format["Du wurdest %1 mal beim Fahren ohne Führerschein gesehen!",life_speedCaught]; 
				[format["Du wurdest %1 mal beim Fahren ohne Führerschein gesehen!",life_speedCaught],"RED",10] spawn life_fnc_notification_system;
			};
            //if(life_speedCaught isEqualTo 6) then { systemChat format["Du wurdest %1 mal beim Fahren ohne Führerschein gesehen!",life_speedCaught];};
            if(life_speedCaught > 3) then {
                vehicle _driver setFuel 0;
                //s/ystemChat format["Dein %1th TICKET! Halt dich an die Verkehrsregeln!",life_speedCaught];
                [format["Dein %1th TICKET! Halt dich an die Verkehrsregeln!",life_speedCaught],"RED",10] spawn life_fnc_notification_system;
				//h/int parseText format ["<t color='#ffffff'><t size='2'><t align='center'>Speed Radar<br/><t color='#ff0000'><t align='center'><t size='1.5'>Speed: %1 km/h<br/><t color='#ffffff'><t align='center'><t size='1'>Speed Limit: %2 km/h<br/><t color='#ffffff'><t align='center'><t size='1'>Driver: %3<br/>You are now wanted for Felony Speeding and are arrest-on-site",round _speed,_limit,name _driver];
                //[parseText format ["<t color='#ffffff'><t size='2'><t align='center'>Speed Radar<br/><t color='#ff0000'><t align='center'><t size='1.5'>Speed: %1 km/h<br/><t color='#ffffff'><t align='center'><t size='1'>Speed Limit: %2 km/h<br/><t color='#ffffff'><t align='center'><t size='1'>Fahrer: %3<br/>Nach dir wird nun wegen zu schnellem Fahren gesucht!",round _speed,_limit,name _driver],"RED",10] spawn life_fnc_notification_system;
			};
            //h/int parseText format ["<t color='#ffffff'><t size='2'><t align='center'>Speed Radar<br/><t color='#ff0000'><t align='center'><t size='1.5'>Speed: %1 km/h<br/><t color='#ffffff'><t align='center'><t size='1'>Speed Limit: %2 km/h<br/><t color='#ffffff'><t align='center'><t size='1'>Driver: %3<br/><t color='#ffffff'><t align='center'><t size='1'>You are now wanted for driving without a license and are subject for arrest",round _speed,_limit,name _driver];
            //[parseText format ["<t color='#ffffff'><t size='2'><t align='center'>Speed Radar<br/><t color='#ff0000'><t align='center'><t size='1.5'>Speed: %1 km/h<br/><t color='#ffffff'><t align='center'><t size='1'>Speed Limit: %2 km/h<br/><t color='#ffffff'><t align='center'><t size='1'>Fahrer: %3<br/><t color='#ffffff'><t align='center'><t size='1'>Nach dir wird nun wegen Fahren ohne Führerschein gesucht!",round _speed,_limit,name _driver],"RED",10] spawn life_fnc_notification_system;
			if((typeOf (vehicle _driver)) in _cars) then {
				[[getPlayerUID _driver,name _driver,"5"],"life_fnc_wantedAdd",false,false] spawn life_fnc_MP;
			} else {
				[[getPlayerUID _driver,name _driver,"6"],"life_fnc_wantedAdd",false,false] spawn life_fnc_MP;
			};
			if(((_speed - _limit) >= 10) && ((_speed - _limit) < 20)) then {
                [[getPlayerUID _driver,name _driver,"10"],"life_fnc_wantedAdd",false,false] spawn life_fnc_MP;
            };
			if (((_speed - _limit) >= 20) && ((_speed - _limit) < 30)) then {
                [[getPlayerUID _driver,name _driver,"11"],"life_fnc_wantedAdd",false,false] spawn life_fnc_MP;
            };
			if ((_speed - _limit) >= 30) then {
                [[getPlayerUID _driver,name _driver,"12"],"life_fnc_wantedAdd",false,false] spawn life_fnc_MP;
            };
			[parseText format ["<t color='#ffffff'><t size='2'><t align='center'>Speed Radar<br/><t color='#ff0000'><t align='center'><t size='1.5'>Speed: %1 km/h<br/><t color='#ffffff'><t align='center'><t size='1'>Speed Limit: %2 km/h<br/><t color='#ffffff'><t align='center'><t size='1'>Fahrer: %3",round _speed,_limit,name _driver],"RED",10] spawn life_fnc_notification_system;
            /*if(CASH <= _ticketWL) then {
                if(BANK <= _ticketWL) exitWith {
                    //h/int parseText format ["<t color='#ffffff'><t size='2'><t align='center'>Speed Radar<br/><t color='#ff0000'><t align='center'><t size='1.5'>Speed: %1 km/h<br/><t color='#ffffff'><t align='center'><t size='1'>Speed Limit: %2 km/h<br/><t color='#ffffff'><t align='center'><t size='1'>Driver: %3<br/><t color='#ffffff'><t align='center'><t size='1'>Fine: $%4<br/>Since you are broke and cannot pay, you now have a warrant out for you instead",round _speed,_limit,name _driver,[_ticketWL] call life_fnc_numberText];
                    [parseText format ["<t color='#ffffff'><t size='2'><t align='center'>Speed Radar<br/><t color='#ff0000'><t align='center'><t size='1.5'>Speed: %1 km/h<br/><t color='#ffffff'><t align='center'><t size='1'>Speed Limit: %2 km/h<br/><t color='#ffffff'><t align='center'><t size='1'>Fahrer: %3<br/><t color='#ffffff'><t align='center'><t size='1'>Strafe: $%4<br/>Da du kein Geld mehr hast, wird nun nach dir gefahndet!",round _speed,_limit,name _driver,[_ticketWL] call life_fnc_numberText],"RED",10] spawn life_fnc_notification_system;
					[[getPlayerUID _driver,name _driver,"139"],"life_fnc_wantedAdd",false,false] spawn life_fnc_MP;
                };
                BANK = BANK - _ticketWL;
                //h/int parseText format ["<t color='#ffffff'><t size='2'><t align='center'>Speed Radar<br/><t color='#ff0000'><t align='center'><t size='1.5'>Speed: %1 km/h<br/><t color='#ffffff'><t align='center'><t size='1'>Speed Limit: %2 km/h<br/><t color='#ffffff'><t align='center'><t size='1'>Driver: %3<br/><t color='#ffffff'><t align='center'><t size='1'>Fine: $%4",round _speed,_limit,name _driver,[_ticketWL] call life_fnc_numberText];
                [parseText format ["<t color='#ffffff'><t size='2'><t align='center'>Speed Radar<br/><t color='#ff0000'><t align='center'><t size='1.5'>Speed: %1 km/h<br/><t color='#ffffff'><t align='center'><t size='1'>Speed Limit: %2 km/h<br/><t color='#ffffff'><t align='center'><t size='1'>Fahrer: %3<br/><t color='#ffffff'><t align='center'><t size='1'>Strafe: $%4",round _speed,_limit,name _driver,[_ticketWL] call life_fnc_numberText],"RED",10] spawn life_fnc_notification_system;
				//diag_log "Ticket paid from player bank";//for logging
                [1] call SOCK_fnc_updatePartial;
            } else {
                CASH = CASH - _ticketWL;
                //h/int parseText format ["<t color='#ffffff'><t size='2'><t align='center'>Speed Radar<br/><t color='#ff0000'><t align='center'><t size='1.5'>Speed: %1 km/h<br/><t color='#ffffff'><t align='center'><t size='1'>Speed Limit: %2 km/h<br/><t color='#ffffff'><t align='center'><t size='1'>Driver: %3<br/><t color='#ffffff'><t align='center'><t size='1'>Fine: $%4",round _speed,_limit,name _driver,[_ticketWL] call life_fnc_numberText];	
                [parseText format ["<t color='#ffffff'><t size='2'><t align='center'>Speed Radar<br/><t color='#ff0000'><t align='center'><t size='1.5'>Speed: %1 km/h<br/><t color='#ffffff'><t align='center'><t size='1'>Speed Limit: %2 km/h<br/><t color='#ffffff'><t align='center'><t size='1'>Fahrer: %3<br/><t color='#ffffff'><t align='center'><t size='1'>Strafe: $%4",round _speed,_limit,name _driver,[_ticketWL] call life_fnc_numberText],"RED",10] spawn life_fnc_notification_system;
				//diag_log "Ticket paid from player cash";//for logging
                [0] call SOCK_fnc_updatePartial;
            };*/
        };
    };
};
//diag_log "Speed cam script done";//for logging
sleep 5;