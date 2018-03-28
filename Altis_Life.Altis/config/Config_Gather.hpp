class CfgGather {
    class Resources {
        
    };

/*
This block can be set using percent,if you want players to mine only one resource ,just leave it as it is.
Example:
        class copper_unrefined
    {
            amount = 2;
        zones[] = { "copper_mine" };
        item = "pickaxe";
        mined[] = { "copper_unrefined" };
This will make players mine only copper_unrefined
Now let's go deeper
Example 2:
        class copper_unrefined
    {
            amount = 2;
        zones[] = { "copper_mine" };
        item = "pickaxe";
        mined[] = { {"copper_unrefined",0,25},{"iron_unrefined",25,95},{"diamond_uncut",95,100} };
    };
    This will give :
    25(±1)% to copper_unrefined;
    70(±1)% to iron_unrefined;
    5%(±1)% to diamond_uncut;

                                                         ! Watch Out !
 If percents are used,you MUST put more than 1 resource in the mined parameter
 mined[] = { {"copper_unrefined",0,25} }; NOT OK (But the script will work)
 mined[] = { {"copper_unrefined",0,45 },{"iron_unrefined",45} };  NOT OK (The script won't work )
 mined[] = { {"copper_unrefined",0,45},{"copper_unrefined",80,100} }; NOT OK
 mined[] = { "copper_unrefined" }; OK
 mined[] = { {"copper_unrefined",0,35} , { "iron_unrefined" ,35,100 } }; OK
*/

	class Minerals {
		
		class pfirsich { //Pfirsich	
			amount = 4;
			zones[] = { "peaches_1","peaches_2" };
			item = "";
			mined[] = { "peach" };
			zoneSize = 24;
			side[] = {"civ","cop","med"};
			device[] = {"O_Truck_03_device_F","O_Truck_03_ammo_F","O_T_VTOL_02_infantry_F"};
			Text = "STR_Gather_Harvest";
		};
		
		class alu { //Aluminiummine	
			amount = 2;
			zones[] = { "aluminium_feld" };
			item = "pickaxe";
			mined[] = { "alu_u" };
			zoneSize = 16;
			side[] = {"civ","cop","med"};
			device[] = {"O_Truck_03_device_F","O_Truck_03_ammo_F","O_T_VTOL_02_infantry_F"};
			Text = "STR_Gather_Mine";
		};	
			
		class milch { //Bauernhof	
			amount = 4;
			zones[] = { "buttermilch_feld" };
			item = "";
			mined[] = { "milch_u" };
			zoneSize = 20;
			side[] = {"civ","cop","med"};
			device[] = {"O_Truck_03_fuel_F","O_Truck_03_ammo_F","O_Heli_Transport_04_fuel_F"};
			Text = "STR_Gather_Liquid";
		};	
			
		class fuel { //Bohrinsel	
			amount = 1.33;
			zones[] = { "diesel_benzin_kunststoff_feld" };
			item = "fuelE";
			mined[] = { "oel_u" };
			zoneSize = 85;
			side[] = {"civ","cop","med"};
			device[] = {"O_Heli_Transport_04_fuel_F"};
			Text = "STR_Gather_Fill";
		};	
			
		class nuclear { //Brennelemente Aufbewahrung	
			amount = 1;
			zones[] = { "atommüll_feld" };
			item = "";
			mined[] = { "nuclear_u" };
			zoneSize = 24;
			side[] = {"civ","cop","med"};
			device[] = {"B_Plane_Fighter_01_Stealth_F"};
			Text = "-//-";
		};	
			
		class meth { //Chemiefabrik	
			amount = 1.5;
			zones[] = { "meth_feld" };
			item = "";
			mined[] = { "meth_u" };
			zoneSize = 8;
			side[] = {"civ"};
			device[] = {"O_Truck_03_device_F","O_Truck_03_ammo_F","O_T_VTOL_02_infantry_F"};
			Text = "STR_Gather_Steal";
		};	
			
		class eisen { //Eisenmine	
			amount = 2;
			zones[] = { "eisen_feld" };
			item = "pickaxe";
			mined[] = { "eisen_u" };
			zoneSize = 40;
			side[] = {"civ","cop","med"};
			device[] = {"O_Truck_03_device_F","O_Truck_03_ammo_F","O_T_VTOL_02_infantry_F"};
			Text = "STR_Gather_Mine";
		};	
			
		class fisch { //Fischvorkommen	
			amount = 4;
			zones[] = { "fisch_kaviar_feld" };
			item = "angel";
			mined[] = { "fisch_u" };
			zoneSize = 100;
			side[] = {"civ","cop","med"};
			device[] = {};
			Text = "STR_Gather_Fishing";
		};	
			
		class getreide { //Getreidefeld	
			amount = 2.4;
			zones[] = { "getreide_feld" };
			item = "sense";
			mined[] = { "getreide_u" };
			zoneSize = 36;
			side[] = {"civ","cop","med"};
			device[] = {"O_Truck_03_device_F","O_Truck_03_ammo_F","O_T_VTOL_02_infantry_F"};
			Text = "STR_Gather_Harvest";
		};	
			
		class gold { //Goldmine	
			amount = 1.33;
			zones[] = { "gold_feld" };
			item = "pickaxe";
			mined[] = { "gold_u" };
			zoneSize = 60;
			side[] = {"civ","cop","med"};
			device[] = {"O_Truck_03_device_F","O_Truck_03_ammo_F","O_T_VTOL_02_infantry_F"};
			Text = "STR_Gather_Mine";
		};	
			
		class kohle { //Kohlemine	
			amount = 2;
			zones[] = { "kohle_feld" };
			item = "pickaxe";
			mined[] = { "kohle_s" };
			zoneSize = 20;
			side[] = {"civ","cop","med"};
			device[] = {"O_Truck_03_device_F","O_Truck_03_ammo_F","O_T_VTOL_02_infantry_F"};
			Text = "STR_Gather_Mine";
		};	
			
		class korallen { //Korallenriff	
			amount = 3;
			zones[] = { "korallen_feld" };
			item = "";
			mined[] = { "korallen_s" };
			zoneSize = 70;
			side[] = {"civ"};
			device[] = {};
			Text = "STR_Gather_Normal";
		};	
			
		class kupfer { //Kupfermine	
			amount = 2;
			zones[] = { "kupfer_feld" };
			item = "pickaxe";
			mined[] = { "kupfer_u" };
			zoneSize = 40;
			side[] = {"civ","cop","med"};
			device[] = {"O_Truck_03_device_F","O_Truck_03_ammo_F","O_T_VTOL_02_infantry_F"};
			Text = "STR_Gather_Mine";
		};	
			
		class heroin { //Mohnfeld	
			amount = 4;
			zones[] = { "heroin_morphin_opium_feld" };
			item = "sense";
			mined[] = { "mohn_u" };
			zoneSize = 60;
			side[] = {"civ"};
			device[] = {"O_Truck_03_device_F","O_Truck_03_ammo_F","O_T_VTOL_02_infantry_F"};
			Text = "STR_Gather_Harvest";
		};	
			
		class ecstasy { //Orangenwurzelplantage	
			amount = 2;
			zones[] = { "ecstasy_feld" };
			item = "";
			mined[] = { "ecstasy_u" };
			zoneSize = 50;
			side[] = {"civ"};
			device[] = {"O_Truck_03_device_F","O_Truck_03_ammo_F","O_T_VTOL_02_infantry_F"};
			Text = "STR_Gather_Normal";
		};	
			
		class qsilber { //Quecksilbervorkommen	
			amount = 2;
			zones[] = { "quecksilber_feld" };
			item = "";
			mined[] = { "qsilber_u" };
			zoneSize = 70;
			side[] = {"civ","cop","med"};
			device[] = {"O_Truck_03_fuel_F","O_Truck_03_ammo_F","O_Heli_Transport_04_fuel_F"};
			Text = "STR_Gather_Normal";
		};	
			
		class glas { //Sandvorkommen	
			amount = 4;
			zones[] = { "glas_feld" };
			item = "schaufel";
			mined[] = { "sand_u" };
			zoneSize = 50;
			side[] = {"civ","cop","med"};
			device[] = {"O_Truck_03_device_F","O_Truck_03_ammo_F","O_T_VTOL_02_infantry_F"};
			Text = "STR_Gather_Mine";
		};	
			
		class poppers { //Säurelager	
			amount = 2;
			zones[] = { "poppers_feld" };
			item = "";
			mined[] = { "poppers_u" };
			zoneSize = 20;
			side[] = {"civ"};
			device[] = {"O_Truck_03_fuel_F","O_Truck_03_ammo_F","O_Heli_Transport_04_fuel_F"};
			Text = "STR_Gather_Steal";
		};	
			
		class cargo { //Schiffswrack	
			amount = 1.5;
			zones[] = { "schiffsfracht_feld" };
			item = "";
			mined[] = { "cargo_u" };
			zoneSize = 25;
			side[] = {"civ"};
			device[] = {};
			Text = "STR_Gather_Normal";
		};	
			
		class contamination { //Schmutzwassertümpel	
			amount = 6;
			zones[] = { "contamination_feld" };
			item = "fuelE";
			mined[] = { "slop_u" };
			zoneSize = 300;
			side[] = {"civ"};
			device[] = {"O_Truck_03_fuel_F","O_Truck_03_ammo_F","O_Heli_Transport_04_fuel_F"};
			Text = "STR_Gather_Fill";
		};	
			
		class batterie { //Schrottplatz	
			amount = 4;
			zones[] = { "batterie_feld" };
			item = "";
			mined[] = { "batterie_u" };
			zoneSize = 20;
			side[] = {"civ"};
			device[] = {"O_Truck_03_device_F","O_Truck_03_ammo_F","O_T_VTOL_02_infantry_F"};
			Text = "STR_Gather_Remove";
		};	
			
		class schrott { //Schrottplatz	
			amount = 3;
			zones[] = { "schrott_feld" };
			item = "";
			mined[] = { "schrott_p" };
			zoneSize = 16;
			side[] = {"civ","cop","med"};
			device[] = {"O_Truck_03_device_F","O_Truck_03_ammo_F","O_T_VTOL_02_infantry_F"};
			Text = "STR_Gather_Normal";
		};	
			
		class brennstoff { //Uran Lager	
			amount = 1;
			zones[] = { "kernbrennstoff_feld" };
			item = "";
			mined[] = { "brennstoff_u" };
			zoneSize = 24;
			side[] = {"civ","cop","med"};
			device[] = {};
			Text = "STR_Gather_Receive";
		};	
		
		class impfstoff { //Impfstoff
			amount = 6;
			zones[] = { "impfstoff_feld" };
			item = "";
			mined[] = { "impfstoff" };
			zoneSize = 24;
			side[] = {"med"};
			device[] = {};
			Text = "STR_Gather_Receive";
		};
		
		class frachtkiste { //Drogenfrachtkiste
			amount = 1;
			zones[] = { "frachtkiste_feld" };
			item = "";
			mined[] = { "frachtkiste_p" };
			zoneSize = 10;
			side[] = {"civ"};
			device[] = {};
			Text = "STR_Gather_Normal";
		};	
		
			
		class food { //Verladerampe	
			amount = 6;
			zones[] = { "lebensmittel_feld" };
			item = "";
			mined[] = {  {"food1_s",0,25} , {"food2_s",25,50} , {"food3_s",50,75} , {"food4_s",75,100} };
			zoneSize = 20;
			side[] = {"civ","cop","med"};
			device[] = {"O_Truck_03_device_F","O_Truck_03_ammo_F","O_T_VTOL_02_infantry_F"};
			Text = "STR_Gather_Food";
		};	
			
		class holz { //Wald	
			amount = 2.4;
			zones[] = { "holz_papier_feld" };
			item = "axt";
			mined[] = { "holz_u" };
			zoneSize = 30;
			side[] = {"civ","cop","med"};
			device[] = {"O_Truck_03_device_F","O_Truck_03_ammo_F","O_T_VTOL_02_infantry_F"};
			Text = "STR_Gather_Receive";
		};	
			
		class wasser { //Wasserentnahme	
			amount = 6;
			zones[] = { "wasser_feld" };
			item = "fuelE";
			mined[] = { "wasser_u" };
			zoneSize = 15;
			side[] = {"civ","cop","med"};
			device[] = {"O_Truck_03_fuel_F","O_Truck_03_ammo_F","O_Heli_Transport_04_fuel_F"};
			Text = "STR_Gather_Liquid";
		};	
			
		class zucker { //Zuckerrohrfeld	
			amount = 1.33;
			zones[] = { "zucker_feld" };
			item = "sense";
			mined[] = { "zucker_u" };
			zoneSize = 36;
			side[] = {"civ","cop","med"};
			device[] = {"O_Truck_03_device_F","O_Truck_03_ammo_F","O_T_VTOL_02_infantry_F"};
			Text = "STR_Gather_Harvest";
		};	
    };
};