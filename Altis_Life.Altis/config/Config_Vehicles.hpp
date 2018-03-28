class CarShops {
    /*
    *    ARRAY FORMAT:
    *        0: STRING (Classname)
    *        1: STRING (Condition)
    *    FORMAT:
    *        STRING (Conditions) - Must return boolean :
    *            String can contain any amount of conditions, aslong as the entire
    *            string returns a boolean. This allows you to check any levels, licenses etc,
    *            in any combination. For example:
    *                "call life_coplevel && license_civ_someLicense"
    *            This will also let you call any other function.
    *
    *   BLUFOR Vehicle classnames can be found here: https://community.bistudio.com/wiki/Arma_3_CfgVehicles_WEST
    *   OPFOR Vehicle classnames can be found here: https://community.bistudio.com/wiki/Arma_3_CfgVehicles_EAST
    *   Independent Vehicle classnames can be found here: https://community.bistudio.com/wiki/Arma_3_CfgVehicles_GUER
    *   Civilian Vehicle classnames can be found here: https://community.bistudio.com/wiki/Arma_3_CfgVehicles_CIV
    */
    class civ_car {
        side = "civ";
        conditions = "";
        vehicles[] = {
            { "B_Quadbike_01_F", "" },
            { "C_Hatchback_01_F", "license_civ_driver" },
            { "C_Offroad_01_F", "license_civ_driver" },
            { "C_Offroad_02_unarmed_F", "license_civ_driver && (395180 in (getDLCs 1))" }, //Apex DLC
			{ "C_SUV_01_F", "license_civ_driver" },
            { "C_Hatchback_01_sport_F", "license_civ_driver" },
            { "C_Van_01_transport_F", "license_civ_driver" },
            { "C_Van_01_box_F", "license_civ_driver" },
			{ "C_Van_01_fuel_F", "license_civ_driver" },
			{ "C_Van_02_transport_F", "license_civ_driver && (571710 in (getDLCs 1))" },
			{ "C_Van_02_vehicle_F", "license_civ_driver && (571710 in (getDLCs 1))" }
        };
    };
	
	class donator1_car {
        side = "civ";
        conditions = "license_civ_donator1";
        vehicles[] = {
            { "B_Quadbike_01_F", "" },
            { "C_Hatchback_01_F", "" },
            { "C_Offroad_01_F", "" },
            { "C_Offroad_02_unarmed_F", "(395180 in (getDLCs 1))" }, //Apex DLC
			{ "C_SUV_01_F", "" },
            { "C_Hatchback_01_sport_F", "" },
            { "C_Van_01_transport_F", "" },
            { "C_Van_01_box_F", "" },
			{ "C_Van_01_fuel_F", "" },
			{ "C_Van_02_transport_F", "(571710 in (getDLCs 1))" }, //LAWS
			{ "C_Van_02_vehicle_F", "(571710 in (getDLCs 1))" } //LAWS
        };
    };

    class kart_shop {
        side = "civ";
        conditions = "288520 in (getDLCs 1)"; //Kart
        vehicles[] = {
            { "C_Kart_01_F", "(288520 in (getDLCs 1))" } 
        };
    };

    class civ_truck {
        side = "civ";
        conditions = "license_civ_truck";
        vehicles[] = {
            { "I_Truck_02_transport_F", "" },
            { "I_Truck_02_covered_F", "" },
            { "B_Truck_01_transport_F", "" },
			{ "O_Truck_03_transport_F", "" },
            { "B_Truck_01_covered_F", "" },
			{ "O_Truck_03_covered_F", "" },
			{ "O_Truck_03_repair_F", "" },
			{ "B_Truck_01_ammo_F", "" },
			{ "B_Truck_01_box_F", "" },
            { "O_Truck_03_device_F", "" },
			{ "O_Truck_03_ammo_F", "" },
			{ "I_Truck_02_fuel_F", "" },
            { "B_Truck_01_fuel_F", "" },
			{ "O_Truck_03_fuel_F", "" },
            { "B_MRAP_01_F", "" }
        };
    };
	
	class donator1_truck {
        side = "civ";
        conditions = "license_civ_donator1";
        vehicles[] = {
            { "I_Truck_02_transport_F", "" },
            { "I_Truck_02_covered_F", "" },
            { "B_Truck_01_transport_F", "" },
			{ "O_Truck_03_transport_F", "" },
            { "B_Truck_01_covered_F", "" },
			{ "O_Truck_03_covered_F", "" },
			{ "O_Truck_03_repair_F", "" },
			{ "B_Truck_01_ammo_F", "" },
			{ "B_Truck_01_box_F", "" },
            { "O_Truck_03_device_F", "" },
			{ "O_Truck_03_ammo_F", "" },
			{ "I_Truck_02_fuel_F", "" },
            { "B_Truck_01_fuel_F", "" },
			{ "O_Truck_03_fuel_F", "" },
            { "B_MRAP_01_F", "" },
			{ "O_MRAP_02_F", "" },
			{ "I_MRAP_03_F", "" }
        };
    };

    class civ_air {
        side = "civ";
        conditions = "license_civ_pilot";
        vehicles[] = {
            { "B_Heli_Light_01_F", "" },				//MH-9
            { "C_Heli_Light_01_civil_F", "" },			//M900
            { "O_Heli_Light_02_unarmed_F", "" },		//Orca
			{ "I_Heli_Transport_02_F", "" },			//Mohawk
			{ "I_Heli_light_03_unarmed_F", "" },		//Hellcat
			{ "I_Heli_light_03_dynamicLoadout_F", "" }, //Hellcat
			{ "B_Heli_Transport_01_F", "" },			//Ghost Hawk
			{ "B_Heli_Transport_03_unarmed_F", "(304380 in (getDLCs 1))" }, //Heli DLC		//Huron
			{ "O_Heli_Transport_04_fuel_F", "(304380 in (getDLCs 1))" }, //Heli DLC			//Taru Fuel
			{ "O_Heli_Transport_04_box_F", "(304380 in (getDLCs 1))" }, //Heli DLC			//Taru Box
			{ "C_Plane_Civil_01_F", "(395180 in (getDLCs 1))" }, //Apex DLC					//Caesar
			{ "C_Plane_Civil_01_racing_F", "(395180 in (getDLCs 1))" }, //Apex DLC			//Caesar Racing / zum Farmen
			{ "B_T_VTOL_01_infantry_F", "(395180 in (getDLCs 1))" }, //Apex DLC				//Blackfish Inf
			{ "B_T_VTOL_01_vehicle_F", "(395180 in (getDLCs 1))" }, //Apex DLC				//Blackfish Transport
			{ "O_T_VTOL_02_infantry_F", "(395180 in (getDLCs 1))" }, //Apex DLC				//Xian
			{ "O_Plane_CAS_02_F", "" },														//Jet 1
			{ "B_Plane_Fighter_01_Stealth_F", "(601670 in (getDLCs 1))" } //Apex DLC		//Jet 2
        };
    };
	
	class donator1_air {
        side = "civ";
        conditions = "license_civ_donator1";
        vehicles[] = {
            { "B_Heli_Light_01_F", "" },
            { "C_Heli_Light_01_civil_F", "" },
            { "O_Heli_Light_02_unarmed_F", "" },
			{ "I_Heli_Transport_02_F", "" },
			{ "I_Heli_light_03_unarmed_F", "" },
			{ "B_Heli_Transport_03_unarmed_F", "(304380 in (getDLCs 1))" }, //Heli DLC
			{ "O_Heli_Transport_04_fuel_F", "(304380 in (getDLCs 1))" }, //Heli DLC
			{ "O_Heli_Transport_04_box_F", "(304380 in (getDLCs 1))" }, //Heli DLC
			{ "O_Heli_Transport_04_bench_F", "(304380 in (getDLCs 1))" }, //Heli DLC
			{ "I_Heli_light_03_dynamicLoadout_F", "" },					 //Hellcat
			{ "B_Heli_Transport_01_F", "" },							//Ghost Hawk
			{ "C_Plane_Civil_01_F", "(395180 in (getDLCs 1))" }, //Apex DLC
			{ "C_Plane_Civil_01_racing_F", "(395180 in (getDLCs 1))" }, //Apex DLC
			{ "B_T_VTOL_01_infantry_F", "(395180 in (getDLCs 1))" }, //Apex DLC
			{ "B_T_VTOL_01_vehicle_F", "(395180 in (getDLCs 1))" }, //Apex DLC
			{ "O_T_VTOL_02_infantry_F", "(395180 in (getDLCs 1))" }, //Apex DLC
			{ "O_Plane_CAS_02_F", "" },
			{ "B_Plane_Fighter_01_Stealth_F", "(601670 in (getDLCs 1))" } //Jet DLC
        };
    };

     class civ_ship {
        side = "civ";
        conditions = "license_civ_boat";
        vehicles[] = {
			{ "C_Scooter_Transport_01_F", "(395180 in (getDLCs 1))" }, //Apex DLC	//Jetski
            { "C_Rubberboat", "" },													//Schlauchboot
            { "B_SDV_01_F", "" },													//SDV
            { "C_Boat_Civil_01_F", "" },											//Motorboot
            { "I_C_Boat_Transport_02_F", "(395180 in (getDLCs 1))" } //Apex DLC		//RHIB
        };
    };

    class bandit_car {
        side = "civ";
        conditions = "(license_civ_rebacess && license_civ_rebel) || license_civ_donator1";
        vehicles[] = {
            { "B_Quadbike_01_F", "" },
            { "B_G_Offroad_01_F", "" },
            { "B_CTRG_LSV_01_light_F", "(395180 in (getDLCs 1))" },
			{ "B_T_LSV_01_unarmed_F", "(395180 in (getDLCs 1))" },
			{ "O_T_LSV_02_unarmed_F", "(395180 in (getDLCs 1))" },
			{ "C_Van_02_transport_F", "(571710 in (getDLCs 1))" }, //LAWS
			{ "C_Van_02_vehicle_F", "(571710 in (getDLCs 1))" }, //LAWS
            { "B_Heli_Light_01_F", "" },
			{ "O_Heli_Transport_04_bench_F", "(304380 in (getDLCs 1))" } //Heli DLC
        };
    };
	
	class rebel_car {
        side = "civ";
        conditions = "(license_civ_rebacess && license_civ_rebel) || license_civ_donator1";
        vehicles[] = {
            { "O_MRAP_02_F", "" },
            { "I_MRAP_03_F", "" }
        };
    };
	// PRS	
    class med_shop {
        side = "med";
        conditions = "";
        vehicles[] = {
            { "C_Offroad_01_repair_F", "" },
			{ "C_SUV_01_F", "(call life_mediclevel >= 4)" },
            { "C_Van_02_medevac_F", "(call life_mediclevel >= 3) && (571710 in (getDLCs 1))" },
            { "C_Van_02_service_F", "(call life_mediclevel >= 3) && (571710 in (getDLCs 1))" },
            { "B_Truck_01_covered_F", "(call life_mediclevel >= 3)" },
			{ "C_Hatchback_01_sport_F", "(call life_mediclevel >= 5)" },
			{ "B_MRAP_01_F", "(call life_mediclevel >= 6)" }
        };
    };

    class med_air_hs {
        side = "med";
        conditions = "license_med_mAir";
        vehicles[] = {
            { "B_Heli_Light_01_F", "(call life_mediclevel >= 2)" },
            { "I_Heli_light_03_unarmed_F", "(call life_mediclevel >= 4)" },
			{ "I_Heli_Transport_02_F", "(call life_mediclevel >= 5)" },
			{ "O_Heli_Light_02_unarmed_F", "(call life_mediclevel >= 3)" },
			{ "B_Heli_Transport_03_unarmed_F", "(call life_mediclevel >= 7) && (304380 in (getDLCs 1))" },
			{ "O_Heli_Transport_04_bench_F", "(call life_mediclevel >= 8) &&(304380 in (getDLCs 1))" },
			{ "O_Heli_Transport_04_F", "(call life_mediclevel >= 3) && (304380 in (getDLCs 1))" },
			{ "O_Heli_Transport_04_medevac_F", "(call life_mediclevel >= 6) &&(304380 in (getDLCs 1))"}
        };
    };
	
	class med_ship {
        side = "med";
        conditions = "";
        vehicles[] = {
            { "B_Boat_Transport_01_F", "" },
            { "C_Boat_Civil_01_rescue_F", "" },
			{ "B_SDV_01_F", "" },
			{ "C_Scooter_Transport_01_F", "" }, 
            { "O_Lifeboat", "" }
        };
    };
	
	//COP
    class cop_car {
        side = "cop";
        conditions = "";
        vehicles[] = {
            { "C_Offroad_01_F", "" },
            { "C_SUV_01_F", "" },
			{ "C_Kart_01_Blu_F", "(call life_coplevel >= 2) && (288520 in (getDLCs 1))" },
			{ "C_Offroad_02_unarmed_F", "(call life_coplevel >= 2)"},
            { "C_Hatchback_01_sport_F", "call life_coplevel >= 2" },
			{ "B_Truck_01_covered_F", "call life_coplevel >= 2" },
			{ "B_CTRG_LSV_01_light_F", "(call life_coplevel >= 3) && (395180 in (getDLCs 1))" },
			{ "O_T_LSV_02_unarmed_F", "(call life_coplevel >= 3) && (395180 in (getDLCs 1))" },
			{ "C_Van_02_transport_F", "(call life_coplevel >= 3) && (571710 in (getDLCs 1))" },
			{ "B_MRAP_01_F", "(call life_coplevel >= 4) || license_cop_swat || license_cop_swatcmd" },
			{ "I_MRAP_03_F", "(call life_coplevel >= 5) || license_cop_swat || license_cop_swatcmd || license_cop_swatazubi" },
			{ "O_MRAP_02_F", "license_cop_swat || license_cop_swatcmd || license_cop_swatazubi" },
            { "I_Truck_02_covered_F", "call life_coplevel >= 5 || license_cop_swat || license_cop_swatcmd" },
			{ "B_Truck_01_box_F", "call life_coplevel >= 5 || license_cop_swat || license_cop_swatcmd" }
        };
    };

    class cop_air {
        side = "cop";
        conditions = "call life_coplevel >= 2";
        vehicles[] = {
            { "B_Heli_Light_01_F", "(call life_coplevel >= 2)" },
			{ "I_Heli_light_03_unarmed_F", "(call life_coplevel >= 4)" },
			{ "I_Heli_light_03_dynamicLoadout_F", "(call life_coplevel >= 5)" },
			{ "B_Heli_Transport_03_unarmed_F", "(call life_coplevel >= 5) || license_cop_swat || license_cop_swatazubi || license_cop_swatcmd" },
			{ "B_T_VTOL_01_infantry_F", "((call life_coplevel >= 8) || license_cop_swat || license_cop_swatazubi || license_cop_swatcmd) && (395180 in (getDLCs 1)) " },
			{ "B_T_VTOL_01_vehicle_F", "((call life_coplevel >= 8) || license_cop_swat || license_cop_swatazubi || license_cop_swatcmd) && (395180 in (getDLCs 1)) " },
			{ "O_Heli_Transport_04_bench_F", "(call life_coplevel >= 8) && (304380 in (getDLCs 1))" },
			{ "B_Heli_Transport_01_F", "(call life_coplevel >= 8)" }
			
		};
    };

    class cop_ship {
        side = "cop";
        conditions = "";
        vehicles[] = {
			{ "C_Scooter_Transport_01_F", "" }, 
            { "B_Boat_Transport_01_F", "" },
            { "C_Boat_Civil_01_police_F", "" },
			{ "I_C_Boat_Transport_02_F", "" },
            { "B_SDV_01_F", "call life_coplevel >= 4" },
            { "B_Boat_Armed_01_minigun_F", "call life_coplevel >= 5" }
        };
    };
	
	//Dithmarscher
	class dm_car {
        side = "civ";
        conditions = "license_civ_dm";
        vehicles[] = {
            { "B_MRAP_01_F", "" },
            { "O_Truck_03_device_F", "" },
			{ "O_Truck_03_ammo_F", "" },
			{ "B_Heli_Light_01_F", "" },
			{ "I_Heli_light_03_unarmed_F", "" },
			{ "I_Heli_light_03_dynamicLoadout_F", "" },
			{ "O_Heli_Transport_04_bench_F", "(304380 in (getDLCs 1))" }
        };
    };
	
	//Evers
	class srevers_car {
        side = "civ";
        conditions = "license_civ_srevers";
        vehicles[] = {
            { "B_MRAP_01_F", "" },
            { "I_MRAP_03_F", "" },
			{ "B_Heli_Light_01_F", "" }
        };
    };
	
	//Private Army
	class pa_car {
        side = "civ";
        conditions = "license_civ_pa";
        vehicles[] = {
            { "B_MRAP_01_F", "" },
            { "I_MRAP_03_F", "" },
            { "O_T_LSV_02_unarmed_F", "(395180 in (getDLCs 1))" },
			{ "C_Hatchback_01_sport_F", "" },
			{ "B_Heli_Light_01_F", "" }
        };
    };
	
	//Kartell
	class kartell_car {
        side = "civ";
        conditions = "license_civ_kartell";
        vehicles[] = {
            { "O_T_LSV_02_unarmed_F", "(395180 in (getDLCs 1))" },
            { "B_MRAP_01_F", "" },
			{ "I_MRAP_03_F", "" },
			{ "B_Heli_Light_01_F", "" },
			{ "I_Heli_light_03_unarmed_F", "" },
			{ "I_Heli_light_03_dynamicLoadout_F", "" }
        };
    };
	
	//KING
	class king_car {
        side = "civ";
        conditions = "license_civ_king";
        vehicles[] = {
            { "B_Heli_Light_01_F", "" },
			{ "I_MRAP_03_F", "" }
        };
    };
	/*
	//SR
	class sr_car {
        side = "civ";
        conditions = "license_civ_sr";
        vehicles[] = {
            { "B_Heli_Light_01_F", "" },
			{ "I_MRAP_03_F", "" }
        };
    };
	*/
	//BHG
	class bhg_car {
        side = "civ";
        conditions = "license_civ_bhg";
        vehicles[] = {
			{ "C_Hatchback_01_sport_F", "" },
			{ "I_Heli_light_03_unarmed_F", "" },
            { "I_Heli_light_03_dynamicLoadout_F", "" },
			{ "I_MRAP_03_F", "" }
        };
    };
	
	class presse_car {
        side = "civ";
        conditions = "license_civ_presse";
        vehicles[] = {
			{ "C_SUV_01_F", "" }
        };
    };
};

class LifeCfgVehicles {
    /*
    *    Vehicle Configs (Contains textures and other stuff)
    *
    *    "price" is the price before any multipliers set in Master_Config are applied.
    *
    *    Default Multiplier Values & Calculations:
    *       Civilian [Purchase, Sell]: [1.0, 0.5]
    *       Cop [Purchase, Sell]: [0.5, 0.5]
    *       Medic [Purchase, Sell]: [0.75, 0.5]
    *       ChopShop: Payout = price * 0.25
    *       GarageSell: Payout = price * [0.5, 0.5, 0.5, -1]
    *       Cop Impound: Payout = price * 0.1
    *       Pull Vehicle from Garage: Cost = price * [1, 0.5, 0.75, -1] * [0.5, 0.5, 0.5, -1]
    *           -- Pull Vehicle & GarageSell Array Explanation = [civ,cop,medic,east]
    *
    *       1: STRING (Condition)
    *    Textures config follows { Texture Name, side, {texture(s)path}, Condition}
    *    Texture(s)path follows this format:
    *    INDEX 0: Texture Layer 0
    *    INDEX 1: Texture Layer 1
    *    INDEX 2: Texture Layer 2
    *    etc etc etc
    *
    */

    class Default {
        vItemSpace = -1;
        conditions = "";
        price = -1;
		garageprice= -1;
		medprice = -1;
		copprice = -1;
		repaintprice = -1;
		storeLiquid= 0;
		gatherWeight = -1; 
		insurance=-1;
		textures[] = {};
    };
	
