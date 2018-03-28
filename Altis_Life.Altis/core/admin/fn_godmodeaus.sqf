/*
	Author: Oktas
	http://www.lostofparadise.de/
*/

if (alive player) then 
{
	player allowDamage true;
	player setDamage 0;
	//t/itleText ["••• GODMODE DEAKTIVIERT, STANDARD LOADOUT WIRD GENERIERT •••","PLAIN",1];
	["••• GODMODE DEAKTIVIERT, STANDARD LOADOUT WIRD GENERIERT •••","WHITE",5] spawn life_fnc_notification_system;
	sleep 1;
	removeHeadgear player;
	removeVest player;
	removeAllWeapons player;
	removeBackpack player;
	removeAllItems player;
	removeAllAssignedItems player;
	removeUniform player;
	removeGoggles player;
	switch (playerSide) do
	{
		case west:
		{
			[] call life_fnc_copLoadout;
		};
		
		case civilian:
		{
			player linkItem "ItemMap";
			player linkItem "ItemCompass";
			player linkItem "ItemWatch";
			player linkItem "ItemRadio";
			player linkItem "ItemGPS";
			player linkItem "NVGoggles_OPFOR";
			player addVest "V_PlateCarrier1_blk";
			player forceAddUniform "U_O_CombatUniform_oucamo";
			if (getPlayerUID player isEqualTo "76561198082204994") then {
				player forceAddUniform "U_Marshal";
				player addBackPack "B_Carryall_oucamo";
				player addHeadgear "H_Hat_grey";
				player addGoggles "G_Spectacles_Tinted";
				player addWeapon "Laserdesignator";
			};
			if (getPlayerUID player isEqualTo "76561198075876776") then {
				player forceAddUniform "U_I_G_Story_Protagonist_F";
				player addBackPack "B_Carryall_oucamo";
				player addHeadgear "H_StrawHat_dark";
				player addGoggles "G_Spectacles_Tinted";
				player addWeapon "Laserdesignator";
				
			};
			if (getPlayerUID player isEqualTo "76561198117772792") then {
				player forceAddUniform "U_O_CombatUniform_oucamo";
				player addBackPack "B_Bergen_rgr";
				player addWeapon "Laserdesignator";
			};
			if (getPlayerUID player isEqualTo "76561198073604498") then {
				player forceAddUniform "U_B_CombatUniform_mcam_vest";
				player addBackPack "B_Carryall_oucamo";
				player addHeadgear "H_Booniehat_mcamo";
				player addGoggles "G_Sport_Greenblack";
				player addWeapon "Laserdesignator";
				player addItemToUniform "FirstAidKit";
				player addItemToUniform "FirstAidKit";
				player addItemToUniform "muzzle_snds_B";
				player addItemToVest "optic_Hamr";
				player addItemToVest "optic_AMS";
				player addItemToVest "bipod_01_F_blk";
				for "_i" from 0 to 6 do {player addItemToVest "20Rnd_762x51_Mag";};
				player addItemToBackpack "arifle_SPAR_03_blk_F";
				player addItemToBackpack "ToolKit";
				player addItemToBackpack "ToolKit";
			};
			if (getPlayerUID player isEqualTo "76561198258898622") then {
				player forceAddUniform "U_B_CTRG_3";
				player addBackPack "B_ViperLightHarness_blk_F";
				player addHeadgear "H_HelmetSpecB_blk";
				player addGoggles "G_Balaclava_TI_G_blk_F";
				player addWeapon "Laserdesignator";
				player addItemToUniform "FirstAidKit";
				player addItemToUniform "FirstAidKit";
				player addItemToUniform "FirstAidKit";
				player addItemToUniform "FirstAidKit";
				player addItemToBackpack "ToolKit";
				player addItemToBackpack "ToolKit";
			};
			if (getPlayerUID player isEqualTo "76561198128285292") then {
				player forceAddUniform "U_B_CombatUniform_mcam_vest";
				player addVest "V_PlateCarrier1_rgr_noflag_F";
				player addBackPack "B_Carryall_cbr";
				player addHeadgear "H_HelmetSpecB_paint2";
				player addGoggles "G_Balaclava_TI_blk_F";
				player addWeapon "Laserdesignator";
				player addItemToUniform "FirstAidKit";
				player addItemToUniform "FirstAidKit";
				player addItemToBackpack "ToolKit";
				player linkItem "NVGoggles_OPFOR";
			};
			if (getPlayerUID player isEqualTo "76561198079938959") then {
				player forceAddUniform "U_B_CombatUniform_mcam_vest";
				player addVest "V_PlateCarrier1_blk";
				player addBackPack "B_Carryall_oucamo";
				player addHeadgear "H_Hat_Safari_sand_F";
				player addGoggles "G_Aviator";
				player addWeapon "Laserdesignator";
				player addItemToUniform "FirstAidKit";
				player addItemToUniform "FirstAidKit";
				player addItemToBackpack "ToolKit";
				player linkItem "NVGoggles_OPFOR";
			};
			if (getPlayerUID player isEqualTo "76561198125123009") then {
				player forceAddUniform "U_B_CombatUniform_mcam_vest";
				player addVest "V_PlateCarrier1_blk";
				player addBackPack "B_Carryall_oucamo";
				player addHeadgear "H_Hat_Safari_sand_F";
				player addGoggles "G_Aviator";
				player addWeapon "Laserdesignator";
				player addItemToUniform "FirstAidKit";
				player addItemToUniform "FirstAidKit";
				player addItemToBackpack "ToolKit";
				player linkItem "NVGoggles_OPFOR";
			};
			if (backpack player isEqualTo "") then {player addBackPack "B_Carryall_oucamo";};
		};
		
		case independent:
		{
			//Initialize Medics and blah
			[] call life_fnc_medicLoadout;
		};
	};
};
sleep 3;
player setVariable ["admin",nil,true];
[player, uniform player] call life_fnc_equipGear;
