/*
*   class:
*       MaterialsReq (Needed to process) = Array - Format -> {{"ITEM CLASS",HOWMANY}}
*       MaterialsGive (Returned items) = Array - Format -> {{"ITEM CLASS",ChanceFrom,ChanceTo}}
*       Text (Progess Bar Text) = Localised String
*       NoLicenseCost (Cost to process w/o license) = Scalar
*
*   Example for multiprocess:
*
*   class Example {
*       MaterialsReq[] = {{"cocaine_processed",1},{"heroin_processed",1}};
*       MaterialsGive[] = {{"diamond_cut",0,1}};
*       Text = "STR_Process_Example";
*       //ScrollText = "Process Example";
*       NoLicenseCost = 4000;
*   };
*/

class ProcessAction {
    class alu { //Erzschmelze	
		MaterialsReq[] = {{"alu_u",1}};
		MaterialsGive[] = {{"alu_p",0,1000}};
		Text = "STR_Process_Alu";
		//Text = Abbauen
		NoLicenseCost = 7000;
		zones[] = {"metall2_verarbeiter" , "metall3_verarbeiter" };
		zoneSize = 30;
		device[] = {"O_Truck_03_ammo_F"};
	};	
		
	class nuclear { //USS Enterprise (CVN-65)	
		MaterialsReq[] = {{"nuclear_u",1}};
		MaterialsGive[] = {{"nuclear_p",0,1000}};
		Text = "STR_Process_Nuclear";
		//Text = 
		NoLicenseCost = 450000;
		zones[] = { "atommüll_verarbeiter" };
		zoneSize = 150;
		device[] = {"B_Plane_Fighter_01_Stealth_F"};
	};	
		
	class batterie { //Batterieladestation	
		MaterialsReq[] = {{"batterie_u",1}};
		MaterialsGive[] = {{"batterie_p",0,1000}};
		Text = "STR_Process_Batterie";
		//Text = 
		NoLicenseCost = 160000;
		zones[] = { "batterien_verarbeiter" };
		zoneSize = 30;
		device[] = {"O_Truck_03_ammo_F"};
	};	
		
	class benzin { //Benzinraffinerie	
		MaterialsReq[] = {{"diesel_p",1}};
		MaterialsGive[] = {{"benzin_p",0,1000}};
		Text = "STR_Process_Benzin";
		//Text = 
		NoLicenseCost = 100000;
		zones[] = { "benzin_verarbeiter" };
		zoneSize = 30;
		device[] = {"O_Truck_03_ammo_F"};
	};	
		
	class bronze { //Bronzeschmelzerei	
		MaterialsReq[] = {{"kupfer_p",3},{"zinn_s",1}};
		MaterialsGive[] = {{"bronze_c",0,1000}};
		Text = "STR_Process_Bronze";
		//Text = 
		NoLicenseCost = 250000;
		zones[] = { "bronze_verarbeiter" };
		zoneSize = 30;
		device[] = {"O_Truck_03_ammo_F"};
	};	
		
	class carbon { //Carbonherstellung	
		MaterialsReq[] = {{"plastik_p",1},{"kohle_s",1}};
		MaterialsGive[] = {{"carbon_c",0,1000}};
		Text = "STR_Process_Carbon";
		//Text = 
		NoLicenseCost = 160000;
		zones[] = { "cfk_verarbeiter" };
		zoneSize = 30;
		device[] = {"O_Truck_03_ammo_F"};
	};	
		
	class meth { //Methküche	
		MaterialsReq[] = {{"meth_u",1}};
		MaterialsGive[] = {{"meth_p",0,1000}};
		Text = "STR_Process_Meth";
		//Text = 
		NoLicenseCost = 130000;
		zones[] = { "meth_verarbeiter" };
		zoneSize = 30;
		device[] = {"O_Truck_03_ammo_F"};
	};	
		
	class fuel { //Dieselraffinerie	
		MaterialsReq[] = {{"oel_u",1}};
		MaterialsGive[] = {{"diesel_p",0,1000}};
		Text = "STR_Process_Fuel";
		//Text = 
		NoLicenseCost = 100000;
		zones[] = { "diesel_verarbeiter" };
		zoneSize = 30;
		device[] = {"O_Truck_03_ammo_F"};
	};	
		
	class fishcan { //Konservenfabrik	
		MaterialsReq[] = {{"fisch_p",1},{"alu_p",1}};
		MaterialsGive[] = {{"fishcan_c",0,1000}};
		Text = "STR_Process_Fishcan";
		//Text = 
		NoLicenseCost = 160000;
		zones[] = { "konserven_verarbeiter" };
		zoneSize = 30;
		device[] = {"O_Truck_03_ammo_F"};
	};	
		