	//PKWs
	class C_Kart_01_F {
        vItemSpace = -1;
        conditions = "";
        price = 375000;
		garageprice= 25000;
		medprice = -1;
		copprice = 25000;
		repaintprice = 37500;
		storeLiquid= 0;
		gatherWeight = -1; 
		insurance=-1;
		textures[] = {
            { "Fuel", {"civ","donator1","admin1"}, {
                "\a3\Soft_F_Kart\Kart_01\Data\Kart_01_CO.paa"
				,"\a3\Soft_F_Kart\Kart_01\Data\Kart_01_logos_CA.paa"
				,"\a3\Soft_F_Kart\Kart_01\Data\Kart_num_1_CA.paa"
				,"\a3\Soft_F_Kart\Kart_01\Data\Kart_num_3_CA.paa"
            },"(!(playerSide in [west,independent]))" },
            { "Cop", {"cop"}, {
                "\a3\Soft_F_Kart\Kart_01\Data\Kart_01_base_blue_CO.paa"
				,"\a3\Soft_F_Kart\Kart_01\Data\Kart_01_logos_blu_CA.paa"
				,"\a3\Soft_F_Kart\Kart_01\Data\Kart_num_1_CA.paa"
				,"\a3\Soft_F_Kart\Kart_01\Data\Kart_num_3_CA.paa"
            },"call life_coplevel > 0" },
			{ "Blueking", {"civ","donator1","admin1"}, {
                "\a3\Soft_F_Kart\Kart_01\Data\Kart_01_blu_CO.paa"
				,"\a3\Soft_F_Kart\Kart_01\Data\Kart_01_logos_blu_CA.paa"
				,"\a3\Soft_F_Kart\Kart_01\Data\Kart_num_1_CA.paa"
				,"\a3\Soft_F_Kart\Kart_01\Data\Kart_num_3_CA.paa"
            },"(!(playerSide in [west,independent]))" },
			{ "Redstone", {"civ","donator1","admin1"}, {
                "\a3\Soft_F_Kart\Kart_01\Data\Kart_01_black_CO.paa"
				,"\a3\Soft_F_Kart\Kart_01\Data\Kart_01_logos_black_CA.paa"
				,"\a3\Soft_F_Kart\Kart_01\Data\Kart_num_1_CA.paa"
				,"\a3\Soft_F_Kart\Kart_01\Data\Kart_num_3_CA.paa"
            },"(!(playerSide in [west,independent]))" },
			{ "Vrana", {"civ","donator1","admin1"}, {
                "\a3\Soft_F_Kart\Kart_01\Data\Kart_01_vrana_CO.paa"
				,"\a3\Soft_F_Kart\Kart_01\Data\Kart_01_logos_vrana_CA.paa"
				,"\a3\Soft_F_Kart\Kart_01\Data\Kart_num_1_CA.paa"
				,"\a3\Soft_F_Kart\Kart_01\Data\Kart_num_3_CA.paa"
            },"(!(playerSide in [west,independent]))" },
			{ "Green", {"civ","donator1","admin1"}, {
                "\a3\Soft_F_Kart\Kart_01\Data\Kart_01_base_green_CO.paa"
				,"\a3\Soft_F_Kart\Kart_01\Data\Kart_01_logos_blu_CA.paa"
				,"\a3\Soft_F_Kart\Kart_01\Data\Kart_num_1_CA.paa"
				,"\a3\Soft_F_Kart\Kart_01\Data\Kart_num_3_CA.paa"
            },"(!(playerSide in [west,independent]))" },
			{ "Blue", {"civ","donator1","admin1"}, {
                "\a3\Soft_F_Kart\Kart_01\Data\Kart_01_base_blue_CO.paa"
				,"\a3\Soft_F_Kart\Kart_01\Data\Kart_01_logos_blu_CA.paa"
				,"\a3\Soft_F_Kart\Kart_01\Data\Kart_num_1_CA.paa"
				,"\a3\Soft_F_Kart\Kart_01\Data\Kart_num_3_CA.paa"
            },"(!(playerSide in [west,independent]))" },
			{ "Orange", {"civ","donator1","admin1"}, {
                "\a3\Soft_F_Kart\Kart_01\Data\Kart_01_base_orange_CO.paa"
				,"\a3\Soft_F_Kart\Kart_01\Data\Kart_01_logos_blu_CA.paa"
				,"\a3\Soft_F_Kart\Kart_01\Data\Kart_num_1_CA.paa"
				,"\a3\Soft_F_Kart\Kart_01\Data\Kart_num_3_CA.paa"
            },"(!(playerSide in [west,independent]))" },
			{ "White", {"civ","donator1","admin1"}, {
                "\a3\Soft_F_Kart\Kart_01\Data\Kart_01_base_white_CO.paa"
				,""
				,"\a3\Soft_F_Kart\Kart_01\Data\Kart_num_1_CA.paa"
				,"\a3\Soft_F_Kart\Kart_01\Data\Kart_num_3_CA.paa"
            },"(!(playerSide in [west,independent]))" },
			{ "White", {"civ","donator1","admin1"}, {
                "\a3\Soft_F_Kart\Kart_01\Data\Kart_01_base_white_CO.paa"
				,""
				,"\a3\Soft_F_Kart\Kart_01\Data\Kart_num_1_CA.paa"
				,"\a3\Soft_F_Kart\Kart_01\Data\Kart_num_3_CA.paa"
            },"(!(playerSide in [west,independent]))" },
			{ "Yellow", {"civ","donator1","admin1"}, {
                "\a3\Soft_F_Kart\Kart_01\Data\Kart_01_base_yellow_CO.paa"
				,""
				,"\a3\Soft_F_Kart\Kart_01\Data\Kart_num_1_CA.paa"
				,"\a3\Soft_F_Kart\Kart_01\Data\Kart_num_3_CA.paa"
            },"(!(playerSide in [west,independent]))" },
			{ "Black", {"civ","donator1","admin1"}, {
                "\a3\Soft_F_Kart\Kart_01\Data\Kart_01_base_black_CO.paa"
				,"\a3\Soft_F_Kart\Kart_01\Data\Kart_01_logos_black_CA.paa"
				,"\a3\Soft_F_Kart\Kart_01\Data\Kart_num_1_CA.paa"
				,"\a3\Soft_F_Kart\Kart_01\Data\Kart_num_3_CA.paa"
            },"(!(playerSide in [west,independent]))" }
        };
    };
	class B_Quadbike_01_F {
        vItemSpace = 25;
        conditions = "";
        price = 15000;
		medprice = 3000;
		copprice = -1;
		garageprice= 150;
		repaintprice=1950;
		storeLiquid= 0;
		gatherWeight = -1; 
		insurance=-1;
		textures[] = {
			{ "Brown", {"civ","donator1","admin1"}, {
                "\A3\Soft_F\Quadbike_01\Data\quadbike_01_opfor_co.paa"
            },"(!(playerSide in [west,independent]))" },
			{ "Cop", {"cop"}, {
                "\A3\Soft_F\Quadbike_01\Data\Quadbike_01_co.paa"
            },"call life_coplevel > 0" },
			{ "Black", {"civ","donator1","admin1"}, {
                "\A3\Soft_F_beta\Quadbike_01\Data\quadbike_01_civ_black_co.paa"
            },"(!(playerSide in [west,independent]))" },
			{ "Blue", {"civ","donator1","admin1"}, {
                "\A3\Soft_F_beta\Quadbike_01\Data\quadbike_01_civ_blue_co.paa"
            },"(!(playerSide in [west,independent]))" },
			{ "Red", {"civ","donator1","admin1"}, {
                "\A3\Soft_F_beta\Quadbike_01\Data\quadbike_01_civ_red_co.paa"
            },"(!(playerSide in [west,independent]))" },
			{ "White", {"civ","donator1","admin1"}, {
                "\A3\Soft_F_beta\Quadbike_01\Data\quadbike_01_civ_white_co.paa"
            },"(!(playerSide in [west,independent]))" },
			{ "Digi Green", {"reb","donator1"}, {
                "\A3\Soft_F_beta\Quadbike_01\Data\quadbike_01_indp_co.paa"
            },"license_civ_rebel || license_civ_donator1" },
			{ "Hunter Camo", {"reb","donator1"}, {
                "\a3\soft_f_gamma\Quadbike_01\data\quadbike_01_indp_hunter_co.paa"
            },"license_civ_rebel || license_civ_donator1" },
			{ "Event", {"admin1"}, {
                "textures\Event\quad_event.paa"
            },"((getPlayerUID player) in ['76561198073604498','76561198075876776'])" },
			{ "PRS", {"med"}, {
               "textures\Fahrzeug_Skins\Medic\quadbike.paa"
			   ,"textures\Fahrzeug_Skins\Medic\quadbike_wheel.paa"
            },"call life_mediclevel > 0" }	
		};
    };
	
	class C_Offroad_01_F {
        vItemSpace = 80;
        conditions = "license_civ_driver || (!(playerSide isEqualTo civilian))";
        price = 30000;
		medprice = 10000;
		copprice = 10000;
		garageprice = 300;
		repaintprice = 3000;
		storeLiquid= 0;
		gatherWeight = -1; 
		insurance=-1;
		textures[] = {
            { "Red", {"civ","donator1","admin1"}, {
                "\A3\soft_F\Offroad_01\Data\offroad_01_ext_co.paa",
                "\A3\soft_F\Offroad_01\Data\offroad_01_ext_co.paa"
            },"(!(playerSide in [west,independent]))" },
            { "Yellow", {"civ","donator1","admin1"}, {
                "\A3\soft_F\Offroad_01\Data\offroad_01_ext_BASE01_CO.paa",
                "\A3\soft_F\Offroad_01\Data\offroad_01_ext_BASE01_CO.paa"
            },"(!(playerSide in [west,independent]))" },
            { "White", {"civ","donator1","admin1"}, {
                "\A3\soft_F\Offroad_01\Data\offroad_01_ext_BASE02_CO.paa",
                "\A3\soft_F\Offroad_01\Data\offroad_01_ext_BASE02_CO.paa"
            },"(!(playerSide in [west,independent]))" },
            { "Blue", {"civ","donator1","admin1"}, {
                "\A3\soft_F\Offroad_01\Data\offroad_01_ext_BASE03_CO.paa",
                "\A3\soft_F\Offroad_01\Data\offroad_01_ext_BASE03_CO.paa"
            },"(!(playerSide in [west,independent]))" },
            { "Dark Red", {"civ","donator1","admin1"}, {
                "\A3\soft_F\Offroad_01\Data\offroad_01_ext_BASE04_CO.paa",
                "\A3\soft_F\Offroad_01\Data\offroad_01_ext_BASE04_CO.paa"
            },"(!(playerSide in [west,independent]))" },
            { "Blue / White", {"civ","donator1","admin1"}, {
                "\A3\soft_F\Offroad_01\Data\offroad_01_ext_BASE05_CO.paa",
                "\A3\soft_F\Offroad_01\Data\offroad_01_ext_BASE05_CO.paa"
            },"(!(playerSide in [west,independent]))" },
           	{ "Gay", {"donator1","admin1"}, {
                "textures\Fahrzeug_Skins\CIV\Gay.paa"
            }, "license_civ_donator1" },
			{ "Holz", {"donator1","admin1"}, {
                "textures\Fahrzeug_Skins\CIV\Holz.paa"
            }, "license_civ_donator1" },
			{ "Cop", {"cop"}, {
                "textures\Fahrzeug_Skins\Cops\offroader.paa"
            }, "call life_coplevel > 0" },
			{ "PRS", {"med"}, {
                "textures\Fahrzeug_Skins\Medic\offr_prs.paa"
            }, "call life_mediclevel > 0" },
			{ "Monster", {"donator1","admin1"}, {
                "textures\Fahrzeug_Skins\CIV\offroad_monster.paa"
            }, "license_civ_donator1" },
            { "Dodge", {"donator1","admin1"}, {
                "textures\Fahrzeug_Skins\CIV\offroad_ram.paa"
            }, "license_civ_donator1" },
			{ "Event", {"admin1"}, {
                "textures\Event\offroad_event.paa"
            }, "license_civ_admin1" },
			{ "IDAP", {"donator1","admin1"}, {
               "\A3\Soft_F_Orange\Offroad_01\Data\Offroad_01_ext_IDAP_CO.paa"
			   ,"\A3\Soft_F_Orange\Offroad_01\Data\Offroad_01_ext_IDAP_CO.paa"
            }, "license_civ_donator1" }
        };
    };
	
	class C_Offroad_01_repair_F : C_Offroad_01_F {};
	
	class B_G_Offroad_01_F : C_Offroad_01_F {
				storeLiquid= 0;
		gatherWeight = -1; 
		insurance=-1;
		textures[] = {
            { "Rebel", {"reb","donator1","admin1"}, {
                "\A3\Soft_F_Bootcamp\Offroad_01\Data\offroad_01_ext_IG_01_CO.paa"
				,"\A3\Soft_F_Bootcamp\Offroad_01\Data\offroad_01_ext_IG_01_CO.paa"
            }, "license_civ_donator1 || license_civ_rebel" },
            { "Rebel 2", {"donator1","admin1"}, {
                "\A3\Soft_F_Bootcamp\Offroad_01\Data\offroad_01_ext_IG_02_CO.paa"
				,"\A3\Soft_F_Bootcamp\Offroad_01\Data\offroad_01_ext_IG_02_CO.paa"
            }, "license_civ_donator1" },
            { "Rebel 3", {"donator1","admin1"}, {
                "\A3\Soft_F_Bootcamp\Offroad_01\Data\offroad_01_ext_IG_03_CO.paa"
				,"\A3\Soft_F_Bootcamp\Offroad_01\Data\offroad_01_ext_IG_03_CO.paa"
            }, "license_civ_donator1" },
			{ "Rebel 4", {"donator1","admin1"}, {
                "\A3\Soft_F_Bootcamp\Offroad_01\Data\offroad_01_ext_IG_04_CO.paa"
				,"\A3\Soft_F_Bootcamp\Offroad_01\Data\offroad_01_ext_IG_04_CO.paa"
            }, "license_civ_donator1" },
			{ "Rebel 5", {"donator1","admin1"}, {
                "\A3\Soft_F_Bootcamp\Offroad_01\Data\offroad_01_ext_IG_05_CO.paa"
				,"\A3\Soft_F_Bootcamp\Offroad_01\Data\offroad_01_ext_IG_05_CO.paa"
            }, "license_civ_donator1" },
			{ "Rebel 6", {"donator1","admin1"}, {
                "\A3\Soft_F_Bootcamp\Offroad_01\Data\offroad_01_ext_IG_06_CO.paa"
				,"\A3\Soft_F_Bootcamp\Offroad_01\Data\offroad_01_ext_IG_06_CO.paa"
            }, "license_civ_donator1" },
			{ "Rebel 7", {"donator1","admin1"}, {
                "\A3\Soft_F_Bootcamp\Offroad_01\Data\offroad_01_ext_IG_07_CO.paa"
				,"\A3\Soft_F_Bootcamp\Offroad_01\Data\offroad_01_ext_IG_07_CO.paa"
            }, "license_civ_donator1" },
			{ "Rebel 8", {"donator1","admin1"}, {
                "\A3\Soft_F_Bootcamp\Offroad_01\Data\offroad_01_ext_IG_08_CO.paa"
				,"\A3\Soft_F_Bootcamp\Offroad_01\Data\offroad_01_ext_IG_08_CO.paa"
            }, "license_civ_donator1" },
			{ "Rebel 9", {"donator1","admin1"}, {
                "\A3\Soft_F_Bootcamp\Offroad_01\Data\offroad_01_ext_IG_09_CO.paa"
				,"\A3\Soft_F_Bootcamp\Offroad_01\Data\offroad_01_ext_IG_09_CO.paa"
            }, "license_civ_donator1" },
			{ "Rebel 10", {"donator1","admin1"}, {
                "\A3\Soft_F_Bootcamp\Offroad_01\Data\offroad_01_ext_IG_10_CO.paa"
				,"\A3\Soft_F_Bootcamp\Offroad_01\Data\offroad_01_ext_IG_10_CO.paa"
            }, "license_civ_donator1" },
			{ "Rebel 11", {"donator1","admin1"}, {
                "\A3\Soft_F_Bootcamp\Offroad_01\Data\offroad_01_ext_IG_11_CO.paa"
				,"\A3\Soft_F_Bootcamp\Offroad_01\Data\offroad_01_ext_IG_11_CO.paa"
            }, "license_civ_donator1" },
			{ "Rebel 12", {"donator1","admin1"}, {
                "\A3\Soft_F_Bootcamp\Offroad_01\Data\offroad_01_ext_IG_12_CO.paa"
				,"\A3\Soft_F_Bootcamp\Offroad_01\Data\offroad_01_ext_IG_12_CO.paa"
            }, "license_civ_donator1" }
        };
    };
		
	class C_Hatchback_01_sport_F {
        vItemSpace = 60;
        conditions = "license_civ_driver || (!(playerSide isEqualTo civilian))";
        price = 600000;
		medprice = 10000;
		copprice = 25000;
		garageprice= 12000;
		repaintprice= 60000;
		storeLiquid= 0;
		gatherWeight = -1; 
		insurance=-1;
		textures[] = {
            { "Beige", {"civ","donator1","admin1"}, {
                "\a3\soft_f_gamma\Hatchback_01\data\hatchback_01_ext_base01_co.paa"
            },"(!(playerSide in [west,independent]))" },
            { "Green", {"civ","donator1","admin1"}, {
                "\a3\soft_f_gamma\Hatchback_01\data\hatchback_01_ext_base02_co.paa"
            },"(!(playerSide in [west,independent]))" },
            { "Blue", {"civ","donator1","admin1"}, {
                "\a3\soft_f_gamma\Hatchback_01\data\hatchback_01_ext_base03_co.paa"
            },"(!(playerSide in [west,independent]))" },
            { "Dark Blue", {"civ","donator1","admin1"}, {
                "\a3\soft_f_gamma\Hatchback_01\data\hatchback_01_ext_base04_co.paa"
            },"(!(playerSide in [west,independent]))" },
            { "Yellow", {"civ","donator1","admin1"}, {
                "\a3\soft_f_gamma\Hatchback_01\data\hatchback_01_ext_base06_co.paa"
            },"(!(playerSide in [west,independent]))" },
            { "White", {"civ","donator1","admin1"}, {
                "\a3\soft_f_gamma\Hatchback_01\data\hatchback_01_ext_base07_co.paa"
            },"(!(playerSide in [west,independent]))" },
            { "Grey", {"civ","donator1","admin1"}, {
                "\a3\soft_f_gamma\Hatchback_01\data\hatchback_01_ext_base08_co.paa"
            },"(!(playerSide in [west,independent]))" },
            { "Black", {"civ","donator1","admin1"}, {
                "\a3\soft_f_gamma\Hatchback_01\data\hatchback_01_ext_base09_co.paa"
            },"(!(playerSide in [west,independent]))" },
			{ "Cop", {"cop"}, {
                "textures\Fahrzeug_Skins\Cops\hatchback.paa"
            }, "call life_coplevel > 0" },
			{ "PRS", {"med"}, {
                "textures\Fahrzeug_Skins\Medic\sportlimo_prs.paa"
            }, "call life_mediclevel > 0" },
			{ "LoP Edition", {"admin1"}, {
                "textures\Fahrzeug_Skins\lopedition.paa"
            }, "((getPlayerUID player) in ['76561198073604498','76561198075876776'])" },
			{ "Hello Kitty", {"donator1","admin1"}, {
                "textures\Fahrzeug_Skins\donator\hellokitty.paa"
            }, "license_civ_donator1" },
			{ "Monster", {"donator1","admin1"}, {
                "textures\Fahrzeug_Skins\donator\monster.paa"
            }, "license_civ_donator1" },
			{ "Metallica", {"donator1","admin1"}, {
                "textures\Fahrzeug_Skins\donator\Metallica.paa"
            }, "license_civ_donator1" },
			{ "Impreza", {"donator1","admin1"}, {
                "textures\Fahrzeug_Skins\donator\hatchback_impreza.paa"
            }, "license_civ_donator1" },
			{ "Asiimov", {"donator1","admin1"}, {
                "textures\Fahrzeug_Skins\donator\asiimov_hatchback.paa"
            }, "license_civ_donator1" },
			{ "Green Undercover", {"cop"}, {
                "\a3\soft_f_gamma\Hatchback_01\data\hatchback_01_ext_sport02_co.paa"
            }, "call life_coplevel > 4" },
			{ "Metallica Undercover", {"cop"}, {
                "textures\Fahrzeug_Skins\donator\Metallica.paa"
            }, "call life_coplevel > 4" },
			{ "Private Army", {"pa","admin1"}, {
				"textures\Fahrzeug_Skins\pa\Sportlimousine.paa"
			}, "license_civ_pa" },
			{ "BHG", {"bhg","admin1"}, {
				"textures\Fahrzeug_Skins\bhg\Sportlimousine.paa"
			}, "license_civ_bhg" }
        };
    };
	class C_Hatchback_01_F : C_Hatchback_01_sport_F {
		vItemSpace = 40;
	    price = 24000;
		medprice = -1;
		copprice = -1;
		garageprice= 2400;
		repaintprice=2400;
    };
	
