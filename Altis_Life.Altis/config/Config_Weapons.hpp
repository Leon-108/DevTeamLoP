/*
*    FORMAT:
*        STRING (Conditions) - Must return boolean :
*            String can contain any amount of conditions, aslong as the entire
*            string returns a boolean. This allows you to check any levels, licenses etc,
*            in any combination. For example:
*                "call life_coplevel && license_civ_someLicense"
*            This will also let you call any other function.
*            
*
*    ARRAY FORMAT:
*        0: STRING (Classname): Item Classname
*        1: STRING (Nickname): Nickname that will appear purely in the shop dialog
*        2: SCALAR (Buy price)
*        3: SCALAR (Sell price): To disable selling, this should be -1
*        4: STRING (Conditions): Same as above conditions string
*
*    Weapon classnames can be found here: https://community.bistudio.com/wiki/Arma_3_CfgWeapons_Weapons
*    Item classnames can be found here: https://community.bistudio.com/wiki/Arma_3_CfgWeapons_Items
*
*/
class WeaponShops {
    //Armory Shops
    class gun {
        name = "Billy Joe's Firearms";
        side = "civ";
        conditions = "license_civ_gun";
        items[] = {
            { "hgun_Rook40_F", "", 50000, -1, "" },
            { "hgun_Pistol_01_F", "", 35000, -1, "(395180 in (getDLCs 1))" }, //Apex DLC - PM 9 mm
            { "hgun_Pistol_heavy_02_F", "", 70000, -1, "" },
            { "hgun_ACPC2_F", "", 35000, -1, "" },
            { "SMG_05_F", "", 100000, -1, "(395180 in (getDLCs 1))" }, //Apex DLC - Protector
            { "hgun_PDW2000_F", "", 85000, -1, "" },
			{ "SMG_01_F", "", 100000, -1, "" },
			{ "arifle_SPAR_01_khk_F", "", 200000, -1, "(395180 in (getDLCs 1))" },//SPAR-16 Apex
			{ "arifle_Mk20_F", "", 200000, -1, ""},
			{ "hgun_Pistol_Signal_F", "", 40000, -1, ""}
        };
        mags[] = {
            { "16Rnd_9x21_Mag", "", 1000, -1, "" },
            { "6Rnd_45ACP_Cylinder", "", 1000, -1, "" },
            { "9Rnd_45ACP_Mag", "", 1000, -1, "" },
            { "30Rnd_9x21_Mag", "", 1000, -1, "" },
            { "30Rnd_9x21_Mag_SMG_02", "", 1000, -1, "(395180 in (getDLCs 1))" }, //Apex DLC
            { "10Rnd_9x21_Mag", "", 1000, -1, "(395180 in (getDLCs 1))" }, //Apex DLC
			{ "30Rnd_45ACP_Mag_SMG_01", "", 1000, -1, "" },
			{ "30Rnd_556x45_Stanag_green", "", 1000, -1, "" },
			{ "30Rnd_9x21_Mag_SMG_02", "", 1000, -1, "" },
			{ "6Rnd_GreenSignal_F", "", 1000, -1, "" },
			{ "6Rnd_RedSignal_F", "", 1000, -1, "" }
        };
        accs[] = {
            { "optic_ACO_grn_smg", "", 10000, -1, "" },
			{ "optic_ACO_grn", "", 10000, -1, "" },
			{ "optic_Aco","",10000,-1,""}
        };
    };

