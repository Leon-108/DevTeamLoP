#include "..\..\script_macros.hpp"
/*
	File: fn_medicLoadout.sqf
	Author: Bryan "Tonic" Boardwine
	
	Description:
	Loads the medic out with the default gear.
*/
private["_handle"];
_handle = [] spawn life_fnc_stripDownPlayer;
waitUntil {scriptDone _handle};

player forceAddUniform "U_I_HeliPilotCoveralls";
player addVest "Vest_V_Safety_orange_F";
player addHeadgear "H_Cap_red";
player addBackpack "B_Carryall_cbr";
player addItem "Medikit";
player addItem "ToolKit";
player addItem "ItemMap";
player assignItem "ItemMap";
player addItem "ItemCompass";
player assignItem "ItemCompass";
player addItem "ItemGPS";
player assignItem "ItemGPS";
player addItem "NVGoggles_OPFOR";
player assignItem "NVGoggles_OPFOR";

if(backpack player != "") then {(unitBackpack player) setObjectTextureGlobal [0,""];};
[[player,0,"textures\klamotten_prs.paa"],"life_fnc_setTexture",true,false] call life_fnc_MP;

[] call life_fnc_saveGear;