	class C_SUV_01_F {
        vItemSpace = 50;
        conditions = "license_civ_driver || (!(playerSide isEqualTo civilian))";
        price = 52500;
		medprice = 52500;
		copprice = 52500;
		garageprice = 5250;
		repaintprice = 5250;
				storeLiquid= 0;
		gatherWeight = -1; 
		insurance=-1;
		textures[] = {
            { "Dark Red", {"civ","donator1","admin1"}, {
                "\a3\soft_f_gamma\SUV_01\Data\suv_01_ext_co.paa"
            },"(!(playerSide in [west,independent]))" },
            { "Black", {"cop"}, {
                "\a3\soft_f_gamma\SUV_01\Data\suv_01_ext_02_co.paa"
            }, "call life_coplevel >=6" },
            { "Silver", {"civ","donator1","admin1"}, {
                "\a3\soft_f_gamma\SUV_01\Data\suv_01_ext_03_co.paa"
            },"(!(playerSide in [west,independent]))" },
            { "Orange", {"civ","donator1","admin1"}, {
                "\a3\soft_f_gamma\SUV_01\Data\suv_01_ext_04_co.paa"
            },"(!(playerSide in [west,independent]))" },
			{ "Cop Black", {"cop"}, {
                "#(ai,64,64,1)Fresnel(1.3,7)"
            }, "call life_coplevel >=6" },
			{ "Carbon", {"donator1","admin1"}, {
                "textures\Fahrzeug_Skins\CIV\Carbon.paa"
            }, "license_civ_donator1" },
			{ "Cop", {"cop"}, {
                "textures\Fahrzeug_Skins\Cops\suv.paa"
            }, "call life_coplevel > 0" },
			{ "Monster", {"donator1","admin1"}, {
                "textures\Fahrzeug_Skins\CIV\suv_monster.paa"
            }, "license_civ_donator1" },
			{ "Priester", {"presse"}, {
                "textures\Fahrzeug_Skins\Presse\presse.paa"
            }, "license_civ_presse" },
			{ "PRS", {"med"}, {
                "textures\Fahrzeug_Skins\Medic\suv_prs.paa"
            }, "call life_mediclevel > 0" },
			{ "City", {"donator1","admin1"}, {
                "textures\Fahrzeug_Skins\CIV\city.paa"
            }, "license_civ_donator1" },
			{ "umlackieren", {"admin1"}, {
                "textures\pixel.jpg"
            }, "license_civ_admin1" },
			{ "LoP Edition", {"donator1","admin1"}, {
                "textures\Fahrzeug_Skins\lop2015.paa"
            }, "((getPlayerUID player) in ['76561198073604498','76561198075876776'])" },
			{ "Gewinner", {"admin1"}, {
                "textures\Event\suv_event.paa"
            }, "((getPlayerUID player) in ['76561198073604498','76561198075876776'])" },
			{ "Monster Undercover", {"cop"}, {
                "textures\Fahrzeug_Skins\CIV\suv_monster.paa"
            }, "call life_coplevel >=4" },
			{ "Dead by Daylight", {"donator1","admin1"}, {
                "textures\Fahrzeug_Skins\Donator\SUV_DBD2.paa"
            }, "license_civ_donator1" },
			{ "Kabumm", {"donator1","admin1"}, {
                "textures\Fahrzeug_Skins\Donator\SUV_Kabumm.paa"
            }, "license_civ_donator1" },
			{ "Money", {"donator1","admin1"}, {
                "textures\Fahrzeug_Skins\Donator\SUV_Money.paa"
            }, "license_civ_donator1" },
			{ "Schildkroete", {"donator1","admin1"}, {
                "textures\Fahrzeug_Skins\Donator\SUV_Schildkroete.paa"
            }, "license_civ_donator1" },
			{ "STVO", {"donator1","admin1"}, {
                "textures\Fahrzeug_Skins\Donator\SUV_STVO.paa"
            }, "license_civ_donator1" },
			{ "Taxi", {"donator1","admin1"}, {
                "textures\Fahrzeug_Skins\Donator\SUVTaxi.paa"
            }, "license_civ_donator1" },
			{ "Pfarrei", {"donator1","admin1"}, {
                "textures\Fahrzeug_Skins\Donator\SUVPfarrei.paa"
            }, "license_civ_donator1" },
			{ "Orange Undercover", {"cop"}, {
                "\a3\soft_f_gamma\SUV_01\Data\suv_01_ext_04_co.paa"
            }, "call life_coplevel >=4" },
			{ "Silver Undercover", {"cop"}, {
                "\a3\soft_f_gamma\SUV_01\Data\suv_01_ext_04_co.paa"
            }, "call life_coplevel >=4" },
			{ "Halloween", {"admin1"}, {
                "textures\Event\Halloween_SUV.paa"
            }, "((getPlayerUID player) in ['76561198073604498','76561198075876776'])" },
			{ "SWAT", {"cop"}, {
                "textures\Fahrzeug_Skins\Cops\SwatSUV.paa"
            }, "license_cop_swat || license_cop_swatazubi || license_cop_swatcmd" },
			{ "Its Magic", {"Magic","admin1"}, {
                "textures\Fahrzeug_Skins\persoenlich\SUVMagic.paa"
            }, "((getPlayerUID player) isEqualTo '76561198142832140')" }
        };
    };
	
	class C_Offroad_02_unarmed_F {
        vItemSpace = 100;
        conditions = "(license_civ_driver || (!(playerSide isEqualTo civilian))) && (395180 in (getDLCs 1))";
        price = 45000;
		medprice = -1;
		copprice = 20000;
		garageprice= 450;
		repaintprice=3000;
		storeLiquid= 0;
		gatherWeight = -1; 
		insurance=-1;
		textures[] = {
            { "Black", {"civ","donator1","admin1"}, {
                "a3\soft_f_exp\offroad_02\data\offroad_02_ext_black_co.paa"
				,"a3\soft_f_exp\offroad_02\data\offroad_02_ext_black_co.paa"
				,"a3\soft_f_exp\offroad_02\data\offroad_02_int_black_co.paa"
				,"a3\soft_f_exp\offroad_02\data\offroad_02_int_black_co.paa"
            },"(!(playerSide in [west,independent]))" },
            { "Blue", {"civ","donator1","admin1"}, {
                "a3\soft_f_exp\offroad_02\data\offroad_02_ext_blue_co.paa"
				,"a3\soft_f_exp\offroad_02\data\offroad_02_ext_blue_co.paa"
				,"a3\soft_f_exp\offroad_02\data\offroad_02_int_blue_co.paa"
				,"a3\soft_f_exp\offroad_02\data\offroad_02_int_blue_co.paa"
            },"(!(playerSide in [west,independent]))" },
            { "Green", {"civ","donator1","admin1"}, {
                "a3\soft_f_exp\offroad_02\data\offroad_02_ext_green_co.paa"
				,"a3\soft_f_exp\offroad_02\data\offroad_02_ext_green_co.paa"
				,"a3\soft_f_exp\offroad_02\data\offroad_02_int_green_co.paa"
				,"a3\soft_f_exp\offroad_02\data\offroad_02_int_green_co.paa"
            },"(!(playerSide in [west,independent]))" },
            { "Orange", {"civ","donator1","admin1"}, {
                "a3\soft_f_exp\offroad_02\data\offroad_02_ext_orange_co.paa"
				,"a3\soft_f_exp\offroad_02\data\offroad_02_ext_orange_co.paa"
				,"a3\soft_f_exp\offroad_02\data\offroad_02_int_orange_co.paa"
				,"a3\soft_f_exp\offroad_02\data\offroad_02_int_orange_co.paa"
            },"(!(playerSide in [west,independent]))" },
            { "Red", {"civ","donator1","admin1"}, {
                "a3\soft_f_exp\offroad_02\data\offroad_02_ext_red_co.paa"
				,"a3\soft_f_exp\offroad_02\data\offroad_02_ext_red_co.paa"
				,"a3\soft_f_exp\offroad_02\data\offroad_02_int_red_co.paa"
				,"a3\soft_f_exp\offroad_02\data\offroad_02_int_red_co.paa"
            },"(!(playerSide in [west,independent]))" },
            { "White", {"civ","donator1","admin1"}, {
                "a3\soft_f_exp\offroad_02\data\offroad_02_ext_white_co.paa"
				,"a3\soft_f_exp\offroad_02\data\offroad_02_ext_white_co.paa"
				,"a3\soft_f_exp\offroad_02\data\offroad_02_int_white_co.paa"
				,"a3\soft_f_exp\offroad_02\data\offroad_02_int_white_co.paa"
            },"(!(playerSide in [west,independent]))" },
			{ "Brown", {"civ","donator1","admin1"}, {
                "a3\soft_f_exp\offroad_02\data\offroad_02_ext_brown_co.paa"
				,"a3\soft_f_exp\offroad_02\data\offroad_02_ext_brown_co.paa"
				,"a3\soft_f_exp\offroad_02\data\offroad_02_int_brown_co.paa"
				,"a3\soft_f_exp\offroad_02\data\offroad_02_int_brown_co.paa"
            },"(!(playerSide in [west,independent]))" },
			{ "Olive", {"civ","donator1","admin1"}, {
                "a3\soft_f_exp\offroad_02\data\offroad_02_ext_olive_co.paa"
				,"a3\soft_f_exp\offroad_02\data\offroad_02_ext_olive_co.paa"
				,"a3\soft_f_exp\offroad_02\data\offroad_02_int_olive_co.paa"
				,"a3\soft_f_exp\offroad_02\data\offroad_02_int_olive_co.paa"
            },"(!(playerSide in [west,independent]))" },
			{ "IDAP", {"donator1","admin1"}, {
               "\a3\Soft_F_Orange\Offroad_02\Data\offroad_02_ext_IDAP_co.paa"
			   ,"\a3\Soft_F_Orange\Offroad_02\Data\offroad_02_ext_IDAP_co.paa"
			   ,"\A3\Soft_F_Exp\Offroad_02\Data\offroad_02_int_brown_co.paa"
			   ,"\A3\Soft_F_Exp\Offroad_02\Data\offroad_02_int_brown_co.paa"
            }, "license_civ_donator1" },
			{ "Cop", {"cop"}, {
               "textures\Fahrzeug_Skins\Cops\mb4wd.paa"
            }, "(call life_coplevel >= 2)" }
        };
    };
	
	class B_CTRG_LSV_01_light_F { // Prowler light
        vItemSpace = 100;
        conditions = "(license_civ_driver || (!(playerSide isEqualTo civilian))) && (395180 in (getDLCs 1))";
        price = 150000;
		medprice = -1;
		copprice = 50000;
		garageprice = 15000;
		repaintprice = 15000;
		storeLiquid= 0;
		gatherWeight = -1; 
		insurance=-1;
		textures[] = {
            { "Black", {"civ","donator1","admin1"}, {
                "a3\soft_f_exp\lsv_01\data\nato_lsv_01_black_co.paa"
				,"a3\soft_f_exp\lsv_01\data\nato_lsv_02_black_co.paa"
				,"a3\soft_f_exp\lsv_01\data\nato_lsv_03_black_co.paa"
				,"a3\soft_f_exp\lsv_01\data\nato_lsv_adds_black_co.paa"
            },"(!(playerSide in [west,independent]))" },
			{ "Olive", {"civ","donator1","admin1"}, {
                "a3\soft_f_exp\lsv_01\data\nato_lsv_01_olive_co.paa"
				,"a3\soft_f_exp\lsv_01\data\nato_lsv_02_olive_co.paa"
				,"a3\soft_f_exp\lsv_01\data\nato_lsv_03_olive_co.paa"
				,"a3\soft_f_exp\lsv_01\data\nato_lsv_adds_olive_co.paa"
            },"(!(playerSide in [west,independent]))" },
			{ "Sand", {"civ","donator1","admin1"}, {
                "a3\soft_f_exp\lsv_01\data\nato_lsv_01_sand_co.paa"
				,"a3\soft_f_exp\lsv_01\data\nato_lsv_02_sand_co.paa"
				,"a3\soft_f_exp\lsv_01\data\nato_lsv_03_sand_co.paa"
				,"a3\soft_f_exp\lsv_01\data\nato_lsv_adds_sand_co.paa"
            },"(!(playerSide in [west,independent]))" },
			{ "Dazzle", {"civ","donator1","admin1"}, {
               "a3\soft_f_exp\lsv_01\data\nato_lsv_01_dazzle_co.paa"
			   ,"a3\soft_f_exp\lsv_01\data\nato_lsv_02_olive_co.paa"
			   ,"a3\soft_f_exp\lsv_01\data\nato_lsv_03_olive_co.paa"
			   ,"a3\soft_f_exp\lsv_01\data\nato_lsv_adds_olive_co.paa"
            }, "license_civ_donator1 || license_civ_rebel" },
			{ "umlackieren", {"admin1"}, {
                "textures\pixel.jpg"
               ,"textures\pixel.jpg"
			   ,"textures\pixel.jpg"
			   ,"textures\pixel.jpg"
            }, "license_civ_admin1" },
			{ "Black", {"cop"}, {
               "a3\soft_f_exp\lsv_01\data\nato_lsv_01_black_co.paa"
			   ,"a3\soft_f_exp\lsv_01\data\nato_lsv_02_black_co.paa"
			   ,"a3\soft_f_exp\lsv_01\data\nato_lsv_03_black_co.paa"
			   ,"a3\soft_f_exp\lsv_01\data\nato_lsv_adds_black_co.paa"
            }, "call life_coplevel > 0" }
        };
    };
	
	class B_T_LSV_01_unarmed_F : B_CTRG_LSV_01_light_F{
		copprice = 50000;
	}; // Prowler
	
		
	class O_T_LSV_02_unarmed_F { //Qilin
        vItemSpace = 100;
        conditions = "(license_civ_driver || (!(playerSide isEqualTo civilian))) && (395180 in (getDLCs 1))";
        price = 150000;
		medprice = -1;
		copprice = 50000;
		garageprice = 15000;
		repaintprice = 10000;
		storeLiquid= 0;
		gatherWeight = -1; 
		insurance=-1;
		textures[] = {
            { "Black", {"civ","donator1","admin1"}, {
                "\A3\Soft_F_Exp\LSV_02\Data\CSAT_LSV_01_black_CO.paa",
                "\A3\Soft_F_Exp\LSV_02\Data\CSAT_LSV_02_black_CO.paa",
                "\A3\Soft_F_Exp\LSV_02\Data\CSAT_LSV_03_black_CO.paa"
            },"(!(playerSide in [west,independent]))" },
            { "Green Hex", {"reb","donator1"}, {
                "\A3\Soft_F_Exp\LSV_02\Data\CSAT_LSV_01_ghex_CO.paa",
                "\A3\Soft_F_Exp\LSV_02\Data\CSAT_LSV_02_ghex_CO.paa",
                "\A3\Soft_F_Exp\LSV_02\Data\CSAT_LSV_03_ghex_CO.paa"
            }, "license_civ_rebel || license_civ_donator1" },
			{ "Arid", {"reb","donator1"}, {
                "\A3\Soft_F_Exp\LSV_02\Data\CSAT_LSV_01_arid_CO.paa",
                "\A3\Soft_F_Exp\LSV_02\Data\CSAT_LSV_02_arid_CO.paa",
                "\A3\Soft_F_Exp\LSV_02\Data\CSAT_LSV_03_arid_CO.paa"
            }, "license_civ_rebel || license_civ_donator1" },
			{ "Black", {"cop"}, {
                "\A3\Soft_F_Exp\LSV_02\Data\CSAT_LSV_01_black_CO.paa",
                "\A3\Soft_F_Exp\LSV_02\Data\CSAT_LSV_02_black_CO.paa",
                "\A3\Soft_F_Exp\LSV_02\Data\CSAT_LSV_03_black_CO.paa"
            }, "call life_coplevel > 0" },
			{ "Kartell", {"kartell"}, {
                "textures\Fahrzeug_Skins\kartell\QilinSyndikos1.paa"
				,"textures\Fahrzeug_Skins\kartell\QilinSyndikos2.paa"
				,"#(ai,64,64,1)Fresnel(1.3,7)"
            }, "license_civ_kartell" },
			{ "Private Army", {"pa","admin1"}, {
                "textures\Fahrzeug_Skins\pa\Qilin1.paa"
				,"textures\Fahrzeug_Skins\pa\Qilin2.paa"
				,"#(ai,64,64,1)Fresnel(1.3,7)"
            }, "license_civ_pa" },
			{ "SWAT", {"cop"}, {
                "textures\Fahrzeug_Skins\Cops\SwatQilin1.paa"
				,"textures\Fahrzeug_Skins\Cops\SwatQilin2.paa"
				,"#(ai,64,64,1)Fresnel(1.3,7)"
            }, "license_cop_swatazubi || license_cop_swat || license_cop_swatcmd" }
        };
    };
	
	class C_Van_01_transport_F {
        vItemSpace = 120;
        conditions = "license_civ_driver || (!(playerSide isEqualTo civilian))";
        price = 51000;
		medprice = -1;
		copprice = -1;
		garageprice = 510;
		repaintprice = 6000;
		storeLiquid= 0;
		gatherWeight = -1; 
		insurance=-1;
		textures[] = {
            { "White", {"civ","donator1","admin1"}, {
                "\a3\soft_f_gamma\Van_01\Data\van_01_ext_co.paa"
            },"(!(playerSide in [west,independent]))" },
            { "Red", {"civ","donator1","admin1"}, {
                "\a3\soft_f_gamma\Van_01\Data\van_01_ext_red_co.paa"
            },"(!(playerSide in [west,independent]))" },
			{ "Black", {"civ","donator1","admin1"}, {
                "\a3\soft_f_gamma\Van_01\Data\van_01_ext_black_co.paa"
            }, "license_civ_donator1" }
        };
    };

    class C_Van_01_box_F {
        vItemSpace = 160;
        conditions = "license_civ_driver || (!(playerSide isEqualTo civilian))";
        price = 110000;
		medprice = -1;
		copprice = -1;
		garageprice = 1100;
		repaintprice = 9000;
		storeLiquid= 0;
		gatherWeight = -1; 
		insurance=50000;
		textures[] = {
            { "White", {"civ","donator1","admin1"}, {
                "\a3\soft_f_gamma\Van_01\Data\van_01_ext_co.paa"
            },"(!(playerSide in [west,independent]))" },
            { "Red", {"civ","donator1","admin1"}, {
                "\a3\soft_f_gamma\Van_01\Data\van_01_ext_red_co.paa"
            },"(!(playerSide in [west,independent]))" },
			{ "PRS", {"med"}, {
                "textures\Fahrzeug_Skins\Medic\rtw_prs_front.paa"
				,"textures\Fahrzeug_Skins\Medic\rtw_prs_back.paa"
            }, "call life_mediclevel > 0" },
			{ "Black", {"donator1","admin1"}, {
                "\a3\soft_f_gamma\Van_01\Data\van_01_ext_black_co.paa"
            }, "license_civ_donator1" },
			{ "Doenerbude", {"donator1","admin1"}, {
                "textures\Fahrzeug_Skins\Donator\Doenerbude.paa"
				,"textures\Fahrzeug_Skins\Donator\Doenerbude2.paa"
            }, "license_civ_donator1" }
        };
    };
	class C_Van_01_fuel_F {
		vItemSpace = 250;
		conditions = "license_civ_driver || (!(playerSide isEqualTo civilian))";
		price = 200000;
		medprice = -1;
		copprice = -1;
		garageprice = 2000;
		repaintprice = 9000;
		storeLiquid= 1;
		gatherWeight = -1; 
		insurance=-1;
		textures[] = {
			{ "White", {"civ","donator1","admin1"}, {
				"\a3\soft_f_gamma\Van_01\Data\van_01_ext_co.paa"
			},"(!(playerSide in [west,independent]))" },
			{ "Red", {"civ","donator1","admin1"}, {
				"\a3\soft_f_gamma\Van_01\Data\van_01_ext_red_co.paa"
			},"(!(playerSide in [west,independent]))" },
			{ "PRS", {"med"}, {
				"textures\Fahrzeug_Skins\Medic\rtw_prs_front.paa"
				,"textures\Fahrzeug_Skins\Medic\rtw_prs_back.paa"
			}, "call life_mediclevel > 0" },
			{ "Black", {"donator1","admin1"}, {
				"\a3\soft_f_gamma\Van_01\Data\van_01_ext_black_co.paa"
			}, "license_civ_donator1" }
		};
	
	
	};
	