	class turtlecan { //Konservenfabrik	
		MaterialsReq[] = {{"turtle_s",1},{"alu_p",1}};
		MaterialsGive[] = {{"turtlecan_c",0,1000}};
		Text = "STR_Process_Fishcan";
		//Text = 
		NoLicenseCost = 160000;
		zones[] = { "konserven_verarbeiter" };
		zoneSize = 30;
		device[] = {"O_Truck_03_ammo_F"};
	};	
		
	class ecstasy { //Drogenlabor	
		MaterialsReq[] = {{"ecstasy_u",1}};
		MaterialsGive[] = {{"ecstasy_p",0,1000}};
		Text = "STR_Process_Ecstasy";
		//Text = 
		NoLicenseCost = 260000;
		zones[] = { "poppers_ecstasy_verarbeiter" };
		zoneSize = 30;
		device[] = {"O_Truck_03_ammo_F"};
	};	
		
	class eisen { //Erzschmelze	
		MaterialsReq[] = {{"eisen_u",1}};
		MaterialsGive[] = {{"eisen_p",0,800},{"zinn_s",800,1000}};
		Text = "STR_Process_Eisen";
		//Text = 
		NoLicenseCost = 14000;
		zones[] = { "metall1_verarbeiter" , "metall2_verarbeiter" , "metall3_verarbeiter" };
		zoneSize = 30;
		device[] = {"O_Truck_03_ammo_F"};
	};	
		
	class fenster { //Fensterherstellung	
		MaterialsReq[] = {{"holz_p",1},{"glas_p",2}};
		MaterialsGive[] = {{"fenster_c",0,1000}};
		Text = "STR_Process_Fenster";
		//Text = 
		NoLicenseCost = 80000;
		zones[] = { "fenster_verarbeiter" };
		zoneSize = 30;
		device[] = {"O_Truck_03_ammo_F"};
	};	
		
	class fisch { //Fischverarbeitung	
		MaterialsReq[] = {{"fisch_u",1}};
		MaterialsGive[] = {{"fisch_p",0,1000}};
		Text = "STR_Process_Fisch";
		//Text = 
		NoLicenseCost = 2000;
		zones[] = { "fisch_verarbeiter" };
		zoneSize = 30;
		device[] = {"O_Truck_03_ammo_F"};
	};	
		
	class getreide { //Mühle	
		MaterialsReq[] = {{"getreide_u",1}};
		MaterialsGive[] = {{"getreide_p",0,1000}};
		Text = "STR_Process_Getreide";
		//Text = 
		NoLicenseCost = 4000;
		zones[] = { "getreide_verarbeiter" };
		zoneSize = 30;
		device[] = {"O_Truck_03_ammo_F"};
	};	
		
	class glas { //Glasschmelze	
		MaterialsReq[] = {{"sand_u",1}};
		MaterialsGive[] = {{"glas_p",0,1000}};
		Text = "STR_Process_Glas";
		//Text = 
		NoLicenseCost = 80000;
		zones[] = { "glas_verarbeiter" };
		zoneSize = 30;
		device[] = {"O_Truck_03_ammo_F"};
	};	
		
	class gold { //Erzschmelze	
		MaterialsReq[] = {{"gold_u",1}};
		MaterialsGive[] = {{"gold_p",0,1000}};
		Text = "STR_Process_Gold";
		//Text = 
		NoLicenseCost = 28000;
		zones[] = { "metall1_verarbeiter" , "metall2_verarbeiter" , "metall3_verarbeiter" };
		zoneSize = 30;
		device[] = {"O_Truck_03_ammo_F"};
	};	
		
	class milch { //Molkerei	
		MaterialsReq[] = {{"milch_u",1}};
		MaterialsGive[] = {{"milch_p",0,1000}};
		Text = "STR_Process_Milch";
		//Text = 
		NoLicenseCost = 11000;
		zones[] = { "milch_verarbeiter" };
		zoneSize = 30;
		device[] = {"O_Truck_03_ammo_F"};
	};	
		
	class heroin { //Heroinlabor	
		MaterialsReq[] = {{"mohn_u",1}};
		MaterialsGive[] = {{"heroin_p",0,1000}};
		Text = "STR_Process_Heroin";
		//Text = 
		NoLicenseCost = 280000;
		zones[] = { "heroin_verarbeiter" };
		zoneSize = 30;
		device[] = {"O_Truck_03_ammo_F"};
	};	
		
	class holz { //Sägewerk	
		MaterialsReq[] = {{"holz_u",1}};
		MaterialsGive[] = {{"holz_p",0,1000}};
		Text = "STR_Process_Holz";
		//Text = 
		NoLicenseCost = 160000;
		zones[] = { "holz_verarbeiter" };
		zoneSize = 30;
		device[] = {"O_Truck_03_ammo_F"};
	};	
		
