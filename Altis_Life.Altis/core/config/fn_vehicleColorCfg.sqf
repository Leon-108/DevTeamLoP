/*
	File: fn_vehicleColorCfg.sqf
	Author: Bryan "Tonic" Boardwine
	
	Description:
	Master configuration for vehicle colors.
*/
private["_vehicle","_ret","_path"];
_vehicle = [_this,0,"",[""]] call BIS_fnc_param;
if(_vehicle isEqualTo "") exitWith {[]};
_ret = [];

switch (_vehicle) do
{
	case "C_Kart_01_F":
	{	
		_ret = [
			["\a3\Soft_F_Kart\Kart_01\Data\Kart_01_CO.paa","civ","\a3\Soft_F_Kart\Kart_01\Data\Kart_01_logos_CA.paa","\a3\Soft_F_Kart\Kart_01\Data\Kart_num_1_CA.paa","\a3\Soft_F_Kart\Kart_01\Data\Kart_num_3_CA.paa"],
			["\a3\Soft_F_Kart\Kart_01\Data\Kart_01_base_blue_CO.paa","cop","\a3\Soft_F_Kart\Kart_01\Data\Kart_01_logos_blu_CA.paa","\a3\Soft_F_Kart\Kart_01\Data\Kart_num_1_CA.paa","\a3\Soft_F_Kart\Kart_01\Data\Kart_num_3_CA.paa"],
			["\a3\Soft_F_Kart\Kart_01\Data\Kart_01_blu_CO.paa","civ","\a3\Soft_F_Kart\Kart_01\Data\Kart_01_logos_blu_CA.paa","\a3\Soft_F_Kart\Kart_01\Data\Kart_num_1_CA.paa","\a3\Soft_F_Kart\Kart_01\Data\Kart_num_3_CA.paa"],
			["\a3\Soft_F_Kart\Kart_01\Data\Kart_01_black_CO.paa","civ","\a3\Soft_F_Kart\Kart_01\Data\Kart_01_logos_black_CA.paa","\a3\Soft_F_Kart\Kart_01\Data\Kart_num_1_CA.paa","\a3\Soft_F_Kart\Kart_01\Data\Kart_num_3_CA.paa"],
			["\a3\Soft_F_Kart\Kart_01\Data\Kart_01_vrana_CO.paa","civ","\a3\Soft_F_Kart\Kart_01\Data\Kart_01_logos_vrana_CA.paa","\a3\Soft_F_Kart\Kart_01\Data\Kart_num_1_CA.paa","\a3\Soft_F_Kart\Kart_01\Data\Kart_num_3_CA.paa"],
			["\a3\Soft_F_Kart\Kart_01\Data\Kart_01_base_green_CO.paa","civ","\a3\Soft_F_Kart\Kart_01\Data\Kart_01_logos_blu_CA.paa","\a3\Soft_F_Kart\Kart_01\Data\Kart_num_1_CA.paa","\a3\Soft_F_Kart\Kart_01\Data\Kart_num_3_CA.paa"],
			["\a3\Soft_F_Kart\Kart_01\Data\Kart_01_base_blue_CO.paa","civ","\a3\Soft_F_Kart\Kart_01\Data\Kart_01_logos_blu_CA.paa","\a3\Soft_F_Kart\Kart_01\Data\Kart_num_1_CA.paa","\a3\Soft_F_Kart\Kart_01\Data\Kart_num_3_CA.paa"],
			["\a3\Soft_F_Kart\Kart_01\Data\Kart_01_base_orange_CO.paa","civ","\a3\Soft_F_Kart\Kart_01\Data\Kart_01_logos_blu_CA.paa","\a3\Soft_F_Kart\Kart_01\Data\Kart_num_1_CA.paa","\a3\Soft_F_Kart\Kart_01\Data\Kart_num_3_CA.paa"],
			["\a3\Soft_F_Kart\Kart_01\Data\Kart_01_base_white_CO.paa","civ","","\a3\Soft_F_Kart\Kart_01\Data\Kart_num_1_CA.paa","\a3\Soft_F_Kart\Kart_01\Data\Kart_num_3_CA.paa"],
			["\a3\Soft_F_Kart\Kart_01\Data\Kart_01_base_yellow_CO.paa","civ","","\a3\Soft_F_Kart\Kart_01\Data\Kart_num_1_CA.paa","\a3\Soft_F_Kart\Kart_01\Data\Kart_num_3_CA.paa"],
			["\a3\Soft_F_Kart\Kart_01\Data\Kart_01_base_black_CO.paa","civ","\a3\Soft_F_Kart\Kart_01\Data\Kart_01_logos_black_CA.paa","\a3\Soft_F_Kart\Kart_01\Data\Kart_num_1_CA.paa","\a3\Soft_F_Kart\Kart_01\Data\Kart_num_3_CA.paa"]
		];
	};
		
	case "I_Heli_Transport_02_F":
	{
		_ret =
		[
			["\a3\air_f_beta\Heli_Transport_02\Data\Skins\heli_transport_02_1_ion_co.paa","civ","\a3\air_f_beta\Heli_Transport_02\Data\Skins\heli_transport_02_2_ion_co.paa","\a3\air_f_beta\Heli_Transport_02\Data\Skins\heli_transport_02_3_ion_co.paa"],
			["\a3\air_f_beta\Heli_Transport_02\Data\Skins\heli_transport_02_1_dahoman_co.paa","civ","\a3\air_f_beta\Heli_Transport_02\Data\Skins\heli_transport_02_2_dahoman_co.paa","\a3\air_f_beta\Heli_Transport_02\Data\Skins\heli_transport_02_3_dahoman_co.paa"],
			["textures\pixel.jpg","fed","textures\pixel.jpg","textures\pixel.jpg"],
			["\a3\air_f_beta\Heli_Transport_02\Data\Skins\heli_transport_02_1_ion_co.paa","donator1","\a3\air_f_beta\Heli_Transport_02\Data\Skins\heli_transport_02_2_ion_co.paa","\a3\air_f_beta\Heli_Transport_02\Data\Skins\heli_transport_02_3_ion_co.paa"],
			["\a3\air_f_beta\Heli_Transport_02\Data\Skins\heli_transport_02_1_dahoman_co.paa","donator1","\a3\air_f_beta\Heli_Transport_02\Data\Skins\heli_transport_02_2_dahoman_co.paa","\a3\air_f_beta\Heli_Transport_02\Data\Skins\heli_transport_02_3_dahoman_co.paa"],
			["textures\Fahrzeug_Skins\Medic\mohawk_prs_main.paa","med","textures\Fahrzeug_Skins\Medic\mohawk_prs_eng.paa","textures\Fahrzeug_Skins\Medic\mohawk_prs_rot.paa"],
			["A3\Air_F_Orange\Heli_Transport_02\Data\Heli_Transport_02_1_IDAP_CO.paa","donator1","A3\Air_F_Orange\Heli_Transport_02\Data\Heli_Transport_02_2_IDAP_CO.paa","A3\Air_F_Orange\Heli_Transport_02\Data\Heli_Transport_02_3_IDAP_CO.paa","A3\Air_F_Orange\Heli_Transport_02\Data\Heli_Transport_02_int_02_IDAP_CO.paa"]
		];

	};
	
	case "C_Offroad_02_unarmed_F": // Offroad Apex
	{
		_ret =
		[
			["a3\soft_f_exp\offroad_02\data\offroad_02_ext_black_co.paa","civ","a3\soft_f_exp\offroad_02\data\offroad_02_ext_black_co.paa","a3\soft_f_exp\offroad_02\data\offroad_02_int_black_co.paa","a3\soft_f_exp\offroad_02\data\offroad_02_int_black_co.paa"],
			["a3\soft_f_exp\offroad_02\data\offroad_02_ext_blue_co.paa","civ","a3\soft_f_exp\offroad_02\data\offroad_02_ext_blue_co.paa","a3\soft_f_exp\offroad_02\data\offroad_02_int_blue_co.paa","a3\soft_f_exp\offroad_02\data\offroad_02_int_blue_co.paa"],
			["a3\soft_f_exp\offroad_02\data\offroad_02_ext_green_co.paa","civ","a3\soft_f_exp\offroad_02\data\offroad_02_ext_green_co.paa","a3\soft_f_exp\offroad_02\data\offroad_02_int_green_co.paa","a3\soft_f_exp\offroad_02\data\offroad_02_int_green_co.paa"],
			["a3\soft_f_exp\offroad_02\data\offroad_02_ext_orange_co.paa","civ","a3\soft_f_exp\offroad_02\data\offroad_02_ext_orange_co.paa","a3\soft_f_exp\offroad_02\data\offroad_02_int_orange_co.paa","a3\soft_f_exp\offroad_02\data\offroad_02_int_orange_co.paa"],
			["a3\soft_f_exp\offroad_02\data\offroad_02_ext_red_co.paa","civ","a3\soft_f_exp\offroad_02\data\offroad_02_ext_red_co.paa","a3\soft_f_exp\offroad_02\data\offroad_02_int_red_co.paa","a3\soft_f_exp\offroad_02\data\offroad_02_int_red_co.paa"],
			["a3\soft_f_exp\offroad_02\data\offroad_02_ext_white_co.paa","civ","a3\soft_f_exp\offroad_02\data\offroad_02_ext_white_co.paa","a3\soft_f_exp\offroad_02\data\offroad_02_int_white_co.paa","a3\soft_f_exp\offroad_02\data\offroad_02_int_white_co.paa"],
			["a3\soft_f_exp\offroad_02\data\offroad_02_ext_brown_co.paa","civ","a3\soft_f_exp\offroad_02\data\offroad_02_ext_brown_co.paa","a3\soft_f_exp\offroad_02\data\offroad_02_int_brown_co.paa","a3\soft_f_exp\offroad_02\data\offroad_02_int_brown_co.paa"],
			["a3\soft_f_exp\offroad_02\data\offroad_02_ext_olive_co.paa","civ","a3\soft_f_exp\offroad_02\data\offroad_02_ext_olive_co.paa","a3\soft_f_exp\offroad_02\data\offroad_02_int_olive_co.paa","a3\soft_f_exp\offroad_02\data\offroad_02_int_olive_co.paa"],
			["\a3\Soft_F_Orange\Offroad_02\Data\offroad_02_ext_IDAP_co.paa","donator1","\a3\Soft_F_Orange\Offroad_02\Data\offroad_02_ext_IDAP_co.paa","\A3\Soft_F_Exp\Offroad_02\Data\offroad_02_int_brown_co.paa","\A3\Soft_F_Exp\Offroad_02\Data\offroad_02_int_brown_co.paa"],
			["textures\Fahrzeug_Skins\Cops\mb4wd.paa","cop"]
		];
	};
	case "I_C_Boat_Transport_02_F": // RHIB
	{
		_ret =
		[
			["a3\boat_f_exp\boat_transport_02\data\boat_transport_02_exterior_co.paa","civ","a3\boat_f_exp\boat_transport_02\data\boat_transport_02_interior_2_co.paa"],
			["a3\boat_f_exp\boat_transport_02\data\boat_transport_02_exterior_civilian_co.paa","civ","a3\boat_f_exp\boat_transport_02\data\boat_transport_02_interior_2_civilian_co.paa"],
			["a3\boat_f_exp\boat_transport_02\data\boat_transport_02_exterior_co.paa","cop","a3\boat_f_exp\boat_transport_02\data\boat_transport_02_interior_2_co.paa"]
		];
	};
	case "B_CTRG_LSV_01_light_F": // Prowler light
	{
		_ret =
		[
			["a3\soft_f_exp\lsv_01\data\nato_lsv_01_black_co.paa","civ","a3\soft_f_exp\lsv_01\data\nato_lsv_02_black_co.paa","a3\soft_f_exp\lsv_01\data\nato_lsv_03_black_co.paa","a3\soft_f_exp\lsv_01\data\nato_lsv_adds_black_co.paa"],
			["a3\soft_f_exp\lsv_01\data\nato_lsv_01_olive_co.paa","civ","a3\soft_f_exp\lsv_01\data\nato_lsv_02_olive_co.paa","a3\soft_f_exp\lsv_01\data\nato_lsv_03_olive_co.paa","a3\soft_f_exp\lsv_01\data\nato_lsv_adds_olive_co.paa"],
			["a3\soft_f_exp\lsv_01\data\nato_lsv_01_sand_co.paa","civ","a3\soft_f_exp\lsv_01\data\nato_lsv_02_sand_co.paa","a3\soft_f_exp\lsv_01\data\nato_lsv_03_sand_co.paa","a3\soft_f_exp\lsv_01\data\nato_lsv_adds_sand_co.paa"],
			["a3\soft_f_exp\lsv_01\data\nato_lsv_01_dazzle_co.paa","reb","a3\soft_f_exp\lsv_01\data\nato_lsv_02_olive_co.paa","a3\soft_f_exp\lsv_01\data\nato_lsv_03_olive_co.paa","a3\soft_f_exp\lsv_01\data\nato_lsv_adds_olive_co.paa"],
			["a3\soft_f_exp\lsv_01\data\nato_lsv_01_black_co.paa","cop","a3\soft_f_exp\lsv_01\data\nato_lsv_02_black_co.paa","a3\soft_f_exp\lsv_01\data\nato_lsv_03_black_co.paa","a3\soft_f_exp\lsv_01\data\nato_lsv_adds_black_co.paa"]
			
		];
	};
	
	case "B_T_LSV_01_unarmed_F": // Prowler
	{
		_ret =
		[
			["a3\soft_f_exp\lsv_01\data\nato_lsv_01_black_co.paa","civ","a3\soft_f_exp\lsv_01\data\nato_lsv_02_black_co.paa","a3\soft_f_exp\lsv_01\data\nato_lsv_03_black_co.paa","a3\soft_f_exp\lsv_01\data\nato_lsv_adds_black_co.paa"],
			["a3\soft_f_exp\lsv_01\data\nato_lsv_01_olive_co.paa","civ","a3\soft_f_exp\lsv_01\data\nato_lsv_02_olive_co.paa","a3\soft_f_exp\lsv_01\data\nato_lsv_03_olive_co.paa","a3\soft_f_exp\lsv_01\data\nato_lsv_adds_olive_co.paa"],
			["a3\soft_f_exp\lsv_01\data\nato_lsv_01_sand_co.paa","civ","a3\soft_f_exp\lsv_01\data\nato_lsv_02_sand_co.paa","a3\soft_f_exp\lsv_01\data\nato_lsv_03_sand_co.paa","a3\soft_f_exp\lsv_01\data\nato_lsv_adds_sand_co.paa"],
			["a3\soft_f_exp\lsv_01\data\nato_lsv_01_dazzle_co.paa","reb","a3\soft_f_exp\lsv_01\data\nato_lsv_02_olive_co.paa","a3\soft_f_exp\lsv_01\data\nato_lsv_03_olive_co.paa","a3\soft_f_exp\lsv_01\data\nato_lsv_adds_olive_co.paa"],
			["a3\soft_f_exp\lsv_01\data\nato_lsv_01_black_co.paa","cop","a3\soft_f_exp\lsv_01\data\nato_lsv_02_black_co.paa","a3\soft_f_exp\lsv_01\data\nato_lsv_03_black_co.paa","a3\soft_f_exp\lsv_01\data\nato_lsv_adds_black_co.paa"]
			
		];
	};
	
	case "O_T_LSV_02_unarmed_F": // Quilin
	{
		_ret =
		[
			["a3\soft_f_exp\lsv_02\data\csat_lsv_01_black_co.paa","civ","a3\soft_f_exp\lsv_02\data\csat_lsv_02_black_co.paa","a3\soft_f_exp\lsv_02\data\csat_lsv_03_black_co.paa"],
			["a3\soft_f_exp\lsv_02\data\csat_lsv_01_ghex_co.paa","reb","a3\soft_f_exp\lsv_02\data\csat_lsv_02_ghex_co.paa","a3\soft_f_exp\lsv_02\data\csat_lsv_03_ghex_co.paa"],
			["a3\soft_f_exp\lsv_02\data\csat_lsv_01_arid_co.paa","reb","a3\soft_f_exp\lsv_02\data\csat_lsv_02_arid_co.paa","a3\soft_f_exp\lsv_02\data\csat_lsv_03_arid_co.paa"],
			["a3\soft_f_exp\lsv_02\data\csat_lsv_01_black_co.paa","cop","a3\soft_f_exp\lsv_02\data\csat_lsv_02_black_co.paa","a3\soft_f_exp\lsv_02\data\csat_lsv_03_black_co.paa"],
			["textures\Fahrzeug_Skins\kartell\QilinSyndikos1.paa","kartell","textures\Fahrzeug_Skins\kartell\QilinSyndikos2.paa","#(ai,64,64,1)Fresnel(1.3,7)"],
			["textures\Fahrzeug_Skins\Cops\SwatQilin1.paa","cop","textures\Fahrzeug_Skins\Cops\SwatQilin2.paa","#(ai,64,64,1)Fresnel(1.3,7)"]
		];
	};
	
	case "C_Hatchback_01_sport_F":
	{
		_ret =
		[
			["\a3\soft_f_gamma\Hatchback_01\data\hatchback_01_ext_sport01_co.paa","civ"],
			["\a3\soft_f_gamma\Hatchback_01\data\hatchback_01_ext_sport02_co.paa","civ"],
			["\a3\soft_f_gamma\Hatchback_01\data\hatchback_01_ext_sport03_co.paa","civ"],
			["\a3\soft_f_gamma\Hatchback_01\data\hatchback_01_ext_sport04_co.paa","civ"],
			["\a3\soft_f_gamma\Hatchback_01\data\hatchback_01_ext_sport05_co.paa","civ"],
			["\a3\soft_f_gamma\Hatchback_01\data\hatchback_01_ext_sport06_co.paa","civ"],
			["textures\Fahrzeug_Skins\Cops\hatchback.paa","cop"],
			["textures\Fahrzeug_Skins\donator\hellokitty.paa","fed"],
			["textures\Fahrzeug_Skins\donator\monster.paa","fed"],
			["textures\Fahrzeug_Skins\donator\Metallica.paa","fed"],
			["textures\Fahrzeug_Skins\donator\hatchback_impreza.paa","fed"],
			["textures\Fahrzeug_Skins\donator\asiimov_hatchback.paa","fed"],
			["textures\Fahrzeug_Skins\lopedition.paa","admin1"],
			["textures\Fahrzeug_Skins\lopedition.paa","admin1"],
			["textures\Fahrzeug_Skins\donator\hellokitty.paa","donator1"],
			["textures\Fahrzeug_Skins\donator\monster.paa","donator1"],
			["textures\Fahrzeug_Skins\donator\Metallica.paa","donator1"],
			["textures\Fahrzeug_Skins\donator\hatchback_impreza.paa","donator1"],
			["textures\Fahrzeug_Skins\donator\asiimov_hatchback.paa","donator1"],
			["textures\Fahrzeug_Skins\Medic\sportlimo_prs.paa","med"],
			["\a3\soft_f_gamma\Hatchback_01\data\hatchback_01_ext_sport02_co.paa","cop"],
			["\a3\soft_f_gamma\Hatchback_01\data\hatchback_01_ext_sport04_co.paa","cop"]
		];
	};
		
		
	case "C_Offroad_01_F":
	{
		_ret = 
		[
			["\A3\soft_F\Offroad_01\Data\offroad_01_ext_co.paa", "civ"], 
			["\A3\soft_F\Offroad_01\Data\offroad_01_ext_BASE01_CO.paa", "civ"],
			["\A3\soft_F\Offroad_01\Data\offroad_01_ext_BASE02_CO.paa", "civ"],
			["\A3\soft_F\Offroad_01\Data\offroad_01_ext_BASE03_CO.paa","civ"],
			["\A3\soft_F\Offroad_01\Data\offroad_01_ext_BASE04_CO.paa","civ"],
			["\A3\soft_F\Offroad_01\Data\offroad_01_ext_BASE05_CO.paa","civ"],
			["textures\pixel.jpg","fed"],
			["textures\Fahrzeug_Skins\CIV\Gay.paa","donator1"],
			["textures\Fahrzeug_Skins\CIV\Holz.paa","donator1"],
			["textures\Fahrzeug_Skins\Cops\offroader.paa","cop"],
			["textures\Fahrzeug_Skins\Medic\offr_prs.paa","med"],
			["textures\Fahrzeug_Skins\CIV\offroad_monster.paa","donator1"],
			["textures\Fahrzeug_Skins\CIV\offroad_ram.paa","donator1"],
			["textures\pixel.jpg","fed"],
			["textures\Event\offroad_event.paa","fed"],
			["\A3\Soft_F_Orange\Offroad_01\Data\Offroad_01_ext_IDAP_CO.paa","donator1","\A3\Soft_F_Orange\Offroad_01\Data\Offroad_01_ext_IDAP_CO.paa"]
		];
	};
	case "B_GEN_Offroad_01_gen_F":
	{
		_ret = 
		[
			["textures\Fahrzeug_Skins\Cops\offroader.paa","cop"],
			["textures\Fahrzeug_Skins\Medic\offr_prs.paa","med"]
		];
	};
	
	case "B_G_Offroad_01_F":
	{
		_ret = 
		[
			["\A3\Soft_F_Bootcamp\Offroad_01\Data\offroad_01_ext_IG_01_CO.paa","reb","\A3\Soft_F_Bootcamp\Offroad_01\Data\offroad_01_ext_IG_01_CO.paa"],
			["\A3\Soft_F_Bootcamp\Offroad_01\Data\offroad_01_ext_IG_01_CO.paa","donator1","\A3\Soft_F_Bootcamp\Offroad_01\Data\offroad_01_ext_IG_01_CO.paa"],
			["\A3\Soft_F_Bootcamp\Offroad_01\Data\offroad_01_ext_IG_02_CO.paa","donator1","\A3\Soft_F_Bootcamp\Offroad_01\Data\offroad_01_ext_IG_02_CO.paa"],
			["\A3\Soft_F_Bootcamp\Offroad_01\Data\offroad_01_ext_IG_03_CO.paa","donator1","\A3\Soft_F_Bootcamp\Offroad_01\Data\offroad_01_ext_IG_03_CO.paa"],
			["\A3\Soft_F_Bootcamp\Offroad_01\Data\offroad_01_ext_IG_04_CO.paa","donator1","\A3\Soft_F_Bootcamp\Offroad_01\Data\offroad_01_ext_IG_04_CO.paa"],
			["\A3\Soft_F_Bootcamp\Offroad_01\Data\offroad_01_ext_IG_05_CO.paa","donator1","\A3\Soft_F_Bootcamp\Offroad_01\Data\offroad_01_ext_IG_05_CO.paa"],
			["\A3\Soft_F_Bootcamp\Offroad_01\Data\offroad_01_ext_IG_06_CO.paa","donator1","\A3\Soft_F_Bootcamp\Offroad_01\Data\offroad_01_ext_IG_06_CO.paa"],
			["\A3\Soft_F_Bootcamp\Offroad_01\Data\offroad_01_ext_IG_07_CO.paa","donator1","\A3\Soft_F_Bootcamp\Offroad_01\Data\offroad_01_ext_IG_07_CO.paa"],
			["\A3\Soft_F_Bootcamp\Offroad_01\Data\offroad_01_ext_IG_08_CO.paa","donator1","\A3\Soft_F_Bootcamp\Offroad_01\Data\offroad_01_ext_IG_08_CO.paa"],
			["\A3\Soft_F_Bootcamp\Offroad_01\Data\offroad_01_ext_IG_09_CO.paa","donator1","\A3\Soft_F_Bootcamp\Offroad_01\Data\offroad_01_ext_IG_09_CO.paa"],
			["\A3\Soft_F_Bootcamp\Offroad_01\Data\offroad_01_ext_IG_10_CO.paa","donator1","\A3\Soft_F_Bootcamp\Offroad_01\Data\offroad_01_ext_IG_10_CO.paa"],
			["\A3\Soft_F_Bootcamp\Offroad_01\Data\offroad_01_ext_IG_11_CO.paa","donator1","\A3\Soft_F_Bootcamp\Offroad_01\Data\offroad_01_ext_IG_11_CO.paa"],
			["\A3\Soft_F_Bootcamp\Offroad_01\Data\offroad_01_ext_IG_12_CO.paa","donator1","\A3\Soft_F_Bootcamp\Offroad_01\Data\offroad_01_ext_IG_12_CO.paa"]
		];
	};
	
	case "C_Offroad_01_repair_F":
	{
		_ret = 
		[
		["textures\pixel.jpg","fed"],
		["textures\Fahrzeug_Skins\Medic\offr_prs.paa","med"]
		];
	};
	
	case "B_Truck_01_mover_F":
	{
		_ret = 
		[
		["textures\Fahrzeug_Skins\Medic\hmmt_prs_front.paa","med","textures\Fahrzeug_Skins\Medic\hmmt_prs_eng.paa"]
		];
	};
	
	case "B_MRAP_01_hmg_F":
	{
		_ret = 
		[
			["textures\Fahrzeug_Skins\Cops\hunter.paa","cop","textures\Fahrzeug_Skins\Cops\hunter1.paa"]
		];
	};
	
	case "O_Plane_CAS_02_F":
		{
		_ret = 
		[
			["textures\Fahrzeug_Skins\CivJetHaupt.paa","civ","textures\Fahrzeug_Skins\CivJetAdds.paa"],
			["textures\Fahrzeug_Skins\CivJetHauptred.paa","civ","textures\Fahrzeug_Skins\CivJetAddsred.paa"]
		];
	};
	
	case "C_Plane_Civil_01_F":
		{
		_ret = 
		[
			["A3\Air_F_Exp\Plane_Civil_01\Data\btt_ext_01_Racer_co.paa","civ","A3\Air_F_Exp\Plane_Civil_01\Data\btt_ext_02_Racer_co.paa","A3\Air_F_Exp\Plane_Civil_01\Data\btt_int_01_tan_co.paa","A3\Air_F_Exp\Plane_Civil_01\Data\btt_int_02_tan_co.paa"],
			["A3\Air_F_Exp\Plane_Civil_01\Data\btt_ext_01_Racer_co.paa","donator1","A3\Air_F_Exp\Plane_Civil_01\Data\btt_ext_02_Racer_co.paa","A3\Air_F_Exp\Plane_Civil_01\Data\btt_int_01_tan_co.paa","A3\Air_F_Exp\Plane_Civil_01\Data\btt_int_02_tan_co.paa"],
			["A3\Air_F_Exp\Plane_Civil_01\Data\btt_ext_01_RedLine_co.paa","donator1","A3\Air_F_Exp\Plane_Civil_01\Data\btt_ext_02_RedLine_co.paa","A3\Air_F_Exp\Plane_Civil_01\Data\btt_int_01_tan_co.paa","A3\Air_F_Exp\Plane_Civil_01\Data\btt_int_02_tan_co.paa"],
			["A3\Air_F_Exp\Plane_Civil_01\Data\btt_ext_01_Wave_co.paa","donator1","A3\Air_F_Exp\Plane_Civil_01\Data\btt_ext_02_Wave_co.paa","A3\Air_F_Exp\Plane_Civil_01\Data\btt_int_01_tan_co.paa","A3\Air_F_Exp\Plane_Civil_01\Data\btt_int_02_tan_co.paa"],
			["A3\Air_F_Exp\Plane_Civil_01\Data\btt_ext_01_Tribal_co.paa","donator1","A3\Air_F_Exp\Plane_Civil_01\Data\btt_ext_02_Tribal_co.paa","A3\Air_F_Exp\Plane_Civil_01\Data\btt_int_01_tan_co.paa","A3\Air_F_Exp\Plane_Civil_01\Data\btt_int_02_tan_co.paa"]
		];
	};
	
	case "C_Plane_Civil_01_racing_F":
		{
		_ret = 
		[
			["A3\Air_F_Exp\Plane_Civil_01\Data\btt_ext_01_Racer_co.paa","civ","A3\Air_F_Exp\Plane_Civil_01\Data\btt_ext_02_Racer_co.paa","A3\Air_F_Exp\Plane_Civil_01\Data\btt_int_01_tan_co.paa","A3\Air_F_Exp\Plane_Civil_01\Data\btt_int_02_tan_co.paa"],
			["A3\Air_F_Exp\Plane_Civil_01\Data\btt_ext_01_Racer_co.paa","donator1","A3\Air_F_Exp\Plane_Civil_01\Data\btt_ext_02_Racer_co.paa","A3\Air_F_Exp\Plane_Civil_01\Data\btt_int_01_tan_co.paa","A3\Air_F_Exp\Plane_Civil_01\Data\btt_int_02_tan_co.paa"],
			["A3\Air_F_Exp\Plane_Civil_01\Data\btt_ext_01_RedLine_co.paa","donator1","A3\Air_F_Exp\Plane_Civil_01\Data\btt_ext_02_RedLine_co.paa","A3\Air_F_Exp\Plane_Civil_01\Data\btt_int_01_tan_co.paa","A3\Air_F_Exp\Plane_Civil_01\Data\btt_int_02_tan_co.paa"],
			["A3\Air_F_Exp\Plane_Civil_01\Data\btt_ext_01_Wave_co.paa","donator1","A3\Air_F_Exp\Plane_Civil_01\Data\btt_ext_02_Wave_co.paa","A3\Air_F_Exp\Plane_Civil_01\Data\btt_int_01_tan_co.paa","A3\Air_F_Exp\Plane_Civil_01\Data\btt_int_02_tan_co.paa"],
			["A3\Air_F_Exp\Plane_Civil_01\Data\btt_ext_01_Tribal_co.paa","donator1","A3\Air_F_Exp\Plane_Civil_01\Data\btt_ext_02_Tribal_co.paa","A3\Air_F_Exp\Plane_Civil_01\Data\btt_int_01_tan_co.paa","A3\Air_F_Exp\Plane_Civil_01\Data\btt_int_02_tan_co.paa"]
		];
	};
	
	case "I_MRAP_03_hmg_F":
	{
		_ret = 
		[
			["textures\Fahrzeug_Skins\Cops\strider.paa","cop","textures\Fahrzeug_Skins\Cops\strider.paa"]
		];
	};
	
	case "B_Truck_01_covered_F":
	{
		_ret = 
		[
			["\a3\soft_f_beta\Truck_01\data\truck_01_ext_01_co.paa","civ","\a3\soft_f_beta\Truck_01\data\truck_01_ext_02_co.paa"],
			["textures\Fahrzeug_Skins\Cops\h-vorne.paa","cop","textures\Fahrzeug_Skins\Cops\h-hinten.paa"],
			["\a3\soft_f_beta\Truck_01\data\truck_01_ext_01_co.paa","donator1","\a3\soft_f_beta\Truck_01\data\truck_01_ext_02_co.paa"],
			["textures\Fahrzeug_Skins\Donator\Hemet_grass_a.paa","donator1","textures\Fahrzeug_Skins\Donator\Hemet_grass_b.paa"],
			["textures\Fahrzeug_Skins\Donator\Hemett_zik_zaka.paa","donator1","textures\Fahrzeug_Skins\Donator\Hemet_zik_zakb.paa"],
			["textures\Fahrzeug_Skins\Medic\hmmt_prs_front.paa","med","textures\Fahrzeug_Skins\Medic\hmmt_prs_eng.paa"],
			["textures\Fahrzeug_Skins\ssg\SSG_Hemtt.paa","ssg","\a3\soft_f_beta\Truck_01\data\truck_01_ext_02_co.paa"]
		];
	};	
	
	case "B_Truck_01_transport_F":
	{
		_ret = 
		[
			["\a3\soft_f_beta\Truck_01\data\truck_01_ext_01_co.paa","civ","\a3\soft_f_beta\Truck_01\data\truck_01_ext_02_co.paa"],
			["\a3\soft_f_beta\Truck_01\data\truck_01_ext_01_co.paa","donator1","\a3\soft_f_beta\Truck_01\data\truck_01_ext_02_co.paa"],
			["textures\Fahrzeug_Skins\Donator\Hemet_grass_a.paa","donator1","textures\Fahrzeug_Skins\Donator\Hemet_grass_b.paa"],
			["textures\Fahrzeug_Skins\Donator\Hemett_zik_zaka.paa","donator1","textures\Fahrzeug_Skins\Donator\Hemet_zik_zakb.paa"]
		];
	};

	case "B_Truck_01_box_F":
	{
		_ret = 
		[
			["\a3\soft_f_beta\Truck_01\data\truck_01_ext_01_co.paa","civ","\a3\soft_f_beta\Truck_01\data\truck_01_ext_02_co.paa"],
			["\a3\soft_f_beta\Truck_01\data\truck_01_ext_01_co.paa","donator1","\a3\soft_f_beta\Truck_01\data\truck_01_ext_02_co.paa","#(ai,64,64,1)Fresnel(1.3,7)"],
			["textures\Fahrzeug_Skins\Donator\Hemet_grass_a.paa","donator1","textures\Fahrzeug_Skins\Donator\Hemet_grass_b.paa"],
			["textures\Fahrzeug_Skins\Donator\Hemett_zik_zaka.paa","donator1","textures\Fahrzeug_Skins\Donator\Hemet_zik_zakb.paa"],
			["\a3\soft_f_beta\Truck_01\data\truck_01_ext_01_co.paa","cop","\a3\soft_f_beta\Truck_01\data\truck_01_ext_02_co.paa"]
		];
	};
	case "B_Truck_01_ammo_F":
	{
		_ret = 
		[
			["\a3\soft_f_beta\truck_01\data\truck_01_ext_01_co.paa","civ""\a3\soft_f_beta\truck_01\data\truck_01_ext_02_co.paa","\A3\Soft_F_Gamma\Truck_01\Data\truck_01_ammo_CO.paa"],
			["\a3\soft_f_beta\Truck_01\data\truck_01_ext_01_co.paa","donator1","\a3\soft_f_beta\Truck_01\data\truck_01_ext_02_co.paa","\A3\Soft_F_Gamma\Truck_01\Data\truck_01_ammo_CO.paa"],
			["textures\Fahrzeug_Skins\Donator\Hemet_grass_a.paa","donator1","textures\Fahrzeug_Skins\Donator\Hemet_grass_b.paa","\A3\Soft_F_Gamma\Truck_01\Data\truck_01_ammo_CO.paa"],
			["textures\Fahrzeug_Skins\Donator\Hemett_zik_zaka.paa","donator1","textures\Fahrzeug_Skins\Donator\Hemet_zik_zakb.paa","\A3\Soft_F_Gamma\Truck_01\Data\truck_01_ammo_CO.paa"]
		];
	};

	case "B_Truck_01_fuel_F":
	{
		_ret = 
		[
			["\a3\soft_f_beta\Truck_01\data\truck_01_ext_01_co.paa","civ","\a3\soft_f_beta\Truck_01\data\truck_01_ext_02_co.paa"],
			["\a3\soft_f_beta\Truck_01\data\truck_01_ext_01_co.paa","donator1","\a3\soft_f_beta\Truck_01\data\truck_01_ext_02_co.paa"],
			["textures\Fahrzeug_Skins\Donator\Hemet_grass_a.paa","donator1","textures\Fahrzeug_Skins\Donator\Hemet_grass_b.paa"],
			["textures\Fahrzeug_Skins\Donator\Hemett_zik_zaka.paa","donator1","textures\Fahrzeug_Skins\Donator\Hemet_zik_zakb.paa"]
		];
	};	
	
	case "O_Truck_03_device_F":
	{
		_ret = 
		[
			["\a3\soft_f_epc\Truck_03\data\truck_03_ext01_co.paa","civ","\A3\Soft_F_EPC\Truck_03\Data\Truck_03_ext02_CO.paa","\A3\Soft_F_EPC\Truck_03\Data\Truck_03_cargo_CO.paa","\A3\Structures_F_EPC\Items\Electronics\Data\The_Device_02_CO.paa","\A3\Structures_F_EPC\Items\Electronics\Data\The_Device_03_CO.paa"],
			["\a3\soft_f_epc\Truck_03\data\truck_03_ext01_co.paa","donator1","\A3\Soft_F_EPC\Truck_03\Data\Truck_03_ext02_CO.paa","\A3\Soft_F_EPC\Truck_03\Data\Truck_03_cargo_CO.paa","\A3\Structures_F_EPC\Items\Electronics\Data\The_Device_02_CO.paa","\A3\Structures_F_EPC\Items\Electronics\Data\The_Device_03_CO.paa"],
			["textures\pixel.jpg","fed","textures\pixel.jpg"],
			["textures\Fahrzeug_Skins\Donator\gerat1.paa","donator1","textures\Fahrzeug_Skins\Donator\gerat2.paa"],
			["\A3\Soft_F_Exp\Truck_03\Data\Truck_03_ext01_ghex_CO.paa","donator1","\A3\Soft_F_Exp\Truck_03\Data\Truck_03_ext02_ghex_CO.paa","\A3\Soft_F_Exp\Truck_03\Data\Truck_03_cargo_ghex_CO.paa","\A3\Structures_F_EPC\Items\Electronics\Data\The_Device_02_CO.paa","\A3\Structures_F_EPC\Items\Electronics\Data\The_Device_03_CO.paa"],
			["textures\Fahrzeug_Skins\dm\geraet1.paa","dm","textures\Fahrzeug_Skins\dm\geraet2.paa"],
			["textures\Fahrzeug_Skins\tgh\geraet1.paa","tgh","textures\Fahrzeug_Skins\tgh\geraet2.paa"]
		];
	};	
	case "O_Truck_03_repair_F":
	{
		_ret = 
		[
			["\a3\soft_f_epc\Truck_03\data\truck_03_ext01_co.paa","civ","\a3\soft_f_epc\Truck_03\data\truck_03_ext02_co.paa","\A3\Soft_F_EPC\Truck_03\Data\Truck_03_ammo_CO.paa"],
			["\a3\soft_f_epc\Truck_03\data\truck_03_ext01_co.paa","donator1","\a3\soft_f_epc\Truck_03\data\truck_03_ext02_co.paa","\A3\Soft_F_EPC\Truck_03\Data\Truck_03_ammo_CO.paa"],
			["\A3\Soft_F_Exp\Truck_03\Data\Truck_03_ext01_ghex_CO.paa","donator1","\A3\Soft_F_Exp\Truck_03\Data\Truck_03_ext02_ghex_CO.paa","\A3\Soft_F_Exp\Truck_03\Data\Truck_03_ammo_ghex_CO.paa"]
		];
	};
	case "O_Truck_03_fuel_F":
	{
		_ret = 
		[
			["\a3\soft_f_epc\Truck_03\data\truck_03_ext01_co.paa","civ","\a3\soft_f_epc\Truck_03\data\truck_03_ext02_co.paa","\A3\Soft_F_EPC\Truck_03\Data\Truck_03_fuel_CO.paa"],
			["\a3\soft_f_epc\Truck_03\data\truck_03_ext01_co.paa","donator1","\a3\soft_f_epc\Truck_03\data\truck_03_ext02_co.paa","\A3\Soft_F_EPC\Truck_03\Data\Truck_03_fuel_CO.paa"],
			["\A3\Soft_F_Exp\Truck_03\Data\Truck_03_ext01_ghex_CO.paa","donator1","\A3\Soft_F_Exp\Truck_03\Data\Truck_03_ext02_ghex_CO.paa","\A3\Soft_F_Exp\Truck_03\Data\Truck_03_fuel_ghex_CO.paa"]
		];
	};
	case "O_Truck_03_covered_F":
	{
		_ret = 
		[
			["\a3\soft_f_epc\Truck_03\data\truck_03_ext01_co.paa","civ","\a3\soft_f_epc\Truck_03\data\truck_03_ext02_co.paa"],
			["\a3\soft_f_epc\Truck_03\data\truck_03_ext01_co.paa","donator1","\a3\soft_f_epc\Truck_03\data\truck_03_ext02_co.paa"],
			["\A3\Soft_F_Exp\Truck_03\Data\Truck_03_ext01_ghex_CO.paa","donator1","\A3\Soft_F_Exp\Truck_03\Data\Truck_03_ext02_ghex_CO.paa","\A3\Soft_F_Exp\Truck_03\Data\Truck_03_cargo_ghex_CO.paa","\A3\Soft_F_Exp\Truck_03\Data\Truck_03_cover_ghex_CO.paa"]
		];
	};
	
	case "O_Truck_03_transport_F":
	{
		_ret = 
		[
			["\a3\soft_f_epc\Truck_03\data\truck_03_ext01_co.paa","civ","\a3\soft_f_epc\Truck_03\data\truck_03_ext02_co.paa","\A3\Soft_F_EPC\Truck_03\Data\Truck_03_cargo_CO.paa"],
			["\a3\soft_f_epc\Truck_03\data\truck_03_ext01_co.paa","donator1","\a3\soft_f_epc\Truck_03\data\truck_03_ext02_co.paa","\A3\Soft_F_EPC\Truck_03\Data\Truck_03_cargo_CO.paa"],
			["\A3\Soft_F_Exp\Truck_03\Data\Truck_03_ext01_ghex_CO.paa","donator1","\A3\Soft_F_Exp\Truck_03\Data\Truck_03_ext02_ghex_CO.paa","\A3\Soft_F_Exp\Truck_03\Data\Truck_03_cargo_ghex_CO.paa"]
		];
	};

	case "C_Hatchback_01_F":
	{
		_ret =
		[
			["\a3\soft_f_gamma\Hatchback_01\data\hatchback_01_ext_base01_co.paa","civ"],
			["\a3\soft_f_gamma\Hatchback_01\data\hatchback_01_ext_base02_co.paa","civ"],
			["\a3\soft_f_gamma\Hatchback_01\data\hatchback_01_ext_base03_co.paa","civ"],
			["\a3\soft_f_gamma\Hatchback_01\data\hatchback_01_ext_base04_co.paa","civ"],
			["\a3\soft_f_gamma\Hatchback_01\data\hatchback_01_ext_base06_co.paa","civ"],
			["\a3\soft_f_gamma\Hatchback_01\data\hatchback_01_ext_base07_co.paa","civ"],
			["\a3\soft_f_gamma\Hatchback_01\data\hatchback_01_ext_base08_co.paa","civ"],
			["\a3\soft_f_gamma\Hatchback_01\data\hatchback_01_ext_base09_co.paa","civ"]
		];
	};
	
	case "C_SUV_01_F":
	{
		_ret =
		[
			["\a3\soft_f_gamma\SUV_01\Data\suv_01_ext_co.paa","civ"],
			["\a3\soft_f_gamma\SUV_01\Data\suv_01_ext_02_co.paa","cop"],
			["\a3\soft_f_gamma\SUV_01\Data\suv_01_ext_03_co.paa","civ"],
			["\a3\soft_f_gamma\SUV_01\Data\suv_01_ext_04_co.paa","civ"],
			["#(ai,64,64,1)Fresnel(1.3,7)","cop"],
			["textures\Fahrzeug_Skins\CIV\Carbon.paa","donator1"],
			["textures\Fahrzeug_Skins\Cops\suv.paa","cop"],
			["textures\pixel.jpg","fed"],
			["textures\Fahrzeug_Skins\CIV\suv_monster.paa","donator1"],
			["textures\Fahrzeug_Skins\Presse\presse.paa","presse"],
			["textures\Fahrzeug_Skins\Medic\suv_prs.paa","med"],
			["textures\Fahrzeug_Skins\CIV\city.paa","donator1"],
			["textures\pixel.jpg","fed"],
			["textures\Fahrzeug_Skins\ssg\suv_sanchez.paa","ssg"],
			["textures\Fahrzeug_Skins\lop2015.paa","civ"],
			["textures\Event\suv_event.paa","fed"],
			["textures\Fahrzeug_Skins\CIV\suv_monster.paa","cop"],
			["textures\Fahrzeug_Skins\Donator\SUV_DBD2.paa","donator1"],
			["textures\Fahrzeug_Skins\Donator\SUV_Kabumm.paa","donator1"],
			["textures\Fahrzeug_Skins\Donator\SUV_Money.paa","donator1"],
			["textures\Fahrzeug_Skins\Donator\SUV_Schildkroete.paa","donator1"],
			["textures\Fahrzeug_Skins\Donator\Suv_STVO.paa","donator1"],
			["textures\Fahrzeug_Skins\Donator\SUVTaxi.paa","donator1"],
			["textures\Fahrzeug_Skins\Donator\SUVPfarrei.paa","donator1"],
			["\a3\soft_f_gamma\SUV_01\Data\suv_01_ext_04_co.paa","cop"],
			["\a3\soft_f_gamma\SUV_01\Data\suv_01_ext_03_co.paa","cop"],
			["textures\Event\Halloween_SUV.paa","fed"],
			["textures\Fahrzeug_Skins\Cops\SwatSUV.paa","cop"]
		];
	};
	case "C_Van_01_box_F":
	{
		_ret = 
		[
			["\a3\soft_f_gamma\Van_01\Data\van_01_ext_co.paa","civ"],
			["\a3\soft_f_gamma\Van_01\Data\van_01_ext_red_co.paa","civ"],
			["textures\Fahrzeug_Skins\Medic\rtw_prs_front.paa","med","textures\Fahrzeug_Skins\Medic\rtw_prs_back.paa"],
			["\a3\soft_f_gamma\Van_01\Data\van_01_ext_black_co.paa","civ"],
			["textures\Fahrzeug_Skins\Donator\Doenerbude.paa","donator1","textures\Fahrzeug_Skins\Donator\Doenerbude2.paa"]
		];
	};
	
	case "C_Van_01_transport_F":
	{
		_ret = 
		[
			["\a3\soft_f_gamma\Van_01\Data\van_01_ext_co.paa","civ"],
			["\a3\soft_f_gamma\Van_01\Data\van_01_ext_red_co.paa","civ"]
		];
	};
	
	case "B_Quadbike_01_F":
	{
		_ret = 
		[
			["\A3\Soft_F\Quadbike_01\Data\quadbike_01_opfor_co.paa","civ"],
			["\A3\Soft_F\Quadbike_01\Data\Quadbike_01_co.paa","cop"],
			["\A3\Soft_F_beta\Quadbike_01\Data\quadbike_01_civ_black_co.paa","civ"],
			["\A3\Soft_F_beta\Quadbike_01\Data\quadbike_01_civ_blue_co.paa","civ"],
			["\A3\Soft_F_beta\Quadbike_01\Data\quadbike_01_civ_red_co.paa","civ"],
			["\A3\Soft_F_beta\Quadbike_01\Data\quadbike_01_civ_white_co.paa","civ"],
			["\A3\Soft_F_beta\Quadbike_01\Data\quadbike_01_indp_co.paa","civ"],
			["\a3\soft_f_gamma\Quadbike_01\data\quadbike_01_indp_hunter_co.paa","civ"],
			["\a3\soft_f_gamma\Quadbike_01\data\quadbike_01_indp_hunter_co.paa","donator1"],
			["textures\Event\quad_event.paa","fed"],
			["textures\Fahrzeug_Skins\Medic\quadbike.paa","med","textures\Fahrzeug_Skins\Medic\quadbike_wheel.paa"]
		];
	};
	
	case "B_Heli_Light_01_F":
	{
		_ret = 
		[
			["\a3\air_f\Heli_Light_01\Data\heli_light_01_ext_blue_co.paa","civ"],
			["\a3\air_f\Heli_Light_01\Data\Skins\heli_light_01_ext_sheriff_co.paa","cop"],
			["\a3\air_f\Heli_Light_01\Data\heli_light_01_ext_ion_co.paa","fed"],
			["\a3\air_f\Heli_Light_01\Data\heli_light_01_ext_co.paa","fed"],
			["\a3\air_f\Heli_Light_01\Data\heli_light_01_ext_indp_co.paa","donator1"],
			["\a3\air_f\Heli_Light_01\Data\Skins\heli_light_01_ext_blueline_co.paa","fed"],
			["\a3\air_f\Heli_Light_01\Data\Skins\heli_light_01_ext_elliptical_co.paa","fed"],
			["\a3\air_f\Heli_Light_01\Data\Skins\heli_light_01_ext_furious_co.paa","fed"],
			["\a3\air_f\Heli_Light_01\Data\Skins\heli_light_01_ext_jeans_co.paa","fed"],
			["\a3\air_f\Heli_Light_01\Data\Skins\heli_light_01_ext_speedy_co.paa","fed"],
			["\a3\air_f\Heli_Light_01\Data\Skins\heli_light_01_ext_sunset_co.paa","fed"],
			["\a3\air_f\Heli_Light_01\Data\Skins\heli_light_01_ext_vrana_co.paa","fed"],
			["\a3\air_f\Heli_Light_01\Data\Skins\heli_light_01_ext_wave_co.paa","fed"],
			["\a3\air_f\Heli_Light_01\Data\Skins\heli_light_01_ext_digital_co.paa","donator1"],
			["#(argb,8,8,3)color(1,1,1,0.8)","fed"],
			["textures\Fahrzeug_Skins\Cops\bird.paa","cop"],
			["textures\pixel.jpg","fed"],
			["textures\Fahrzeug_Skins\CIV\hummingbird_monster.paa","civ"],
			["\a3\air_f\Heli_Light_01\Data\Skins\heli_light_01_ext_blueline_co.paa","donator1"],
			["\a3\air_f\Heli_Light_01\Data\Skins\heli_light_01_ext_elliptical_co.paa","donator1"],
			["\a3\air_f\Heli_Light_01\Data\Skins\heli_light_01_ext_furious_co.paa","donator1"],
			["\a3\air_f\Heli_Light_01\Data\Skins\heli_light_01_ext_jeans_co.paa","donator1"],
			["\a3\air_f\Heli_Light_01\Data\Skins\heli_light_01_ext_speedy_co.paa","donator1"],
			["\a3\air_f\Heli_Light_01\Data\Skins\heli_light_01_ext_sunset_co.paa","donator1"],
			["\a3\air_f\Heli_Light_01\Data\Skins\heli_light_01_ext_vrana_co.paa","donator1"],
			["\a3\air_f\Heli_Light_01\Data\Skins\heli_light_01_ext_wave_co.paa","donator1"],
			["#(ai,64,64,1)Fresnel(1.3,7)","donator1"],
			["#(ai,64,64,1)Fresnel(1.3,7)","donator1"],
			["textures\Fahrzeug_Skins\Medic\hummi_prs.paa","med"],
			["textures\Fahrzeug_Skins\CIV\hummingbird_monster.paa","civ"],
			["textures\Fahrzeug_Skins\tgh\Hummingbird.paa","tgh"],
			["textures\Fahrzeug_Skins\Cops\SwatHumsebird.paa","cop"],
			["textures\Fahrzeug_Skins\pa\HeliPAV2.0.paa","pa"],
			["textures\Fahrzeug_Skins\ssg\SSG_hummig.paa","ssg"],
			["textures\Fahrzeug_Skins\kartell\HummiKA.paa","kartell"]

		];
	};
	
	case "C_Heli_Light_01_civil_F":
	{
		_ret = [
			["\a3\air_f\Heli_Light_01\Data\Skins\heli_light_01_ext_blueline_co.paa","civ"],
			["\a3\air_f\Heli_Light_01\Data\Skins\heli_light_01_ext_digital_co.paa","civ"],
			["\a3\air_f\Heli_Light_01\Data\Skins\heli_light_01_ext_elliptical_co.paa","fed"],
			["\a3\air_f\Heli_Light_01\Data\Skins\heli_light_01_ext_furious_co.paa","fed"],
			["\a3\air_f\Heli_Light_01\Data\Skins\heli_light_01_ext_graywatcher_co.paa","fed"],
			["\a3\air_f\Heli_Light_01\Data\Skins\heli_light_01_ext_jeans_co.paa","fed"],
			["\a3\air_f\Heli_Light_01\Data\Skins\heli_light_01_ext_light_co.paa","fed"],
			["\a3\air_f\Heli_Light_01\Data\Skins\heli_light_01_ext_shadow_co.paa","fed"],
			["\a3\air_f\Heli_Light_01\Data\Skins\heli_light_01_ext_sheriff_co.paa","fed"],
			["\a3\air_f\Heli_Light_01\Data\Skins\heli_light_01_ext_speedy_co.paa","fed"],
			["\a3\air_f\Heli_Light_01\Data\Skins\heli_light_01_ext_sunset_co.paa","fed"],
			["\a3\air_f\Heli_Light_01\Data\Skins\heli_light_01_ext_vrana_co.paa","fed"],
			["\a3\air_f\Heli_Light_01\Data\Skins\heli_light_01_ext_wasp_co.paa","fed"],
			["\a3\air_f\Heli_Light_01\Data\Skins\heli_light_01_ext_wave_co.paa","fed"],
			["\a3\air_f\Heli_Light_01\Data\Skins\heli_light_01_ext_blueline_co.paa","donator1"],
			["\a3\air_f\Heli_Light_01\Data\Skins\heli_light_01_ext_digital_co.paa","donator1"],
			["\a3\air_f\Heli_Light_01\Data\Skins\heli_light_01_ext_elliptical_co.paa","donator1"],
			["\a3\air_f\Heli_Light_01\Data\Skins\heli_light_01_ext_furious_co.paa","donator1"],
			["\a3\air_f\Heli_Light_01\Data\Skins\heli_light_01_ext_graywatcher_co.paa","donator1"],
			["\a3\air_f\Heli_Light_01\Data\Skins\heli_light_01_ext_jeans_co.paa","donator1"],
			["\a3\air_f\Heli_Light_01\Data\Skins\heli_light_01_ext_light_co.paa","donator1"],
			["\a3\air_f\Heli_Light_01\Data\Skins\heli_light_01_ext_shadow_co.paa","donator1"],
			["\a3\air_f\Heli_Light_01\Data\Skins\heli_light_01_ext_sheriff_co.paa","donator1"],
			["\a3\air_f\Heli_Light_01\Data\Skins\heli_light_01_ext_speedy_co.paa","donator1"],
			["\a3\air_f\Heli_Light_01\Data\Skins\heli_light_01_ext_sunset_co.paa","donator1"],
			["\a3\air_f\Heli_Light_01\Data\Skins\heli_light_01_ext_vrana_co.paa","donator1"],
			["\a3\air_f\Heli_Light_01\Data\Skins\heli_light_01_ext_wasp_co.paa","donator1"],
			["\a3\air_f\Heli_Light_01\Data\Skins\heli_light_01_ext_wave_co.paa","donator1"]
			];
	};

	case "O_Heli_Light_02_unarmed_F":
	{
		_ret = 
		[
			["\a3\air_f\Heli_Light_02\Data\heli_light_02_ext_civilian_co.paa","civ"],
			["\a3\air_f\Heli_Light_02\Data\heli_light_02_ext_co.paa","donator1"],
			["\a3\air_f\Heli_Light_02\Data\heli_light_02_ext_indp_co.paa","donator1"],
			["\a3\air_f\Heli_Light_02\Data\heli_light_02_ext_opfor_co.paa","donator1"],
			["\A3\Air_F_Heli\Heli_Light_02\Data\Heli_Light_02_ext_OPFOR_V2_CO.paa","donator1"],
			["\a3\air_f\Heli_Light_02\Data\heli_light_02_ext_civilian_co.paa","donator1"],
			["#(ai,64,64,1)Fresnel(1.3,7)","donator1"],
			["textures\pixel.jpg","fed"],
			["textures\Fahrzeug_Skins\Medic\orca_prs.paa","med"]
		];
	};
	
	case "I_Heli_light_03_unarmed_F":
	{
		_ret = 
		[
			["\a3\air_f_epb\Heli_Light_03\data\heli_light_03_base_co.paa","civ"],
			["textures\pixel.jpg","fed"],
			["textures\Fahrzeug_Skins\Cops\hellcat.paa","cop"],
			["textures\pixel.jpg","fed"],
			["textures\Fahrzeug_Skins\Cops\SwatHellcat.paa","cop"],
			["textures\Fahrzeug_Skins\dm\hellcat.paa","dm"],
			["textures\Fahrzeug_Skins\ssg\SSG_Hellcat.paa","ssg"],
			["textures\pixel.jpg","fed"],
			["textures\pixel.jpg","fed"],
			["\A3\Air_F_EPB\Heli_Light_03\data\Heli_Light_03_base_INDP_CO.paa","donator1"],
			["textures\Fahrzeug_Skins\Medic\hellcat_prs.paa","med"]
		];
	};
	
	case "B_MRAP_01_F": //Hunter
	{
		_ret = 
		[
			["\a3\soft_f\MRAP_01\Data\mrap_01_base_co.paa","civ","\a3\soft_f\MRAP_01\Data\mrap_01_adds_co.paa"],
			["textures\Fahrzeug_Skins\Cops\hunter.paa","cop","textures\Fahrzeug_Skins\Cops\hunter1.paa"],
			["textures\Fahrzeug_Skins\Medic\hunter_prs_front.paa","med","textures\Fahrzeug_Skins\Medic\hunter_prs_back.paa"],
			["textures\Fahrzeug_Skins\CIV\hunter_urban1.paa","donator1","textures\Fahrzeug_Skins\CIV\hunter_urban2.paa"],
			["textures\pixel.jpg","fed","textures\pixel.jpg"],
			["textures\Fahrzeug_Skins\dm\hunter2.paa","dm","textures\Fahrzeug_Skins\dm\hunter1.paa"],
			["textures\pixel.jpg","fed","textures\pixel.jpg"],
			["textures\Fahrzeug_Skins\evers\hunter1.paa","evers","textures\Fahrzeug_Skins\evers\hunter2.paa"],
		    ["textures\Fahrzeug_Skins\pa\Hunter_front.paa","pa","textures\Fahrzeug_Skins\pa\Hunter_back.paa"],
			["textures\Fahrzeug_Skins\ssg\hunter1.paa","ssg","textures\Fahrzeug_Skins\ssg\hunter2.paa"],
			["textures\pixel.jpg","fed","textures\pixel.jpg"],
			["textures\pixel.jpg","fed","textures\pixel.jpg"],
			["textures\pixel.jpg","fed","textures\pixel.jpg"],
			["textures\Fahrzeug_Skins\tgh\Hunter1.paa","tgh","textures\Fahrzeug_Skins\tgh\Hunter2.paa"],
			["textures\Fahrzeug_Skins\CIV\hunter_RIP1.paa","civ","textures\Fahrzeug_Skins\CIV\hunter_RIP2.paa"],
			["textures\Fahrzeug_Skins\CIV\hunter_RIP1.paa","donator1","textures\Fahrzeug_Skins\CIV\hunter_RIP2.paa"],
			["textures\Fahrzeug_Skins\kartell\hunter-vorne.paa","kartell","textures\Fahrzeug_Skins\kartell\hunter-hinten.paa"],
			["textures\Fahrzeug_Skins\donator\hunterCSGO1.paa","donator1","textures\Fahrzeug_Skins\donator\hunterCSGO2.paa"]
		];
	};
	
		case "O_MRAP_02_F": //Ifrit
	{
		_ret = 
		[
			["\A3\soft_f\mrap_02\data\mrap_02_ext_01_co.paa","rebel2","\a3\soft_f\mrap_02\data\mrap_02_ext_02_co.paa"],
			["textures\pixel.jpg","fed","textures\pixel.jpg"],
			["textures\Fahrzeug_Skins\CIV\ifrit_grey_front.paa","rebel2","textures\Fahrzeug_Skins\CIV\ifrit_grey_back.paa"],
			["textures\Fahrzeug_Skins\CIV\ifrit_lion_front.paa","rebel2","textures\Fahrzeug_Skins\CIV\ifrit_lion_back.paa"],
			["textures\Fahrzeug_Skins\CIV\ifrit_red_front.paa","rebel2","textures\Fahrzeug_Skins\CIV\ifrit_red_back.paa"],
			["\A3\Soft_F_Exp\MRAP_02\data\MRAP_02_ext_01_ghex_CO.paa","donator1","\A3\Soft_F_Exp\MRAP_02\data\MRAP_02_ext_02_ghex_CO.paa"],
			["textures\pixel.jpg","fed","textures\pixel.jpg"],
			["textures\pixel.jpg","fed","textures\pixel.jpg"],
			["textures\pixel.jpg","fed","textures\pixel.jpg"],
			["textures\Fahrzeug_Skins\Cops\SwatIfrit1.paa","cop","textures\Fahrzeug_Skins\Cops\SwatIfrit2.paa"]
			
		];
	};

	case "I_MRAP_03_F": //Strider
	{
		_ret = 
		[
			["\A3\soft_f_beta\mrap_03\data\mrap_03_ext_co.paa","rebel2"],
			["textures\pixel.jpg","fed"],
			["textures\Fahrzeug_Skins\Cops\strider.paa","cop"],
			["\a3\soft_f_beta\mrap_03\data\mrap_03_ext_indp_co.paa","donator1"],
			["textures\pixel.jpg","fed"],
			["textures\pixel.jpg","fed"],
			["\A3\soft_f_beta\mrap_03\data\mrap_03_ext_co.paa","donator1"],
			["textures\Fahrzeug_Skins\CIV\striderblaudigital.paa","donator1"],
			["textures\Fahrzeug_Skins\CIV\stridersafari.paa","donator1"],
			["textures\pixel.jpg","fed"],
			["textures\Fahrzeug_Skins\Medic\strider_prs.paa","med"],
			["textures\pixel.jpg","fed"],
			["textures\Fahrzeug_Skins\Cops\SwatStrider.paa","cop"],
			["textures\Fahrzeug_Skins\evers\strider.paa","evers"],
			["textures\Fahrzeug_Skins\pa\strider.paa","pa"],
			["textures\Fahrzeug_Skins\kartell\StriderKA.paa","kartell"]
			
		];
	};
	
	case "I_Truck_02_covered_F":
	{
		_ret = 
		[
			["\A3\Soft_F_Beta\Truck_02\data\truck_02_kab_co.paa","civ","\a3\soft_f_beta\Truck_02\data\truck_02_kuz_co.paa"],
			["textures\Fahrzeug_Skins\CIV\zamak_kindl1.paa","civ","textures\Fahrzeug_Skins\CIV\zamak_kindl2.paa"],
			["\A3\Soft_F_Beta\Truck_02\data\truck_02_kab_co.paa","donator1","\a3\soft_f_beta\Truck_02\data\truck_02_kuz_co.paa"],
			["textures\Fahrzeug_Skins\CIV\zamak_kindl1.paa","donator1","textures\Fahrzeug_Skins\CIV\zamak_kindl2.paa"],
			["\A3\Soft_F_Beta\Truck_02\data\truck_02_kab_co.paa","cop","\a3\soft_f_beta\Truck_02\data\truck_02_kuz_co.paa"],
			["\a3\soft_f_beta\Truck_02\data\truck_02_kab_blue_co.paa","civ","\a3\soft_f_beta\Truck_02\data\truck_02_kuz_co.paa","\a3\soft_f_beta\truck_02\data\truck_02_int_co.paa"],
			["\A3\soft_f_orange\Truck_02\Data\Truck_02_kab_IDAP_co.paa","civ","\A3\soft_f_orange\Truck_02\Data\Truck_02_kuz_IDAP_co.paa","\A3\soft_f_orange\Truck_02\Data\Truck_02_int_IDAP_co.paa"]
			
		];
	};
	
	case "I_Truck_02_transport_F":
	{
		_ret = 
		[
			["\A3\Soft_F_Beta\Truck_02\data\truck_02_kab_co.paa","civ","\a3\soft_f_beta\Truck_02\data\truck_02_kuz_co.paa"],
			["#(argb,8,8,3)color(0.05,0.05,0.05,1)","fed"],
			["\a3\soft_f_beta\Truck_02\data\truck_02_kab_blue_CO.paa","civ","\a3\soft_f_beta\Truck_02\data\truck_02_kuz_co.paa","\a3\soft_f_beta\truck_02\data\truck_02_int_co.paa"],
			["\A3\soft_f_orange\Truck_02\Data\Truck_02_kab_IDAP_co.paa","civ","\A3\soft_f_orange\Truck_02\Data\Truck_02_kuz_IDAP_co.paa","\A3\soft_f_orange\Truck_02\Data\Truck_02_int_IDAP_co.paa"]
		];
	};
	
		case "I_Truck_02_fuel_F":
	{
		_ret = 
		[
			["\A3\Soft_F_Beta\Truck_02\data\truck_02_kab_co.paa","civ","\a3\soft_f_beta\Truck_02\data\truck_02_fuel_co.paa"],
			["#(argb,8,8,3)color(0.05,0.05,0.05,1)","fed"]
		];
	};
	
	case "B_APC_Wheeled_01_cannon_F":
	{
		_ret = 
		[
			["#(argb,8,8,3)color(0.05,0.05,0.05,1)","fed"]
		];
	};
	
	case "O_Heli_Attack_02_black_F":
	{
		_ret = 
		[
			["#(argb,8,8,3)color(0.05,0.05,0.05,1)","fed"]
		];
	};
	case "B_Heli_Transport_03_unarmed_F":
	{
		_ret = 
		[
			["a3\air_f_heli\Heli_Transport_03\Data\Heli_Transport_03_ext01_black_CO.paa","civ","a3\air_f_heli\Heli_Transport_03\Data\Heli_Transport_03_ext02_black_CO.paa"],
			["a3\air_f_heli\Heli_Transport_03\Data\Heli_Transport_03_ext01_black_CO.paa","cop","a3\air_f_heli\Heli_Transport_03\Data\Heli_Transport_03_ext02_black_CO.paa"],
			["textures\Fahrzeug_Skins\Medic\hure_prs_front.paa","med","textures\Fahrzeug_Skins\Medic\hure_prs_back.paa"],
			["a3\air_f_heli\Heli_Transport_03\Data\Heli_Transport_03_ext01_CO.paa","donator1","a3\air_f_heli\Heli_Transport_03\Data\Heli_Transport_03_ext02_CO.paa"],
			["a3\air_f_heli\Heli_Transport_03\Data\Heli_Transport_03_ext01_black_CO.paa","civ","a3\air_f_heli\Heli_Transport_03\Data\Heli_Transport_03_ext02_black_CO.paa"],
			["textures\Fahrzeug_Skins\Cops\SwatHuron1.paa","cop","textures\Fahrzeug_Skins\Cops\SwatHuron2.paa"]
		];
	};
	case "O_Heli_Transport_04_F":
	{
		_ret = 
		[
			["a3\air_f_heli\Heli_Transport_04\Data\Heli_Transport_04_base_01_CO.paa","civ","a3\air_f_heli\Heli_Transport_04\Data\Heli_Transport_04_base_02_CO.paa"],
			["a3\air_f_heli\Heli_Transport_04\Data\heli_transport_04_base_01_Black_co.paa","donator1","a3\air_f_heli\Heli_Transport_04\Data\heli_transport_04_base_02_Black_co.paa"],
			["textures\Fahrzeug_Skins\Medic\taru_prs_front.paa","med","textures\Fahrzeug_Skins\Medic\taru_prs_back.paa"]
		];
	};
	case "O_Heli_Transport_04_box_F":
	{
		_ret = 
		[
			["A3\Air_F_Heli\Heli_Transport_04\Data\Heli_Transport_04_base_01_CO.paa","civ","A3\Air_F_Heli\Heli_Transport_04\Data\Heli_Transport_04_base_02_CO.paa","A3\Air_F_Heli\Heli_Transport_04\Data\Heli_Transport_04_Pod_Ext01_CO.paa","A3\Air_F_Heli\Heli_Transport_04\Data\Heli_Transport_04_Pod_Ext02_CO.paa"],
			["A3\Air_F_Heli\Heli_Transport_04\Data\Heli_Transport_04_base_01_black_CO.paa","donator1","A3\Air_F_Heli\Heli_Transport_04\Data\Heli_Transport_04_base_02_black_CO.paa","A3\Air_F_Heli\Heli_Transport_04\Data\Heli_Transport_04_Pod_Ext01_black_CO.paa","A3\Air_F_Heli\Heli_Transport_04\Data\Heli_Transport_04_Pod_Ext02_black_CO.paa"],
			["A3\Air_F_Heli\Heli_Transport_04\Data\Heli_Transport_04_base_01_CO.paa","donator1","A3\Air_F_Heli\Heli_Transport_04\Data\Heli_Transport_04_base_02_CO.paa","A3\Air_F_Heli\Heli_Transport_04\Data\Heli_Transport_04_Pod_Ext01_CO.paa","A3\Air_F_Heli\Heli_Transport_04\Data\Heli_Transport_04_Pod_Ext02_CO.paa"]
		];
	};
	case "O_Heli_Transport_04_fuel_F":
	{
		_ret = 
		[
			["A3\Air_F_Heli\Heli_Transport_04\Data\Heli_Transport_04_base_01_CO.paa","civ","A3\Air_F_Heli\Heli_Transport_04\Data\Heli_Transport_04_base_02_CO.paa","A3\Air_F_Heli\Heli_Transport_04\Data\Heli_Transport_04_fuel_CO.paa"],
			["a3\air_f_heli\Heli_Transport_04\Data\Heli_Transport_04_fuel_black_CO.paa","donator1","a3\air_f_heli\Heli_Transport_04\Data\heli_transport_04_base_02_Black_co.paa","A3\Air_F_Heli\Heli_Transport_04\Data\Heli_Transport_04_fuel_black_CO.paa"],
			["A3\Air_F_Heli\Heli_Transport_04\Data\Heli_Transport_04_base_01_CO.paa","donator1","A3\Air_F_Heli\Heli_Transport_04\Data\Heli_Transport_04_base_02_CO.paa","A3\Air_F_Heli\Heli_Transport_04\Data\Heli_Transport_04_fuel_CO.paa"]
		];
	};
	case "O_Heli_Transport_04_bench_F":
	{
		_ret = 
		[
			["A3\Air_F_Heli\Heli_Transport_04\Data\Heli_Transport_04_base_01_co.paa","civ","A3\Air_F_Heli\Heli_Transport_04\Data\Heli_Transport_04_base_02_co.paa"],
			["A3\Air_F_Heli\Heli_Transport_04\Data\heli_transport_04_base_01_Black_co.paa","donator1","A3\Air_F_Heli\Heli_Transport_04\Data\heli_transport_04_base_02_Black_co.paa"],
			["A3\Air_F_Heli\Heli_Transport_04\Data\heli_transport_04_base_01_Black_co.paa","cop","A3\Air_F_Heli\Heli_Transport_04\Data\heli_transport_04_base_02_Black_co.paa"]
		];
	};
		
	case "O_T_VTOL_02_infantry_F":
	{
		_ret = 
		[
			["\A3\Air_F_Exp\VTOL_02\Data\VTOL_02_EXT01_bhex_CO.paa","civ","\A3\Air_F_Exp\VTOL_02\Data\VTOL_02_EXT02_bhex_CO.paa","\A3\Air_F_Exp\VTOL_02\Data\VTOL_02_EXT03_L_bhex_CO.paa","\A3\Air_F_Exp\VTOL_02\Data\VTOL_02_EXT03_R_bhex_CO.paa"],
			["\A3\Air_F_Exp\VTOL_02\Data\VTOL_02_EXT01_CO.paa","donator1","\A3\Air_F_Exp\VTOL_02\Data\VTOL_02_EXT02_CO.paa","\A3\Air_F_Exp\VTOL_02\Data\VTOL_02_EXT03_L_CO.paa","\A3\Air_F_Exp\VTOL_02\Data\VTOL_02_EXT03_R_CO.paa"],
			["\A3\Air_F_Exp\VTOL_02\Data\VTOL_02_EXT01_ghex_CO.paa","donator1","\A3\Air_F_Exp\VTOL_02\Data\VTOL_02_EXT02_ghex_CO.paa","\A3\Air_F_Exp\VTOL_02\Data\VTOL_02_EXT03_L_ghex_CO.paa","\A3\Air_F_Exp\VTOL_02\Data\VTOL_02_EXT03_R_ghex_CO.paa"],
			["\A3\Air_F_Exp\VTOL_02\Data\VTOL_02_EXT01_bhex_CO.paa","donator1","\A3\Air_F_Exp\VTOL_02\Data\VTOL_02_EXT02_bhex_CO.paa","\A3\Air_F_Exp\VTOL_02\Data\VTOL_02_EXT03_L_bhex_CO.paa","\A3\Air_F_Exp\VTOL_02\Data\VTOL_02_EXT03_R_bhex_CO.paa"],
			["textures\Fahrzeug_Skins\tgh\Xian.paa","tgh","textures\Fahrzeug_Skins\tgh\Blackfish_Xian.paa","textures\Fahrzeug_Skins\tgh\Blackfish_Xian.paa","textures\Fahrzeug_Skins\tgh\Blackfish_Xian.paa"]
		];
	};
	case "B_T_VTOL_01_infantry_F":
	{
		_ret = 
		[
			["\A3\Air_F_Exp\VTOL_01\Data\VTOL_01_EXT01_olive_CO.paa","civ","\A3\Air_F_Exp\VTOL_01\Data\VTOL_01_EXT02_olive_CO.paa","\A3\Air_F_Exp\VTOL_01\Data\VTOL_01_EXT03_olive_CO.paa","\A3\Air_F_Exp\VTOL_01\Data\VTOL_01_EXT04_olive_CO.paa"],
			["\A3\Air_F_Exp\VTOL_01\Data\VTOL_01_EXT01_blue_CO.paa","donator1","\A3\Air_F_Exp\VTOL_01\Data\VTOL_01_EXT02_blue_CO.paa","\A3\Air_F_Exp\VTOL_01\Data\VTOL_01_EXT03_blue_CO.paa","\A3\Air_F_Exp\VTOL_01\Data\VTOL_01_EXT04_blue_CO.paa"],
			["\A3\Air_F_Exp\VTOL_01\Data\VTOL_01_EXT01_olive_CO.paa","cop","\A3\Air_F_Exp\VTOL_01\Data\VTOL_01_EXT02_olive_CO.paa","\A3\Air_F_Exp\VTOL_01\Data\VTOL_01_EXT03_olive_CO.paa","\A3\Air_F_Exp\VTOL_01\Data\VTOL_01_EXT04_olive_CO.paa"],
			["\A3\Air_F_Exp\VTOL_01\Data\VTOL_01_EXT01_blue_CO.paa","cop","\A3\Air_F_Exp\VTOL_01\Data\VTOL_01_EXT02_blue_CO.paa","\A3\Air_F_Exp\VTOL_01\Data\VTOL_01_EXT03_blue_CO.paa","\A3\Air_F_Exp\VTOL_01\Data\VTOL_01_EXT04_blue_CO.paa"],
			["\A3\Air_F_Exp\VTOL_01\Data\VTOL_01_EXT01_olive_CO.paa","donator1","\A3\Air_F_Exp\VTOL_01\Data\VTOL_01_EXT02_olive_CO.paa","\A3\Air_F_Exp\VTOL_01\Data\VTOL_01_EXT03_olive_CO.paa","\A3\Air_F_Exp\VTOL_01\Data\VTOL_01_EXT04_olive_CO.paa"],
			["textures\Fahrzeug_Skins\tgh\Blackfish1.paa","tgh","textures\Fahrzeug_Skins\tgh\Blackfish2.paa","textures\Fahrzeug_Skins\tgh\Blackfish_Xian.paa","textures\Fahrzeug_Skins\tgh\Blackfish_Xian.paa"]
		];
	};
	case "B_T_VTOL_01_vehicle_F":
	{
		_ret = 
		[
			["\A3\Air_F_Exp\VTOL_01\Data\VTOL_01_EXT01_olive_CO.paa","civ","\A3\Air_F_Exp\VTOL_01\Data\VTOL_01_EXT02_olive_CO.paa","\A3\Air_F_Exp\VTOL_01\Data\VTOL_01_EXT03_olive_CO.paa","\A3\Air_F_Exp\VTOL_01\Data\VTOL_01_EXT04_olive_CO.paa"],
			["\A3\Air_F_Exp\VTOL_01\Data\VTOL_01_EXT01_blue_CO.paa","donator1","\A3\Air_F_Exp\VTOL_01\Data\VTOL_01_EXT02_blue_CO.paa","\A3\Air_F_Exp\VTOL_01\Data\VTOL_01_EXT03_blue_CO.paa","\A3\Air_F_Exp\VTOL_01\Data\VTOL_01_EXT04_blue_CO.paa"],
			["\A3\Air_F_Exp\VTOL_01\Data\VTOL_01_EXT01_olive_CO.paa","cop","\A3\Air_F_Exp\VTOL_01\Data\VTOL_01_EXT02_olive_CO.paa","\A3\Air_F_Exp\VTOL_01\Data\VTOL_01_EXT03_olive_CO.paa","\A3\Air_F_Exp\VTOL_01\Data\VTOL_01_EXT04_olive_CO.paa"],
			["\A3\Air_F_Exp\VTOL_01\Data\VTOL_01_EXT01_blue_CO.paa","cop","\A3\Air_F_Exp\VTOL_01\Data\VTOL_01_EXT02_blue_CO.paa","\A3\Air_F_Exp\VTOL_01\Data\VTOL_01_EXT03_blue_CO.paa","\A3\Air_F_Exp\VTOL_01\Data\VTOL_01_EXT04_blue_CO.paa"],
			["\A3\Air_F_Exp\VTOL_01\Data\VTOL_01_EXT01_olive_CO.paa","donator1","\A3\Air_F_Exp\VTOL_01\Data\VTOL_01_EXT02_olive_CO.paa","\A3\Air_F_Exp\VTOL_01\Data\VTOL_01_EXT03_olive_CO.paa","\A3\Air_F_Exp\VTOL_01\Data\VTOL_01_EXT04_olive_CO.paa"],
			["textures\Fahrzeug_Skins\tgh\Blackfish1.paa","tgh","textures\Fahrzeug_Skins\tgh\Blackfish2.paa","textures\Fahrzeug_Skins\tgh\Blackfish_Xian.paa","textures\Fahrzeug_Skins\tgh\Blackfish_Xian.paa"]
		];
	};
	case "B_Plane_Fighter_01_Stealth_F":
	{
		_ret = 
		[
			["a3\air_f_jets\plane_fighter_01\data\fighter_01_fuselage_01_co.paa","civ","a3\air_f_jets\plane_fighter_01\data\fighter_01_fuselage_02_co.paa","a3\air_f_jets\plane_fighter_01\data\fighter_01_glass_01_ca.paa","a3\air_f_jets\plane_fighter_01\data\fighter_01_cockpit_01_co.paa"],
			["a3\air_f_jets\plane_fighter_01\data\fighter_01_fuselage_01_co.paa","donator1","a3\air_f_jets\plane_fighter_01\data\fighter_01_fuselage_02_co.paa","a3\air_f_jets\plane_fighter_01\data\fighter_01_glass_01_ca.paa","a3\air_f_jets\plane_fighter_01\data\fighter_01_cockpit_01_co.paa"],
			["a3\air_f_jets\plane_fighter_01\data\fighter_01_fuselage_01_Camo_co.paa","donator1","a3\air_f_jets\plane_fighter_01\data\fighter_01_fuselage_02_Camo_co.paa","a3\air_f_jets\plane_fighter_01\data\fighter_01_glass_01_ca.paa","a3\air_f_jets\plane_fighter_01\data\fighter_01_cockpit_01_co.paa","a3\air_f_jets\plane_fighter_01\data\fighter_01_cockpit_02_co.paa","a3\air_f_jets\plane_fighter_01\data\fighter_01_cockpit_03_co.paa","a3\air_f_jets\plane_fighter_01\data\fighter_01_cockpit_05_co.paa"]
		];
	};
	case "B_Plane_Fighter_01_F":
	{
		_ret = 
		[
			["a3\air_f_jets\plane_fighter_01\data\fighter_01_fuselage_01_co.paa","civ","a3\air_f_jets\plane_fighter_01\data\fighter_01_fuselage_02_co.paa","a3\air_f_jets\plane_fighter_01\data\fighter_01_glass_01_ca.paa","a3\air_f_jets\plane_fighter_01\data\fighter_01_cockpit_01_co.paa"]
		];
	};
	case "C_Scooter_Transport_01_F":
	{
		_ret = 
		[
			["\A3\Boat_F_Exp\Scooter_Transport_01\Data\Scooter_Transport_01_CO.paa","civ","\A3\Boat_F_Exp\Scooter_Transport_01\Data\Scooter_Transport_01_VP_CO.paa"],
			["\A3\Boat_F_Exp\Scooter_Transport_01\Data\Scooter_Transport_01_Black_CO.paa","cop","\A3\Boat_F_Exp\Scooter_Transport_01\Data\Scooter_Transport_01_VP_Black_CO.paa"],
			["\A3\Boat_F_Exp\Scooter_Transport_01\Data\Scooter_Transport_01_Yellow_CO.paa","med","\A3\Boat_F_Exp\Scooter_Transport_01\Data\Scooter_Transport_01_VP_Yellow_CO.paa"],
			["\A3\Boat_F_Exp\Scooter_Transport_01\Data\Scooter_Transport_01_Black_CO.paa","civ","\A3\Boat_F_Exp\Scooter_Transport_01\Data\Scooter_Transport_01_VP_Black_CO.paa"],
			["\A3\Boat_F_Exp\Scooter_Transport_01\Data\Scooter_Transport_01_Blue_co.paa","civ","\A3\Boat_F_Exp\Scooter_Transport_01\Data\Scooter_Transport_01_VP_Blue_co.paa"],
			["\A3\Boat_F_Exp\Scooter_Transport_01\Data\Scooter_Transport_01_Grey_co.paa","civ","\A3\Boat_F_Exp\Scooter_Transport_01\Data\Scooter_Transport_01_VP_Grey_co.paa"],
			["\A3\Boat_F_Exp\Scooter_Transport_01\Data\Scooter_Transport_01_Lime_co.paa","civ","\A3\Boat_F_Exp\Scooter_Transport_01\Data\Scooter_Transport_01_VP_Lime_co.paa"],
			["\A3\Boat_F_Exp\Scooter_Transport_01\Data\Scooter_Transport_01_Red_CO.paa","civ","\A3\Boat_F_Exp\Scooter_Transport_01\Data\Scooter_Transport_01_VP_CO.paa"],
			["\A3\Boat_F_Exp\Scooter_Transport_01\Data\Scooter_Transport_01_Yellow_CO.paa","civ","\A3\Boat_F_Exp\Scooter_Transport_01\Data\Scooter_Transport_01_VP_Yellow_CO.paa"]
		];
	};
	
	case "B_SDV_01_F":
	{
		_ret = 
		[
			["\A3\boat_f_beta\SDV_01\data\SDV_ext_CO.paa","civ"],
			["\A3\boat_f_beta\SDV_01\data\SDV_ext_CO.paa","cop"],
			["\A3\boat_f_beta\SDV_01\data\SDV_ext_CO.paa","med"]
		];
	};
	case "C_Boat_Civil_01_rescue_F":
	{
		_ret = 
		[
			["\a3\boat_f_gamma\Boat_Civil_01\data\Boat_Civil_01_ext_rescue_co.paa","med","\a3\boat_f_gamma\Boat_Civil_01\data\Boat_Civil_01_int_rescue_co.paa"]
		];
	};
	case "C_Boat_Civil_01_police_F":
	{
		_ret = 
		[
			["\a3\boat_f_gamma\Boat_Civil_01\data\Boat_Civil_01_ext_police_co.paa","cop","\a3\boat_f_gamma\Boat_Civil_01\data\Boat_Civil_01_int_police_co.paa"]
		];
	};
	case "O_Lifeboat":
	{
		_ret = 
		[
			["\A3\boat_F\Boat_Transport_01\data\Boat_Transport_01_rescue_CO.paa","med"]
		];
	};
	case "B_Boat_Transport_01_F":
	{
		_ret = 
		[
			["\A3\boat_F\Boat_Transport_01\data\boat_transport_01_co.paa","civ"],
			["\A3\boat_F\Boat_Transport_01\data\boat_transport_01_co.paa","cop"],
			["\A3\boat_F\Boat_Transport_01\data\boat_transport_01_co.paa","med"]
		];
	};
	case "O_Boat_Armed_01_hmg_F":
	{
		_ret = 
		[
			["\A3\boat_f\Boat_Armed_01\data\Boat_Armed_01_ext_opfor_co.paa","cop","\A3\boat_f\Boat_Armed_01\data\Boat_Armed_01_int_opfor_co.paa","\A3\boat_f\Boat_Armed_01\data\Boat_Armed_01_crows_OPFOR_co.paa"]
		];
	};
	case "C_Van_02_vehicle_F":
	{
		_ret = 
		[
			["\a3\soft_f_orange\van_02\data\van_body_white_CO.paa","civ","\a3\soft_f_orange\van_02\data\van_wheel_co.paa","\a3\soft_f_orange\van_02\data\van_glass_transport_ca.paa","\a3\soft_f_orange\van_02\data\van_body_white_CO.paa"],
			["\a3\soft_f_orange\van_02\data\van_body_blue_CO.paa","civ","\a3\soft_f_orange\van_02\data\van_wheel_co.paa","\a3\soft_f_orange\van_02\data\van_glass_transport_ca.paa","\a3\soft_f_orange\van_02\data\van_body_blue_CO.paa"],
			["\a3\soft_f_orange\van_02\data\van_body_orange_CO.paa","civ","\a3\soft_f_orange\van_02\data\van_wheel_co.paa","\a3\soft_f_orange\van_02\data\van_glass_transport_ca.paa","\a3\soft_f_orange\van_02\data\van_body_orange_CO.paa"],
			["\a3\soft_f_orange\van_02\data\van_body_black_CO.paa","civ","\a3\soft_f_orange\van_02\data\van_wheel_co.paa","\a3\soft_f_orange\van_02\data\van_glass_transport_ca.paa","\a3\soft_f_orange\van_02\data\van_body_black_CO.paa"],
			["\a3\Soft_F_Orange\Van_02\Data\van_body_Green_CO.paa","civ","\a3\soft_f_orange\van_02\data\van_wheel_co.paa","\a3\soft_f_orange\van_02\data\van_glass_utility_CA.paa","\a3\Soft_F_Orange\Van_02\Data\van_body_Green_CO.paa"],
			["\a3\Soft_F_Orange\Van_02\Data\van_body_Red_CO.paa","civ","\a3\soft_f_orange\van_02\data\van_wheel_co.paa","\a3\soft_f_orange\van_02\data\van_glass_utility_CA.paa","\a3\Soft_F_Orange\Van_02\Data\van_body_Red_CO.paa"],
			["\a3\Soft_F_Orange\Van_02\Data\van_body_Syndikat_CO.paa","civ","\a3\soft_f_orange\van_02\data\van_wheel_co.paa","\a3\soft_f_orange\van_02\data\van_glass_utility_CA.paa","\a3\Soft_F_Orange\Van_02\Data\van_body_Syndikat_CO.paa"],
			["\a3\soft_f_orange\van_02\data\van_body_white_CO.paa","donator1","\a3\soft_f_orange\van_02\data\van_wheel_co.paa","\a3\soft_f_orange\van_02\data\van_glass_transport_ca.paa","\a3\soft_f_orange\van_02\data\van_body_white_CO.paa"],
			["\a3\soft_f_orange\van_02\data\van_body_blue_CO.paa","donator1","\a3\soft_f_orange\van_02\data\van_wheel_co.paa","\a3\soft_f_orange\van_02\data\van_glass_transport_ca.paa","\a3\soft_f_orange\van_02\data\van_body_blue_CO.paa"],
			["\a3\soft_f_orange\van_02\data\van_body_orange_CO.paa","donator1","\a3\soft_f_orange\van_02\data\van_wheel_co.paa","\a3\soft_f_orange\van_02\data\van_glass_transport_ca.paa","\a3\soft_f_orange\van_02\data\van_body_orange_CO.paa"],
			["\a3\soft_f_orange\van_02\data\van_body_black_CO.paa","donator1","\a3\soft_f_orange\van_02\data\van_wheel_co.paa","\a3\soft_f_orange\van_02\data\van_glass_transport_ca.paa","\a3\soft_f_orange\van_02\data\van_body_black_CO.paa"],
			["\a3\Soft_F_Orange\Van_02\Data\van_body_Green_CO.paa","donator1","\a3\soft_f_orange\van_02\data\van_wheel_co.paa","\a3\soft_f_orange\van_02\data\van_glass_utility_CA.paa","\a3\Soft_F_Orange\Van_02\Data\van_body_Green_CO.paa"],
			["\a3\Soft_F_Orange\Van_02\Data\van_body_Red_CO.paa","donator1","\a3\soft_f_orange\van_02\data\van_wheel_co.paa","\a3\soft_f_orange\van_02\data\van_glass_utility_CA.paa","\a3\Soft_F_Orange\Van_02\Data\van_body_Red_CO.paa"],
			["\a3\Soft_F_Orange\Van_02\Data\van_body_Syndikat_CO.paa","donator1","\a3\soft_f_orange\van_02\data\van_wheel_co.paa","\a3\soft_f_orange\van_02\data\van_glass_utility_CA.paa","\a3\Soft_F_Orange\Van_02\Data\van_body_Syndikat_CO.paa"],
			["\a3\Soft_F_Orange\Van_02\Data\van_body_BluePearl_CO.paa","donator1","\a3\soft_f_orange\van_02\data\van_wheel_co.paa","\a3\soft_f_orange\van_02\data\van_glass_utility_CA.paa","\a3\Soft_F_Orange\Van_02\Data\van_body_BluePearl_CO.paa"],
			["\a3\Soft_F_Orange\Van_02\Data\van_body_Daltgreen_CO.paa","donator1","\a3\soft_f_orange\van_02\data\van_wheel_transport_co.paa","\a3\soft_f_orange\van_02\data\van_glass_transport_CA.paa","\a3\Soft_F_Orange\Van_02\Data\van_body_Daltgreen_CO.paa"],
			["\a3\Soft_F_Orange\Van_02\Data\van_body_AAN_CO.paa","donator1","\a3\soft_f_orange\van_02\data\van_wheel_transport_co.paa","\a3\soft_f_orange\van_02\data\van_glass_transport_CA.paa","\a3\Soft_F_Orange\Van_02\Data\van_body_AAN_CO.paa"],
			["\a3\Soft_F_Orange\Van_02\Data\van_body_BB_CO.paa","donator1","\a3\Soft_F_Orange\Van_02\Data\van_wheel_BB_CO.paa","\a3\Soft_F_Orange\Van_02\Data\van_glass_BB_CA.paa","\a3\Soft_F_Orange\Van_02\Data\van_body_BB_CO.paa"],
			["\a3\Soft_F_Orange\Van_02\Data\van_body_Masked_CO.paa","donator1","\a3\soft_f_orange\van_02\data\van_wheel_transport_co.paa","\a3\soft_f_orange\van_02\data\van_glass_transport_CA.paa","\a3\Soft_F_Orange\Van_02\Data\van_body_Masked_CO.paa"],
			["\a3\Soft_F_Orange\Van_02\Data\van_body_Redstone_CO.paa","donator1","\a3\Soft_F_Orange\Van_02\Data\van_wheel_Redstone_CO.paa","\a3\soft_f_orange\van_02\data\van_glass_utility_CA.paa","\a3\Soft_F_Orange\Van_02\Data\van_body_Redstone_CO.paa"],
			["\a3\Soft_F_Orange\Van_02\Data\van_body_armazon_CO.paa","donator1","\a3\soft_f_orange\van_02\data\van_wheel_co.paa","\a3\soft_f_orange\van_02\data\van_glass_utility_CA.paa","\a3\Soft_F_Orange\Van_02\Data\van_body_armazon_CO.paa"],
			["\a3\Soft_F_Orange\Van_02\Data\van_body_Fuel_CO.paa","donator1","\a3\soft_f_orange\van_02\data\van_wheel_co.paa","\a3\soft_f_orange\van_02\data\van_glass_utility_CA.paa","\a3\Soft_F_Orange\Van_02\Data\van_body_Fuel_CO.paa"],
			["\a3\Soft_F_Orange\Van_02\Data\van_body_Vrana_CO.paa","donator1","\a3\soft_f_orange\van_02\data\van_wheel_co.paa","\a3\soft_f_orange\van_02\data\van_glass_utility_CA.paa","\a3\Soft_F_Orange\Van_02\Data\van_body_Vrana_CO.paa"],
			["\a3\Soft_F_Orange\Van_02\Data\van_body_FIA_01_CO.paa","donator1","\a3\soft_f_orange\van_02\data\van_wheel_co.paa","\a3\soft_f_orange\van_02\data\van_glass_utility_CA.paa","\a3\Soft_F_Orange\Van_02\Data\van_body_FIA_01_CO.paa"],
			["\a3\Soft_F_Orange\Van_02\Data\van_body_FIA_02_CO.paa","donator1","\a3\soft_f_orange\van_02\data\van_wheel_co.paa","\a3\soft_f_orange\van_02\data\van_glass_utility_CA.paa","\a3\Soft_F_Orange\Van_02\Data\van_body_FIA_02_CO.paa"],
			["\a3\Soft_F_Orange\Van_02\Data\van_body_FIA_01_CO.paa","reb","\a3\soft_f_orange\van_02\data\van_wheel_co.paa","\a3\soft_f_orange\van_02\data\van_glass_utility_CA.paa","\a3\Soft_F_Orange\Van_02\Data\van_body_FIA_01_CO.paa"],
			["\a3\Soft_F_Orange\Van_02\Data\van_body_FIA_02_CO.paa","reb","\a3\soft_f_orange\van_02\data\van_wheel_co.paa","\a3\soft_f_orange\van_02\data\van_glass_utility_CA.paa","\a3\Soft_F_Orange\Van_02\Data\van_body_FIA_02_CO.paa"],
			["\a3\Soft_F_Orange\Van_02\Data\van_body_FIA_02_unfinished_CO.paa","\a3\Soft_F_Orange\Van_02\Data\van_wheel_CO.paa","\a3\Soft_F_Orange\Van_02\Data\van_glass_FIA_02_unfinished_CA.paa","\a3\Soft_F_Orange\Van_02\Data\van_body_FIA_02_unfinished_CO.paa"]
			
		];
	};
	case "C_Van_02_transport_F":
	{
		_ret =
		[
			["\a3\soft_f_orange\van_02\data\van_body_white_CO.paa","civ","\a3\soft_f_orange\van_02\data\van_wheel_co.paa","\a3\soft_f_orange\van_02\data\van_glass_transport_ca.paa","\a3\soft_f_orange\van_02\data\van_body_white_CO.paa"],
			["\a3\soft_f_orange\van_02\data\van_body_blue_CO.paa","civ","\a3\soft_f_orange\van_02\data\van_wheel_co.paa","\a3\soft_f_orange\van_02\data\van_glass_transport_ca.paa","\a3\soft_f_orange\van_02\data\van_body_blue_CO.paa"],
			["\a3\soft_f_orange\van_02\data\van_body_orange_CO.paa","civ","\a3\soft_f_orange\van_02\data\van_wheel_co.paa","\a3\soft_f_orange\van_02\data\van_glass_transport_ca.paa","\a3\soft_f_orange\van_02\data\van_body_orange_CO.paa"],
			["\a3\soft_f_orange\van_02\data\van_body_black_CO.paa","civ","\a3\soft_f_orange\van_02\data\van_wheel_co.paa","\a3\soft_f_orange\van_02\data\van_glass_transport_ca.paa","\a3\soft_f_orange\van_02\data\van_body_black_CO.paa"],
			["\a3\Soft_F_Orange\Van_02\Data\van_body_Green_CO.paa","civ","\a3\soft_f_orange\van_02\data\van_wheel_co.paa","\a3\soft_f_orange\van_02\data\van_glass_utility_CA.paa","\a3\Soft_F_Orange\Van_02\Data\van_body_Green_CO.paa"],
			["\a3\Soft_F_Orange\Van_02\Data\van_body_Red_CO.paa","civ","\a3\soft_f_orange\van_02\data\van_wheel_co.paa","\a3\soft_f_orange\van_02\data\van_glass_utility_CA.paa","\a3\Soft_F_Orange\Van_02\Data\van_body_Red_CO.paa"],
			["\a3\Soft_F_Orange\Van_02\Data\van_body_Syndikat_CO.paa","civ","\a3\soft_f_orange\van_02\data\van_wheel_co.paa","\a3\soft_f_orange\van_02\data\van_glass_utility_CA.paa","\a3\Soft_F_Orange\Van_02\Data\van_body_Syndikat_CO.paa"],
			["\a3\soft_f_orange\van_02\data\van_body_white_CO.paa","donator1","\a3\soft_f_orange\van_02\data\van_wheel_co.paa","\a3\soft_f_orange\van_02\data\van_glass_transport_ca.paa","\a3\soft_f_orange\van_02\data\van_body_white_CO.paa"],
			["\a3\soft_f_orange\van_02\data\van_body_blue_CO.paa","donator1","\a3\soft_f_orange\van_02\data\van_wheel_co.paa","\a3\soft_f_orange\van_02\data\van_glass_transport_ca.paa","\a3\soft_f_orange\van_02\data\van_body_blue_CO.paa"],
			["\a3\soft_f_orange\van_02\data\van_body_orange_CO.paa","donator1","\a3\soft_f_orange\van_02\data\van_wheel_co.paa","\a3\soft_f_orange\van_02\data\van_glass_transport_ca.paa","\a3\soft_f_orange\van_02\data\van_body_orange_CO.paa"],
			["\a3\soft_f_orange\van_02\data\van_body_black_CO.paa","donator1","\a3\soft_f_orange\van_02\data\van_wheel_co.paa","\a3\soft_f_orange\van_02\data\van_glass_transport_ca.paa","\a3\soft_f_orange\van_02\data\van_body_black_CO.paa"],
			["\a3\Soft_F_Orange\Van_02\Data\van_body_Green_CO.paa","donator1","\a3\soft_f_orange\van_02\data\van_wheel_co.paa","\a3\soft_f_orange\van_02\data\van_glass_utility_CA.paa","\a3\Soft_F_Orange\Van_02\Data\van_body_Green_CO.paa"],
			["\a3\Soft_F_Orange\Van_02\Data\van_body_Red_CO.paa","donator1","\a3\soft_f_orange\van_02\data\van_wheel_co.paa","\a3\soft_f_orange\van_02\data\van_glass_utility_CA.paa","\a3\Soft_F_Orange\Van_02\Data\van_body_Red_CO.paa"],
			["\a3\Soft_F_Orange\Van_02\Data\van_body_Syndikat_CO.paa","donator1","\a3\soft_f_orange\van_02\data\van_wheel_co.paa","\a3\soft_f_orange\van_02\data\van_glass_utility_CA.paa","\a3\Soft_F_Orange\Van_02\Data\van_body_Syndikat_CO.paa"],
			["\a3\Soft_F_Orange\Van_02\Data\van_body_Daltgreen_CO.paa","donator1","\a3\soft_f_orange\van_02\data\van_wheel_transport_co.paa","\a3\soft_f_orange\van_02\data\van_glass_transport_CA.paa","\a3\Soft_F_Orange\Van_02\Data\van_body_Daltgreen_CO.paa"],
			["\a3\Soft_F_Orange\Van_02\Data\van_body_AAN_CO.paa","donator1","\a3\soft_f_orange\van_02\data\van_wheel_transport_co.paa","\a3\soft_f_orange\van_02\data\van_glass_transport_CA.paa","\a3\Soft_F_Orange\Van_02\Data\van_body_AAN_CO.paa"],
			["\a3\Soft_F_Orange\Van_02\Data\van_body_BB_CO.paa","donator1","\a3\Soft_F_Orange\Van_02\Data\van_wheel_BB_CO.paa","\a3\Soft_F_Orange\Van_02\Data\van_glass_BB_CA.paa","\a3\Soft_F_Orange\Van_02\Data\van_body_BB_CO.paa"],
			["\a3\Soft_F_Orange\Van_02\Data\van_body_Masked_CO.paa","donator1","\a3\soft_f_orange\van_02\data\van_wheel_transport_co.paa","\a3\soft_f_orange\van_02\data\van_glass_transport_CA.paa","\a3\Soft_F_Orange\Van_02\Data\van_body_Masked_CO.paa"],
			["\a3\Soft_F_Orange\Van_02\Data\van_body_FIA_01_CO.paa","donator1","\a3\soft_f_orange\van_02\data\van_wheel_co.paa","\a3\soft_f_orange\van_02\data\van_glass_utility_CA.paa","\a3\Soft_F_Orange\Van_02\Data\van_body_FIA_01_CO.paa"],
			["\a3\Soft_F_Orange\Van_02\Data\van_body_FIA_02_CO.paa","donator1","\a3\soft_f_orange\van_02\data\van_wheel_co.paa","\a3\soft_f_orange\van_02\data\van_glass_utility_CA.paa","\a3\Soft_F_Orange\Van_02\Data\van_body_FIA_02_CO.paa"],
			["\a3\soft_f_orange\van_02\data\van_body_black_CO.paa","cop","\a3\soft_f_orange\van_02\data\van_wheel_co.paa","\a3\soft_f_orange\van_02\data\van_glass_transport_ca.paa","\a3\soft_f_orange\van_02\data\van_body_black_CO.paa"],
			["\a3\Soft_F_Orange\Van_02\Data\van_body_FIA_01_CO.paa","reb","\a3\soft_f_orange\van_02\data\van_wheel_co.paa","\a3\soft_f_orange\van_02\data\van_glass_utility_CA.paa","\a3\Soft_F_Orange\Van_02\Data\van_body_FIA_01_CO.paa"],
			["\a3\Soft_F_Orange\Van_02\Data\van_body_FIA_02_CO.paa","reb","\a3\soft_f_orange\van_02\data\van_wheel_co.paa","\a3\soft_f_orange\van_02\data\van_glass_utility_CA.paa","\a3\Soft_F_Orange\Van_02\Data\van_body_FIA_02_CO.paa"],
			["\a3\Soft_F_Orange\Van_02\Data\van_body_FIA_02_unfinished_CO.paa","reb","\a3\Soft_F_Orange\Van_02\Data\van_wheel_CO.paa","\a3\Soft_F_Orange\Van_02\Data\van_glass_FIA_02_unfinished_CA.paa","\a3\Soft_F_Orange\Van_02\Data\van_body_FIA_02_unfinished_CO.paa"]
		];
	};
	case "C_Van_02_medevac_F":
	{
		_ret = 
		[
			["A3\Soft_F_Orange\Van_02\Data\van_body_CivAmbulance_CO.paa","med","a3\Soft_F_Orange\Van_02\Data\van_wheel_Red_CO.paa","a3\soft_f_orange\van_02\data\van_glass_CivAmbulance_CA.paa","a3\soft_f_orange\van_02\data\van_ambulance_monitors_co.paa","A3\Soft_F_Orange\Van_02\Data\van_body_CivAmbulance_CO.paa"]
		];
	};
	case "C_Van_02_service_F":
	{
		_ret =
		[
			["\a3\Soft_F_Orange\Van_02\Data\van_body_CivService_CO.paa","med","\a3\Soft_F_Orange\Van_02\Data\van_wheel_dirty_CO.paa","\a3\Soft_F_Orange\Van_02\Data\van_glass_CivService_CA.paa","\a3\Soft_F_Orange\Van_02\Data\van_body_CivService_CO.paa"]
		];
	};
};

_ret;