	class C_Van_02_transport_F {
        vItemSpace = 200;
        conditions = "license_civ_driver || (!(playerSide isEqualTo civilian))";
        price = 187000;
		medprice = -1;
		copprice = 90000;
		garageprice = 1800;
		repaintprice = 9000;
		storeLiquid= 0;
		gatherWeight = -1; 
		insurance=-1;
		textures[] = {
            { "White", {"civ","donator1","admin1"}, {
                "\a3\soft_f_orange\van_02\data\van_body_white_CO.paa"
				,"\a3\soft_f_orange\van_02\data\van_wheel_co.paa"
				,"\a3\soft_f_orange\van_02\data\van_glass_transport_ca.paa"
				,"\a3\soft_f_orange\van_02\data\van_body_white_CO.paa"
            },"(!(playerSide in [west,independent]))" },
            { "Blue", {"civ","donator1","admin1"}, {
                "\a3\soft_f_orange\van_02\data\van_body_blue_CO.paa"
				,"\a3\soft_f_orange\van_02\data\van_wheel_co.paa"
				,"\a3\soft_f_orange\van_02\data\van_glass_transport_ca.paa"
				,"\a3\soft_f_orange\van_02\data\van_body_blue_CO.paa"
            },"(!(playerSide in [west,independent]))" },
			{ "Orange", {"civ","donator1","admin1"}, {
                "\a3\soft_f_orange\van_02\data\van_body_orange_CO.paa"
				,"\a3\soft_f_orange\van_02\data\van_wheel_co.paa"
				,"\a3\soft_f_orange\van_02\data\van_glass_transport_ca.paa"
				,"\a3\soft_f_orange\van_02\data\van_body_orange_CO.paa"
            },"(!(playerSide in [west,independent]))" },
			{ "Black", {"civ","donator1","admin1","cop"}, {
                "\a3\soft_f_orange\van_02\data\van_body_black_CO.paa"
				,"\a3\soft_f_orange\van_02\data\van_wheel_co.paa"
				,"\a3\soft_f_orange\van_02\data\van_glass_transport_ca.paa"
				,"\a3\soft_f_orange\van_02\data\van_body_black_CO.paa"
            },"(!(playerSide in [independent]))" },
			{ "Green", {"civ","donator1","admin1"}, {
                "\a3\Soft_F_Orange\Van_02\Data\van_body_Green_CO.paa"
				,"\a3\soft_f_orange\van_02\data\van_wheel_co.paa"
				,"\a3\soft_f_orange\van_02\data\van_glass_utility_CA.paa"
				,"\a3\Soft_F_Orange\Van_02\Data\van_body_Green_CO.paa"
            },"(!(playerSide in [west,independent]))" },
			{ "Red", {"civ","donator1","admin1"}, {
                "\a3\Soft_F_Orange\Van_02\Data\van_body_Red_CO.paa"
				,"\a3\soft_f_orange\van_02\data\van_wheel_co.paa"
				,"\a3\soft_f_orange\van_02\data\van_glass_utility_CA.paa"
				,"\a3\Soft_F_Orange\Van_02\Data\van_body_Red_CO.paa"
            },"(!(playerSide in [west,independent]))" },
			{ "Brown", {"civ","donator1","admin1"}, {
                "\a3\Soft_F_Orange\Van_02\Data\van_body_Syndikat_CO.paa"
				,"\a3\soft_f_orange\van_02\data\van_wheel_co.paa"
				,"\a3\soft_f_orange\van_02\data\van_glass_utility_CA.paa"
				,"\a3\Soft_F_Orange\Van_02\Data\van_body_Syndikat_CO.paa"
            },"(!(playerSide in [west,independent]))" },
			{ "Daltgreen", {"donator1","admin1"}, {
                "\a3\Soft_F_Orange\Van_02\Data\van_body_Daltgreen_CO.paa"
				,"\a3\soft_f_orange\van_02\data\van_wheel_transport_co.paa"
				,"\a3\soft_f_orange\van_02\data\van_glass_transport_CA.paa"
				,"\a3\Soft_F_Orange\Van_02\Data\van_body_Daltgreen_CO.paa"
            }, "license_civ_donator1" },
			{ "AA News", {"donator1","admin1"}, {
                "\a3\Soft_F_Orange\Van_02\Data\van_body_AAN_CO.paa"
				,"\a3\soft_f_orange\van_02\data\van_wheel_transport_co.paa"
				,"\a3\soft_f_orange\van_02\data\van_glass_transport_CA.paa"
				,"\a3\Soft_F_Orange\Van_02\Data\van_body_AAN_CO.paa"
            }, "license_civ_donator1" },
			{ "Battle Bus", {"donator1","admin1"}, {
                "\a3\Soft_F_Orange\Van_02\Data\van_body_BB_CO.paa"
				,"\a3\Soft_F_Orange\Van_02\Data\van_wheel_BB_CO.paa"
				,"\a3\Soft_F_Orange\Van_02\Data\van_glass_BB_CA.paa"
				,"\a3\Soft_F_Orange\Van_02\Data\van_body_BB_CO.paa"
            }, "license_civ_donator1" },
			{ "Masked", {"donator1","admin1"}, {
                "\a3\Soft_F_Orange\Van_02\Data\van_body_Masked_CO.paa"
				,"\a3\soft_f_orange\van_02\data\van_wheel_transport_co.paa"
				,"\a3\soft_f_orange\van_02\data\van_glass_transport_CA.paa"
				,"\a3\Soft_F_Orange\Van_02\Data\van_body_Masked_CO.paa"
            }, "license_civ_donator1" },
			{ "Guerrillia 1", {"reb","donator1"}, {
                "\a3\Soft_F_Orange\Van_02\Data\van_body_FIA_01_CO.paa"
				,"\a3\soft_f_orange\van_02\data\van_wheel_co.paa"
				,"\a3\soft_f_orange\van_02\data\van_glass_utility_CA.paa"
				,"\a3\Soft_F_Orange\Van_02\Data\van_body_FIA_01_CO.paa"
            }, "(license_civ_donator1 || license_civ_rebel)" },
			{ "Guerrillia 2", {"reb","donator1"}, {
                "\a3\Soft_F_Orange\Van_02\Data\van_body_FIA_02_CO.paa"
				,"\a3\soft_f_orange\van_02\data\van_wheel_co.paa"
				,"\a3\soft_f_orange\van_02\data\van_glass_utility_CA.paa"
				,"\a3\Soft_F_Orange\Van_02\Data\van_body_FIA_02_CO.paa"
            }, "(license_civ_donator1 || license_civ_rebel)" },
			{ "Unfinished", {"reb","donator1"}, {
                "\a3\Soft_F_Orange\Van_02\Data\van_body_FIA_02_unfinished_CO.paa"
				,"\a3\Soft_F_Orange\Van_02\Data\van_wheel_CO.paa"
				,"\a3\Soft_F_Orange\Van_02\Data\van_glass_FIA_02_unfinished_CA.paa"
				,"\a3\Soft_F_Orange\Van_02\Data\van_body_FIA_02_unfinished_CO.paa"
            }, "(license_civ_donator1 || license_civ_rebel)" }
        };
    };
	
	class C_Van_02_vehicle_F {
        vItemSpace = 200;
        conditions = "license_civ_driver || (!(playerSide isEqualTo civilian))";
        price = 187000;
		medprice = -1;
		copprice = -1;
		garageprice = 1800;
		repaintprice = 25000;
		storeLiquid= 0;
		gatherWeight = -1; 
		insurance=-1;
		textures[] = {
            { "White", {"civ","donator1","admin1"}, {
                "\a3\soft_f_orange\van_02\data\van_body_white_CO.paa"
				,"\a3\soft_f_orange\van_02\data\van_wheel_co.paa"
				,"\a3\soft_f_orange\van_02\data\van_glass_transport_ca.paa"
				,"\a3\soft_f_orange\van_02\data\van_body_white_CO.paa"
            },"(!(playerSide in [west,independent]))" },
            { "Blue", {"civ","donator1","admin1"}, {
                "\a3\soft_f_orange\van_02\data\van_body_blue_CO.paa"
				,"\a3\soft_f_orange\van_02\data\van_wheel_co.paa"
				,"\a3\soft_f_orange\van_02\data\van_glass_transport_ca.paa"
				,"\a3\soft_f_orange\van_02\data\van_body_blue_CO.paa"
            },"(!(playerSide in [west,independent]))" },
			{ "Orange", {"civ","donator1","admin1"}, {
                "\a3\soft_f_orange\van_02\data\van_body_orange_CO.paa"
				,"\a3\soft_f_orange\van_02\data\van_wheel_co.paa"
				,"\a3\soft_f_orange\van_02\data\van_glass_transport_ca.paa"
				,"\a3\soft_f_orange\van_02\data\van_body_orange_CO.paa"
            },"(!(playerSide in [west,independent]))" },
			{ "Black", {"civ","donator1","admin1"}, {
                "\a3\soft_f_orange\van_02\data\van_body_black_CO.paa"
				,"\a3\soft_f_orange\van_02\data\van_wheel_co.paa"
				,"\a3\soft_f_orange\van_02\data\van_glass_transport_ca.paa"
				,"\a3\soft_f_orange\van_02\data\van_body_black_CO.paa"
            },"(!(playerSide in [west,independent]))" },
			{ "Green", {"civ","donator1","admin1"}, {
                "\a3\Soft_F_Orange\Van_02\Data\van_body_Green_CO.paa"
				,"\a3\soft_f_orange\van_02\data\van_wheel_co.paa"
				,"\a3\soft_f_orange\van_02\data\van_glass_utility_CA.paa"
				,"\a3\Soft_F_Orange\Van_02\Data\van_body_Green_CO.paa"
            },"(!(playerSide in [west,independent]))" },
			{ "Red", {"civ","donator1","admin1"}, {
                "\a3\Soft_F_Orange\Van_02\Data\van_body_Red_CO.paa"
				,"\a3\soft_f_orange\van_02\data\van_wheel_co.paa"
				,"\a3\soft_f_orange\van_02\data\van_glass_utility_CA.paa"
				,"\a3\Soft_F_Orange\Van_02\Data\van_body_Red_CO.paa"
            },"(!(playerSide in [west,independent]))" },
			{ "Brown", {"civ","donator1","admin1"}, {
                "\a3\Soft_F_Orange\Van_02\Data\van_body_Syndikat_CO.paa"
				,"\a3\soft_f_orange\van_02\data\van_wheel_co.paa"
				,"\a3\soft_f_orange\van_02\data\van_glass_utility_CA.paa"
				,"\a3\Soft_F_Orange\Van_02\Data\van_body_Syndikat_CO.paa"
            },"(!(playerSide in [west,independent]))" },
			{ "Bluepearl", {"donator1","admin1"}, {
                "\a3\Soft_F_Orange\Van_02\Data\van_body_BluePearl_CO.paa"
				,"\a3\soft_f_orange\van_02\data\van_wheel_co.paa"
				,"\a3\soft_f_orange\van_02\data\van_glass_utility_CA.paa"
				,"\a3\Soft_F_Orange\Van_02\Data\van_body_BluePearl_CO.paa"
            }, "license_civ_donator1" },
			{ "Daltgreen", {"donator1","admin1"}, {
                "\a3\Soft_F_Orange\Van_02\Data\van_body_Daltgreen_CO.paa"
				,"\a3\soft_f_orange\van_02\data\van_wheel_transport_co.paa"
				,"\a3\soft_f_orange\van_02\data\van_glass_transport_CA.paa"
				,"\a3\Soft_F_Orange\Van_02\Data\van_body_Daltgreen_CO.paa"
            }, "license_civ_donator1" },
			{ "AA News", {"donator1","admin1"}, {
                "\a3\Soft_F_Orange\Van_02\Data\van_body_AAN_CO.paa"
				,"\a3\soft_f_orange\van_02\data\van_wheel_transport_co.paa"
				,"\a3\soft_f_orange\van_02\data\van_glass_transport_CA.paa"
				,"\a3\Soft_F_Orange\Van_02\Data\van_body_AAN_CO.paa"
            }, "license_civ_donator1" },
			{ "Battle Bus", {"donator1","admin1"}, {
                "\a3\Soft_F_Orange\Van_02\Data\van_body_BB_CO.paa"
				,"\a3\Soft_F_Orange\Van_02\Data\van_wheel_BB_CO.paa"
				,"\a3\Soft_F_Orange\Van_02\Data\van_glass_BB_CA.paa"
				,"\a3\Soft_F_Orange\Van_02\Data\van_body_BB_CO.paa"
            }, "license_civ_donator1" },
			{ "Masked", {"donator1","admin1"}, {
                "\a3\Soft_F_Orange\Van_02\Data\van_body_Masked_CO.paa"
				,"\a3\soft_f_orange\van_02\data\van_wheel_transport_co.paa"
				,"\a3\soft_f_orange\van_02\data\van_glass_transport_CA.paa"
				,"\a3\Soft_F_Orange\Van_02\Data\van_body_Masked_CO.paa"
            }, "license_civ_donator1" },
			{ "Redstone", {"donator1","admin1"}, {
               "\a3\Soft_F_Orange\Van_02\Data\van_body_Redstone_CO.paa"
			   ,"\a3\Soft_F_Orange\Van_02\Data\van_wheel_Redstone_CO.paa"
			   ,"\a3\soft_f_orange\van_02\data\van_glass_utility_CA.paa"
			   ,"\a3\Soft_F_Orange\Van_02\Data\van_body_Redstone_CO.paa"
            }, "license_civ_donator1" },
			{ "Swif Delivery", {"donator1","admin1"}, {
               "\a3\Soft_F_Orange\Van_02\Data\van_body_armazon_CO.paa"
			   ,"\a3\soft_f_orange\van_02\data\van_wheel_co.paa"
			   ,"\a3\soft_f_orange\van_02\data\van_glass_utility_CA.paa"
			   ,"\a3\Soft_F_Orange\Van_02\Data\van_body_armazon_CO.paa"
            }, "license_civ_donator1" },
			{ "Fuel", {"donator1","admin1"}, {
              "\a3\Soft_F_Orange\Van_02\Data\van_body_Fuel_CO.paa"
			  ,"\a3\soft_f_orange\van_02\data\van_wheel_co.paa"
			  ,"\a3\soft_f_orange\van_02\data\van_glass_utility_CA.paa"
			  ,"\a3\Soft_F_Orange\Van_02\Data\van_body_Fuel_CO.paa"
            }, "license_civ_donator1" },
			{ "Vrana", {"donator1","admin1"}, {
              "\a3\Soft_F_Orange\Van_02\Data\van_body_Vrana_CO.paa"
			  ,"\a3\soft_f_orange\van_02\data\van_wheel_co.paa"
			  ,"\a3\soft_f_orange\van_02\data\van_glass_utility_CA.paa"
			  ,"\a3\Soft_F_Orange\Van_02\Data\van_body_Vrana_CO.paa"
            }, "license_civ_donator1" },
			{ "Guerrillia 1", {"reb","donator1"}, {
                "\a3\Soft_F_Orange\Van_02\Data\van_body_FIA_01_CO.paa"
				,"\a3\soft_f_orange\van_02\data\van_wheel_co.paa"
				,"\a3\soft_f_orange\van_02\data\van_glass_utility_CA.paa"
				,"\a3\Soft_F_Orange\Van_02\Data\van_body_FIA_01_CO.paa"
            }, "license_civ_donator1 || license_civ_rebel" },
			{ "Guerrillia 2", {"reb","donator1"}, {
                "\a3\Soft_F_Orange\Van_02\Data\van_body_FIA_02_CO.paa"
				,"\a3\soft_f_orange\van_02\data\van_wheel_co.paa"
				,"\a3\soft_f_orange\van_02\data\van_glass_utility_CA.paa"
				,"\a3\Soft_F_Orange\Van_02\Data\van_body_FIA_02_CO.paa"
            }, "license_civ_donator1 || license_civ_rebel" },
			{ "Unfinished", {"reb","donator1"}, {
                "\a3\Soft_F_Orange\Van_02\Data\van_body_FIA_02_unfinished_CO.paa"
				,"\a3\Soft_F_Orange\Van_02\Data\van_wheel_CO.paa"
				,"\a3\Soft_F_Orange\Van_02\Data\van_glass_FIA_02_unfinished_CA.paa"
				,"\a3\Soft_F_Orange\Van_02\Data\van_body_FIA_02_unfinished_CO.paa"
            }, "license_civ_donator1 || license_civ_rebel" }
        };
    };
	
	//PRS Van
			
	class C_Van_02_medevac_F {
        vItemSpace = 200;
        conditions = "";
        price = -1;
		medprice = 25000;
		copprice = -1;
		garageprice = 1500;
		repaintprice = 25000;
		storeLiquid= 0;
		gatherWeight = -1; 
		insurance=-1;
		textures[] = {
            { "PRS", {"med"}, {
                "A3\Soft_F_Orange\Van_02\Data\van_body_CivAmbulance_CO.paa"
				,"a3\Soft_F_Orange\Van_02\Data\van_wheel_Red_CO.paa"
				,"a3\soft_f_orange\van_02\data\van_glass_CivAmbulance_CA.paa"
				,"a3\soft_f_orange\van_02\data\van_ambulance_monitors_co.paa"
				,"A3\Soft_F_Orange\Van_02\Data\van_body_CivAmbulance_CO.paa"
            }, "call life_mediclevel > 0" }
		};
	};
	class C_Van_02_service_F {
        vItemSpace = 250;
        conditions = "";
        price = -1;
		medprice = 25000;
		copprice = -1;
		garageprice = 1500;
		repaintprice = 25000;
		storeLiquid= 0;
		gatherWeight = -1; 
		insurance=-1;
		textures[] = {
            { "PRS", {"med"}, {
                "\a3\Soft_F_Orange\Van_02\Data\van_body_CivService_CO.paa"
				,"\a3\Soft_F_Orange\Van_02\Data\van_wheel_dirty_CO.paa"
				,"\a3\Soft_F_Orange\Van_02\Data\van_glass_CivService_CA.paa"
				,"\a3\Soft_F_Orange\Van_02\Data\van_body_CivService_CO.paa"
            }, "call life_mediclevel > 0" }
		};
	};
	
	//LKWs und gepanzerte Fahrzeuge
	
	class I_Truck_02_transport_F {
        vItemSpace = 300;
        conditions = "license_civ_truck || (!(playerSide isEqualTo civilian))";
        price = 288000;
		medprice = 25000;
		copprice = -1;
		garageprice = 15000;
		repaintprice = 25000;
		storeLiquid= 0;
		gatherWeight = -1; 
		insurance=-1;
		textures[] = {
            { "Orange", {"civ","donator1","admin1"}, {
                "\A3\Soft_F_Beta\Truck_02\data\truck_02_kab_co.paa",
                "\a3\soft_f_beta\Truck_02\data\truck_02_kuz_co.paa"
            },"(!(playerSide in [west,independent]))" },
            { "Blue", {"civ,donator1"}, {
                "\a3\soft_f_beta\Truck_02\data\truck_02_kab_blue_CO.paa"
				,"\a3\soft_f_beta\Truck_02\data\truck_02_kuz_co.paa"
				,"\a3\soft_f_beta\truck_02\data\truck_02_int_co.paa"
            },"(!(playerSide in [west,independent]))" },
			{ "IDAP", {"civ,donator1"}, {
                "\A3\soft_f_orange\Truck_02\Data\Truck_02_kab_IDAP_co.paa"
				,"\A3\soft_f_orange\Truck_02\Data\Truck_02_kuz_IDAP_co.paa"
				,"\A3\soft_f_orange\Truck_02\Data\Truck_02_int_IDAP_co.paa"
            },"(!(playerSide in [west,independent]))" }
        };
    };
	
	class I_Truck_02_covered_F {
        vItemSpace = 340;
        conditions = "license_civ_truck || (!(playerSide isEqualTo civilian))";
        price = 524000;
		medprice = -1;
		copprice = 150000;
		garageprice = 5200;
		repaintprice = 30000;
		storeLiquid= 0;
		gatherWeight = -1; 
		insurance=-1;
		textures[] = {
            { "Orange", {"civ","donator1","admin1"}, {
                "\A3\Soft_F_Beta\Truck_02\data\truck_02_kab_co.paa",
                "\a3\soft_f_beta\Truck_02\data\truck_02_kuz_co.paa"
            },"(!(playerSide in [west,independent]))" },
			{ "Berliner Kindl", {"civ","donator1","admin1"}, {
                "textures\Fahrzeug_Skins\CIV\zamak_kindl1.paa"
				,"textures\Fahrzeug_Skins\CIV\zamak_kindl2.paa"
            },"(!(playerSide in [west,independent]))" },
			{ "Orange", {"cop"}, {
                "\A3\Soft_F_Beta\Truck_02\data\truck_02_kab_co.paa",
                "\a3\soft_f_beta\Truck_02\data\truck_02_kuz_co.paa"
            }, "call life_coplevel > 0" },
			{ "Blue", {"donator1","admin1"}, {
                "\a3\soft_f_beta\Truck_02\data\truck_02_kab_blue_co.paa"
				,"\a3\soft_f_beta\Truck_02\data\truck_02_kuz_co.paa"
				,"\a3\soft_f_beta\truck_02\data\truck_02_int_co.paa"
            }, "license_civ_donator1" },
			{ "IDAP", {"donator1","admin1"}, {
                "\A3\soft_f_orange\Truck_02\Data\Truck_02_kab_IDAP_co.paa"
				,"\A3\soft_f_orange\Truck_02\Data\Truck_02_kuz_IDAP_co.paa"
				,"\A3\soft_f_orange\Truck_02\Data\Truck_02_int_IDAP_co.paa"
            }, "license_civ_donator1" }
        };
    };
	
    class I_Truck_02_fuel_F {
        vItemSpace = 450;
        conditions = "license_civ_truck || (!(playerSide isEqualTo civilian))";
        price = 1200000;
		medprice = -1;
		copprice = -1;
		garageprice = 12000;
		repaintprice = 28500;
        storeLiquid= 1;
		gatherWeight = -1; 
		insurance=350000;
		textures[] = {
			{ "Orange", {"civ","donator1","admin1"}, {
                "\A3\Soft_F_Beta\Truck_02\data\truck_02_kab_co.paa",
                "\a3\soft_f_beta\Truck_02\data\truck_02_fuel_co.paa"
            },"(!(playerSide in [west,independent]))" },
			{ "OPFOR", {"reb","donator1","admin1"}, {
                "\A3\soft_f_beta\Truck_02\Data\Truck_02_kab_opfor_co.paa"
				,"\A3\soft_f_beta\Truck_02\Data\Truck_02_fuel_OPFOR_co.paa"
            }, "license_civ_rebel || license_civ_donator1" },
			{ "Indepentent", {"reb","donator1","admin1"}, {
                "\A3\soft_f_beta\Truck_02\Data\Truck_02_kab_indp_co.paa"
				,"\A3\soft_f_beta\Truck_02\Data\Truck_02_fuel_indp_co.paa"
            }, "license_civ_rebel || license_civ_donator1" }
		};
    };
	
	class B_Truck_01_transport_F {
        vItemSpace = 400;
        conditions = "license_civ_truck || (!(playerSide isEqualTo civilian))";
        price = 716000;
		medprice = -1;
		copprice = -1;
		garageprice = 7600;
		repaintprice = 52500;
		storeLiquid= 0;
		gatherWeight = -1; 
		insurance=200000;
		textures[] = {
			{ "Olive", {"civ","donator1","admin1"}, {
                "\a3\soft_f_beta\Truck_01\data\truck_01_ext_01_co.paa"
				,"\a3\soft_f_beta\Truck_01\data\truck_01_ext_02_co.paa"
            },"(!(playerSide in [west,independent]))" },
			{ "Grass", {"civ","donator1","admin1"}, {
                "textures\Fahrzeug_Skins\Donator\Hemet_grass_a.paa"
				,"textures\Fahrzeug_Skins\Donator\Hemet_grass_b.paa"
            }, "license_civ_donator1" },
			{ "ZickZack", {"civ","donator1","admin1"}, {
               "textures\Fahrzeug_Skins\Donator\Hemett_zik_zaka.paa"
			   ,"textures\Fahrzeug_Skins\Donator\Hemet_zik_zakb.paa"
            }, "license_civ_donator1" },
			{ "Cop", {"cop"}, {
               "textures\Fahrzeug_Skins\Cops\h-vorne.paa"
			   ,"textures\Fahrzeug_Skins\Cops\h-hinten.paa"
            },"call life_coplevel >=2" },
			{ "Undercover", {"cop"}, {
               "\a3\soft_f_beta\Truck_01\data\truck_01_ext_01_co.paa"
			   ,"\a3\soft_f_beta\Truck_01\data\truck_01_ext_02_co.paa"
            }, "call life_coplevel >=4" },
			{ "PRS", {"med"}, {
               "textures\Fahrzeug_Skins\Medic\hmmt_prs_front.paa"
			   ,"textures\Fahrzeug_Skins\Medic\hmmt_prs_eng.paa"
            }, "call life_mediclevel > 0" }
		};
    };