    class rebel {
        name = "Mohammed's Jihadi and VIP Shop";
        side = "civ";
        conditions = "license_civ_donator1 || ( license_civ_rebacess && (license_civ_rebel || license_civ_rebel2))";
        items[] = {
			//Legale Waffen für Donator
			{ "hgun_Rook40_F", "", 50000, -1, "" },
            { "hgun_Pistol_01_F", "", 35000, -1, "(395180 in (getDLCs 1))" }, //Apex DLC
            { "hgun_Pistol_heavy_02_F", "", 70000, -1, "" },
            { "hgun_ACPC2_F", "", 35000, -1, "" },
            { "SMG_05_F", "", 100000, -1, "(395180 in (getDLCs 1))" }, //Apex DLC
            { "hgun_PDW2000_F", "", 85000, -1, "" },
			{ "SMG_01_F", "", 100000, -1, "" },
			//Sting BHG
			{ "SMG_02_F","",150000,-1,"license_civ_bhg"},
			//----------
			{ "arifle_SPAR_01_khk_F", "", 200000, -1, "(395180 in (getDLCs 1))" },//SPAR-16 Apex
			{ "arifle_Mk20_F", "", 200000, -1, "" },
			{ "hgun_Pistol_Signal_F", "", 40000, -1, "" },
			//Illegale Waffen Donator und Banditen
            { "arifle_TRG20_F", "", 150000, -1, "license_civ_rebel2 || license_civ_rebel"},
            { "arifle_Katiba_F", "", 310000, -1, "license_civ_rebel2 || license_civ_rebel"},
			{ "arifle_AKS_F", "", 250000, -1, "(395180 in (getDLCs 1)) && (license_civ_rebel2 || license_civ_rebel)"}, //Apex DLC
            { "arifle_CTAR_hex_F", "", 290000, -1, "(395180 in (getDLCs 1)) && (license_civ_rebel2 || license_civ_rebel)"}, //Apex CAR-95
            { "arifle_MX_F", "", 300000, -1, "(license_civ_rebel2 || license_civ_rebel)"},
			{ "arifle_MX_khk_F", "", 300000, -1, "(license_civ_rebel2 || license_civ_rebel)"},
			{ "arifle_MXC_F", "", 295000, -1, "(license_civ_rebel2 || license_civ_rebel)"},
			{ "arifle_MXC_khk_F", "", 300000, -1, "(license_civ_rebel2 || license_civ_rebel)"},
			{ "arifle_MXM_khk_F", "", 750000, -1, "(license_civ_rebel2 || license_civ_rebel)"},
			{ "arifle_MXM_F", "", 750000, -1, "(license_civ_rebel2 || license_civ_rebel)"},
			//MX-SW BHG
			//{ "arifle_MX_SW_F","",1750000,-1,"license_civ_bhg"},
			//---------
			{ "LMG_03_F", "", 1500000, -1, "(395180 in (getDLCs 1)) && (license_civ_rebel2 || license_civ_rebel)"}, //Apex DLC LIM
			{ "arifle_SDAR_F", "", 150000, -1, "(license_civ_rebel2 || license_civ_rebel)"},
            { "srifle_DMR_07_ghex_F", "", 700000, -1, "(license_civ_rebel2 || license_civ_rebel)"},
           	//Illegale Waffen Donator und Rebellen
			{ "srifle_GM6_F","",2300000,-1,"license_civ_rebel2"},
			{ "srifle_DMR_05_tan_F","",2100000,-1,"(332350 in (getDLCs 1)) && license_civ_rebel2"},//Cyrus
			{ "srifle_DMR_04_F","",1700000,-1,"(332350 in (getDLCs 1)) && license_civ_rebel2"},
			{ "srifle_DMR_04_tan_F","",1700000,-1,"(332350 in (getDLCs 1)) && license_civ_rebel2"},//asp1
			{ "srifle_DMR_03_tan_F","",1500000,-1,"(332350 in (getDLCs 1)) && license_civ_rebel2"},//mk1 civ
			{ "LMG_Mk200_F","",1900000,-1,"license_civ_rebel2"},
			{ "srifle_DMR_02_sniper_F","",2000000,-1,"(332350 in (getDLCs 1)) && license_civ_rebel2"}, //mar10
			{ "srifle_DMR_01_F","",450000,-1,"license_civ_rebel2"},
			{ "srifle_DMR_06_olive_F","",1350000,-1,"(332350 in (getDLCs 1)) && license_civ_rebel2"}, //MK14
			{ "srifle_EBR_F","",1000000,-1,"license_civ_rebel2"},
			{ "arifle_SPAR_03_khk_F","",1200000,-1,"(395180 in (getDLCs 1)) && license_civ_rebel2"}, //Spar 17 Apex
			{ "muzzle_snds_H","",25000,-1,"(license_civ_rebel || license_civ_rebel2)"},
			{ "SmokeShellOrange","",1500,-1,"license_civ_rebel2"},
			{ "SmokeShellRed","",1500,-1,"license_civ_rebel2"},
			{ "SmokeShellBlue","",1500,-1,"license_civ_rebel2"},
			{ "SmokeShellPurple","",1500,-1,"license_civ_rebel2"},
			//Zubehoer (Nachtsicht und Rangefinder)
			{ "optic_Hamr","",7500,-1,"license_civ_rebel" },
			{ "optic_AMS","",120000,-1,"(332350 in (getDLCs 1)) && license_civ_rebel2"},
			{ "NVGoggles_OPFOR", "", 5000, -1, "" },
            { "O_NVGoggles_ghex_F", "", 5000, -1, "" },
			{ "rangefinder", "", 5000, -1, "" }, 
            { "Laserdesignator","",1500000, -1,"license_civ_rebel2"}
        };
        mags[] = {
			//Legale Sachen fuer Donator
			{ "16Rnd_9x21_Mag", "", 1000, -1, "" },
            { "6Rnd_45ACP_Cylinder", "", 1000, -1, "" },
            { "9Rnd_45ACP_Mag", "", 1000, -1, "" },
            { "30Rnd_9x21_Mag", "", 1000, -1, "" },
            { "30Rnd_9x21_Mag_SMG_02", "", 1000, -1, "(395180 in (getDLCs 1))" }, //Apex DLC
            { "10Rnd_9x21_Mag", "", 1000, -1, "(395180 in (getDLCs 1))" }, //Apex DLC
			{ "30Rnd_45ACP_Mag_SMG_01", "", 1000, -1, "" },
			{ "30Rnd_556x45_Stanag_green", "", 1000, -1, "" },
			{ "30Rnd_9x21_Mag_SMG_02", "", 1000, -1, "" },
			{ "6Rnd_GreenSignal_F", "", 1000, -1, "" },
			{ "6Rnd_RedSignal_F", "", 1000, -1, "" },
			//Illegale Sachen Banditen
            { "30Rnd_556x45_Stanag_green","",2500,-1,"(license_civ_rebel2 || license_civ_rebel)"},
			{ "30Rnd_65x39_caseless_green","",2500,-1,"(license_civ_rebel2 || license_civ_rebel)"},
			{ "30Rnd_65x39_caseless_green_mag_Tracer","",2500,-1,"(license_civ_rebel2 || license_civ_rebel)"},
			{ "30Rnd_545x39_Mag_F","",2500,-1,"(395180 in (getDLCs 1)) && (license_civ_rebel2 || license_civ_rebel)"}, //Apex AKS74U
			{ "30Rnd_580x42_Mag_F","",2500,-1,"(395180 in (getDLCs 1)) && (license_civ_rebel2 || license_civ_rebel)"}, //Apex CAR-95
			{ "30Rnd_65x39_caseless_mag","",2500,-1,"(license_civ_rebel2 || license_civ_rebel)"},
			{ "30Rnd_65x39_caseless_mag_Tracer","",2500,-1,"(license_civ_rebel2 || license_civ_rebel)"},
			//BHG Muni
			//{ "100Rnd_65x39_caseless_mag","",7000, -1, "license_civ_bhg"},
			//--------------
			{ "200Rnd_556x45_Box_Red_F","",2500,-1,"(395180 in (getDLCs 1)) && (license_civ_rebel2 || license_civ_rebel)"},            //LMI Apex
			{ "20Rnd_556x45_UW_mag","",2500,-1,"(license_civ_rebel2 || license_civ_rebel)"},
			{ "30Rnd_556x45_Stanag_green","",2500,-1,"(license_civ_rebel2 || license_civ_rebel)"},
			{ "30Rnd_556x45_Stanag_Tracer_Red","",2500,-1,"(license_civ_rebel2 || license_civ_rebel)"},
			{ "30Rnd_556x45_Stanag_Tracer_Green","",2500,-1,"(license_civ_rebel2 || license_civ_rebel)"},
			{ "30Rnd_556x45_Stanag_Tracer_Yellow","",2500,-1,"(license_civ_rebel2 || license_civ_rebel)"},
			{ "20Rnd_650x39_Cased_Mag_F","",2500,-1,"(395180 in (getDLCs 1)) && (license_civ_rebel2 || license_civ_rebel)"}, //CMR Apex
			//Illegale Sachen Rebellen
			{ "5Rnd_127x108_Mag","",5000,-1,"license_civ_rebel2"},
			{ "10Rnd_93x64_DMR_05_Mag","",5000,-1,"license_civ_rebel2"},//Cyrus
			{ "10Rnd_127x54_Mag","",5000,-1,"license_civ_rebel2"},
			{ "20Rnd_762x51_Mag","",5000,-1,"license_civ_rebel2"},//mk1
			{ "200Rnd_65x39_cased_Box","",5000,-1,"license_civ_rebel2"},
			{ "200Rnd_65x39_cased_Box_Tracer","",5000,-1,"license_civ_rebel2"},
			{ "10Rnd_338_Mag","",5000,-1,"license_civ_rebel2"},//mar10
			{ "10Rnd_762x54_Mag","",5000,-1,"license_civ_rebel2"}
        };
        accs[] = {
			//Visire Banditen
            { "optic_MRCO","",15000,-1,"(license_civ_rebel || license_civ_rebel2)"},
			{ "optic_Arco","",25000,-1,"(license_civ_rebel || license_civ_rebel2)"},
			{ "optic_ACO_grn","",15000,-1,"(license_civ_rebel || license_civ_rebel2)"},
			{ "optic_ACO_grn_smg", "", 10000, -1, "(license_civ_rebel || license_civ_rebel2)" },
			{ "optic_Holosight","",12500,-1,"(license_civ_rebel || license_civ_rebel2)"},
			{ "optic_Hamr","",7500,-1,"(license_civ_rebel || license_civ_rebel2)"},
			{ "optic_ERCO_khk_F","",25000,-1,"(license_civ_rebel || license_civ_rebel2)"},
			{ "optic_ERCO_snd_F","",25000,-1,"(license_civ_rebel || license_civ_rebel2)"},
			//Visire Rebellen
			{ "optic_SOS","",180000,-1,"license_civ_rebel2"},
			{ "optic_AMS","",120000,-1,"(332350 in (getDLCs 1)) && license_civ_rebel2"},
			{ "optic_AMS_khk","",120000,-1,"(332350 in (getDLCs 1)) && license_civ_rebel2"},
			{ "optic_AMS_snd","",120000,-1,"(332350 in (getDLCs 1)) && license_civ_rebel2"},
			{ "optic_KHS_blk","",120000,-1,"(332350 in (getDLCs 1)) && license_civ_rebel2"},
			{ "optic_KHS_hex","",120000,-1,"(332350 in (getDLCs 1)) && license_civ_rebel2"},
			{ "optic_KHS_old","",120000,-1,"(332350 in (getDLCs 1)) && license_civ_rebel2"},
			{ "optic_KHS_tan","",120000,-1,"(332350 in (getDLCs 1)) && license_civ_rebel2"},
			{ "optic_DMS","",90000,-1,"(license_civ_rebel2)"},
			//Zweibeine 
			{ "bipod_01_F_blk","",50000,-1,"license_civ_rebel || license_civ_rebel2"},
			{ "bipod_01_F_mtp","",50000,-1,"license_civ_rebel || license_civ_rebel2"},
			{ "bipod_01_F_snd","",50000,-1,"license_civ_rebel || license_civ_rebel2"},
			{ "bipod_02_F_blk","",50000,-1,"license_civ_rebel || license_civ_rebel2"},
			{ "bipod_02_F_hex","",50000,-1,"license_civ_rebel || license_civ_rebel2"},
			{ "bipod_02_F_tan","",50000,-1,"license_civ_rebel || license_civ_rebel2"},
			{ "bipod_03_F_blk","",50000,-1,"license_civ_rebel || license_civ_rebel2"},
			{ "bipod_03_F_oli","",50000,-1,"license_civ_rebel || license_civ_rebel2"},
			//Schallis Banditen
			{ "muzzle_snds_acp","",50000,-1,"(license_civ_rebel || license_civ_rebel2)"},
			{ "muzzle_snds_H","",50000,-1,"(license_civ_rebel || license_civ_rebel2)"},
			{ "muzzle_snds_93mmg","",50000,-1,"(license_civ_rebel || license_civ_rebel2)"},
			{ "muzzle_snds_M","",50000,-1,"(license_civ_rebel || license_civ_rebel2)"},
			{ "muzzle_snds_H_MG","",50000,-1,"(license_civ_rebel || license_civ_rebel2)"},
			{ "muzzle_snds_m_khk_F","",50000,-1,"(license_civ_rebel || license_civ_rebel2)"}, 	
			{ "muzzle_snds_65_TI_blk_F","",50000,-1,"(license_civ_rebel || license_civ_rebel2)"},
			{ "muzzle_snds_58_wdm_F","",50000,-1,"(license_civ_rebel || license_civ_rebel2)"},
			{ "muzzle_snds_65_TI_ghex_F","",50000,-1,"(license_civ_rebel || license_civ_rebel2)"},
			{ "muzzle_snds_65_TI_hex_F","",50000,-1,"(license_civ_rebel || license_civ_rebel2)"},
			//Schallis Rebellen
			{ "muzzle_snds_B","",50000,-1,"(license_civ_rebel || license_civ_rebel2)"},
			{ "muzzle_snds_B_snd_F","",50000,-1,"(license_civ_rebel || license_civ_rebel2)"},
			{ "muzzle_snds_B_khk_F","",50000,-1,"(license_civ_rebel || license_civ_rebel2)"},
			{ "muzzle_snds_H_MG_khk_F","",50000,-1,"(license_civ_rebel || license_civ_rebel2)"},
			{ "muzzle_snds_H_MG_blk_F","",50000,-1,"(license_civ_rebel || license_civ_rebel2)"},
			{ "muzzle_snds_338_black","",50000,-1,"(license_civ_rebel || license_civ_rebel2)"},
			//Aufsaetze
			{ "acc_flashlight","",1000,-1,""},
			{ "acc_pointer_IR","",2500,-1,""}
        };
    };

