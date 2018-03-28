/*
	File: fn_copLoadout.sqf
	Author: Bryan "Tonic" Boardwine
	
	Description:
	Loads the cops out with the default gear.
	Edited: Itsyuka
*/

private["_handle"];
_handle = [] spawn life_fnc_stripDownPlayer;
waitUntil {scriptDone _handle};

//Load player with default cop gear.
player addUniform "U_Rangemaster";
player addVest "V_TacVest_blk_POLICE";
player addBackpack "B_Bergen_dgtl_F";
player addMagazine "11Rnd_45ACP_Mag";player addMagazine "11Rnd_45ACP_Mag";player addMagazine "11Rnd_45ACP_Mag";
player addMagazine "11Rnd_45ACP_Mag";player addMagazine "11Rnd_45ACP_Mag";player addMagazine "11Rnd_45ACP_Mag";
player addWeapon "hgun_Pistol_heavy_01_F";
player addHandgunItem "optic_MRD";
player addHandgunItem "acc_flashlight_pistol";
player addHandgunItem "muzzle_snds_acp";
player addItem "ItemMap";
player assignItem "ItemMap";
player addItem "ItemCompass";
player assignItem "ItemCompass";
player addItem "ItemWatch";
player assignItem "ItemWatch";
player addItem "ItemGPS";
player assignItem "ItemGPS";
player addItem "NVGoggles_OPFOR";
player assignItem "NVGoggles_OPFOR";
player addItem "Medikit";
player addItem "ToolKit";

if(backpack player != "") then {(unitBackpack player) setObjectTextureGlobal [0,""];};
player setObjectTextureGlobal [0,"textures\Person_Skins_Cop\PPD_Hemd.paa"];

[] call life_fnc_saveGear;