	class B_Truck_01_box_F : B_Truck_01_transport_F {
		vItemSpace = 1000;
		price = 8596000;
		medprice = -1;
		copprice = 90000;
		garageprice = 85960;
		repaintprice = 210000;	
		insurance=-1;
	};
	
	class B_Truck_01_ammo_F : B_Truck_01_transport_F {
		vItemSpace = 870;
		price = 4935000;
		medprice = -1;
		copprice = -1;
		garageprice = 49350;
		repaintprice = 225000;
		insurance=2000000;
	};
	class B_Truck_01_fuel_F : B_Truck_01_transport_F {
		vItemSpace = 950;
		price = 7000000;
		medprice = -1;
		copprice = -1;
		garageprice = 30000;
		repaintprice = 550000;
		storeLiquid = true;
		insurance=-1;
	};
	class B_Truck_01_covered_F : B_Truck_01_transport_F {
		vItemSpace = 540;
		price = 1917000;
		medprice = 100000;
		copprice = 100000;
		garageprice = 19170;
		repaintprice = 550000;
		insurance=-1;
		
	};
	class O_Truck_03_covered_F {
        vItemSpace = 640;
        conditions = "license_civ_truck || (!(playerSide isEqualTo civilian))";
        price = 2418000;
		medprice = -1;
		copprice = -1;
		garageprice = 22180;
		repaintprice = 52500;
		storeLiquid= 0;
		gatherWeight = -1; 
		insurance=-1;
		textures[] = {
			{ "Brown Hex", {"civ","donator1","admin1"}, {
                "\a3\soft_f_epc\Truck_03\data\truck_03_ext01_co.paa"
				,"\a3\soft_f_epc\Truck_03\data\truck_03_ext02_co.paa"
				,"\A3\Soft_F_EPC\Truck_03\Data\Truck_03_cargo_CO.paa"
				,"\A3\Soft_F_EPC\Truck_03\Data\Truck_03_cover_CO.paa"
            },"(!(playerSide in [west,independent]))" },
			{ "Green Hex", {"donator1","admin1"}, {
                "\A3\Soft_F_Exp\Truck_03\Data\Truck_03_ext01_ghex_CO.paa"
				,"\A3\Soft_F_Exp\Truck_03\Data\Truck_03_ext02_ghex_CO.paa"
				,"\A3\Soft_F_Exp\Truck_03\Data\Truck_03_cargo_ghex_CO.paa"
				,"\A3\Soft_F_Exp\Truck_03\Data\Truck_03_cover_ghex_CO.paa"
            }, "license_civ_donator1" },
			{ "Grenzgänger", {"donator1","admin1"}, {
               "textures\Fahrzeug_Skins\Donator\gerat1.paa"
			   ,"textures\Fahrzeug_Skins\Donator\gerat2.paa"
			   ,"#(ai,64,64,1)Fresnel(1.3,7)"
			   ,"#(ai,64,64,1)Fresnel(1.3,7)"
            }, "license_civ_donator1" },
			{ "LoP Spezial", {"donator1","admin1"}, {
               "#(ai,64,64,1)Fresnel(1.3,7)"
			   ,"textures\Fahrzeug_Skins\Donator\muni2.paa"
			   ,"#(ai,64,64,1)Fresnel(1.3,7)"
			   ,"#(argb,8,8,3)color(0,0.18,0.32,1)"
            }, "license_civ_donator1" },
			{ "LoP Orange", {"donator1","admin1"}, {
               "#(ai,64,64,1)Fresnel(1.3,7)"
			   ,"textures\Fahrzeug_Skins\Donator\muni2.paa"
			   ,"#(ai,64,64,1)Fresnel(1.3,7)"
			   ,"#(argb,8,8,3)color(0.94,0.23,0,1)"
            }, "license_civ_donator1" },
			{ "LoP Rot", {"donator1","admin1"}, {
               "#(ai,64,64,1)Fresnel(1.3,7)"
			   ,"textures\Fahrzeug_Skins\Donator\muni2.paa"
			   ,"#(ai,64,64,1)Fresnel(1.3,7)"
			   ,"#(argb,8,8,3)color(0.9,0.02,0,1)"
            }, "license_civ_donator1" },
			{ "LoP Gelb", {"donator1","admin1"}, {
               "#(ai,64,64,1)Fresnel(1.3,7)"
			   ,"textures\Fahrzeug_Skins\Donator\muni2.paa"
			   ,"#(ai,64,64,1)Fresnel(1.3,7)"
			   ,"#(argb,8,8,3)color(0.99,0.88,0.01,1)"
            }, "license_civ_donator1" },
			{ "LoP Blau", {"donator1","admin1"}, {
               "#(ai,64,64,1)Fresnel(1.3,7)"
			   ,"textures\Fahrzeug_Skins\Donator\muni2.paa"
			   ,"#(ai,64,64,1)Fresnel(1.3,7)"
			   ,"#(argb,8,8,3)color(0.01,0.07,0.64,1)"
            }, "license_civ_donator1" },
			{ "LoP Black", {"donator1","admin1"}, {
               "#(ai,64,64,1)Fresnel(1.3,7)"
			   ,"textures\Fahrzeug_Skins\Donator\muni2.paa"
			   ,"#(ai,64,64,1)Fresnel(1.3,7)"
			   ,"#(ai,64,64,1)Fresnel(1.3,7)"
            }, "license_civ_donator1" }
		};
    };
	class O_Truck_03_transport_F {
        vItemSpace = 460;
        conditions = "license_civ_truck || (!(playerSide isEqualTo civilian))";
        price = 1500000;
		medprice = -1;
		copprice = -1;
		garageprice = 15000;
		repaintprice = 52500;
				storeLiquid= 0;
		gatherWeight = -1; 
		insurance=-1;
		textures[] = {
			{ "Brown Hex", {"civ","donator1","admin1"}, {
                "\A3\Soft_F_EPC\Truck_03\Data\Truck_03_ext01_CO.paa"
				,"\A3\Soft_F_EPC\Truck_03\Data\Truck_03_ext02_CO.paa"
				,"\A3\Soft_F_EPC\Truck_03\Data\Truck_03_cargo_CO.paa"
            },"(!(playerSide in [west,independent]))" },
			{ "Green Hex", {"donator1","admin1"}, {
                "\A3\Soft_F_Exp\Truck_03\Data\Truck_03_ext01_ghex_CO.paa"
				,"\A3\Soft_F_Exp\Truck_03\Data\Truck_03_ext02_ghex_CO.paa"
				,"\A3\Soft_F_Exp\Truck_03\Data\Truck_03_cargo_ghex_CO.paa"
            }, "license_civ_donator1" },
			{ "Grenzgänger", {"donator1","admin1"}, {
               "textures\Fahrzeug_Skins\Donator\gerat1.paa"
			   ,"textures\Fahrzeug_Skins\Donator\gerat2.paa"
			   ,"#(ai,64,64,1)Fresnel(1.3,7)"
            }, "license_civ_donator1" }
		};
    };
	
	class O_Truck_03_repair_F {
        vItemSpace = 750;
        conditions = "license_civ_truck || (!(playerSide isEqualTo civilian))";
        price = 3111000;
		medprice = -1;
		copprice = -1;
		garageprice = 31110;
		repaintprice = 52500;
				storeLiquid= 0;
		gatherWeight = -1; 
		insurance=-1;
		textures[] = {
			{ "Brown Hex", {"civ","donator1","admin1"}, {
                "\A3\Soft_F_EPC\Truck_03\Data\Truck_03_ext01_CO.paa"
				,"\A3\Soft_F_EPC\Truck_03\Data\Truck_03_ext02_CO.paa"
				,"\A3\Soft_F_EPC\Truck_03\Data\Truck_03_ammo_CO.paa"
            },"(!(playerSide in [west,independent]))" },
			{ "Green Hex", {"donator1","admin1"}, {
               "\A3\Soft_F_Exp\Truck_03\Data\Truck_03_ext01_ghex_CO.paa"
			   ,"\A3\Soft_F_Exp\Truck_03\Data\Truck_03_ext02_ghex_CO.paa"
			   ,"\A3\Soft_F_Exp\Truck_03\Data\Truck_03_ammo_ghex_CO.paa"
            }, "license_civ_donator1" },
			{ "Grenzgänger", {"donator1","admin1"}, {
               "textures\Fahrzeug_Skins\Donator\gerat1.paa"
			   ,"textures\Fahrzeug_Skins\Donator\gerat2.paa"
			   ,"#(ai,64,64,1)Fresnel(1.3,7)"
            }, "license_civ_donator1" },
			{ "LoP Spezial", {"donator1","admin1"}, {
               "#(ai,64,64,1)Fresnel(1.3,7)"
			   ,"textures\Fahrzeug_Skins\Donator\muni2.paa"
			   ,"#(ai,64,64,1)Fresnel(1.3,7)"
            }, "license_civ_donator1" },
			{ "LoP Blau", {"donator1","admin1"}, {
               "#(ai,64,64,1)Fresnel(1.3,7)"
			   ,"textures\Fahrzeug_Skins\Donator\muni2.paa"
			   ,"#(argb,8,8,3)color(0,0.18,0.32,1)"
            }, "license_civ_donator1" },
			{ "LoP Orange", {"donator1","admin1"}, {
               "#(ai,64,64,1)Fresnel(1.3,7)"
			   ,"textures\Fahrzeug_Skins\Donator\muni2.paa"
			   ,"#(argb,8,8,3)color(0.94,0.23,0,1)"
            }, "license_civ_donator1" },
			{ "LoP Rot", {"donator1","admin1"}, {
               "#(ai,64,64,1)Fresnel(1.3,7)"
			   ,"textures\Fahrzeug_Skins\Donator\muni2.paa"
			   ,"#(argb,8,8,3)color(0.9,0.02,0,1)"
            }, "license_civ_donator1" },
			{ "LoP Gelb", {"donator1","admin1"}, {
               "#(ai,64,64,1)Fresnel(1.3,7)"
			   ,"textures\Fahrzeug_Skins\Donator\muni2.paa"
			   ,"#(argb,8,8,3)color(0.99,0.88,0.01,1)"
            }, "license_civ_donator1" },
			{ "LoP Blau 2", {"donator1","admin1"}, {
               "#(ai,64,64,1)Fresnel(1.3,7)"
			   ,"textures\Fahrzeug_Skins\Donator\muni2.paa"
			   ,"#(argb,8,8,3)color(0.01,0.07,0.64,1)"
            }, "license_civ_donator1" },
			{ "LoP Black", {"donator1","admin1"}, {
               "#(ai,64,64,1)Fresnel(1.3,7)"
			   ,"textures\Fahrzeug_Skins\Donator\muni2.paa"
			   ,"#(ai,64,64,1)Fresnel(1.3,7)"
            }, "license_civ_donator1" }
		};
    };
	
	class O_Truck_03_fuel_F {
       vItemSpace = 1150;
        conditions = "license_civ_truck || (!(playerSide isEqualTo civilian))";
        price = 40000000;
		medprice = -1;
		copprice = -1;
		garageprice = 100000;
		repaintprice = 1000000;
		storeLiquid= 1;
		gatherWeight = 60; 
		insurance=5000000;
		Text = "STR_Gather_Fill_Vehicle";
		textures[] = {
			{ "Brown Hex", {"civ","donator1","admin1"}, {
                "\A3\Soft_F_EPC\Truck_03\Data\Truck_03_ext01_CO.paa"
				,"\A3\Soft_F_EPC\Truck_03\Data\Truck_03_ext02_CO.paa"
				,"\A3\Soft_F_EPC\Truck_03\Data\Truck_03_fuel_CO.paa"
            },"(!(playerSide in [west,independent]))" },
			{ "Green Hex", {"donator1","admin1"}, {
               "\A3\Soft_F_Exp\Truck_03\Data\Truck_03_ext01_ghex_CO.paa"
			   ,"\A3\Soft_F_Exp\Truck_03\Data\Truck_03_ext02_ghex_CO.paa"
			   ,"\A3\Soft_F_Exp\Truck_03\Data\Truck_03_fuel_ghex_CO.paa"
            }, "license_civ_donator1" },
			{ "Grenzgänger", {"donator1","admin1"}, {
               "textures\Fahrzeug_Skins\Donator\gerat1.paa"
			   ,"textures\Fahrzeug_Skins\Donator\gerat2.paa"
			   ,"#(ai,64,64,1)Fresnel(1.3,7)"
            }, "license_civ_donator1" },
			{ "LoP Spezial", {"donator1","admin1"}, {
               "#(ai,64,64,1)Fresnel(1.3,7)"
			   ,"textures\Fahrzeug_Skins\Donator\muni2.paa"
			   ,"#(argb,8,8,3)color(0,0.18,0.32,1)"
            }, "license_civ_donator1" },
			{ "LoP Orange", {"donator1","admin1"}, {
               "#(ai,64,64,1)Fresnel(1.3,7)"
			   ,"textures\Fahrzeug_Skins\Donator\muni2.paa"
			   ,"#(argb,8,8,3)color(0.94,0.23,0,1)"
            }, "license_civ_donator1" },
			{ "LoP Rot", {"donator1","admin1"}, {
               "#(ai,64,64,1)Fresnel(1.3,7)"
			   ,"textures\Fahrzeug_Skins\Donator\muni2.paa"
			   ,"#(argb,8,8,3)color(0.9,0.02,0,1)"
            }, "license_civ_donator1" },
			{ "LoP Gelb", {"donator1","admin1"}, {
               "#(ai,64,64,1)Fresnel(1.3,7)"
			   ,"textures\Fahrzeug_Skins\Donator\muni2.paa"
			   ,"#(argb,8,8,3)color(0.99,0.88,0.01,1)"
            }, "license_civ_donator1" },
			{ "LoP Blau", {"donator1","admin1"}, {
               "#(ai,64,64,1)Fresnel(1.3,7)"
			   ,"textures\Fahrzeug_Skins\Donator\muni2.paa"
			   ,"#(argb,8,8,3)color(0.01,0.07,0.64,1)"
            }, "license_civ_donator1" },
			{ "LoP Black", {"donator1","admin1"}, {
               "#(ai,64,64,1)Fresnel(1.3,7)"
			   ,"textures\Fahrzeug_Skins\Donator\muni2.paa"
			   ,"#(ai,64,64,1)Fresnel(1.3,7)"
            }, "license_civ_donator1" }
		};
    };

    class O_Truck_03_device_F {
        vItemSpace = 1200;
        conditions = "license_civ_truck || (!(playerSide isEqualTo civilian))";
        price = 50000000;
		medprice = -1;
		copprice = -1;
		garageprice = 100000;
		repaintprice = 1000000;
		storeLiquid= 0;
		gatherWeight = 60; 
		Text = "STR_Gather_Load_Vehicle";
		insurance = 5000000;
		textures[] = {
			{ "Brown Hex", {"civ","donator1","admin1"}, {
                "\a3\soft_f_epc\Truck_03\data\truck_03_ext01_co.paa"
				,"\A3\Soft_F_EPC\Truck_03\Data\Truck_03_ext02_CO.paa"
				,"\A3\Soft_F_EPC\Truck_03\Data\Truck_03_cargo_CO.paa"
				,"\A3\Structures_F_EPC\Items\Electronics\Data\The_Device_02_CO.paa"
				,"\A3\Structures_F_EPC\Items\Electronics\Data\The_Device_03_CO.paa"
            },"(!(playerSide in [west,independent]))" },
			{ "Grenzgänger", {"donator1","admin1"}, {
				"textures\Fahrzeug_Skins\Donator\gerat1.paa"
				,"textures\Fahrzeug_Skins\Donator\gerat2.paa"
				,"#(ai,64,64,1)Fresnel(1.3,7)"
				,"\A3\Structures_F_EPC\Items\Electronics\Data\The_Device_02_CO.paa"
				,"\A3\Structures_F_EPC\Items\Electronics\Data\The_Device_03_CO.paa"
            }, "license_civ_donator1" },
			{ "Green Hex", {"donator1","admin1"}, {
				"\A3\Soft_F_Exp\Truck_03\Data\Truck_03_ext01_ghex_CO.paa"
				,"\A3\Soft_F_Exp\Truck_03\Data\Truck_03_ext02_ghex_CO.paa"
				,"\A3\Soft_F_Exp\Truck_03\Data\Truck_03_cargo_ghex_CO.paa"
				,"\A3\Structures_F_EPC\Items\Electronics\Data\The_Device_02_CO.paa"
				,"\A3\Structures_F_EPC\Items\Electronics\Data\The_Device_03_CO.paa"
            }, "license_civ_donator1" },
			{ "Dithmarscher", {"dm","admin1"}, {
               "textures\Fahrzeug_Skins\dm\geraet1.paa"
				,"textures\Fahrzeug_Skins\dm\geraet2.paa"
				,"#(ai,64,64,1)Fresnel(1.3,7)"
				,"\A3\Structures_F_EPC\Items\Electronics\Data\The_Device_02_CO.paa"
				,"\A3\Structures_F_EPC\Items\Electronics\Data\The_Device_03_CO.paa"
            }, "license_civ_dm" },
			{ "LoP Blau", {"donator1","admin1"}, {
               "#(ai,64,64,1)Fresnel(1.3,7)"
			   ,"textures\Fahrzeug_Skins\Donator\muni2.paa"
			   ,"#(ai,64,64,1)Fresnel(1.3,7)"
			   ,"#(argb,8,8,3)color(0,0.18,0.32,1)"
			   ,"#(ai,64,64,1)Fresnel(1.3,7)"
            }, "license_civ_donator1" },
			{ "LoP Orange", {"donator1","admin1"}, {
               "#(ai,64,64,1)Fresnel(1.3,7)"
			   ,"textures\Fahrzeug_Skins\Donator\muni2.paa"
			   ,"#(ai,64,64,1)Fresnel(1.3,7)"
			   ,"#(ai,64,64,1)Fresnel(1.3,7)"
			   ,"#(argb,8,8,3)color(0.94,0.23,0,1)"
            }, "license_civ_donator1" },
			{ "LoP Rot", {"donator1","admin1"}, {
               "#(ai,64,64,1)Fresnel(1.3,7)"
			   ,"textures\Fahrzeug_Skins\Donator\muni2.paa"
			   ,"#(ai,64,64,1)Fresnel(1.3,7)"
			   ,"#(ai,64,64,1)Fresnel(1.3,7)"
			   ,"#(argb,8,8,3)color(0.9,0.02,0,1)"
            }, "license_civ_donator1" },
			{ "LoP Gelb", {"donator1","admin1"}, {
               "#(ai,64,64,1)Fresnel(1.3,7)"
			   ,"textures\Fahrzeug_Skins\Donator\muni2.paa"
			   ,"#(ai,64,64,1)Fresnel(1.3,7)"
			   ,"#(ai,64,64,1)Fresnel(1.3,7)"
			   ,"#(argb,8,8,3)color(0.99,0.88,0.01,1)"
            }, "license_civ_donator1" },
			{ "LoP Blau 2", {"donator1","admin1"}, {
               "#(ai,64,64,1)Fresnel(1.3,7)"
			   ,"textures\Fahrzeug_Skins\Donator\muni2.paa"
			   ,"#(ai,64,64,1)Fresnel(1.3,7)"
			   ,"#(ai,64,64,1)Fresnel(1.3,7)"
			   ,"#(argb,8,8,3)color(0.01,0.07,0.64,1)"
            }, "license_civ_donator1" },
			{ "LoP Black", {"donator1","admin1"}, {
               "#(ai,64,64,1)Fresnel(1.3,7)"
			   ,"textures\Fahrzeug_Skins\Donator\muni2.paa"
			   ,"#(ai,64,64,1)Fresnel(1.3,7)"
			   ,"#(ai,64,64,1)Fresnel(1.3,7)"
			   ,"#(ai,64,64,1)Fresnel(1.3,7)"
            }, "license_civ_donator1" }
		};
    };
	