    class kartell {
        name = "Kartell Shop";
        side = "civ";
        conditions = "license_civ_kartell";
        items[] = {
            { "arifle_AK12_F","",800000,-1,""},
			{ "arifle_AKM_F","",400000,-1,""},
			{ "arifle_SPAR_01_snd_F","",75000,-1,""},
			{ "arifle_SPAR_03_snd_F","",800000,-1,""},
			{ "arifle_MX_SW_F","",1600000,-1,""},
			{ "arifle_CTAR_hex_F","",220000,-1,"(395180 in (getDLCs 1))"},  //Apex CAR-95
			{ "srifle_DMR_03_woodland_F","",1000000,-1,"(332350 in (getDLCs 1))"},
			{ "srifle_DMR_03_multicam_F","",1000000,-1,"(332350 in (getDLCs 1))"},
			{ "srifle_DMR_05_hex_F","",1500000,-1,"(332350 in (getDLCs 1))"},//Cyrus
			{ "srifle_DMR_07_hex_F","",450000,-1,""},
			{ "srifle_GM6_ghex_F","",1600000,-1,""},
			{ "hgun_Rook40_F","",16000,-1,""},
			{ "hgun_ACPC2_F","",70000,-1,""}
			//{ "hgun_Pistol_heavy_01_F","Gummi Pistole",2000,-1,""},	//Tazer nicht aktiv!
        };
        mags[] = {
            { "30Rnd_762x39_Mag_F","",2000,-1,""},
			{ "30Rnd_556x45_Stanag_green","",2000,-1,""},
			{ "20Rnd_762x51_Mag","",2000,-1,""},
			{ "30Rnd_580x42_Mag_F","",2000,-1,"(395180 in (getDLCs 1))"}, //Apex CAR-95
			{ "20Rnd_762x51_Mag","",2000,-1,""},
			{ "10Rnd_93x64_DMR_05_Mag","",5000,-1,""},//Cyrus
			{ "20Rnd_650x39_Cased_Mag_F","",2000,-1,""},
			{ "5Rnd_127x108_Mag","",2000,-1,""},
			{ "30Rnd_9x21_Mag","",1000,-1,""},
			{ "100Rnd_65x39_caseless_mag","",7000, -1, ""},
			{ "9Rnd_45ACP_Mag","",1000,-1,""}
			//{ "11Rnd_45ACP_Mag","Gummigeschosse",100,-1,""},			//Tazer nicht aktiv!
        };
        accs[] = {
           	{ "optic_KHS_blk","",20000,-1,"(332350 in (getDLCs 1))"},
			{ "optic_KHS_hex","",20000,-1,"(332350 in (getDLCs 1))"},
			{ "optic_AMS_snd","",20000,-1,"(332350 in (getDLCs 1))"},
			{ "optic_AMS","",20000,-1,"(332350 in (getDLCs 1))"},
			{ "muzzle_snds_acp","",5000,-1,""},
			{ "muzzle_snds_B","",5000,-1,""},
			{ "muzzle_snds_m_snd_F","",5000,-1,""},
			{ "muzzle_snds_B_snd_F","",5000,-1,""},					//Sound Suppressor (7.62 mm Sand)
			{ "muzzle_snds_H","",5000,-1,""},							//Sound Suppressor (6.5 mm, Black)
			{ "muzzle_snds_H_khk_F","",5000,-1,""},					//Sound Suppressor (6.5 mm, Khaki)
			{ "muzzle_snds_H_snd_F","",5000,-1,""}					//Sound Suppressor (6.5 mm, Sand)
			//{ "optic_MRD","ACP Visier",10000]					//Tazer nicht aktiv!
        };
    };
	
