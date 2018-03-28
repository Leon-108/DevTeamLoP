#include "..\..\script_macros.hpp"
/*
	File: fn_actionKeyHandler.sqf
	Author: Bryan "Tonic" Boardwine
	
	Description:
	Master action key handler, handles requests for picking up various items and
	interacting with other players (Cops = Cop Menu for unrestrain,escort,stop escort, arrest (if near cop hq), etc).
*/
private["_curTarget","_fish","_money","_miscItems","_isWater","_whatIsIt","_fish","_turtle","_handle"];

_curTarget = if (!isNull cursorObject) then {
	cursorObject;
} else {
	cursorTarget;
};

if(dialog) exitWith {};
if(vehicle player != player) exitWith {};
if(life_action_inUse) exitWith {};
if(life_interrupted) exitWith {life_interrupted = false;};
_isWater = surfaceIsWater (visiblePositionASL player);
_money = ((nearestObjects[getPos player,["Land_Money_F"],2]) select 0);
_spikestrip = ((nearestObjects[getPos player,["Land_Razorwire_F"],2]) select 0);
//_miscItems = ((nearestObjects[getPos player,["Land_BottlePlastic_V1_F","Land_TacticalBacon_F","Land_Can_V3_F","Land_CanisterFuel_F","Land_Suitcase_F"],2]) select 0);
_closestMan = (nearestObjects[getPos player,["Man"],1.4]);
if(count _closestMan > 1) then {
	_closestMan = (_closestMan select 1);
} else {
	_closestMan = objNull;
};
// Checkt ob ein Spieler im Wasser ist und ein Fisch in der nähe schwimmt
if (_isWater) then {
	_turtle = ((nearestObjects[player,["Turtle_F"],3]) select 0);
	if (!isNil "_turtle" && playerSide isEqualTo civilian) exitWith {
		if (!alive _turtle) then {
			[_turtle] call life_fnc_catchTurtle;
		};
	};
	_fish = ((nearestObjects[player,["Fish_Base_F"],3]) select 0);
	if (!isNil "_fish") exitWith {
		[_fish] call life_fnc_catchFish;
	};
};
//Ist vor dir ein gefesselter oder gezippter Mensch)
if !(isNull _closestMan) exitWith {
	if (alive _closestMan) then {
		if(isPlayer _closestMan) exitWith {
			if(!dialog && playerSide isEqualTo west) exitWith {
				[_curTarget,_closestMan] call life_fnc_copInteractionMenu;
			};
			if((_closestMan getVariable["Re-strained",false]) && !dialog && playerSide isEqualTo civilian && !(player getVariable["Re-strained",false]) ) exitWith {
				[_curTarget,_closestMan] call life_fnc_civInteractionMenu;
			}; 
			if(!dialog && playerSide isEqualTo independent && !(player getVariable["Re-strained",false])) exitWith {
				[_curTarget,_closestMan] call life_fnc_arsInteractionMenu;
			};
		};
	} else {
		if(((playerSide isEqualto west && {(call life_revive_cops)}) || playerSide isEqualto independent) && {"Medikit" in (items player)}) then {
			[_closestMan] call life_fnc_revivePlayer;
		};
	};
};
_curTar = cursorTarget;
if(_curTar isKindOf "Man" && player distance _curTar < 2.5) exitWith {
    if (alive _curTar) then {
        if(isPlayer _curTar) exitWith {
            if(!dialog && playerSide isEqualTo west) exitWith {
                [_curTarget,_curTar] call life_fnc_copInteractionMenu;
            };
            if((_curTarget getVariable["Re-strained",false]) && !dialog && playerSide isEqualTo civilian && !(player getVariable["Re-strained",false])) exitWith {
                [_curTarget,_curTar] call life_fnc_civInteractionMenu;
            }; 
            if(!dialog && playerSide isEqualTo independent && !(player getVariable["Re-strained",false])) exitWith {
                [_curTarget,_curTar] call life_fnc_arsInteractionMenu;
            };
        };
    } else {
        if(((playerSide isEqualto west && {(call life_revive_cops)}) || playerSide isEqualto independent) && {"Medikit" in (items player)}) then {
            [_curTar] call life_fnc_revivePlayer;
        };
    };
};
// Einheitliches Sammeln auf Q gelegt
/*
if (isNull _curTarget) exitWith {
	_whatIsIt = "nothing";
	if (!life_action_gathering) exitWith {
		_whatIsIt = [] call life_fnc_whereAmI;
		if (life_action_gathering) exitWith {};                 //Action is in use, exit to prevent spamming.
		if !(_whatIsIt isEqualTo "nothing") then { 
			_handle = [_whatIsIt] spawn life_fnc_mine;
			life_action_gathering = true;
			waitUntil {scriptDone _handle};
			life_action_gathering = false;
		};
	};
};
*/

// Liegt Geld vor dir?
_curTarget = cursorObject;
if ((typeOf _curTarget) isEqualTo "Land_Money_F" && {!(_curTarget getVariable ["inUse",false])}) then {
	[[_curTarget,player,true],"TON_fnc_pickupAction",false,false] spawn life_fnc_MP;
};

// Ist vor dir ein Item, dass du aufheben möchtest?
_miscItems = ["Land_BottlePlastic_V1_F","Land_TacticalBacon_F","Land_Can_V3_F","Land_CanisterFuel_F","Land_Suitcase_F","Land_Axe_F","Land_Shovel_F"];
if ((typeOf _curTarget) in _miscItems) then {
	[[_curTarget,player,false],"TON_fnc_pickupAction",false,false] spawn life_fnc_MP;
};

// Ist vor dir ein Spikestrip, dass du aufheben möchtest?
if(!isNil "_spikestrip" && playerSide isEqualto west) exitWith {
	[_spikestrip] spawn life_fnc_packupSpikes;
};

// Ist vor dir die Bank?!
if(_curTarget isKindOf "House_F" && {player distance _curTarget < 12} OR ((nearestObject [[9590.06,10605,40.367],"Land_Dome_Big_F"]) isEqualto _curTarget OR (nearestObject [[9590.06,10605,40.367],"Land_Research_house_V1_F"]) isEqualto _curTarget)) exitWith {
	[_curTarget] call life_fnc_houseMenu;
};

// Steht vor dir ein Fahrzeug?
_curTarget = cursorTarget;
if((_curTarget isKindOf "landVehicle") OR (_curTarget isKindOf "Ship") OR (_curTarget isKindOf "Air")) exitWith {
	if(player distance _curTarget < ((boundingBox _curTarget select 1) select 0) + 2) then {
		[_curTarget] call life_fnc_vInteractionMenu;
	};
};