	class O_Truck_03_ammo_F {
        vItemSpace = 2000;
        conditions = "license_civ_truck || (!(playerSide isEqualTo civilian))";
        price = 250000000;
		medprice = -1;
		copprice = -1;
		garageprice = 250000;
		repaintprice = 1000000;
		storeLiquid = -1;
		gatherWeight = 120; 
		Text = "STR_Gather_Load_Vehicle";
		insurance = 10000000;
		textures[] = {
			{ "Brown Hex", {"civ","donator1","admin1"}, {
                "\A3\Soft_F_EPC\Truck_03\Data\Truck_03_ext01_CO.paa"
				,"\A3\Soft_F_EPC\Truck_03\Data\Truck_03_ext02_CO.paa"
				,"\A3\Soft_F_EPC\Truck_03\Data\Truck_03_cargo_CO.paa"
				,"\A3\Structures_F\Data\Metal\Containers\Containers_02_set_CO.paa"
            },"(!(playerSide in [west,independent]))" },
			{ "Grenzgänger", {"donator1","admin1"}, {
               "textures\Fahrzeug_Skins\Donator\gerat1.paa"
			   ,"textures\Fahrzeug_Skins\Donator\gerat2.paa"
			   ,"#(ai,64,64,1)Fresnel(1.3,7)"
			   ,"#(ai,64,64,1)Fresnel(1.3,7)"  
            }, "license_civ_donator1" },
			{ "Green Hex", {"donator1","admin1"}, {
               "\A3\Soft_F_Exp\Truck_03\Data\Truck_03_ext01_ghex_CO.paa"
			   ,"\A3\Soft_F_Exp\Truck_03\Data\Truck_03_ext02_ghex_CO.paa"
			   ,"\A3\Soft_F_Exp\Truck_03\Data\Truck_03_cargo_ghex_CO.paa"
			   ,"\A3\Structures_F\Data\Metal\Containers\Containers_colors_05_co.paa"
            }, "license_civ_donator1" },
			{ "LoP Blau", {"donator1","admin1"}, {
               "#(ai,64,64,1)Fresnel(1.3,7)"
			   ,"textures\Fahrzeug_Skins\Donator\muni2.paa"
			   ,"#(ai,64,64,1)Fresnel(1.3,7)"
			   ,"#(argb,8,8,3)color(0,0.18,0.32,1)"
            }, "license_civ_donator1" },
			{ "LoP Orange", {"donator1","admin1"}, {
               "#(ai,64,64,1)Fresnel(1.3,7)"
			   ,"textures\Fahrzeug_Skins\Donator\muni2.paa"
			   ,"#(ai,64,64,1)Fresnel(1.3,7)"
			   ,"#(argb,8,8,3)color(0.94,0.23,0,1)"
            }, "license_civ_donator1" },
			{ "LoP Gelb", {"donator1","admin1"}, {
               "#(ai,64,64,1)Fresnel(1.3,7)"
			   ,"textures\Fahrzeug_Skins\Donator\muni2.paa"
			   ,"#(ai,64,64,1)Fresnel(1.3,7)"
			   ,"#(argb,8,8,3)color(0.99,0.88,0.01,1)"
            }, "license_civ_donator1" },
			{ "LoP Rot", {"donator1","admin1"}, {
               "#(ai,64,64,1)Fresnel(1.3,7)"
			   ,"textures\Fahrzeug_Skins\Donator\muni2.paa"
			   ,"#(ai,64,64,1)Fresnel(1.3,7)"
			   ,"#(argb,8,8,3)color(0.9,0.02,0,1)"
            }, "license_civ_donator1" },
			{ "LoP Blau 2", {"donator1","admin1"}, {
               "#(ai,64,64,1)Fresnel(1.3,7)"
			   ,"textures\Fahrzeug_Skins\Donator\muni2.paa"
			   ,"#(ai,64,64,1)Fresnel(1.3,7)"
			   ,"#(argb,8,8,3)color(0.01,0.07,0.64,1)"
            }, "license_civ_donator1" },
			{ "LoP Black", {"donator1","admin1"}, {
               "#(ai,64,64,1)Fresnel(1.3,7)"
			   ,"textures\Fahrzeug_Skins\Donator\muni2.paa"
			   ,"#(ai,64,64,1)Fresnel(1.3,7)"
			   ,"#(ai,64,64,1)Fresnel(1.3,7)"
            }, "license_civ_donator1" },
			{ "Dithmarscher", {"dm","admin1"}, {
               "textures\Fahrzeug_Skins\dm\geraet1.paa"
				,"textures\Fahrzeug_Skins\dm\geraet2.paa"
				,"#(ai,64,64,1)Fresnel(1.3,7)"
				,"#(argb,8,8,3)color(0,1,0,1)"		
            }, "license_civ_dm" }
		};
    };
	
	class B_MRAP_01_F {
        vItemSpace = 100;
        conditions = "license_civ_truck || (!(playerSide isEqualTo civilian))";
        price = 10500000;
		medprice = 100000;
		copprice = 100000;
		garageprice = 100000;
		repaintprice = 1000000;
		storeLiquid= 0;
		gatherWeight = -1; 
		insurance=-1;
		textures[] = {
			{ "Olive", {"civ","donator1","admin1"}, {
                "\a3\soft_f\MRAP_01\Data\mrap_01_base_co.paa"
				,"\a3\soft_f\MRAP_01\Data\mrap_01_adds_co.paa"
            },"(!(playerSide in [west,independent]))" },
			{ "PPD", {"cop"}, {
                "textures\Fahrzeug_Skins\Cops\hunter.paa"
				,"textures\Fahrzeug_Skins\Cops\hunter1.paa"
            }, "call life_coplevel > 0" },
			{ "PRS", {"med"}, {
                "textures\Fahrzeug_Skins\Medic\hunter_prs_front.paa"
				,"textures\Fahrzeug_Skins\Medic\hunter_prs_back.paa"
            }, "call life_mediclevel > 0" },
			{ "Grau", {"donator1","admin1"}, {
                "textures\Fahrzeug_Skins\CIV\hunter_urban1.paa"
				,"textures\Fahrzeug_Skins\CIV\hunter_urban2.paa"
            }, "license_civ_donator1" },
			{ "Dithmarscher", {"dm","admin1"}, {
                "textures\Fahrzeug_Skins\dm\hunter2.paa"
				,"textures\Fahrzeug_Skins\dm\hunter1.paa"
            }, "license_civ_dm" },
			{ "Evers", {"srevers","admin1"}, {
                "textures\Fahrzeug_Skins\evers\hunter1.paa"
				,"textures\Fahrzeug_Skins\evers\hunter2.paa"
            }, "license_civ_srevers" },
			{ "Private Army", {"pa","admin1"}, {
                "textures\Fahrzeug_Skins\pa\Hunter_front.paa"
				,"textures\Fahrzeug_Skins\pa\Hunter_back.paa"
            }, "license_civ_pa" },
			{ "umlackieren", {"admin1"}, {
                "textures\pixel.jpg"
				,"textures\pixel.jpg"
            }, "license_civ_admin1" },
			{ "Tribut LoP", {"civ","donator1","admin1"}, {
                "textures\Fahrzeug_Skins\CIV\hunter_RIP1.paa"
				,"textures\Fahrzeug_Skins\CIV\hunter_RIP2.paa"
            },"(!(playerSide in [west,independent]))" },
			{ "Kartell", {"kartell","admin1"}, {
                "textures\Fahrzeug_Skins\kartell\hunter-vorne.paa"
				,"textures\Fahrzeug_Skins\kartell\hunter-hinten.paa"
            }, "license_civ_kartell" },
			{ "CS Go", {"donator1","admin1"}, {
                "textures\Fahrzeug_Skins\donator\hunterCSGO1.paa"
				,"textures\Fahrzeug_Skins\donator\hunterCSGO2.paa"
            }, "license_civ_donator1" },
			{ "Srevers", {"srevers","admin1"}, {
                "textures\Fahrzeug_Skins\srevers\hunter1.paa"
				,"textures\Fahrzeug_Skins\srevers\hunter2.paa"
            }, "license_civ_srevers" }
		};
    };
		
	class O_MRAP_02_F {
        vItemSpace = 100;
        conditions = "license_civ_rebel2 || license_cop_swat || license_cop_swatazubi || license_cop_swatcmd";
        price = 6300000;
		medprice = -1;
		copprice = 100000;
		garageprice = 100000;
		repaintprice = 1000000;
		storeLiquid= 0;
		gatherWeight = -1; 
		insurance=-1;
		textures[] = {
			{ "Brown Hex", {"rebel2","donator1","admin1"}, {
                "\A3\soft_f\mrap_02\data\mrap_02_ext_01_co.paa"
				,"\a3\soft_f\mrap_02\data\mrap_02_ext_02_co.paa"
            },"(!(playerSide in [west,independent]))" },
			{ "Green Hex", {"donator1","admin1"}, {
               "\A3\Soft_F_Exp\MRAP_02\data\MRAP_02_ext_01_ghex_CO.paa"
			   ,"\A3\Soft_F_Exp\MRAP_02\data\MRAP_02_ext_02_ghex_CO.paa"
			}, "license_civ_donator1" },
			{ "Grey", {"donator1","admin1"}, {
              "textures\Fahrzeug_Skins\CIV\ifrit_grey_front.paa"
			  ,"textures\Fahrzeug_Skins\CIV\ifrit_grey_back.paa"
			}, "license_civ_donator1" },
			{ "Lion", {"donator1","admin1"}, {
              "textures\Fahrzeug_Skins\CIV\ifrit_lion_front.paa"
			  ,"textures\Fahrzeug_Skins\CIV\ifrit_lion_back.paa"
			}, "license_civ_donator1" },
			{ "Red", {"donator1","admin1"}, {
              "textures\Fahrzeug_Skins\CIV\ifrit_red_front.paa"
			  ,"textures\Fahrzeug_Skins\CIV\ifrit_red_back.paa"
			}, "license_civ_donator1" },
			{ "SWAT", {"cop"}, {
              "textures\Fahrzeug_Skins\Cops\SwatIfrit1.paa"
			  ,"textures\Fahrzeug_Skins\Cops\SwatIfrit2.paa"
			}, "license_cop_swat || license_cop_swatazubi || license_cop_swatcmd" },
			{ "Black", {"admin1"}, {
              "#(ai,64,64,1)Fresnel(1.3,7)"
			  ,"#(ai,64,64,1)Fresnel(1.3,7)"
			}, "license_civ_admin1" },
			{ "RennwagenEvent", {"admin1"}, {
              "textures\Event\EventRennwagen.paa"
			  ,"textures\Event\EventRennwagen2.paa"
			}, "license_civ_admin1" }
		};
    };
	
	class I_MRAP_03_F {
        vItemSpace = 100;
        conditions = "license_civ_rebel2 || (!(playerSide isEqualTo civilian))";
        price = 9600000;
		medprice = -1;
		copprice = 100000;
		garageprice = 100000;
		repaintprice = 1000000;
				storeLiquid= 0;
		gatherWeight = -1; 
		insurance=-1;
		textures[] = {
			{ "Olive", {"rebel2","donator1","admin1"}, {
                "\A3\soft_f_beta\mrap_03\data\mrap_03_ext_co.paa"
            },"(!(playerSide in [west,independent]))" },
			{ "Green Hex", {"donator1","admin1"}, {
               "\a3\soft_f_beta\mrap_03\data\mrap_03_ext_indp_co.paa"
			   ,"\a3\data_f\vehicles\turret_indp_co.paa"
			}, "license_civ_donator1" },
			{ "PPD", {"cop"}, {
              "textures\Fahrzeug_Skins\Cops\strider.paa"
			}, "call life_coplevel > 0" },
			{ "Blue Digital", {"donator1","admin1"}, {
              "textures\Fahrzeug_Skins\CIV\striderblaudigital.paa"
			}, "license_civ_donator1" },
			{ "Safari", {"donator1","admin1"}, {
              "textures\Fahrzeug_Skins\CIV\stridersafari.paa"
			}, "license_civ_donator1" },
			{ "PRS", {"med"}, {
              "textures\Fahrzeug_Skins\Medic\strider_prs.paa"
			}, "call life_mediclevel > 0" },
			{ "SWAT", {"cop"}, {
              "textures\Fahrzeug_Skins\Cops\SwatStrider.paa"
			}, "license_cop_swat || license_cop_swatazubi || license_cop_swatcmd" },
			{ "Evers", {"srevers","admin1"}, {
              "textures\Fahrzeug_Skins\evers\strider.paa"
			}, "license_civ_srevers || license_civ_admin1" },
			{ "BHG", {"bhg","admin1"}, {
              "textures\Fahrzeug_Skins\bhg\Strider.paa"
			}, "license_civ_bhg" },
			{ "KING", {"king","admin1"}, {
              "textures\Fahrzeug_Skins\king\Strider.paa"
			}, "license_civ_king" },
			{ "Private Army", {"pa","admin1"}, {
              "textures\Fahrzeug_Skins\pa\strider.paa"
			}, "license_civ_pa || license_civ_admin1" },
			{ "Kartell", {"kartell","admin1"}, {
              "textures\Fahrzeug_Skins\kartell\StriderKA.paa"
			}, "license_civ_kartell || license_civ_admin1" },
			{ "Black", {"admin1"}, {
              "#(ai,64,64,1)Fresnel(1.3,7)"
			  ,"#(ai,64,64,1)Fresnel(1.3,7)"
			}, "license_civ_admin1" },
			{ "Srevers", {"srevers","admin1"}, {
              "textures\Fahrzeug_Skins\srevers\Strider.paa"
			}, "license_civ_srevers" }
		};
    };
	
	//Helis und Flugzeuge
	
	class B_Heli_Light_01_F {
        vItemSpace = 90;
        conditions = "license_civ_pilot || {license_cop_cAir} || {license_med_mAir}";
        price = 900000;
		medprice = 150000;
		copprice = 100000;
		garageprice = 45000;
		repaintprice = 90000;
		storeLiquid= 0;
		gatherWeight = -1; 
		insurance=-1;
		textures[] = {
			{ "Civ Blue", {"civ","donator1","admin1","cop"}, {
                "\a3\air_f\Heli_Light_01\Data\heli_light_01_ext_blue_co.paa"
            },"(!(playerSide in [west,independent]))" },
            { "PPD", {"cop"}, {
                "textures\Fahrzeug_Skins\Cops\bird.paa"
            }, "call life_coplevel > 0" },
			{ "SWAT", {"cop"}, {
                "textures\Fahrzeug_Skins\Cops\SwatHumsebird.paa"
            }, "license_cop_swat || license_cop_swatazubi || license_cop_swatcmd" },
			{ "Monster", {"civ","donator1","admin1","cop"}, {
                "textures\Fahrzeug_Skins\CIV\hummingbird_monster.paa"
            },"(!(playerSide in [west,independent]))" },
			{ "Blueline", {"donator1","admin1"}, {
                "\a3\air_f\Heli_Light_01\Data\Skins\heli_light_01_ext_blueline_co.paa"
            }, "license_civ_donator1" },
            { "Sheriff", {"donator1","admin1"}, {
                "\a3\air_f\Heli_Light_01\Data\Skins\heli_light_01_ext_sheriff_co.paa"
            }, "license_civ_donator1" },
            { "Civ Red", {"donator1","admin1"}, {
                "\a3\air_f\Heli_Light_01\Data\heli_light_01_ext_co.paa"
            }, "license_civ_donator1" },
            { "Elliptical", {"donator1","admin1"}, {
                "\a3\air_f\Heli_Light_01\Data\Skins\heli_light_01_ext_elliptical_co.paa"
            }, "license_civ_donator1" },
            { "Furious", {"donator1","admin1"}, {
                "\a3\air_f\Heli_Light_01\Data\Skins\heli_light_01_ext_furious_co.paa"
            }, "license_civ_donator1" },
            { "Jeans Blue", {"donator1","admin1"}, {
                "\a3\air_f\Heli_Light_01\Data\Skins\heli_light_01_ext_jeans_co.paa"
            }, "license_civ_donator1" },
            { "Speedy Redline", {"donator1","admin1"}, {
                "\a3\air_f\Heli_Light_01\Data\Skins\heli_light_01_ext_speedy_co.paa"
            }, "license_civ_donator1" },
            { "Sunset", {"donator1","admin1"}, {
                "\a3\air_f\Heli_Light_01\Data\Skins\heli_light_01_ext_sunset_co.paa"
            }, "license_civ_donator1" },
            { "Vrana", {"donator1","admin1"}, {
                "\a3\air_f\Heli_Light_01\Data\Skins\heli_light_01_ext_vrana_co.paa"
            }, "license_civ_donator1" },
            { "Waves Blue", {"donator1","admin1"}, {
                "\a3\air_f\Heli_Light_01\Data\Skins\heli_light_01_ext_wave_co.paa"
            }, "license_civ_donator1" },
			{ "Black", {"donator1","admin1"}, {
                "#(ai,64,64,1)Fresnel(1.3,7)"
            }, "license_civ_donator1" },
            { "Rebel Digital", {"reb","donator1","admin1"}, {
                "\a3\air_f\Heli_Light_01\Data\Skins\heli_light_01_ext_digital_co.paa"
            }, "license_civ_rebel" },
            { "Digi Green", {"reb","donator1","admin1"}, {
                "\a3\air_f\Heli_Light_01\Data\heli_light_01_ext_indp_co.paa"
            }, "license_civ_donator1" },
            { "PRS", {"med"}, {
                "textures\Fahrzeug_Skins\Medic\hummi_prs.paa"
            }, "call life_mediclevel > 0" },
			{ "Private Army", {"pa","admin1"}, {
                "textures\Fahrzeug_Skins\pa\HeliPAV2.0.paa"
            }, "license_civ_pa" },
			{ "umlackieren", {"admin1"}, {
                "textures\pixel.jpg"
            }, "license_civ_admin1" },
			{ "Kartell", {"kartell","admin1"}, {
                "textures\Fahrzeug_Skins\kartell\HummiKA.paa"
            }, "license_civ_kartell" },
			{ "Olive", {"donator1","admin1"}, {
                "A3\Air_F\Heli_Light_01\Data\Heli_Light_01_ext_Blufor_CO.paa"
            }, "license_civ_donator1" },
			{ "Graywatcher", {"donator1","admin1"}, {
                "\a3\air_f\Heli_Light_01\Data\Skins\heli_light_01_ext_graywatcher_co.paa"
            }, "license_civ_donator1" },
			{ "Srevers", {"srevers","admin1"}, {
                "textures\Fahrzeug_Skins\srevers\hummi.paa"
            }, "license_civ_srevers" },
			{ "King", {"king","admin1"}, {
                "textures\Fahrzeug_Skins\king\hummi.paa"
            }, "license_civ_king" },
			{ "Dithmarscher", {"dm","admin1"}, {
                "textures\Fahrzeug_Skins\dm\Hummi.paa"
            }, "license_civ_dm" }
        };
    };

    class C_Heli_Light_01_civil_F : B_Heli_Light_01_F {
		vItemSpace = 150;
		price = 990000;
		garageprice = 45000;
	};
	
	class O_Heli_Light_02_unarmed_F {
        vItemSpace = 280;
        conditions = "license_civ_pilot || {license_med_mAir}";
        price = 1950000;
		medprice = 150000;
		copprice = -1;
		garageprice = 55000;
		repaintprice = 225000;
		storeLiquid= 0;
		gatherWeight = -1; 
		insurance=-1;
		textures[] = {
            { "White / Blue", {"civ","donator1","admin1"}, {
                "\a3\air_f\Heli_Light_02\Data\heli_light_02_ext_civilian_co.paa"
            },"(!(playerSide in [west,independent]))" },
            { "Black", {"donator1","admin1"}, {
                "\a3\air_f\Heli_Light_02\Data\heli_light_02_ext_co.paa"
            },"(!(playerSide in [west,independent]))" },
            { "Digi Green", {"donator1","admin1"}, {
                "\a3\air_f\Heli_Light_02\Data\heli_light_02_ext_indp_co.paa"
            },"(!(playerSide in [west,independent]))" },
            { "Desert Digi", {"donator1","admin1"}, {
                "\a3\air_f\Heli_Light_02\Data\heli_light_02_ext_opfor_co.paa"
            }, "license_civ_donator1" },
			 { "Schwarz / Weiss", {"donator1","admin1"}, {
                "\A3\Air_F_Heli\Heli_Light_02\Data\Heli_Light_02_ext_OPFOR_V2_CO.paa"
            }, "license_civ_donator1" },
            { "PRS", {"med"}, {
                "textures\Fahrzeug_Skins\Medic\orca_prs.paa"
            }, "call life_mediclevel > 0" }
        };
    };
	
	class I_Heli_Transport_02_F {
        vItemSpace = 380;
        conditions = "license_civ_pilot || {license_med_mAir}";
        price = 4950000;
		medprice = 187500;
		copprice = -1;
		garageprice = 90000;
		repaintprice = 405000;
		storeLiquid= 0;
		gatherWeight = -1; 
		insurance=-1;
		textures[] = {
            { "Ion", {"civ","donator1","admin1"}, {
                "\a3\air_f_beta\Heli_Transport_02\Data\Skins\heli_transport_02_1_ion_co.paa"
				,"\a3\air_f_beta\Heli_Transport_02\Data\Skins\heli_transport_02_2_ion_co.paa"
				,"\a3\air_f_beta\Heli_Transport_02\Data\Skins\heli_transport_02_3_ion_co.paa"
            },"(!(playerSide in [west,independent]))" },
            { "Dahoman", {"civ","donator1","admin1"}, {
                "\a3\air_f_beta\Heli_Transport_02\Data\Skins\heli_transport_02_1_dahoman_co.paa"
				,"\a3\air_f_beta\Heli_Transport_02\Data\Skins\heli_transport_02_2_dahoman_co.paa"
				,"\a3\air_f_beta\Heli_Transport_02\Data\Skins\heli_transport_02_3_dahoman_co.paa"
            },"(!(playerSide in [west,independent]))" },
            { "PRS", {"med"}, {
                "textures\Fahrzeug_Skins\Medic\mohawk_prs_main.paa"
				,"textures\Fahrzeug_Skins\Medic\mohawk_prs_eng.paa"
				,"textures\Fahrzeug_Skins\Medic\mohawk_prs_rot.paa"
            }, "call life_mediclevel > 0" },
            { "IDAP", {"donator1","admin1"}, {
                "A3\Air_F_Orange\Heli_Transport_02\Data\Heli_Transport_02_1_IDAP_CO.paa"
				,"A3\Air_F_Orange\Heli_Transport_02\Data\Heli_Transport_02_2_IDAP_CO.paa"
				,"A3\Air_F_Orange\Heli_Transport_02\Data\Heli_Transport_02_3_IDAP_CO.paa"
				,"A3\Air_F_Orange\Heli_Transport_02\Data\Heli_Transport_02_int_02_IDAP_CO.paa"
            }, "license_civ_donator1" }
        };
    };
	