	//Admin Shop
	class admin1 {
        name = "Admin Shop";
        side = "civ";
        conditions = "license_civ_admin1 && call life_adminlevel >= 5";
        items[] = {
            //Pistol
			{ "hgun_Pistol_heavy_01_F","",100,100,""},					//4-five .45 ACP
			{ "hgun_P07_snds_F","",100,100,""},							//P07
			{ "hgun_Pistol_Signal_F","",100,100,""},					//Signal Pistol
			{ "hgun_Pistol_heavy_02_F","",100,100,""},					//Zubr .45 ACP
			{ "hgun_Pistol_01_F","",100,100,"(395180 in (getDLCs 1))"},//PM09 Apex
			//PDWS
			{ "hgun_PDW2000_F","",100,100,""},							//PDW
			{ "SMG_02_F","",100,100,""}, 								//Sting
			{ "SMG_05_F","",100,100,"(395180 in (getDLCs 1))"}, 								//Protector
			//Rifles 5.56 mm
			{ "arifle_TRG20_F","",100,100,""}, 							//TRG20
			{ "arifle_TRG21_F","",100,100,""}, 							//TRG21
			{ "arifle_Mk20_F","",100,100,""},      			  			//MK20 Camo
			{ "arifle_Mk20_plain_F","",100,100,""},      		  		//MK20 Plain
			{ "arifle_Mk20C_F","",100,100,""},      			  		//MK20C Camo 
			{ "arifle_Mk20C_plain_F","",100,100,""},      				//MK20C Plain
			{ "arifle_SPAR_01_khk_F","",100,100,"(395180 in (getDLCs 1))"},      		  		//Spar 16 Khaki
			{ "arifle_SPAR_01_snd_F","",100,100,"(395180 in (getDLCs 1))"},      		  		//Spar 16 Sand
			{ "arifle_SPAR_01_blk_F","",100,100,"(395180 in (getDLCs 1))"},      		  		//Spar 16 Schwarz
			{ "arifle_SPAR_01_GL_khk_F","",100,100,"(395180 in (getDLCs 1))"},     			//Spar 16 GL Khaki
			{ "arifle_SPAR_01_GL_snd_F","",100,100,"(395180 in (getDLCs 1))"},     			//Spar 16 GL Sand
			{ "arifle_SPAR_01_GL_blk_F","",100,100,"(395180 in (getDLCs 1))"},     			//Spar 16 GL Schwarz
			{ "arifle_SPAR_02_khk_F","",100,100,"(395180 in (getDLCs 1))"},      		  		//Spar 16S Khaki
			{ "arifle_SPAR_02_snd_F","",100,100,"(395180 in (getDLCs 1))"},      		  		//Spar 16S Sand
			{ "arifle_SPAR_02_blk_F","",100,100,"(395180 in (getDLCs 1))"},      		  		//Spar 16S Schwarz
			{ "arifle_SDAR_F","",100,100,""},												//SDAR
			{ "arifle_AKS_F","",100,100,"(395180 in (getDLCs 1))"},							//AKS-74U
			{ "arifle_CTAR_blk_F","",100,100,"(395180 in (getDLCs 1))"},						//CAR-95 Schwarz
			{ "arifle_CTAR_hex_F","",100,100,"(395180 in (getDLCs 1))"},						//CAR-95 Hex
			{ "arifle_CTAR_ghex_F","",100,100,"(395180 in (getDLCs 1))"},						//CAR-95 Green Hex
			//Rifles 6.5 mm
			{ "arifle_Katiba_F","",100,100,""}, 						//Katiba
			{ "arifle_MX_F","",100,100,""},								//MX Sand
			{ "arifle_MX_Black_F","",100,100,""},						//MX Black
			{ "arifle_MXC_F","",100,100,""},							//MXC Sand
			{ "arifle_MXC_Black_F","",100,100,""},						//MXC Black
			{ "arifle_MXM_F","",100,100,""},							//MXM Sand
			{ "arifle_MXM_Black_F","",100,100,""},						//MXM Black
			{ "arifle_MX_GL_F","",100,100,""},							//MX 3GL Sand
			{ "arifle_MX_GL_Black_F","",100,100,""},					//MX 3GL Black
			{ "arifle_MX_SW_F","",100,100,""},							//MX SW Sand
			{ "arifle_MX_SW_Black_F","",100,100,""},					//MX SW Schwarz
			{ "srifle_DMR_07_blk_F","",100,100,"(395180 in (getDLCs 1))"},						//CMR-76 Schwarz
			{ "srifle_DMR_07_hex_F","",100,100,"(395180 in (getDLCs 1))"},						//CMR-76 Hex
			{ "srifle_DMR_07_ghex_F","",100,100,"(395180 in (getDLCs 1))"},					//CMR-76 Green Hex
			//Rifles 7.62 mm
			{ "srifle_DMR_01_F","",100,100,""},							//Rahim
			{ "srifle_EBR_F","",100,100,""},							//MK18
			{ "srifle_DMR_03_F","",100,100,"(332350 in (getDLCs 1))"},							//MK1 Schwarz
			{ "srifle_DMR_03_khaki_F","",100,100,"(332350 in (getDLCs 1))"},					//MK1 Khaki
			{ "srifle_DMR_03_tan_F","",100,100,"(332350 in (getDLCs 1))"},						//MK1 Sand
			{ "srifle_DMR_03_multicam_F","",100,100,"(332350 in (getDLCs 1))"},				//MK1 Camo
			{ "srifle_DMR_03_woodland_F","",100,100,"(332350 in (getDLCs 1))"},				//MK1 Woodland
			{ "srifle_DMR_06_camo_F","",100,100,"(332350 in (getDLCs 1))"},					//MK14 Camo
			{ "srifle_DMR_06_olive_F","",100,100,"(332350 in (getDLCs 1))"},					//MK14 Olive
			{ "arifle_AK12_F","",100,100,"(395180 in (getDLCs 1))"},							//AK-12
			{ "arifle_AK12_GL_F","",100,100,"(395180 in (getDLCs 1))"},						//AK-12 GL
			{ "arifle_AKM_F","",100,100,""},							//AKM
			{ "arifle_SPAR_03_khk_F","",100,100,"(395180 in (getDLCs 1))"},      		  		//Spar 17 Khaki
			{ "arifle_SPAR_03_snd_F","",100,100,"(395180 in (getDLCs 1))"},      		  		//Spar 17 Sand
			{ "arifle_SPAR_03_blk_F","",100,100,"(395180 in (getDLCs 1))"},      		  		//Spar 17 Schwarz
			//Sniper
			{ "srifle_GM6_F","",100,100,""},							//Lynx Schwarz
			{ "srifle_GM6_camo_F","",100,100,""},						//Lynx Camo
			{ "srifle_GM6_ghex_F","",100,100,""},						//Lynx Green Hex
			{ "srifle_LRR_F","",100,100,""},							//LRR Schwarz
			{ "srifle_LRR_tna_F","",100,100,""},						//LRR Tropic
			{ "srifle_LRR_camo_F","",100,100,""},						//LRR Camo
			{ "srifle_DMR_04_F","",100,100,"(332350 in (getDLCs 1))"},							//ASP-1 Schwarz
			{ "srifle_DMR_04_Tan_F","",100,100,"(332350 in (getDLCs 1))"},						//ASP-1 Tan
			{ "srifle_DMR_05_blk_F","",100,100,"(332350 in (getDLCs 1))"},						//Cyrus Schwarz
			{ "srifle_DMR_05_hex_F","",100,100,"(332350 in (getDLCs 1))"},						//Cyrus Hex
			{ "srifle_DMR_05_tan_F","",100,100,"(332350 in (getDLCs 1))"},						//Cyrus Tan
			{ "srifle_DMR_02_F","",100,100,"(332350 in (getDLCs 1))"},							//MAR-10 Schwarz
			{ "srifle_DMR_02_camo_F","",100,100,"(332350 in (getDLCs 1))"},					//MAR-10 Camo
			{ "srifle_DMR_02_sniper_F","",100,100,"(332350 in (getDLCs 1))"},					//MAR-10 Sand
			//LMG
			{ "LMG_03_F","",100,100,"(395180 in (getDLCs 1))"},                   				//LIM Apex
			{ "arifle_CTARS_blk_F","",100,100,"(395180 in (getDLCs 1))"},            			//CAR-95-1 Black
			{ "arifle_CTARS_hex_F","",100,100,"(395180 in (getDLCs 1))"},            			//CAR-95-1 Hex
			{ "arifle_CTARS_ghex_F","",100,100,"(395180 in (getDLCs 1))"},            			//CAR-95-1 Green Hex
			{ "LMG_Mk200_F","",100,100,""},								//MK200
			{ "LMG_Zafir_F","",100,100,"call life_adminlevel >= 4"},				//Zafir
			//Smoke
			{ "1Rnd_Smoke_Grenade_shell","",100,100,""},
			{ "1Rnd_SmokePurple_Grenade_shell","",100,100,""},
			{ "1Rnd_SmokeYellow_Grenade_shell","",100,100,""},
			{ "1Rnd_SmokeGreen_Grenade_shell","",100,100,""},
			{ "1Rnd_SmokeBlue_Grenade_shell","",100,100,""},
			{ "1Rnd_SmokeOrange_Grenade_shell","",100,100,""},
			{ "1Rnd_SmokeRed_Grenade_shell","",100,100,""},
			//Smoke Grenade
			{ "SmokeShell","",100,100,""},
			{ "SmokeShellYellow","",100,100,""},
			{ "SmokeShellGreen","",100,100,""},
			{ "SmokeShellRed","",100,100,""},
			{ "SmokeShellPurple","",100,100,""},
			{ "SmokeShellOrange","",100,100,""},
			{ "SmokeShellBlue","",100,100,""},
			//Missles
			{ "launch_RPG32_F","",100,100,""},
			{ "launch_NLAW_F","",100,100,""},
			{ "launch_Titan_short_F","",100,100,""},
			{ "launch_Titan_F","",100,100,""},
			//Detonator
			{ "DemoCharge_Remote_Mag","",100,100,"call life_adminlevel >= 4"},
			{ "SatchelCharge_Remote_Mag","",100,100,"call life_adminlevel >= 4"},
			{ "ATMine_Range_Mag","",100,100,"call life_adminlevel >= 4"},
			{ "ClaymoreDirectionalMine_Remote_Mag","",100,100,"call life_adminlevel >= 4"},
			{ "APERSMine_Range_Mag","",100,100,"call life_adminlevel >= 4"},
			{ "APERSBoundingMine_Range_Mag","",100,100,"call life_adminlevel >= 4"},
			{ "SLAMDirectionalMine_Wire_Mag","",100,100,"call life_adminlevel >= 4"},
			{ "APERSTripMine_Wire_Mag","",100,100,"call life_adminlevel >= 4"},
			{ "HandGrenade_Stone","",100,100,""},
			{ "HandGrenade","",100,100,"call life_adminlevel >= 4"},
			{ "MiniGrenade","",100,100,"call life_adminlevel >= 4"},
			{ "B_IR_Grenade","",100,100,"call life_adminlevel >= 4"},
			{ "O_IR_Grenade","",100,100,"call life_adminlevel >= 4"},
			{ "I_IR_Grenade","",100,100,"call life_adminlevel >= 4"}
        };
        mags[] = {
            { "11Rnd_45ACP_Mag","",100,100,""},
			{ "30Rnd_9x21_Mag","",100,100,""},
			{ "6Rnd_GreenSignal_F","",100,100,""},
			{ "6Rnd_RedSignal_F","",100,100,""},
			{ "6Rnd_45ACP_Cylinder","",100,100,""},
			{ "10Rnd_9x21_Mag","",100,100,""},
			{ "16Rnd_9x21_Mag","",100,100,""},
			{ "30Rnd_9x21_Mag","",100,100,""},
			{ "30Rnd_9x21_Mag_SMG_02","",100,100,""},
			{ "30Rnd_556x45_Stanag","",100,100,""},
			{ "30Rnd_556x45_Stanag_red","",100,100,""},
			{ "30Rnd_556x45_Stanag_green","",100,100,""},
			{ "30Rnd_556x45_Stanag_Tracer_Red","",100,100,""},
			{ "30Rnd_556x45_Stanag_Tracer_Green","",100,100,""},
			{ "30Rnd_556x45_Stanag_Tracer_Yellow","",100,100,""},
			{ "150Rnd_556x45_Drum_Mag_F","",100,100,""},
			{ "150Rnd_556x45_Drum_Mag_Tracer_F","",100,100,""},
			{ "30Rnd_580x42_Mag_F","",100,100,""},
			{ "30Rnd_580x42_Mag_Tracer_F","",100,100,""},
			{ "20Rnd_556x45_UW_mag","",100,100,""},
			{ "30Rnd_65x39_caseless_mag","",100,100,""},
			{ "30Rnd_65x39_caseless_mag_Tracer","",100,100,""},
			{ "30Rnd_545x39_Mag_F","",100,100,""},
			{ "30Rnd_545x39_Mag_Tracer_F","",100,100,""},
			{ "30Rnd_65x39_caseless_green","",100,100,""},
			{ "30Rnd_65x39_caseless_green_mag_Tracer","",100,100,""},
			{ "100Rnd_65x39_caseless_mag","",100,100,""},
			{ "100Rnd_65x39_caseless_mag_Tracer","",100,100,""},
			{ "20Rnd_650x39_Cased_Mag_F","",100,100,""},
			{ "10Rnd_762x51_Mag","",100,100,""},
			{ "20Rnd_762x51_Mag","",100,100,""},
			{ "30Rnd_762x39_Mag_F","",100,100,""},
			{ "5Rnd_127x108_Mag","",100,100,""},
			{ "5Rnd_127x108_APDS_Mag","",100,100,""},
			{ "7Rnd_408_Mag","",100,100,""},
			{ "10Rnd_127x54_Mag","",100,100,""},
			{ "10Rnd_93x64_DMR_05_Mag","",100,100,""},
			{ "10Rnd_338_Mag","",100,100,""},
			{ "200Rnd_556x45_Box_F","",100,100,""},
			{ "200Rnd_556x45_Box_Tracer_F","LIM Tazer",100,100,""},
			{ "200Rnd_556x45_Box_Red_F","",100,100,""},
			{ "200Rnd_556x45_Box_Tracer_Red_F","",100,100,""},
			{ "100Rnd_580x42_Mag_F","",100,100,""},
			{ "200Rnd_65x39_cased_Box","",100,100,""},
			{ "200Rnd_65x39_cased_Box_Tracer","",100,100,""},
			{ "150Rnd_762x54_Box","",100,100,"call life_adminlevel >= 4"},
			{ "150Rnd_762x54_Box_Tracer","",100,100,"call life_adminlevel >= 4"},
			//Missles
			{ "RPG32_F","",100,100,"call life_adminlevel >= 4"},
			{ "RPG32_HE_F","",100,100,"call life_adminlevel >= 4"},
			{ "NLAW_F","",100,100,"call life_adminlevel >= 4"},
			{ "Titan_AT","",100,100,"call life_adminlevel >= 4"},
			{ "Titan_AP","",100,100,"call life_adminlevel >= 4"},
			{ "Titan_AA","",100,100,"call life_adminlevel >= 4"}
        };
        accs[] = {
           //Attachments
			{ "acc_pointer_IR","",100,100,""},
			{ "acc_flashlight","",100,100,""},
			//Optics
			{ "optic_MRD","",100,100,""},								//MRD
			{ "optic_Aco","",100,100,""},								//ACO (Red)
			{ "optic_ACO_grn","",100,100,""},							//ACO (Green)
			{ "optic_Holosight","",100,100,""},						//Mk17 Holosight
			{ "optic_Holosight_blk_F","",100,100,""},					//Mk17 Holosight Black
			{ "optic_Holosight_khk_F","",100,100,""},					//Mk17 Holosight Khaki
			{ "optic_Hamr","",100,100,""},								//RCO Schwarz
			{ "optic_Hamr_khk_F","",100,100,""},						//RCO Khaki
			{ "optic_Arco","",100,100,""},								//ARCO
			{ "optic_Arco_blk_F","",100,100,""},						//ARCO Black
			{ "optic_Arco_ghex_F","",100,100,""},						//ARCO Green Hex
			{ "optic_ERCO_blk_F","",100,100,""},						//ERCO Black
			{ "optic_ERCO_khk_F","",100,100,""},						//ERCO Khaki
			{ "optic_ERCO_snd_F","",100,100,""},						//ERCO Sand
			{ "optic_MRCO","",100,100,""},								//MRCO
			{ "optic_DMS","",100,100,""},								//DMS
			{ "optic_DMS_ghex_F","",100,100,""},						//DMS Green Hex
			{ "optic_SOS","",100,100,""},								//MOS Black
			{ "optic_SOS_khk_F","",100,100,""},						//MOS Khaki
			{ "optic_AMS","",100,100,"(332350 in (getDLCs 1))"}, 								//AMS Black
			{ "optic_AMS_khk","",100,100,"(332350 in (getDLCs 1))"}, 							//AMS Khaki
			{ "optic_AMS_snd","",100,100,"(332350 in (getDLCs 1))"}, 							//AMS Sand
			{ "optic_KHS_blk","",100,100,"(332350 in (getDLCs 1))"}, 							//Kahali Black
			{ "optic_KHS_hex","",100,100,"(332350 in (getDLCs 1))"}, 							//Kahlia Hex
			{ "optic_KHS_old","",100,100,"(332350 in (getDLCs 1))"}, 							//Kahlia Old
			{ "optic_KHS_tan","",100,100,"(332350 in (getDLCs 1))"}, 							//Kahlia Tan
			{ "optic_LRPS","",100,100,""},								//LRPS
			{ "optic_NVS","",100,100,""},								//NVS
			{ "optic_Nightstalker","",100,100,""},						//Nightstalker
			{ "optic_tws","",100,100,""},								//TWS
			//Sound Supp
			{ "muzzle_snds_acp","",100,100,""},						//Sound Suppressor (.45 ACP)
			{ "muzzle_snds_L","",100,100,""},							//Sound Suppressor (9 mm)
			{ "muzzle_snds_M","",100,100,""},							//Sound Suppressor (5.56 mm Black)
			{ "muzzle_snds_m_snd_F","",100,100,""},					//Sound Suppressor (5.56 mm Sand)
			{ "muzzle_snds_m_khk_F","",100,100,""},					//Sound Suppressor (5.56 mm Khaki)
			{ "muzzle_snds_58_blk_F","",100,100,""},					//Sound Suppressor (5.8 mm, Black)
			{ "muzzle_snds_H","",100,100,""},							//Sound Suppressor (6.5 mm, Black)
			{ "muzzle_snds_H_khk_F","",100,100,""},					//Sound Suppressor (6.5 mm, Khaki)
			{ "muzzle_snds_H_snd_F","",100,100,""},					//Sound Suppressor (6.5 mm, Sand)
			{ "muzzle_snds_B","",100,100,""},							//Sound Suppressor (7.62 mm Black)
			{ "muzzle_snds_B_khk_F","",100,100,""},					//Sound Suppressor (7.62 mm Khaki)
			{ "muzzle_snds_B_snd_F","",100,100,""},					//Sound Suppressor (7.62 mm Sand)
			{ "muzzle_snds_338_black","",100,100,""},					//Sound Suppressor (.338, Black)
			{ "muzzle_snds_338_green","",100,100,""},					//Sound Suppressor (.338, Green)
			{ "muzzle_snds_338_sand","",100,100,""},					//Sound Suppressor (.338, Sand)
			{ "muzzle_snds_93mmg","",100,100,""},						//Sound Suppressor (9.3mm, Black)
			{ "muzzle_snds_93mmg_tan","",100,100,""},					//Sound Suppressor (9.3mm, Tan)
			{ "muzzle_snds_H_MG","",100,100,""},						//Sound Suppressor LMG (6.5 mm)
			{ "Laserdesignator","",100,100,""},
			//Bipod
			{ "bipod_01_F_blk","",100,100,""},
			{ "bipod_01_F_mtp","",100,100,""},
			{ "bipod_01_F_snd","",100,100,""},
			{ "bipod_02_F_blk","",100,100,""},
			{ "bipod_02_F_hex","",100,100,""},
			{ "bipod_02_F_tan","",100,100,""},
			{ "bipod_03_F_blk","",100,100,""},
			{ "bipod_03_F_oli","",100,100,""}
        };
    };
	