	class rifle { //Waffenmanufaktur	
		MaterialsReq[] = {{"holz_p",1},{"waffenbody_p",1}};
		MaterialsGive[] = {{"rifle_c",0,1000}};
		Text = "STR_Process_Rifle";
		//Text = 
		NoLicenseCost = 0;
		zones[] = {};
		zoneSize = 30;
		device[] = {};
	};	
		
	class kaviar { //Kaviargewinnung	
		MaterialsReq[] = {{"fisch_u",1}};
		MaterialsGive[] = {{"kaviar_p",0,1000}};
		Text = "STR_Process_Kaviar";
		//Text = 
		NoLicenseCost = 7400;
		zones[] = { "kaviar_verarbeiter" };
		zoneSize = 30;
		device[] = {"O_Truck_03_ammo_F"};
	};	
		
	class brennstoff { //Kernbrennstoff Fabrik	
		MaterialsReq[] = {{"brennstoff_u",1}};
		MaterialsGive[] = {{"brennstoff_p",0,1000}};
		Text = "STR_Process_Brennstoff";
		//Text = 
		NoLicenseCost = 450000;
		zones[] = { "kernbrennstoff_verarbeiter" };
		zoneSize = 30;
		device[] = {"O_Truck_03_ammo_F"};
	};	
		
	class plastik { //Kunstofffabrik	
		MaterialsReq[] = {{"oel_u",1}};
		MaterialsGive[] = {{"plastik_p",0,1000}};
		Text = "STR_Process_Plastik";
		//Text = 
		NoLicenseCost = 240000;
		zones[] = { "kunststoff_verarbeiter" };
		zoneSize = 30;
		device[] = {"O_Truck_03_ammo_F"};
	};	
		
	class kupfer { //Erzschmelze	
		MaterialsReq[] = {{"kupfer_u",1}};
		MaterialsGive[] = {{"kupfer_p",0,1000}};
		Text = "STR_Process_Kupfer";
		//Text = 
		NoLicenseCost = 35000;
		zones[] = { "metall1_verarbeiter" , "metall2_verarbeiter" , "metall3_verarbeiter" };
		zoneSize = 30;
		device[] = {"O_Truck_03_ammo_F"};
	};	
		
	class liq_ecstasy { //Labor für Liquid-Ecstasy	
		MaterialsReq[] = {{"liq_ecstasy_u",1}};
		MaterialsGive[] = {{"liq_ecstasy_p",0,1000}};
		Text = "STR_Process_Liq_Ecstasy";
		//Text = 
		NoLicenseCost = 400000;
		zones[] = { "liquidecstasy_verarbeiter" };
		zoneSize = 30;
		device[] = {"O_Truck_03_ammo_F"};
	};	
		
	class lpg { //LPG Herstellung	
		MaterialsReq[] = {{"lpg_u",1}};
		MaterialsGive[] = {{"lpg_p",0,1000}};
		Text = "STR_Process_Lpg";
		//Text = 
		NoLicenseCost = 180000;
		zones[] = { "lpg_verarbeiter" };
		zoneSize = 30;
		device[] = {"O_Truck_03_ammo_F"};
	};	
		
	class morphin { //Morphinlabor	
		MaterialsReq[] = {{"mohn_u",1}};
		MaterialsGive[] = {{"morphin_p",0,1000}};
		Text = "STR_Process_Morphin";
		//Text = 
		NoLicenseCost = 360000;
		zones[] = { "morphin_verarbeiter" };
		zoneSize = 30;
		device[] = {"O_Truck_03_ammo_F"};
	};	
		
	class opium { //Trocknungsanlage	
		MaterialsReq[] = {{"mohn_u",1}};
		MaterialsGive[] = {{"opium_p",0,1000}};
		Text = "STR_Process_Opium";
		//Text = 
		NoLicenseCost = 250000;
		zones[] = { "opium_verarbeiter" };
		zoneSize = 30;
		device[] = {"O_Truck_03_ammo_F"};
	};	
		
	class pipe { //Opiumpfeifenbauer	
		MaterialsReq[] = {{"opium_p",2},{"holz_p",1}};
		MaterialsGive[] = {{"pipe_c",0,1000}};
		Text = "STR_Process_Pipe";
		//Text = 
		NoLicenseCost = 120000;
		zones[] = { "opiumpfeife_verarbeiter" };
		zoneSize = 30;
		device[] = {"O_Truck_03_ammo_F"};
	};	
		
	class papier { //Papierherstellung	
		MaterialsReq[] = {{"holz_u",1}};
		MaterialsGive[] = {{"papier_p",0,1000}};
		Text = "STR_Process_Papier";
		//Text = 
		NoLicenseCost = 150000;
		zones[] = { "papier_verarbeiter" };
		zoneSize = 30;
		device[] = {"O_Truck_03_ammo_F"};
	};	
		
