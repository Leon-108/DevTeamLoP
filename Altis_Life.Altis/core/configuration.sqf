#include "..\script_macros.hpp"
/*
	Master Life Configuration File
	This file is to setup variables for the client, there are still other configuration files in the system

*****************************
****** Backend Variables *****
*****************************
*/
life_query_time = time;
life_action_delay = time;
life_trunk_vehicle = Objnull;
life_session_completed = false;
life_garage_store = false;
life_session_tries = 0;
mdone = false;
safe = false; 
life_net_dropped = false;
life_hit_explosive = false;
life_siren_active = false;
life_clothing_filter = 0;
life_action_gather = false;
life_TankLaster = 1; // Tanklaster
life_fadeSound = 0; // Ohrstöpsel
life_clothing_uniform = -1;
life_redgull_effect = time;
life_is_processing = false;
life_mauer = ObjNull;
life_geld = ObjNull;
life_bail_paid = false;
life_impound_inuse = false;
life_action_inUse = false;
life_spikestrip = ObjNull;
//life_respawn_timer = 1; //Scaled in minutes
life_knockout = false;
life_channel_send = true;
life_interrupted = false;
life_respawned = false;
life_pickAxeAllowed = true;
life_removeWanted = false;
life_loadout=[];
life_actions = [];
life_markers = false;
life_taxi_useTime = time;
life_action_gathering = false;
life_whatIsIt ="";
life_preview_3D_vehicle_cam = objNull;
life_preview_3D_vehicle_object = objNull;
life_preview_light = objNull;
life_pos_exist = false;
life_pos_attach = [];
life_save_gear= [];
life_open_notifications = [];
life_frozen = false;
life_dealerMarkers = [];
//Settings
life_settings_enableNewsBroadcast = profileNamespace getVariable ["life_enableNewsBroadcast",true];
life_settings_enableSidechannel = profileNamespace getVariable ["life_enableSidechannel",true];
life_settings_tagson = profileNamespace getVariable ["life_settings_tagson",true];
life_settings_revealObjects = profileNamespace getVariable ["life_settings_revealObjects",true];
life_settings_viewDistanceFoot = profileNamespace getVariable ["life_viewDistanceFoot",3000];
life_settings_viewDistanceCar = profileNamespace getVariable ["life_viewDistanceCar",3000];
life_settings_viewDistanceAir = profileNamespace getVariable ["life_viewDistanceAir",3000];

//Persistent Saving
__CONST__(life_save_civ,TRUE); //Save weapons for civs?
__CONST__(life_save_yinv,TRUE); //Save Y-Inventory for players?

//Revive constant variables.
__CONST__(life_revive_cops,TRUE); //Set to false if you don't want cops to be able to revive downed players.
__CONST__(life_revive_fee,2500); //Fee for players to pay when revived.

//House Limit
__CONST__(life_houseLimit,2); //Maximum amount of houses a player can buy (TODO: Make Tiered licenses).

__CONST__(life_enableFatigue,false); //Enable / Disable the ARMA 3 Fatigue System

//Gang related stuff?
__CONST__(life_gangPrice,75000); //Price for creating a gang (They're all persistent so keep it high to avoid 345345345 gangs).
__CONST__(life_gangUpgradeBase,10000); //MASDASDASD
__CONST__(life_gangUpgradeMultipler,2.5); //BLAH

//Uniform price (0),Hat Price (1),Glasses Price (2),Vest Price (3),Backpack Price (4)
life_clothing_purchase = [-1,-1,-1,-1,-1];
/*
*****************************
****** Weight Variables *****
*****************************
*/
life_maxWeight = 24; //Identifies the max carrying weight (gets adjusted throughout game when wearing different types of clothing).
life_maxWeightT = 24; //Static variable representing the players max carrying weight on start.
life_carryWeight = 0; //Represents the players current inventory weight (MUST START AT 0).
/*
*****************************
****** Life Variables *******
*****************************
*/
life_net_dropped = false;
life_hit_explosive = false;
life_siren_active = false;
life_bank_fail = false;
life_use_atm = true;
life_is_arrested = false;
life_delivery_in_progress = false;
life_action_in_use = false;
life_thirst = 100;
life_hunger = 100;
__CONST__(life_paycheck_period,5); //Five minutes
CASH = 0;
life_vipdate = "0000-00-00";
__CONST__(life_impound_car,2500);
__CONST__(life_impound_boat,5000);
__CONST__(life_impound_air,20000);
life_istazed = false;
life_my_gang = ObjNull;
life_smartphoneTarget = ObjNull;
life_known_Players = [];
life_2vehicles = [];
bank_robber = [];
switch (playerSide) do {
	case west: {
		BANK = 15000;
		life_paycheck = 38000;
	};
	case civilian: {
		BANK = 30000; //Starting Bank Money
		life_paycheck = 750; //Paycheck Amount
	};
	case independent: {
		BANK = 15000;
		life_paycheck = 28000;
	};
};
life_vShop_rentalOnly = ["B_G_Offroad_01_armed_F"];
__CONST__(life_vShop_rentalOnly,life_vShop_rentalOnly); //These vehicles can never be bought and only 'rented'. Used as a balancer & money sink. If you want your server to be chaotic then fine.. Remove it..
//Setup Items
{
    missionNamespace setVariable [ITEM_VARNAME(configName _x),0];
} forEach ("true" configClasses (missionConfigFile >> "VirtualItems"));

/* Setup Licenses */
{
    _varName = getText(_x >> "variable");
    _sideFlag = getText(_x >> "side");

    missionNamespace setVariable [LICENSE_VARNAME(_varName,_sideFlag),false];
} forEach ("true" configClasses (missionConfigFile >> "Licenses"));

//life_dp_points = ["dp_1","dp_2","dp_3","dp_4","dp_5","dp_6","dp_7","dp_8","dp_9","dp_10","dp_11","dp_12","dp_13","dp_14","dp_15","dp_15","dp_16","dp_17","dp_18","dp_19","dp_20","dp_21","dp_22","dp_23","dp_24","dp_25"];
//[shortVar,reward]