    //Basic Shops
    class genstore {
        name = "Altis General Store";
        side = "civ";
        conditions = "";
        items[] = {
            { "Binocular", "", 150, -1, "" },
            { "ItemGPS", "", 100, -1, "" },
            { "ItemMap", "", 100, -1, "" },
            { "ItemCompass", "", 100, -1, "" },
            { "ItemWatch", "", 250, -1, "" },
            { "FirstAidKit", "", 150, -1, "" },
			{ "ToolKit","",250, -1, ""},
            { "NVGoggles", "", 2000, -1, "" },
			{ "NVGoggles_tna_F", "", 2000, -1, "" },
            { "Chemlight_red", "", 1500, -1, "" },
            { "Chemlight_yellow", "", 1500, -1, "" },
            { "Chemlight_green", "", 1500, -1, "" },
            { "Chemlight_blue", "", 1500, -1, "" }
        };
        mags[] = {};
        accs[] = {};
    };

    class f_station_store {
        name = "Altis Fuel Station Store";
        side = "";
        conditions = "";
        items[] = {
            { "Binocular", "", 750, -1, "" },
            { "ItemGPS", "", 500, -1, "" },
            { "ItemMap", "", 250, -1, "" },
            { "ItemCompass", "", 250, -1, "" },
            { "ItemWatch", "", 250, -1, "" },
            { "FirstAidKit", "", 150, -1, "" },
			{ "ToolKit","",250, -1, ""},
            { "NVGoggles", "", 2000, -1, "" },
			{ "NVGoggles_tna_F", "", 2000, -1, "" },
            { "Chemlight_red", "", 1500, -1, "" },
            { "Chemlight_yellow", "", 1500, -1, "" },
            { "Chemlight_green", "", 1500, -1, "" },
            { "Chemlight_blue", "", 1500, -1, "" }
        };
        mags[] = {};
        accs[] = {};
    };