	class I_Heli_light_03_unarmed_F {
        vItemSpace = 150;
        conditions = "license_civ_pilot || license_med_mAir || license_cop_cAir";
        price = 4500000;
		medprice = 187500;
		copprice = 187500;
		garageprice = 90000;
		repaintprice = 525000;
        storeLiquid= 0;
		gatherWeight = -1; 
		insurance=-1;
		textures[] = {
            { "Grün", {"civ","donator1","admin1"}, {
                "\a3\air_f_epb\Heli_Light_03\data\heli_light_03_base_co.paa"
            },"(!(playerSide in [west,independent]))" },
            { "COP", {"cop"}, {
                "textures\Fahrzeug_Skins\Cops\hellcat.paa"
            }, "call life_coplevel > 0" },
            { "SWAT", {"cop"}, {
                "textures\Fahrzeug_Skins\Cops\SwatHellcat.paa"
            }, "license_cop_swat || license_cop_swatazubi || license_cop_swatcmd" },
            { "Dithmarscher", {"dm","admin1"}, {
                "textures\Fahrzeug_Skins\dm\hellcat.paa"
            }, "license_civ_dm" },
			{ "BHG", {"bhg","admin1"}, {
               "textures\Fahrzeug_Skins\bhg\hellcat.paa"
            }, "license_civ_bhg" },
			{ "Independent", {"reb","donator1","admin1"}, {
               "\A3\Air_F_EPB\Heli_Light_03\data\Heli_Light_03_base_INDP_CO.paa"
            }, "license_civ_rebel || license_civ_donator1" },
			{ "PRS", {"med"}, {
               "textures\Fahrzeug_Skins\Medic\hellcat_prs.paa"
            }, "call life_mediclevel > 0" },
			{ "Kartell", {"kartell","admin1"}, {
                "textures\Fahrzeug_Skins\Kartell\hellcat.paa"
            }, "license_civ_kartell" }
        };
    };
	
	class B_Heli_Transport_03_unarmed_F {
        vItemSpace = 460;
        conditions = "license_civ_pilot || license_med_mAir || license_cop_cAir";
        price = 6800000;
		medprice = 187500;
		copprice = 187500;
		garageprice = 100000;
		repaintprice = 502500;
        storeLiquid= 0;
		gatherWeight = -1; 
		insurance=-1;
		textures[] = {
            { "Black", {"civ","donator1","admin1"}, {
                "a3\air_f_heli\Heli_Transport_03\Data\Heli_Transport_03_ext01_black_CO.paa"
				,"a3\air_f_heli\Heli_Transport_03\Data\Heli_Transport_03_ext02_black_CO.paa"
            },"(!(playerSide in [west,independent]))" },
            { "COP", {"cop"}, {
                "a3\air_f_heli\Heli_Transport_03\Data\Heli_Transport_03_ext01_black_CO.paa"
				,"a3\air_f_heli\Heli_Transport_03\Data\Heli_Transport_03_ext02_black_CO.paa"
            }, "call life_coplevel > 0" },
            { "PRS", {"med"}, {
                "textures\Fahrzeug_Skins\Medic\hure_prs_front.paa"
				,"textures\Fahrzeug_Skins\Medic\hure_prs_back.paa"
            }, "call life_mediclevel > 0" },
            { "Grün", {"civ","donator1","admin1"}, {
                "a3\air_f_heli\Heli_Transport_03\Data\Heli_Transport_03_ext01_CO.paa"
				,"a3\air_f_heli\Heli_Transport_03\Data\Heli_Transport_03_ext02_CO.paa"
            }, "license_civ_donator1" },
			{ "SWAT", {"cop"}, {
               "textures\Fahrzeug_Skins\Cops\SwatHuron1.paa"
			   ,"textures\Fahrzeug_Skins\Cops\SwatHuron2.paa"
            }, "license_cop_swat || license_cop_swatazubi || license_cop_swatcmd" }
        };
    };
	
	class O_Heli_Transport_04_F {
        vItemSpace = 100;
        conditions = "license_civ_pilot || license_med_mAir || license_cop_cAir";
        price = -1;
		medprice = 187500;
		copprice = -1;
		garageprice = 90000;
		repaintprice = 502500;
        storeLiquid= 0;
		gatherWeight = -1; 
		insurance=-1;
		textures[] = {
            { "Brown HEX", {"civ","donator1","admin1"}, {
                "a3\air_f_heli\Heli_Transport_04\Data\Heli_Transport_04_base_01_CO.paa"
				,"a3\air_f_heli\Heli_Transport_04\Data\Heli_Transport_04_base_02_CO.paa"
            },"(!(playerSide in [west,independent]))" },
            { "Black", {"donator1","admin1"}, {
                "a3\air_f_heli\Heli_Transport_04\Data\heli_transport_04_base_01_Black_co.paa"
				,"a3\air_f_heli\Heli_Transport_04\Data\heli_transport_04_base_02_Black_co.paa"
            }, "license_civ_donator1" },
            { "PRS", {"med"}, {
                "textures\Fahrzeug_Skins\Medic\taru_prs_front.paa"
				,"textures\Fahrzeug_Skins\Medic\taru_prs_back.paa"
            }, "call life_mediclevel > 0" }
        };
    };
	
		class O_Heli_Transport_04_medevac_F {
        vItemSpace = 100;
        conditions = "license_civ_pilot || license_med_mAir || license_cop_cAir";
        price = -1;
		medprice = 187500;
		copprice = -1;
		garageprice = 90000;
		repaintprice = 502500;
        storeLiquid= 0;
		gatherWeight = -1; 
		insurance=-1;
		textures[] = {
            { "PRS", {"med"}, {
                "textures\Fahrzeug_Skins\Medic\taru_prs_front.paa"
				,"textures\Fahrzeug_Skins\Medic\taru_prs_back.paa"
            }, "call life_mediclevel > 0" }
        };
    };
	
	
	class O_Heli_Transport_04_bench_F {
        vItemSpace = 100;
        conditions = "license_civ_pilot || license_med_mAir || license_cop_cAir";
        price = 4000000;
		medprice = 187500;
		copprice = 225000;
		garageprice = 90000;
		repaintprice = 400000;
        storeLiquid= 0;
		gatherWeight = -1; 
		insurance=-1;
		textures[] = {
            { "Brown HEX", {"civ","donator1","admin1","cop","dm"}, {
                "a3\air_f_heli\Heli_Transport_04\Data\Heli_Transport_04_base_01_CO.paa"
				,"a3\air_f_heli\Heli_Transport_04\Data\Heli_Transport_04_base_02_CO.paa"
            },"(!(playerSide in [west,independent]))" },
            { "Black", {"donator1","admin1","cop"}, {
                "a3\air_f_heli\Heli_Transport_04\Data\heli_transport_04_base_01_Black_co.paa"
				,"a3\air_f_heli\Heli_Transport_04\Data\heli_transport_04_base_02_Black_co.paa"
            },"(!(playerSide in [west,independent]))" },
			{ "Dithmarscher", {"dm","admin1"}, {
                "textures\Fahrzeug_Skins\dm\Taru1.paa"
				,"textures\Fahrzeug_Skins\dm\Taru2.paa"
            },"license_civ_dm" },
			{ "PRS", {"med"}, {
                "textures\Fahrzeug_Skins\Medic\taru_prs_front.paa"
				,"textures\Fahrzeug_Skins\Medic\taru_prs_back.paa"
            }, "call life_mediclevel > 0" }
        };
    };
	
	class O_Heli_Transport_04_box_F {
		vItemSpace = 750;
		conditions = "license_civ_pilot";
		price = 12000000;
		medprice = -1;
		copprice = -1;
		garageprice = 100000;
		repaintprice = 540000;
        storeLiquid= 0;
		gatherWeight = -1; 
		insurance=6000000;
		textures[] = {
            { "Brown HEX", {"civ","donator1","admin1"}, {
                "A3\Air_F_Heli\Heli_Transport_04\Data\Heli_Transport_04_base_01_CO.paa"
				,"A3\Air_F_Heli\Heli_Transport_04\Data\Heli_Transport_04_base_02_CO.paa"
				,"A3\Air_F_Heli\Heli_Transport_04\Data\Heli_Transport_04_Pod_Ext01_CO.paa"
				,"A3\Air_F_Heli\Heli_Transport_04\Data\Heli_Transport_04_Pod_Ext02_CO.paa"
            },"(!(playerSide in [west,independent]))" },
            { "Black", {"donator1","admin1"}, {
               "A3\Air_F_Heli\Heli_Transport_04\Data\Heli_Transport_04_base_01_black_CO.paa"
			   ,"A3\Air_F_Heli\Heli_Transport_04\Data\Heli_Transport_04_base_02_black_CO.paa"
			   ,"A3\Air_F_Heli\Heli_Transport_04\Data\Heli_Transport_04_Pod_Ext01_black_CO.paa"
			   ,"A3\Air_F_Heli\Heli_Transport_04\Data\Heli_Transport_04_Pod_Ext02_black_CO.paa"
            }, "license_civ_donator1" }
        };
	};
	
	class O_Heli_Transport_04_fuel_F {
		vItemSpace = 900;
		conditions = "license_civ_pilot";
		price = 30000000;
		medprice = -1;
		copprice = -1;
		garageprice = 90000;
		repaintprice = 570000;
        storeLiquid= 1;
		gatherWeight = 30; 
		insurance=6000000;
		textures[] = {
            { "Brown HEX", {"civ","donator1","admin1"}, {
                "A3\Air_F_Heli\Heli_Transport_04\Data\Heli_Transport_04_base_01_CO.paa"
				,"A3\Air_F_Heli\Heli_Transport_04\Data\Heli_Transport_04_base_02_CO.paa"
				,"A3\Air_F_Heli\Heli_Transport_04\Data\Heli_Transport_04_Pod_Ext01_CO.paa"
            },"(!(playerSide in [west,independent]))" },
            { "Black", {"donator1","admin1"}, {
				"A3\Air_F_Heli\Heli_Transport_04\Data\heli_transport_04_base_01_Black_co.paa"
				,"A3\Air_F_Heli\Heli_Transport_04\Data\heli_transport_04_base_02_Black_co.paa"
				,"A3\Air_F_Heli\Heli_Transport_04\Data\Heli_Transport_04_fuel_black_CO.paa"
			}, "license_civ_donator1" }
        };
	};
	
	class C_Plane_Civil_01_F {
        vItemSpace = 250;
        conditions = "license_civ_pilot";
        price = 3000000;
		medprice = -1;
		copprice = -1;
		garageprice = 30000;
		repaintprice = 300000;
        storeLiquid= 0;
		gatherWeight = -1; 
		insurance=-1;
		textures[] = {
            { "Racing (Tan Interior)", {"civ","donator1","admin1"}, {
                "A3\Air_F_Exp\Plane_Civil_01\Data\btt_ext_01_Racer_co.paa",
                "A3\Air_F_Exp\Plane_Civil_01\Data\btt_ext_02_Racer_co.paa",
                "A3\Air_F_Exp\Plane_Civil_01\Data\btt_int_01_tan_co.paa",
                "A3\Air_F_Exp\Plane_Civil_01\Data\btt_int_02_tan_co.paa"
            },"(!(playerSide in [west,independent]))" },
            { "Racing", {"donator1","admin1"}, {
                "A3\Air_F_Exp\Plane_Civil_01\Data\btt_ext_01_Racer_co.paa",
                "A3\Air_F_Exp\Plane_Civil_01\Data\btt_ext_02_Racer_co.paa",
                "A3\Air_F_Exp\Plane_Civil_01\Data\btt_int_01_co.paa",
                "A3\Air_F_Exp\Plane_Civil_01\Data\btt_int_02_co.paa"
            }, "license_civ_donator1" },
            { "Red Line (Tan Interior)", {"donator1","admin1"}, {
                "A3\Air_F_Exp\Plane_Civil_01\Data\btt_ext_01_RedLine_co.paa",
                "A3\Air_F_Exp\Plane_Civil_01\Data\btt_ext_02_RedLine_co.paa",
                "A3\Air_F_Exp\Plane_Civil_01\Data\btt_int_01_tan_co.paa",
                "A3\Air_F_Exp\Plane_Civil_01\Data\btt_int_02_tan_co.paa"
            }, "license_civ_donator1" },
            { "Red Line", {"donator1","admin1"}, {
                "A3\Air_F_Exp\Plane_Civil_01\Data\btt_ext_01_RedLine_co.paa",
                "A3\Air_F_Exp\Plane_Civil_01\Data\btt_ext_02_RedLine_co.paa",
                "A3\Air_F_Exp\Plane_Civil_01\Data\btt_int_01_co.paa",
                "A3\Air_F_Exp\Plane_Civil_01\Data\btt_int_02_co.paa"
            }, "license_civ_donator1" },
            { "Tribal (Tan Interior)", {"donator1","admin1"}, {
                "A3\Air_F_Exp\Plane_Civil_01\Data\btt_ext_01_Tribal_co.paa",
                "A3\Air_F_Exp\Plane_Civil_01\Data\btt_ext_02_Tribal_co.paa",
                "A3\Air_F_Exp\Plane_Civil_01\Data\btt_int_01_tan_co.paa",
                "A3\Air_F_Exp\Plane_Civil_01\Data\btt_int_02_tan_co.paa"
            }, "license_civ_donator1" },
            { "Tribal", {"donator1","admin1"}, {
                "A3\Air_F_Exp\Plane_Civil_01\Data\btt_ext_01_Tribal_co.paa",
                "A3\Air_F_Exp\Plane_Civil_01\Data\btt_ext_02_Tribal_co.paa",
                "A3\Air_F_Exp\Plane_Civil_01\Data\btt_int_01_co.paa",
                "A3\Air_F_Exp\Plane_Civil_01\Data\btt_int_02_co.paa"
            }, "license_civ_donator1" },
            { "Blue Wave (Tan Interior)", {"donator1","admin1"}, {
                "A3\Air_F_Exp\Plane_Civil_01\Data\btt_ext_01_Wave_co.paa",
                "A3\Air_F_Exp\Plane_Civil_01\Data\btt_ext_02_Wave_co.paa",
                "A3\Air_F_Exp\Plane_Civil_01\Data\btt_int_01_tan_co.paa",
                "A3\Air_F_Exp\Plane_Civil_01\Data\btt_int_02_tan_co.paa"
            }, "license_civ_donator1" },
            { "Blue Wave", {"donator1","admin1"}, {
                "A3\Air_F_Exp\Plane_Civil_01\Data\btt_ext_01_Wave_co.paa",
                "A3\Air_F_Exp\Plane_Civil_01\Data\btt_ext_02_Wave_co.paa",
                "A3\Air_F_Exp\Plane_Civil_01\Data\btt_int_01_co.paa",
                "A3\Air_F_Exp\Plane_Civil_01\Data\btt_int_02_co.paa"
            }, "license_civ_donator1" },
			{ "Kartell", {"civ","donator1","admin1"}, {
                "textures\Fahrzeug_Skins\CIV\Kartell1.paa",
                "textures\Fahrzeug_Skins\CIV\Kartell1.paa",
                "A3\Air_F_Exp\Plane_Civil_01\Data\btt_int_01_co.paa",
                "A3\Air_F_Exp\Plane_Civil_01\Data\btt_int_02_co.paa"
            }, "" }
        };
    };
	
	class C_Plane_civil_01_racing_F : C_Plane_Civil_01_F {
		vItemSpace = 700;
        price = 7000000;
		insurance=800000;
	};
	
	class B_T_VTOL_01_infantry_F {
		vItemSpace = 500;
        conditions = "license_civ_pilot || license_cop_cAir";
        price = 7500000;
		medprice = -1;
		copprice = 375000;
		garageprice = 100000;
		repaintprice = 750000;
		storeLiquid= 0;
		gatherWeight = -1; 
		insurance=-1;
		textures[] = {
			{ "Olive", {"civ","donator1","admin1"}, {
                "\A3\Air_F_Exp\VTOL_01\Data\VTOL_01_EXT01_olive_CO.paa"
				,"\A3\Air_F_Exp\VTOL_01\Data\VTOL_01_EXT02_olive_CO.paa"
				,"\A3\Air_F_Exp\VTOL_01\Data\VTOL_01_EXT03_olive_CO.paa"
				,"\A3\Air_F_Exp\VTOL_01\Data\VTOL_01_EXT04_olive_CO.paa"
            },"(!(playerSide in [west,independent]))" },
			{ "Blue", {"donator1","admin1"}, {
                "\A3\Air_F_Exp\VTOL_01\Data\VTOL_01_EXT01_blue_CO.paa"
				,"\A3\Air_F_Exp\VTOL_01\Data\VTOL_01_EXT02_blue_CO.paa"
				,"\A3\Air_F_Exp\VTOL_01\Data\VTOL_01_EXT03_blue_CO.paa"
				,"\A3\Air_F_Exp\VTOL_01\Data\VTOL_01_EXT04_blue_CO.paa"
            }, "license_civ_donator1" },
			{ "Frei", {"frei","admin1"}, {
                "textures\pixel.jpg"
				,"textures\pixel.jpg"
				,"textures\pixel.jpg"
				,"textures\pixel.jpg"
            }, "license_civ_admin1" },
			{ "Cop", {"cop"}, {
               "\A3\Air_F_Exp\VTOL_01\Data\VTOL_01_EXT01_olive_CO.paa"
				,"\A3\Air_F_Exp\VTOL_01\Data\VTOL_01_EXT02_olive_CO.paa"
				,"\A3\Air_F_Exp\VTOL_01\Data\VTOL_01_EXT03_olive_CO.paa"
				,"\A3\Air_F_Exp\VTOL_01\Data\VTOL_01_EXT04_olive_CO.paa"
            }, "call life_coplevel > 0" },
			{ "SWAT", {"cop"}, {
                "\A3\Air_F_Exp\VTOL_01\Data\VTOL_01_EXT01_blue_CO.paa"
				,"\A3\Air_F_Exp\VTOL_01\Data\VTOL_01_EXT02_blue_CO.paa"
				,"\A3\Air_F_Exp\VTOL_01\Data\VTOL_01_EXT03_blue_CO.paa"
				,"\A3\Air_F_Exp\VTOL_01\Data\VTOL_01_EXT04_blue_CO.paa"
            }, "license_cop_swat || license_cop_swatazubi || license_cop_swatcmd" }
		};
	};
	
	class B_T_VTOL_01_vehicle_F : B_T_VTOL_01_infantry_F {
		price = 12000000;
		vItemSpace = 300;
		repaintprice = 1000000;
		insurance=9000000;
	};
	
	class O_T_VTOL_02_infantry_F {
		vItemSpace = 1000;
        conditions = "license_civ_pilot || license_cop_cAir";
        price = 87000000;
		medprice = -1;
		copprice = -1;
		garageprice = 100000;
		repaintprice = 1000000;
		insurance = 3000000;
		storeLiquid= 0;
		gatherWeight = 30;
		Text = "STR_Gather_Load_Vehicle";
		textures[] = {
			{ "Brown Hex", {"civ","donator1","admin1"}, {
                "\A3\Air_F_Exp\VTOL_02\Data\VTOL_02_EXT01_bhex_CO.paa"
				,"\A3\Air_F_Exp\VTOL_02\Data\VTOL_02_EXT02_bhex_CO.paa"
				,"\A3\Air_F_Exp\VTOL_02\Data\VTOL_02_EXT03_L_bhex_CO.paa"
				,"\A3\Air_F_Exp\VTOL_02\Data\VTOL_02_EXT03_R_bhex_CO.paa"
            },"(!(playerSide in [west,independent]))" },
			{ "Grey", {"donator1","admin1"}, {
                "\A3\Air_F_Exp\VTOL_02\Data\VTOL_02_EXT01_CO.paa"
				,"\A3\Air_F_Exp\VTOL_02\Data\VTOL_02_EXT02_CO.paa"
				,"\A3\Air_F_Exp\VTOL_02\Data\VTOL_02_EXT03_L_CO.paa"
				,"\A3\Air_F_Exp\VTOL_02\Data\VTOL_02_EXT03_R_CO.paa"
            }, "license_civ_donator1" },
			{ "Green Hex", {"donator1","admin1"}, {
               "\A3\Air_F_Exp\VTOL_02\Data\VTOL_02_EXT01_ghex_CO.paa"
			   ,"\A3\Air_F_Exp\VTOL_02\Data\VTOL_02_EXT02_ghex_CO.paa"
			   ,"\A3\Air_F_Exp\VTOL_02\Data\VTOL_02_EXT03_L_ghex_CO.paa"
			   ,"\A3\Air_F_Exp\VTOL_02\Data\VTOL_02_EXT03_R_ghex_CO.paa"
            }, "license_civ_donator1" }
		};
	};
	
