#include "..\..\script_macros.hpp"
/*
	FileexitWith fn_useItem.sqf
	AuthorexitWith Bryan "Tonic" Boardwine
	
	DescriptionexitWith
	Main function for item effects and functionality through the player menu.
*/

disableSerialization;
if((lbCurSel 2005) isEqualto -1) exitWith {[localize "STR_ISTR_SelectItemFirst","RED",10] spawn life_fnc_notification_system;};
private _item = CONTROL_DATA(2005);

_check = false;
call {
	if (_item isEqualto "kidney") exitWith {
		if(([false,_item,1] call life_fnc_handleInv)) then {
			player setVariable["missingOrgan",false,true];
			life_thirst = 100;
			life_hunger = 100;
			player setFatigue .5;
			_check = true;
		};
	};
	if (_item isEqualTo "dogfood") exitWith {
		if(([false,_item,1] call life_fnc_handleInv)) then {
			[player] spawn life_fnc_dogInit;
			_check = true;
		};
	};
	if (_item isEqualto "boltcutter")exitWith {
		[cursorTarget] spawn life_fnc_boltcutter;
		closeDialog 0;
		_check = true;
	};
	if (_item isEqualto "blastingcharge")exitWith {
		player reveal fed_bank;
		(group player) reveal fed_bank;
		[cursorTarget] spawn life_fnc_blastingCharge;
		_check = true;
	};
	if (_item isEqualto "alkohol") exitWith {
		if(([false,_item,1] call life_fnc_handleInv)) then {
			life_thirst = 100;
			player setFatigue 0;
			[] spawn life_fnc_bier;
			_check = true;
		};
	};
	if (_item isEqualto "whiskey_c") exitWith {
		if(([false,_item,1] call life_fnc_handleInv)) then {
			life_thirst = 100;
			player setFatigue 0;
			[] spawn life_fnc_lopbier;
			_check = true;
		};
	};
	if (_item isEqualto "meth_p") exitWith {if(([false,_item,1] call life_fnc_handleInv)) then { [] spawn life_fnc_meth;_check = true;};};
	if (_item isEqualto "workbench_p") exitWith {if(([false,_item,1] call life_fnc_handleInv)) then { [] spawn life_fnc_setWeaponBench;_check = true;};};
	if (_item isEqualto "destille_p") exitWith {if(([false,_item,1] call life_fnc_handleInv)) then { [] spawn life_fnc_setDestille;_check = true;};};
	if (_item isEqualto "opium_p") exitWith {if(([false,_item,1] call life_fnc_handleInv)) then {[] spawn life_fnc_meth;};_check = true;};
	if (_item isEqualto "morphin_p") exitWith {if(([false,_item,1] call life_fnc_handleInv)) then	{[] spawn life_fnc_meth;};_check = true;};
	if (_item in ["ecstasy_p","liq_ecstasy_p"]) exitWith {if(([false,_item,1] call life_fnc_handleInv)) then {[] spawn life_fnc_kokain;};_check = true;};
	if (_item isEqualto "marihuana") exitWith { if(([false,_item,1] call life_fnc_handleInv)) then { [] spawn life_fnc_weed;};_check = true;};
	if (_item isEqualto "pille") exitWith {
		if(([false,_item,1] call life_fnc_handleInv)) then {
			[] spawn life_fnc_pille;
			player setDamage 0;
			life_hunger = 100;
			life_thirst = 100;
			_check = true;
		};
	};
	if (_item isEqualto "abfuehrmittel") exitWith {
		if(([false,_item,1] call life_fnc_handleInv)) then {
			life_hunger = 40;
			_check = true;
		};
	};
	if (_item isEqualto "antidepressiva") exitWith {
		if(([false,_item,1] call life_fnc_handleInv)) then {
			player setDamage 0.20;
			_check = true;
		};
	};
	if (_item isEqualto "impfstoff") exitWith {
		if((damage player) < 0.20) exitWith {["Dir geht es bereits blendend! Du hast mehr als 80HP.","PINK",5] spawn life_fnc_notification_system;};
		if(([false,_item,1] call life_fnc_handleInv)) then {
			player setDamage 0.20;
			_check = true;
		};
	};
	if (_item isEqualto "antibiotika") exitWith { if(([false,_item,1] call life_fnc_handleInv)) then { [] spawn life_fnc_lsd;};_check = true;};
	if (_item isEqualto "heroin_p") exitWith {	if(([false,_item,1] call life_fnc_handleInv)) then {[] spawn life_fnc_heroin;};_check = true;};
	if (_item isEqualto "defusekit")exitWith {[cursorTarget] spawn life_fnc_defuseKit;_check = true;};	
	if (_item in ["storagesmall","storagebig","storagebigextra"])exitWith {[_item] call life_fnc_storageBox;_check = true;};	
	if (_item isEqualto "spikeStrip")exitWith {
		if(!isNull life_spikestrip) exitWith {
			[localize "STR_ISTR_SpikesDeployment","PINK",5] spawn life_fnc_notification_system;
		};
		if(([false,_item,1] call life_fnc_handleInv)) then { [] spawn life_fnc_spikeStrip;};
		_check = true;
	};
	if (_item isEqualto "mauer")exitWith	{
		if(!isNull life_mauer) exitWith {["Du stellst schon eine Pylone!","PINK",5] spawn life_fnc_notification_system;};
		if(([false,_item,1] call life_fnc_handleInv)) then {[] spawn life_fnc_mauer;};
		_check = true;
	};
	if (_item isEqualto "geld")exitWith {
		if(!isNull life_geld) exitWith {["Du legst schon Falschgeld!","PINK",5] spawn life_fnc_notification_system;};
		if(([false,_item,1] call life_fnc_handleInv)) then {[] spawn life_fnc_geld;};
		_check = true;
	};
	if (_item isEqualto "lampe")exitWith {
		if(!isNull life_lampe) exitWith {["Du stellst schon einen Strahler auf!","PINK",5] spawn life_fnc_notification_system;};
		if(([false,_item,1] call life_fnc_handleInv)) then {[] spawn life_fnc_lampe;};
		_check = true;
	};
	if (_item isEqualto "dixi")exitWith {
		if(!isNull life_dixi) exitWith {["Du stellst schon eine Toilette auf!","PINK",5] spawn life_fnc_notification_system;};
		if(([false,_item,1] call life_fnc_handleInv)) then {[] spawn life_fnc_dixi;};
		_check = true;
	};
	if (_item isEqualto "generator")exitWith	{
		if(!isNull life_generator) exitWith {["Du stellst schon einen Generator auf!","PINK",5] spawn life_fnc_notification_system;};
		if(([false,_item,1] call life_fnc_handleInv)) then {[] spawn life_fnc_generator;};
		_check = true;
	};
	
	if (_item isEqualto "matratze")exitWith {
		if(!isNull life_matratze) exitWith {["Du legst schon eine Matratze hin!","PINK",5] spawn life_fnc_notification_system;};
		if(([false,_item,1] call life_fnc_handleInv)) then {[] spawn life_fnc_matratze;};
		_check = true;
	};
	if (_item isEqualto "zelt")exitWith {
		if(!isNull life_zelt) exitWith {["Du stellst schon ein Pavillon auf!","PINK",5] spawn life_fnc_notification_system;};
		if(([false,_item,1] call life_fnc_handleInv)) then {[] spawn life_fnc_zelt;};
		_check = true;
	};
	if (_item isEqualto "tisch")exitWith {
		if(!isNull life_tisch) exitWith {["Du stellst schon einen Tisch auf!","PINK",5] spawn life_fnc_notification_system;};
		if(([false,_item,1] call life_fnc_handleInv)) then {[] spawn life_fnc_tisch;};
		_check = true;
	};
	if (_item isEqualto "wand")exitWith {
		if(!isNull life_wand) exitWith {["Du stellst schon eine Mauer auf!","PINK",5] spawn life_fnc_notification_system;};
		if(([false,_item,1] call life_fnc_handleInv)) then {[] spawn life_fnc_wand;};
		_check = true;
	};
	if (_item isEqualto "schranke")exitWith {
		if(!isNull life_schranke) exitWith {["Du stellst schon eine Schranke auf!","PINK",5] spawn life_fnc_notification_system;};
		if(([false,_item,1] call life_fnc_handleInv)) then {[] spawn life_fnc_schranke;};
		_check = true;
	};
	if (_item isEqualto "sperre")exitWith {
		if(!isNull life_sperre) exitWith {[localize "STR_ISTR_RefuelInVehicle","YELLOW",5] spawn life_fnc_notification_system;};
		if(([false,_item,1] call life_fnc_handleInv)) then {[] spawn life_fnc_sperre;};
		_check = true;
	};
	if (_item isEqualto "fuelF")exitWith {
		if(vehicle player != player) exitWith {[localize "STR_ISTR_RefuelInVehicle","YELLOW",5] spawn life_fnc_notification_system};
		[] spawn life_fnc_jerryRefuel;
		_check = true;
	};
	if (_item isEqualto "lockpick")exitWith{[] spawn life_fnc_lockpick;_check = false;};
	
	if (_item in ["peach","obst1","obst2","backware1","backware2","backware3","essen_warm1","essen_warm2","essen_warm3","delikatesse","fishcan_c","turtlecan_c","fisch_p","kaviar_p","food1_s","food2_s","food3_s","food4_s"])exitWith {
        if (!(M_CONFIG(getNumber,"VirtualItems",_item,"edible") isEqualTo -1)) then {
            if ([false,_item,1] call life_fnc_handleInv) then {
                _val = M_CONFIG(getNumber,"VirtualItems",_item,"edible");
                _sum = life_hunger + _val;
				_check = true;
                call {
                    if (_val < 0 && _sum < 1)exitWith {life_hunger = 5;}; //This adds the ability to set the entry edible to a negative value and decrease the hunger without death
                    if (_sum > 100)exitWith {life_hunger = 100;["Du hast dich etwas überfressen...","PINK",5] spawn life_fnc_notification_system;};
                    life_hunger = _sum;
                };
            };
        };
    };
	
    if (_item in ["waterbottle","energy","warmdrink","limo","alkohol","whiskey_c","milch_p","milch_u","wasser_p"])exitWith {
        if (!(M_CONFIG(getNumber,"VirtualItems",_item,"edible") isEqualTo -1)) then {
            if ([false,_item,1] call life_fnc_handleInv) then {
                _val = M_CONFIG(getNumber,"VirtualItems",_item,"edible");
                _sum = life_thirst + _val;
				_check = true;
                call {
                    if (_val < 0 && _sum < 1)exitWith {life_thirst = 5;}; //This adds the ability to set the entry edible to a negative value and decrease the hunger without death
                    if (_sum > 100)exitWith {life_thirst = 100;["Du hast etwas zu viel getrunken...","PINK",5] spawn life_fnc_notification_system;};
                    life_thirst = _sum;
                };
            };
        };
    };
	
	if (_item isEqualto "underwatercharge")exitWith {
		player reveal gold_safe;
		(group player) reveal gold_safe;
		[cursorTarget] spawn life_fnc_underwaterCharge;
		_check = false;
	};
};
if !(_check) then {[localize "STR_ISTR_NotUsable","RED",10] spawn life_fnc_notification_system;};
	
[] call life_fnc_p_updateMenu;
[] call life_fnc_hudUpdate;