    //Cop Shops
    class cop_shop {
        name = "PPD Shop";
        side = "cop";
        conditions = "";
        items[] = {
            { "hgun_Pistol_heavy_01_F","Taser Pistole",2000, 2000, "call life_coplevel >=1"},
			{ "hgun_P07_snds_F","Scharfe Pistole",10000, 10000, "call life_coplevel >=2"},
			{ "hgun_Pistol_Signal_F","",10000, 10000, "call life_coplevel >=2"},
			{ "SMG_02_F","",100000, 100000, "call life_coplevel >=1"},																								//[A] Protector
			{ "SMG_05_F","",100000, 100000, "(call life_coplevel >=1) && (395180 in (getDLCs 1))"},
			{ "SMG_01_F","",100000, 100000, "call life_coplevel >=1"},
			//Auto-Rifles
			{ "arifle_TRG20_F","",100000, 100000, "call life_coplevel >=1"},
			{ "arifle_SDAR_F","",100000, 100000, "call life_coplevel >=2"}, 																						//SDAR
			{ "arifle_SPAR_01_blk_F","",100000, 100000, "(call life_coplevel >=2) && (395180 in (getDLCs 1))"},    													//[A] Spar 16
			{ "arifle_SPAR_01_GL_blk_F","",100000, 100000, "(call life_coplevel >=2) && (395180 in (getDLCs 1))"}, 													//[A] Spar 16
			{ "arifle_CTAR_blk_F","",100000, 100000, "(call life_coplevel >=2) && (395180 in (getDLCs 1))"},       													//[A] CAR-95
			{ "arifle_CTAR_GL_blk_F","",100000, 100000, "(call life_coplevel >=2) && (395180 in (getDLCs 1))"},    													//[A] CAR-95
			{ "srifle_DMR_07_blk_F","",100000, 100000, "(call life_coplevel >=3) && (395180 in (getDLCs 1))"},        												//[A] CMR
			{ "arifle_MXC_Black_F","",100000, 100000, "call life_coplevel >=2"},																					//MXC
			{ "arifle_MX_Black_F","",100000, 100000, "call life_coplevel >=3"},																						//MX
			{ "arifle_MX_GL_Black_F","",100000, 100000, "call life_coplevel >=3"},																					//MX 3GL
			{ "arifle_Katiba_F","",100000, 100000, "call life_coplevel >=4"},																						//Katiba	
			{ "arifle_Katiba_GL_F","",100000, 100000, "call life_coplevel >=4"},																					//Katiba 3GL
            { "arifle_MXM_Black_F","",100000, 100000, "call life_coplevel >=4"},																					//MXM
			{ "arifle_Mk20_F","",100000, 100000, "call life_coplevel >=9"},																							//Mk20
			{ "arifle_MX_SW_Black_F","",100000, 100000, "(call life_coplevel >=5) || license_cop_swatcmd || license_cop_swat || license_cop_swatazubi"},			//MX-SW
			{ "arifle_AK12_F","",100000,100000,"(395180 in (getDLCs 1))&& (license_cop_swatcmd || license_cop_swat)"},												//[A] AK-12
			{ "arifle_AK12_GL_F","",100000,100000,"(395180 in (getDLCs 1)) && (license_cop_swatcmd || license_cop_swat)"},											//[A] AK-12 GL
			
			//DMRs
			{ "srifle_DMR_04_F","",100000, 100000, "(332350 in (getDLCs 1)) && ((call life_coplevel >=6) || license_cop_swatcmd || license_cop_swat)"},            	//[M] ASP 1 schwarz
			{ "srifle_DMR_01_F","",100000, 100000, "call life_coplevel >=4"},																						//Rahim			
			{ "srifle_EBR_F","",100000, 100000, "call life_coplevel >=5 || license_cop_swatcmd || license_cop_swat || license_cop_swatazubi"},             			//Mk18
			{ "arifle_SPAR_03_blk_F","",100000, 100000, "(395180 in (getDLCs 1)) && ((call life_coplevel >=5) || license_cop_swatcmd || license_cop_swat)"},		//[A] Spar 17
			{ "srifle_DMR_06_olive_F","",100000, 100000, "(332350 in (getDLCs 1)) && ((call life_coplevel >=6) || license_cop_swatcmd || license_cop_swat)"},       //[M] mk14
			{ "srifle_DMR_03_F","",100000, 100000, "(332350 in (getDLCs 1)) && ((call life_coplevel >=7) || license_cop_swatcmd || license_cop_swat)"},            	//[M] mk1 cop
			{ "srifle_DMR_02_F","",100000, 100000, "(332350 in (getDLCs 1)) && ((call life_coplevel >=7) || license_cop_swatcmd)"},         						//[M] mar10 cop
			{ "srifle_DMR_02_camo_F","",100000,100000,"(call life_coplevel >=8) && (332350 in (getDLCs 1))"},														//[M] mar10 cop
			{ "srifle_DMR_05_blk_F","",100000, 100000, "(332350 in (getDLCs 1)) && ((call life_coplevel >=8) || license_cop_swatcmd)" },         					//[M] Cyrus
			//LMGs
			{ "LMG_03_F","",100000, 100000, "(395180 in (getDLCs 1)) && ((call life_coplevel >=6) || license_cop_swatcmd || license_cop_swat)"},                   	//[A] LIM
			{ "LMG_Mk200_F","",100000, 100000, "call life_coplevel >=8 || license_cop_swatcmd"},																	//MK-200
			//Sniper-Rifles
			{ "srifle_LRR_F","",100000, 100000, "call life_coplevel >=8 || license_cop_swatcmd"},																	//LRR black
            { "srifle_LRR_tna_F","",100000, 100000, "call life_coplevel >=8 || license_cop_swatcmd"},																//LRR tarn
			//Undercover
			{ "arifle_SPAR_01_khk_F","UndercoverwaffeONLY",100000, 100000, "call life_coplevel >=5 && (395180 in (getDLCs 1))"},									//[A] SPAR-16
			{ "arifle_AKS_F","UndercoverwaffeONLY",100000, 100000, "(call life_coplevel >=5) && (395180 in (getDLCs 1))"}, 											//[A] AKS74U
			{ "arifle_MX_F","UndercoverwaffeONLY",100000, 100000, "call life_coplevel >=5"},																		//MX
			{ "arifle_MXC_F","UndercoverwaffeONLY",100000, 100000, "call life_coplevel >=5"},																		//MXC
			{ "arifle_MXM_F","UndercoverwaffeONLY",100000, 100000, "call life_coplevel >=5"},																		//MXM
			{ "arifle_MX_SW_F","UndercoverwaffeONLY",100000, 100000, "call life_coplevel >=5"},																		//MXSW
			{ "srifle_EBR_F","UndercoverwaffeONLY",100000, 100000, "call life_coplevel >=5"}, 																		//MK18
			{ "arifle_SPAR_03_khk_F","UndercoverwaffeONLY",100000, 100000, "(call life_coplevel >=5) && (395180 in (getDLCs 1))"}, 									//[A] Spar 17
			{ "srifle_DMR_06_olive_F","UndercoverwaffeONLY",100000, 100000, "(call life_coplevel >=6) && (332350 in (getDLCs 1))"}, 								//MK14
			{ "srifle_DMR_03_tan_F","UndercoverwaffeONLY",100000, 100000, "(call life_coplevel >=7) && (332350 in (getDLCs 1))"},									//mk1
			{ "srifle_DMR_02_sniper_F","UndercoverwaffeONLY",100000, 100000, "(call life_coplevel >=7) && (332350 in (getDLCs 1))"}, 								//mar10
			//Sonstiges
			{ "optic_Hamr","",10000, 10000, "call life_coplevel >=1"},
			{ "optic_AMS","",10000, 10000, "(332350 in (getDLCs 1)) && (call life_coplevel >=5 || license_cop_swatcmd || license_cop_swat)"},
			{ "SmokeShellgreen","",250, 250, "call life_coplevel >=3"},
			{ "SmokeShellYellow","",750, 750, "call life_coplevel >=3"},
			{ "HandGrenade_Stone","Flashbang",500, 500, "call life_coplevel >=4"},
			{ "rangefinder","",30000, 30000, "call life_coplevel >=1"},
			{ "Laserdesignator","",30000, 30000, "call life_coplevel >=2"},
			{ "ItemGPS","",100, 100, "call life_coplevel >=1"},
			{ "ItemWatch","",450, 450, "call life_coplevel >=1"},
			{ "ToolKit","",250, 250, "call life_coplevel >=1"},
			{ "FirstAidKit","",150, 150, "call life_coplevel >=1"},
			{ "Medikit","",1000, 1000, "call life_coplevel >=1"},
			{ "NVGoggles_OPFOR","",2000, 2000, "call life_coplevel >=1"},
			{ "O_NVGoggles_ghex_F","",2000, 2000, "call life_coplevel >=1"},
			{ "G_Combat_Goggles_tna_F","",2000, 2000, "call life_coplevel >=1"},
			{ "B_UavTerminal","",1000, 1000, "call life_coplevel >=5"},
			{ "B_UAV_01_backpack_F","",1000, 1000, "call life_coplevel >=6" }
        };
        mags[] = {
			{ "11Rnd_45ACP_Mag","",100, 100, ""},
			{ "30Rnd_556x45_Stanag_Tracer_Yellow","Tazer Munition",100, 100, ""},
			{ "30Rnd_556x45_Stanag_green","Scharfe Munition",100, 100, ""},
			{ "30Rnd_9x21_Mag","",100, 100, ""},
			{ "30Rnd_9x21_Mag_SMG_02","",100, 100, ""},
			{ "30Rnd_9x21_Mag","",100, 100, ""},
			{ "30Rnd_45ACP_Mag_SMG_01","",100, 100, ""},
			{ "6Rnd_GreenSignal_F","",100, 100, ""},
            { "6Rnd_RedSignal_F","",100, 100, ""},
			{ "30Rnd_65x39_caseless_mag","",100, 100, ""},
            { "30Rnd_65x39_caseless_mag_Tracer","",100, 100, ""},
			{ "30Rnd_65x39_caseless_green","",100, 100, ""},
            { "30Rnd_65x39_caseless_green_mag_Tracer","",100, 100, ""},
			{ "100Rnd_65x39_caseless_mag","",100, 100, ""},
			{ "30Rnd_580x42_Mag_F","",100, 100, ""},
			{ "20Rnd_650x39_Cased_Mag_F","",2000, 100, ""},
			{ "30Rnd_556x45_Stanag_green","",100, 100, ""},
			{ "30Rnd_556x45_Stanag_green","",100, 100, ""},
			{ "20Rnd_556x45_UW_mag","",100, 100, ""},
			{ "20Rnd_762x51_Mag","",100, 100, ""},
			{ "10Rnd_762x54_Mag","",100, 100, ""},
			{ "10Rnd_338_Mag","",100, 100, ""},
			{ "30Rnd_545x39_Mag_F","",100, 100, ""},
			{ "200Rnd_556x45_Box_Red_F","",100, 100, ""},
			{ "10Rnd_93x64_DMR_05_Mag","",100, 100, ""},
			{ "30Rnd_762x39_Mag_F","",100,100,""},
			{ "7Rnd_408_Mag","",100, 100, ""},
			{ "200Rnd_65x39_cased_Box","",100, 100, ""},
            { "200Rnd_65x39_cased_Box_Tracer","",100, 100, ""},
			{ "10Rnd_127x54_Mag","",100,100,""},
			{ "UGL_FlareWhite_F","",100, 100, ""},
			{ "UGL_FlareGreen_F","",100, 100, ""},
			{ "UGL_FlareRed_F","",100, 100, ""},
			{ "1Rnd_Smoke_Grenade_shell","",100, 100, ""},
			{ "1Rnd_SmokePurple_Grenade_shell","",100, 100, ""},
			{ "1Rnd_SmokeYellow_Grenade_shell","",100, 100, ""},
			{ "1Rnd_SmokeGreen_Grenade_shell","",100, 100, ""}
        };
        accs[] = {
			{ "optic_MRD","Tazer ACP Visier",10000, 10000, "call life_coplevel >=1"},
			{ "optic_Aco","",10000, 10000, "call life_coplevel >=1"},
			{ "optic_ACO_grn","",10000, 10000, "call life_coplevel >=1"},
			{ "optic_Holosight","",10000, 10000, "call life_coplevel >=1"},
			{ "optic_MRCO","",10000, 10000, "call life_coplevel >=1"},
			{ "optic_Arco_blk_F","",10000, 10000, "call life_coplevel >=1"},
			{ "optic_Hamr","",10000, 10000, "call life_coplevel >=1"},
			{ "optic_ERCO_blk_F","",10000, 10000, "call life_coplevel >=1"},
			{ "optic_SOS","",10000, 10000, "call life_coplevel >=2" },
			{ "optic_DMS","",10000, 10000, "call life_coplevel >=4"},
			{ "optic_AMS","",10000, 10000, "(332350 in (getDLCs 1)) && (call life_coplevel >=5 || license_cop_swatcmd || license_cop_swat)"},
			{ "optic_AMS_khk","",10000, 10000, "(332350 in (getDLCs 1)) && (call life_coplevel >=5 || license_cop_swatcmd || license_cop_swat)"},
			{ "optic_AMS_snd","",10000, 10000, "(332350 in (getDLCs 1)) && (call life_coplevel >=5 || license_cop_swatcmd || license_cop_swat)"},
			{ "optic_KHS_blk","",10000, 10000, "(332350 in (getDLCs 1)) && (call life_coplevel >=5 || license_cop_swatcmd || license_cop_swat)"},
			{ "optic_KHS_hex","",10000, 10000, "(332350 in (getDLCs 1)) && (call life_coplevel >=5 || license_cop_swatcmd || license_cop_swat)"},
			{ "optic_KHS_old","",10000, 10000, "(332350 in (getDLCs 1)) && (call life_coplevel >=5 || license_cop_swatcmd || license_cop_swat)"},
			{ "optic_KHS_tan","",10000, 10000, "(332350 in (getDLCs 1)) && (call life_coplevel >=5 || license_cop_swatcmd || license_cop_swat)"},
            { "muzzle_snds_acp","",500, 500, "call life_coplevel >=1"},
			{ "muzzle_snds_L","",2000, 2000, "call life_coplevel >=1"},
			{ "muzzle_snds_M","",2000, 2000, "call life_coplevel >=1"},
			{ "muzzle_snds_58_blk_F","",2000, 2000, "call life_coplevel >=2"},
            { "muzzle_snds_H","",2000, 2000, "call life_coplevel >=2"},
            { "muzzle_snds_65_TI_blk_F","",2000, 2000, "call life_coplevel >=2"},
			{ "muzzle_snds_B","",2000, 2000, "call life_coplevel >=4"},
			{ "muzzle_snds_93mmg","",2000, 2000, ""},
            { "muzzle_snds_H_MG_blk_F","",2000, 2000, ""},
			{ "muzzle_snds_338_black","",2000, 2000, ""},
			{ "bipod_01_F_blk","",10000, 2000, "call life_coplevel >=2"},
			{ "bipod_01_F_mtp","",10000, 2000, "call life_coplevel >=2"},
			{ "bipod_01_F_snd","",10000, 10000, "call life_coplevel >=2"},
			{ "acc_pointer_IR","",2500, 2500, "call life_coplevel >=1"},
			{ "acc_flashlight","",2500, 2500, "call life_coplevel >=1"},
			{ "acc_flashlight_pistol","",2000, 2000, "call life_coplevel >=1" }
        };
    };
	