	class O_Plane_CAS_02_F {
		vItemSpace = 3000;
        conditions = "license_civ_pilot";
        price = 70000000;
		medprice = -1;
		copprice = -1;
		garageprice = 100000;
		repaintprice = 1000000;
		insurance = 0;
		storeLiquid= 0;
		gatherWeight = -1; 
		textures[] = {
			{ "Grau", {"civ","donator1","admin1"}, {
                "textures\Fahrzeug_Skins\CivJetHaupt.paa"
				,"textures\Fahrzeug_Skins\CivJetAdds.paa"
            },"(!(playerSide in [west,independent]))" },
			{ "Red", {"civ","donator1","admin1"}, {
                "textures\Fahrzeug_Skins\CivJetHaupt.paa"
				,"textures\Fahrzeug_Skins\CivJetAdds.paa"
            },"(!(playerSide in [west,independent]))" },
			{ "Camo", {"donator1","admin1"}, {
                "\A3\Air_F_EPC\Plane_CAS_02\Data\fighter02_ext01_co.paa"
				,"\A3\Air_F_EPC\Plane_CAS_02\Data\fighter02_ext02_co.paa"
            }, "license_civ_donator1" }
		};
	};
	
	class B_Plane_Fighter_01_Stealth_F {
		vItemSpace = 3000;
        conditions = "license_civ_pilot";
        price = 140000000;
		medprice = -1;
		copprice = -1;
		garageprice = 140000;
		repaintprice = 1000000;
		insurance = 0;
		storeLiquid= 0;
		gatherWeight = 3040; 
		textures[] = {
			{ "Grau", {"civ","donator1","admin1"}, {
                "a3\air_f_jets\plane_fighter_01\data\fighter_01_fuselage_01_co.paa"
				,"a3\air_f_jets\plane_fighter_01\data\fighter_01_fuselage_02_co.paa"
				,"a3\air_f_jets\plane_fighter_01\data\fighter_01_glass_01_ca.paa"
				,"a3\air_f_jets\plane_fighter_01\data\fighter_01_cockpit_01_co.paa"
            },"(!(playerSide in [west,independent]))" },
			{ "Tarn", {"civ","donator1","admin1"}, {
                "a3\air_f_jets\plane_fighter_01\data\fighter_01_fuselage_01_Camo_co.paa"
				,"a3\air_f_jets\plane_fighter_01\data\fighter_01_fuselage_02_Camo_co.paa"
				,"a3\air_f_jets\plane_fighter_01\data\fighter_01_glass_01_ca.paa"
				,"a3\air_f_jets\plane_fighter_01\data\fighter_01_cockpit_01_co.paa"
				,"a3\air_f_jets\plane_fighter_01\data\fighter_01_cockpit_02_co.paa"
				,"a3\air_f_jets\plane_fighter_01\data\fighter_01_cockpit_03_co.paa"
				,"a3\air_f_jets\plane_fighter_01\data\fighter_01_cockpit_05_co.paa"
            },"(!(playerSide in [west,independent]))" }
		};
	};
	
	class I_Heli_light_03_dynamicLoadout_F {
        vItemSpace = 150;
        conditions = "license_civ_pilot || license_cop_cAir";
        price = 7900000;
		medprice = 187500;
		copprice = 200000;
		garageprice = 90000;
		repaintprice = 525000;
        storeLiquid= 0;
		gatherWeight = -1; 
		insurance=-1;
		textures[] = {
            { "Grün", {"civ","donator1","admin1"}, {
                "\a3\air_f_epb\Heli_Light_03\data\heli_light_03_base_co.paa"
            },"(!(playerSide in [west,independent]))" },
            { "COP", {"cop"}, {
                "textures\Fahrzeug_Skins\Cops\hellcat.paa"
            }, "call life_coplevel >= 5" },
            { "SWAT", {"cop"}, {
                "textures\Fahrzeug_Skins\Cops\SwatHellcat.paa"
            }, "license_cop_swat || license_cop_swatazubi || license_cop_swatcmd" },
			{ "Independent", {"reb","donator1","admin1"}, {
               "\A3\Air_F_EPB\Heli_Light_03\data\Heli_Light_03_base_INDP_CO.paa"
            }, "license_civ_rebel || license_civ_donator1" },
			{ "BHG", {"bhg","admin1"}, {
               "textures\Fahrzeug_Skins\bhg\hellcat.paa"
            }, "license_civ_bhg" },
			{ "Dithmarscher", {"dm","admin1"}, {
                "textures\Fahrzeug_Skins\dm\hellcat.paa"
            }, "license_civ_dm" },
			{ "Kartell", {"kartell","admin1"}, {
                "textures\Fahrzeug_Skins\Kartell\hellcat.paa"
            }, "license_civ_kartell" }
        };
    };
	
	class B_Heli_Transport_01_F {
		vItemSpace = 400;
        conditions = "license_civ_pilot || license_cop_cAir";
        price = 14900000;
		medprice = 187500;
		copprice = 250000;
		garageprice = 90000;
		repaintprice = 525000;
        storeLiquid= 0;
		gatherWeight = -1; 
		insurance=-1;
		textures[] = {
            { "Grün", {"donator1","admin1"}, {
                "\A3\Air_F_Beta\Heli_Transport_01\Data\Heli_Transport_01_ext01_BLUFOR_CO.paa"
				,"\A3\Air_F_Beta\Heli_Transport_01\Data\Heli_Transport_01_ext02_BLUFOR_CO.paa"
            }, "license_civ_donator1" },
            { "COP", {"cop"}, {
                "\A3\Air_F_Beta\Heli_Transport_01\Data\Heli_Transport_01_ext01_CO.paa"
				,"\A3\Air_F_Beta\Heli_Transport_01\Data\Heli_Transport_01_ext02_CO.paa"
            }, "call life_coplevel > 8" },
            { "Olive", {"civ","donator1","admin1"}, {
                "\A3\Air_F_Exp\Heli_Transport_01\Data\Heli_Transport_01_ext01_tropic_CO.paa"
				,"\A3\Air_F_Exp\Heli_Transport_01\Data\Heli_Transport_01_ext02_tropic_CO.paa"
            },"(!(playerSide in [west,independent]))" },
            { "Sand", {"donator1","admin1"}, {
                "\A3\Air_F_Exp\Heli_Transport_01\Data\Heli_Transport_01_ext01_sand_CO.paa"
				,"\A3\Air_F_Exp\Heli_Transport_01\Data\Heli_Transport_01_ext02_sand_CO.paa"
            }, "license_civ_donator1" }
        };
	};
	//Boat
	
	class C_Rubberboat {
		vItemSpace = 175;
        conditions = "license_civ_boat || (!(playerSide isEqualTo civilian))";
        price = 50000;
		medprice = -1;
		copprice = -1;
		garageprice = 500;
		repaintprice = 675;
		storeLiquid= 0;
		gatherWeight = -1; 
		textures[] = {
			{ "Standard", {"civ","donator1","admin1"}, {
                "\A3\boat_F\Boat_Transport_01\data\Boat_Transport_01_civilian_CO.paa"
            },"(!(playerSide in [west,independent]))" }
		};
	};
	
	class O_Lifeboat {
		vItemSpace = 180;
        conditions = "license_civ_boat || (!(playerSide isEqualTo civilian))";
        price = -1;
		medprice = 6750;
		copprice = -1;
		garageprice = 450;
		repaintprice = 675;
		storeLiquid= 0;
		gatherWeight = -1; 
		insurance=-1;
		textures[] = {
			{ "PRS", {"med"}, {
                "\A3\boat_F\Boat_Transport_01\data\Boat_Transport_01_rescue_CO.paa"
            },"(!(playerSide in [west,independent]))" }
		};
	};
		
	class B_Boat_Transport_01_F {
		vItemSpace = 180;
        conditions = "license_civ_boat || (!(playerSide isEqualTo civilian))";
        price = -1;
		medprice = 6750;
		copprice = 6750;
		garageprice = 450;
		repaintprice = 675;
		storeLiquid= 0;
		gatherWeight = -1; 
		insurance=-1;
		textures[] = {
			{ "Standard", {"civ","donator1","admin1"}, {
                "\A3\boat_F\Boat_Transport_01\data\boat_transport_01_co.paa"
            },"(!(playerSide in [west,independent]))" },
			{ "COP", {"cop"}, {
                "\A3\boat_F\Boat_Transport_01\data\boat_transport_01_co.paa"
            }, "call life_coplevel > 0" },
			{ "PRS", {"med"}, {
                "\A3\boat_F\Boat_Transport_01\data\boat_transport_01_co.paa"
            }, "call life_mediclevel > 0" }
		};
	};
	
	class C_Boat_Civil_01_F {
		vItemSpace = 450;
        conditions = "license_civ_boat || (!(playerSide isEqualTo civilian))";
        price = 1000000;
		medprice = -1;
		copprice = -1;
		garageprice = 10000;
		repaintprice = 22500;
		storeLiquid= 0;
		gatherWeight = -1; 
		insurance=-1;
		textures[] = {
			{ "Standard", {"civ","donator1","admin1"}, {
                "\a3\boat_f_gamma\Boat_Civil_01\data\Boat_Civil_01_ext_co.paa"
				,"\a3\boat_f_gamma\Boat_Civil_01\data\Boat_Civil_01_int_co.paa"
            },"(!(playerSide in [west,independent]))" }
		};
	};
	
	class C_Boat_Civil_01_police_F {
		vItemSpace = 85;
        conditions = "license_civ_boat || (!(playerSide isEqualTo civilian))";
        price = -1;
		medprice = 30000;
		copprice = 30000;
		garageprice = 5000;
		repaintprice = 3000;
		storeLiquid= 0;
		gatherWeight = -1; 
		insurance=-1;
		textures[] = {
			{ "Cop", {"cop"}, {
                "\a3\boat_f_gamma\Boat_Civil_01\data\Boat_Civil_01_ext_police_co.paa"
				,"\a3\boat_f_gamma\Boat_Civil_01\data\Boat_Civil_01_int_police_co.paa"
            }, "call life_coplevel > 0" },
			{ "PRS", {"med"}, {
                "\a3\boat_f_gamma\Boat_Civil_01\data\Boat_Civil_01_ext_rescue_co.paa"
				,"\a3\boat_f_gamma\Boat_Civil_01\data\Boat_Civil_01_int_rescue_co.paa"
            }, "call life_mediclevel > 0" }
		};
	};
	
	class I_C_Boat_Transport_02_F {				//RHIB
		vItemSpace = 820;
        conditions = "license_civ_boat || (!(playerSide isEqualTo civilian))";
        price = 3500000;
		medprice = 30000;
		copprice = 30000;
		garageprice = 35000;
		repaintprice = 22500;
		storeLiquid= 0;
		gatherWeight = -1; 
		insurance=-1;
		textures[] = {
			{ "Schwarz", {"civ","donator1","admin1"}, {
               "a3\boat_f_exp\boat_transport_02\data\boat_transport_02_exterior_co.paa"
			   ,"a3\boat_f_exp\boat_transport_02\data\boat_transport_02_interior_2_co.paa"
            },"(!(playerSide in [west,independent]))" },
			{ "Türkis", {"civ","donator1","admin1"}, {
               "a3\boat_f_exp\boat_transport_02\data\boat_transport_02_exterior_civilian_co.paa"
			   ,"a3\boat_f_exp\boat_transport_02\data\boat_transport_02_interior_2_civilian_co.paa"
            },"(!(playerSide in [west,independent]))" },
			{ "Schwarz", {"cop"}, {
               "a3\boat_f_exp\boat_transport_02\data\boat_transport_02_exterior_co.paa"
			   ,"a3\boat_f_exp\boat_transport_02\data\boat_transport_02_interior_2_co.paa"
            }, "call life_coplevel > 0" }
		};
	};
	
	class C_Scooter_Transport_01_F {
        vItemSpace = 100;
        conditions = "license_civ_boat || (!(playerSide isEqualTo civilian))";
        price = 30000;
		medprice = 3000;
		copprice = 3000;
		garageprice = 300;
		repaintprice = 1000;
		storeLiquid= 0;
		gatherWeight = -1; 
		insurance=-1;
		textures[] = {
            { "Black", {"civ","donator1","admin1"}, {
                "\A3\Boat_F_Exp\Scooter_Transport_01\Data\Scooter_Transport_01_Black_CO.paa",
                "\A3\Boat_F_Exp\Scooter_Transport_01\Data\Scooter_Transport_01_VP_Black_CO.paa"
            },"(!(playerSide in [west,independent]))" },
            { "Blue", {"civ","donator1","admin1"}, {
                "\A3\Boat_F_Exp\Scooter_Transport_01\Data\Scooter_Transport_01_Blue_co.paa",
                "\A3\Boat_F_Exp\Scooter_Transport_01\Data\Scooter_Transport_01_VP_Blue_co.paa"
            },"(!(playerSide in [west,independent]))" },
            { "Grey", {"civ","donator1","admin1"}, {
                "\A3\Boat_F_Exp\Scooter_Transport_01\Data\Scooter_Transport_01_Grey_co.paa",
                "\A3\Boat_F_Exp\Scooter_Transport_01\Data\Scooter_Transport_01_VP_Grey_co.paa"
            },"(!(playerSide in [west,independent]))" },
            { "Green", {"civ","donator1","admin1"}, {
                "\A3\Boat_F_Exp\Scooter_Transport_01\Data\Scooter_Transport_01_Lime_co.paa",
                "\A3\Boat_F_Exp\Scooter_Transport_01\Data\Scooter_Transport_01_VP_Lime_co.paa"
            },"(!(playerSide in [west,independent]))" },
            { "Red", {"civ","donator1","admin1"}, {
                "\A3\Boat_F_Exp\Scooter_Transport_01\Data\Scooter_Transport_01_Red_CO.paa",
                "\A3\Boat_F_Exp\Scooter_Transport_01\Data\Scooter_Transport_01_VP_CO.paa"
            },"(!(playerSide in [west,independent]))" },
            { "White", {"civ","donator1","admin1"}, {
                "\A3\Boat_F_Exp\Scooter_Transport_01\Data\Scooter_Transport_01_CO.paa",
                "\A3\Boat_F_Exp\Scooter_Transport_01\Data\Scooter_Transport_01_VP_CO.paa"
            },"(!(playerSide in [west,independent]))" },
            { "Yellow", {"civ","donator1","admin1"}, {
                "\A3\Boat_F_Exp\Scooter_Transport_01\Data\Scooter_Transport_01_Yellow_CO.paa",
                "\A3\Boat_F_Exp\Scooter_Transport_01\Data\Scooter_Transport_01_VP_Yellow_CO.paa"
            },"(!(playerSide in [west,independent]))" },
			{ "Black", {"cop"}, {
                "\A3\Boat_F_Exp\Scooter_Transport_01\Data\Scooter_Transport_01_Black_CO.paa",
                "\A3\Boat_F_Exp\Scooter_Transport_01\Data\Scooter_Transport_01_VP_Black_CO.paa"
            }, "call life_coplevel > 0" },
			{ "Yellow", {"med"}, {
                "\A3\Boat_F_Exp\Scooter_Transport_01\Data\Scooter_Transport_01_Yellow_CO.paa",
                "\A3\Boat_F_Exp\Scooter_Transport_01\Data\Scooter_Transport_01_VP_Yellow_CO.paa"
            }, "call life_mediclevel > 0" }
        };
    };
	
	class B_SDV_01_F {
		vItemSpace = 350;
        conditions = "license_civ_boat || (!(playerSide isEqualTo civilian))";
        price = 350000;
		medprice = 30000;
		copprice = 30000;
		garageprice = 3500;
		repaintprice = 10500;
		storeLiquid= 0;
		gatherWeight = -1; 
		insurance=-1;
		textures[] = {
			{ "Schwarz", {"civ","donator1","admin1"}, {
               "\A3\boat_f_beta\SDV_01\data\SDV_ext_CO.paa"
            },"(!(playerSide in [west,independent]))" },
			{ "COP", {"cop"}, {
               "\A3\boat_f_beta\SDV_01\data\SDV_ext_CO.paa"
            }, "call life_coplevel > 0" },
			{ "PRS", {"med"}, {
               "\A3\boat_f_beta\SDV_01\data\SDV_ext_CO.paa"
            }, "call life_mediclevel > 0" }
		};
	};
	class Land_CargoBox_V1_F {
        vItemSpace = 7000;
        conditions = "";
        price = -1;
		storeLiquid= -1;
        textures[] = {};
    };

    class Box_IND_Grenades_F {
        vItemSpace = 350;
        conditions = "";
        price = -1;
        textures[] = {};
    };

    class I_supplyCrate_F {
        vItemSpace = 3500;
        conditions = "";
        price = -1;
		storeLiquid= -1;
        textures[] = {};
    };
	
	//Angriffspack
	class B_AssaultPack_khk {
        vItemSpace = 16;
        conditions = "";
        price = -1;
		storeLiquid= -1;
        textures[] = {};
    };
	class B_AssaultPack_cbr : B_AssaultPack_khk {};
	class B_AssaultPack_dgtl : B_AssaultPack_khk {};
	class B_AssaultPack_rgr : B_AssaultPack_khk {};
	class B_AssaultPack_sgg : B_AssaultPack_khk {};
	class B_AssaultPack_blk : B_AssaultPack_khk {};
	class B_AssaultPack_mcamo : B_AssaultPack_khk {};
	class B_AssaultPack_tna_f : B_AssaultPack_khk {};
	
	//Feldpack
	class B_FieldPack_cbr {
        vItemSpace = 36;
        conditions = "";
        price = -1;
		storeLiquid= -1;
        textures[] = {};
    };
	class B_FieldPack_khk : B_FieldPack_cbr {};
	class B_FieldPack_blk : B_FieldPack_cbr {};
	class B_FieldPack_ocamo : B_FieldPack_cbr {};
	class B_FieldPack_oucamo : B_FieldPack_cbr {};
	class B_FieldPack_ghex_F : B_FieldPack_cbr {};
	class B_FieldPack_oli : B_FieldPack_cbr {};
	
	//Taktischer Rucksack
	class B_TacticalPack_rgr {
        vItemSpace = 56;
        conditions = "";
        price = -1;
		storeLiquid= -1;
        textures[] = {};
    };
	class B_TacticalPack_ocamo : B_TacticalPack_rgr {};
	class B_TacticalPack_mcamo : B_TacticalPack_rgr {};
	class B_TacticalPack_oli : B_TacticalPack_rgr {};
	class B_TacticalPack_blk : B_TacticalPack_rgr {};
	
	//Seesack
	class B_Kitbag_mcamo {
        vItemSpace = 76;
        conditions = "";
        price = -1;
		storeLiquid= -1;
        textures[] = {};
    };
	class B_Kitbag_sgg : B_Kitbag_mcamo {};
	class B_Kitbag_cbr : B_Kitbag_mcamo {};
	class B_Kitbag_rgr : B_Kitbag_mcamo {};
	
	//Großer Rucksack
	class B_Carryall_ocamo {
        vItemSpace = 126;
        conditions = "";
        price = -1;
		storeLiquid= -1;
        textures[] = {};
    };
	class B_Carryall_oucamo : B_Carryall_ocamo {};
	class B_Carryall_mcamo : B_Carryall_ocamo {};
	class B_Carryall_oli : B_Carryall_ocamo {};
	class B_Carryall_khk : B_Carryall_ocamo {};
	class B_Carryall_cbr : B_Carryall_ocamo {};
	class B_Carryall_ghex_f : B_Carryall_ocamo {};	
	
	//Bergen Rucksack
	class B_Bergen_dgtl_f {
        vItemSpace = 126;
        conditions = "";
        price = -1;
		storeLiquid= -1;
        textures[] = {};
    };
	class B_Bergen_hex_F : B_Bergen_dgtl_f {};
	class B_Bergen_mcamo_F : B_Bergen_dgtl_f {};
	class B_Bergen_tna_f : B_Bergen_dgtl_f {};
	
	//Viper Rucksack (Evers)
	class B_ViperLightHarness_blk_F {
        vItemSpace = 76;
        conditions = "";
        price = -1;
		storeLiquid= -1;
        textures[] = {};
    };
};
/*
Angriffspack	40	1.500 €		B_AssaultPack_khk
								B_AssaultPack_cbr
								B_AssaultPack_dgtl
								B_AssaultPack_rgr
								B_AssaultPack_sgg
								B_AssaultPack_blk
								B_AssaultPack_mcamo
								B_AssaultPack_tna_f
Feldpack		60	2.000 €		B_FieldPack_cbr
								B_FieldPack_khk
								B_FieldPack_blk
								B_FieldPack_ocamo
								B_FieldPack_oucamo
								B_FieldPack_ghex_F
								B_FieldPack_oli
Takt. Rucksack	80	3.000 €		B_TacticalPack_rgr
								B_TacticalPack_ocamo
								B_TacticalPack_mcamo
								B_TacticalPack_oli
								B_TacticalPack_blk
Seesack			100	5.000 €		B_Kitbag_mcamo
								B_Kitbag_sgg
								B_Kitbag_cbr
								B_Kitbag_rgr
Großer Rucksack	150	100.000 €	B_Carryall_ocamo
								B_Carryall_oucamo
								B_Carryall_mcamo
								B_Carryall_oli
								B_Carryall_khk
								B_Carryall_cbr
								B_Carryall_ghex_f
Bergen Rucksack	150	150.000 €	B_Bergen_mcamo_f
								B_Bergen_dgtl_f
								B_Bergen_hex_f
								B_Bergen_tna_f
Viper			100	?			B_ViperLightHarness_blk_F (EVERS)
*/