	class pistol { //Waffenmanufaktur	
		MaterialsReq[] = {{"waffenbody_p",1},{"plastik_p",1}};
		MaterialsGive[] = {{"pistol_c",0,1000}};
		Text = "STR_Process_Pistol";
		//Text = 
		NoLicenseCost = 0;
		zones[] = {  };
		zoneSize = 30;
		device[] = {"O_Truck_03_ammo_F"};
	};	
		
	class poppers { //Drogenlabor	
		MaterialsReq[] = {{"poppers_u",1}};
		MaterialsGive[] = {{"poppers_p",0,1000}};
		Text = "STR_Process_Poppers";
		//Text = 
		NoLicenseCost = 340000;
		zones[] = { "poppers_ecstasy_verarbeiter" };
		zoneSize = 30;
		device[] = {"O_Truck_03_ammo_F"};
	};	
		
	class qsilber { //Quecksilberaufbereitung	
		MaterialsReq[] = {{"qsilber_u",1}};
		MaterialsGive[] = {{"qsilber_p",0,1000}};
		Text = "STR_Process_Qsilber";
		//Text = 
		NoLicenseCost = 60000;
		zones[] = { "quecksilber_verarbeiter" };
		zoneSize = 30;
		device[] = {"O_Truck_03_ammo_F"};
	};	
		
	class cargo { //Schiffsfracht durchsuchen	
		MaterialsReq[] = {{"cargo_u",1}};
		MaterialsGive[] = {{"cargo2_p",0,250},{"cargo1_p",250,500},{"cargo3_p",500,1000}};
		Text = "STR_Process_Cargo";
		//Text = 
		NoLicenseCost = 300000;
		zones[] = { "schiffsfracht_verarbeiter" };
		zoneSize = 30;
		device[] = {"O_Truck_03_ammo_F"};
	};	
		
	class waffenbody { //Waffenschmiede	
		MaterialsReq[] = {{"eisen_p",2}};
		MaterialsGive[] = {{"waffenbody_p",0,1000}};
		Text = "STR_Process_Waffenbody";
		//Text = 
		NoLicenseCost = 180000;
		zones[] = { "waffenbody_verarbeiter" };
		zoneSize = 30;
		device[] = {"O_Truck_03_ammo_F"};
	};	
		
	class workbench { //Geheime Werkstatt	
		MaterialsReq[] = {{"schrott_p",20}};
		MaterialsGive[] = {{"workbench_p",0,1000}};
		Text = "STR_Process_Workbench";
		//Text = 
		NoLicenseCost = 0;
		zones[] = { "werkstatt_verarbeiter" };
		zoneSize = 30;
		device[] = {""};
	};	
	
	class destille { //Geheime Werkstatt	
		MaterialsReq[] = {{"schrott_p",20}};
		MaterialsGive[] = {{"destille_p",0,1000}};
		Text = "STR_Process_Destille";
		//Text = 
		NoLicenseCost = 2100000;
		zones[] = { "werkstatt_verarbeiter" };
		zoneSize = 30;
		device[] = {""};
	};	
		
	class wasser { //Wasseraufbereitung	
		MaterialsReq[] = {{"wasser_u",1}};
		MaterialsGive[] = {{"wasser_p",0,1000}};
		Text = "STR_Process_Wasser";
		//Text = 
		NoLicenseCost = 9000;
		zones[] = { "wasser_verarbeiter" };
		zoneSize = 30;
		device[] = {"O_Truck_03_ammo_F"};
	};	
		
	class contamination { //Grundwasser vergiften	
		MaterialsReq[] = {{"slop_u",1}};
		MaterialsGive[] = {{"probe_p",0,1000}};
		Text = "STR_Process_Contamination";
		//Text = 
		NoLicenseCost = 200000;
		zones[] = { "schmutzwasser_verarbeiter" };
		zoneSize = 30;
		device[] = {"O_Truck_03_ammo_F"};
	};	
		
	class whiskey { //Whiskybrennerei	
		MaterialsReq[] = {{"wasser_p",2},{"getreide_u",1}};
		MaterialsGive[] = {{"whiskey_c",0,1000}};
		Text = "STR_Process_Whiskey";
		//Text = 
		NoLicenseCost = 0;
		zones[] = {  };
		zoneSize = 30;
		device[] = {"O_Truck_03_ammo_F"};
	};	
		
	class zucker { //Zuckerherstellung	
		MaterialsReq[] = {{"zucker_u",1}};
		MaterialsGive[] = {{"zucker_p",0,1000}};
		Text = "STR_Process_Zucker";
		//Text = 
		NoLicenseCost = 18000;
		zones[] = { "zucker_verarbeiter" };
		zoneSize = 30;
		device[] = {"O_Truck_03_ammo_F"};
	};
};