	class cop_geheim {
        name = "SWAT Geheimkammer";
        side = "cop";
        conditions = "license_cop_swat || license_cop_swatcmd";
        items[] = {
			//Auto-Rifles
			{ "arifle_MX_SW_Black_F","",100000, 100000, ""},
			{ "arifle_AK12_F","",100000,100000,"(395180 in (getDLCs 1))"},												//[A] AK-12
			{ "arifle_AK12_GL_F","",100000,100000,"(395180 in (getDLCs 1))"},											//[A] AK-12 GL
			//DMRs
			{ "srifle_DMR_04_F","",100000, 100000, "(332350 in (getDLCs 1))"},             								//[M] ASP 1 schwarz
			{ "srifle_EBR_F","",100000, 100000, ""},                													//Mk18
			{ "arifle_SPAR_03_blk_F","",100000, 100000, "(395180 in (getDLCs 1))"},       								//[A] Spar 17
			{ "srifle_DMR_06_olive_F","",100000, 100000, "(332350 in (getDLCs 1))"},       								//[M] mk14
			{ "srifle_DMR_03_F","",100000, 100000, "(332350 in (getDLCs 1))"},             								//[M] mk1 cop
			{ "srifle_DMR_02_F","",100000, 100000, "(332350 in (getDLCs 1))"},             								//[M] mar10 cop
			{ "srifle_DMR_05_blk_F","",100000, 100000, "(332350 in (getDLCs 1))"},         								//[M] cyrus
			//LMGs
			{ "LMG_03_F","",100000, 100000, "(395180 in (getDLCs 1))"},                    								//[A] LIM
			{ "LMG_Mk200_F","",100000, 100000, ""},
			//Sniper-Rifles
			{ "srifle_LRR_F","",100000, 100000, ""},
            { "srifle_LRR_tna_F","",100000, 100000, ""},
			//Sonstiges
			{ "SmokeShellgreen","",250, 250, ""},
			{ "SmokeShellYellow","",750, 750, ""},
			{ "HandGrenade_Stone","Flashbang",500, 500, ""},
			{ "rangefinder","",30000, 30000, ""},
			{ "Laserdesignator","",30000, 30000, ""},
			{ "ItemGPS","",100, 100, ""},
			{ "ItemWatch","",450, 450, ""},
			{ "ToolKit","",250, 250, ""},
			{ "FirstAidKit","",150, 150, ""},
			{ "Medikit","",1000, 1000, ""},
			{ "NVGoggles_OPFOR","",2000, 2000, ""},
			{ "O_NVGoggles_ghex_F","",2000, 2000, ""},
			{ "G_Combat_Goggles_tna_F","",2000, 2000, ""},
			{ "B_UavTerminal","",1000, 1000, ""},
			{ "B_UAV_01_backpack_F","",1000, 1000, ""}
        };
        mags[] = {
			{ "30Rnd_65x39_caseless_mag","",100, 100, ""},
            { "30Rnd_65x39_caseless_mag_Tracer","",100, 100, ""},
			{ "30Rnd_65x39_caseless_green","",100, 100, ""},
            { "30Rnd_65x39_caseless_green_mag_Tracer","",100, 100, ""},
			{ "100Rnd_65x39_caseless_mag","",100, 100, ""},												
			{ "20Rnd_762x51_Mag","",100, 100, ""},
			{ "10Rnd_338_Mag","",100, 100, ""},
			{ "200Rnd_556x45_Box_Red_F","",100, 100, ""},
			{ "10Rnd_93x64_DMR_05_Mag","",100, 100, ""},
			{ "30Rnd_762x39_Mag_F","",100,100, ""},
			{ "7Rnd_408_Mag","",100, 100, ""},
			{ "200Rnd_65x39_cased_Box","",100, 100, ""},
            { "200Rnd_65x39_cased_Box_Tracer","",100, 100, ""},
			{ "10Rnd_127x54_Mag","",100,100,""},
			{ "UGL_FlareWhite_F","",100, 100, ""},
			{ "UGL_FlareGreen_F","",100, 100, ""},
			{ "UGL_FlareRed_F","",100, 100, ""},
			{ "1Rnd_Smoke_Grenade_shell","",100, 100, ""},
			{ "1Rnd_SmokePurple_Grenade_shell","",100, 100, ""},
			{ "1Rnd_SmokeYellow_Grenade_shell","",100, 100, ""},
			{ "1Rnd_SmokeGreen_Grenade_shell","",100, 100, ""}
        };
        accs[] = {
			{ "optic_MRD","Tazer ACP Visier",10000, 10000, ""},
			{ "optic_Aco","",10000, 10000, ""},
			{ "optic_ACO_grn","",10000, 10000, ""},
			{ "optic_Holosight","",10000, 10000, ""},
			{ "optic_MRCO","",10000, 10000, ""},
			{ "optic_Arco_blk_F","",10000, 10000, ""},
			{ "optic_Hamr","",10000, 10000, ""},
			{ "optic_ERCO_blk_F","",10000, 10000, ""},
			{ "optic_SOS","",10000, 1000, "" },
			{ "optic_DMS","",10000, 10000, ""},
			{ "optic_AMS","",10000, 10000, "(332350 in (getDLCs 1))"},
			{ "optic_AMS_khk","",10000, 10000, "(332350 in (getDLCs 1))"},
			{ "optic_AMS_snd","",10000, 10000, "(332350 in (getDLCs 1))"},
			{ "optic_KHS_blk","",10000, 10000, "(332350 in (getDLCs 1))"},
			{ "optic_KHS_hex","",10000, 10000, "(332350 in (getDLCs 1))"},
			{ "optic_KHS_old","",10000, 10000, "(332350 in (getDLCs 1))"},
			{ "optic_KHS_tan","",10000, 10000, "(332350 in (getDLCs 1))"},
            { "muzzle_snds_acp","",500, 500, ""},
			{ "muzzle_snds_L","",2000, 2000, ""},
			{ "muzzle_snds_M","",2000, 2000, ""},
			{ "muzzle_snds_58_blk_F","",2000, 2000, ""},
            { "muzzle_snds_H","",2000, 2000, ""},
            { "muzzle_snds_65_TI_blk_F","",2000, 2000, ""},
			{ "muzzle_snds_B","",2000, 2000, ""},
			{ "muzzle_snds_93mmg","",2000, 2000, ""},
            { "muzzle_snds_H_MG_blk_F","",2000, 2000, ""},
			{ "muzzle_snds_338_black","",2000, 2000, ""},
			{ "bipod_01_F_blk","",10000, 2000, ""},
			{ "bipod_01_F_mtp","",10000, 2000, ""},
			{ "bipod_01_F_snd","",10000, 10000, ""},
			{ "acc_pointer_IR","",2500, 2500, ""},
			{ "acc_flashlight","",2000, 2000, ""},
			{ "acc_flashlight_pistol","",2000, 2000, ""}
		};
    };
	
	
    //Medic Shops
    class med_basic {
        name = "store";
        side = "med";
        conditions = "";
        items[] = {
            { "ItemGPS", "", 100, -1 "" },
            { "rangefinder", "", 150, -1, "" },
			{ "ItemMap", "", 100, -1, "" },
            { "ItemCompass", "", 250, -1, "" },
            { "ItemWatch", "", 450, -1, "" },
            { "FirstAidKit", "", 150, -1, "" },
			{ "Medikit", "", 500, -1, "" },
			{ "ToolKit", "", 500, -1, "" },
            { "NVGoggles", "", 200, -1-, "" },
			{ "Chemlight_red", "", 100, -1, "" },
            { "Chemlight_yellow", "", 100, -1, "" },
            { "Chemlight_green", "", 100, -1, "" },
            { "Chemlight_blue", "", 100, -1, "" }
        };
        mags[] = {};
        accs[] = {};
    };
};
