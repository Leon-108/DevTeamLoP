/*
*    FORMAT:
*        STRING (Conditions) - Must return boolean :
*            String can contain any amount of conditions, aslong as the entire
*            string returns a boolean. This allows you to check any levels, licenses etc,
*            in any combination. For example:
*                "life_coplevel && license_civ_someLicense"
*            This will also let you call any other function.
*/
class VirtualShops {
    //Virtual Shops
    class market {
        name = "STR_Shops_Market";
        side = "civ";
        conditions = "";
        items[] = {"peach","obst1","obst2","backware1","backware2","essen_warm1","essen_warm2","essen_warm3","delikatesse","energy","warmdrink","waterbottle","alkohol","limo","pickaxe","fuelE","angel","sense","schaufel","axt","fuelF","storagebig"};
    };
	
	class supermarket {
        name = "STR_Shops_Supermarket";
        side = "civ";
        conditions = "license_civ_food";
        items[] = {"food1_s","food2_s","food3_s","food4_s"};
    };

    class rebelmarket {
        name = "STR_Shops_Rebel";
        side = "civ";
        conditions = "license_civ_rebacess";
        items[] = {"peach","obst1","obst2","backware1","backware2","essen_warm1","essen_warm2","essen_warm3","delikatesse","energy","warmdrink","waterbottle","alkohol","limo","pickaxe","fuelE","angel","sense","schaufel","axt","fuelF","storagebig","lockpick","scalpel","blastingCharge","boltCutter","geld"};
    };

    class gang {
        name = "STR_Shops_Gang";
        side = "civ";
        conditions = "";
        items[] = {"peach","obst1","obst2","backware1","backware2","essen_warm1","essen_warm2","essen_warm3","delikatesse","energy","warmdrink","waterbottle","alkohol","limo","pickaxe","fuelE","angel","sense","schaufel","axt","fuelF","storagebig","lockpick","blastingCharge","boltCutter","geld"};
    };

    class wongs {
        name = "STR_Shops_Wongs";
        side = "civ";
        conditions = "";
        items[] = { "turtle" };
    };

    class coffee {
        name = "STR_Shops_Coffee";
        side = "civ";
        conditions = "";
        items[] = { "warmdrink", "backware2" };
    };
	
	class organ {
        name = "STR_Shops_Organ";
        side = "civ";
        conditions = "";
        items[] = { "kidney" };
    };

/*    class f_station_coffee {
        name = "STR_Shop_Station_Coffee";
        side = "";
        conditions = "";
        items[] = { "coffee", "donuts", "redgull", "toolkit", "fuelFull"};
    };
*/
	
	// Routen
	
    class brennstoff { //Brennelementefabrik
        name = "STR_Shops_Brennstoff";
        side = "civ";
        conditions = "";
        items[] = {"brennstoff_p"};
    };
	
	class batterie { //Autowerkstatt
        name = "STR_Shops_Batterie";
        side = "civ";
        conditions = "";
        items[] = {"batterie_p"};
    };
	
	class bakery { //Bäckerei
        name = "STR_Shops_Bakery";
        side = "civ";
        conditions = "";
        items[] = {"getreide_p","zucker_p","food3_s","backware1","backware2","backware3","warmdrink"};
    };
	
	class nuclear { //Atommüll Versiegelung
        name = "STR_Shops_Nuclear";
        side = "civ";
        conditions = "";
        items[] = {"nuclear_p"};
    };
	
	class kaviar { //Chefkoch
        name = "STR_Shops_Kaviar";
        side = "civ";
        conditions = "";
        items[] = {"kaviar_p"};
    };
	
	class dealer { //Drogendealer
        name = "STR_Shops_Dealer";
        side = "civ";
        conditions = "";
        items[] = {"meth_p","ecstasy_p","heroin_p","liq_ecstasy_p","morphin_p","opium_p","poppers_p"};
    };
	
	class papier { //Druckerei
        name = "STR_Shops_Papier";
        side = "civ";
        conditions = "";
        items[] = {"papier_p"};
    };
	
	class metall { //Eisen & Aluminium Händler
        name = "STR_Shops_Metall";
        side = "civ";
        conditions = "";
        items[] = {"eisen_p","alu_p"};
    };
	
	class eisen { //Eisen Händler
        name = "STR_Shops_Metall";
        side = "civ";
        conditions = "";
        items[] = {"eisen_p"};
    };
	
	class fisch { //Fischhändler
        name = "STR_Shops_Fisch";
        side = "civ";
        conditions = "";
        items[] = {"fisch_p"};
    };
	
	class glas { //Glaser
        name = "STR_Shops_Glas";
        side = "civ";
        conditions = "";
        items[] = {"glas_p"};
    };
	
	class gold { //Juwelier
        name = "STR_Shops_Gold";
        side = "civ";
        conditions = "";
        items[] = {"gold_p","goldBar"};
    };
	
	class kohle { //Kohlekraftwerk
        name = "STR_Shops_Kohle";
        side = "civ";
        conditions = "license_civ_kohle";
        items[] = {"kohle_s"};
    };
	
	class korallen { //Korallenschmuggler
        name = "STR_Shops_Korallen";
        side = "civ";
        conditions = "license_civ_korallen";
        items[] = {"korallen_s"};
    };
	
	class kraftstoff { //Kraftstofflieferanten
        name = "STR_Shops_Kraftstoff";
        side = "civ";
        conditions = "";
        items[] = {"benzin_p","diesel_p","lpg_p"};
    };
	
	class plastik { //Kunststoffhändler
        name = "STR_Shops_Plastik";
        side = "civ";
        conditions = "";
        items[] = {"plastik_p"};
    };
	
	class kupfer { //Kupfermanufaktur
        name = "STR_Shops_Kupfer";
        side = "civ";
        conditions = "";
        items[] = {"kupfer_p"};
    };
	
	class handel { //Lebensmittel-Großhandel
        name = "STR_Shops_Handel";
        side = "civ";
        conditions = "";
        items[] = {"wasser_p","fishcan_c","turtlecan_c"};
    };
	
	class taverne { //Moe´s Taverne
        name = "STR_Shops_Taverne";
        side = "civ";
        conditions = "";
        items[] = {"milch_p","whiskey_c"};
    };
	
	class cargo { //Pfandleihhaus
        name = "STR_Shops_Cargo";
        side = "civ";
        conditions = "";
        items[] = {"cargo1_p","cargo2_p","cargo3_p"};
    };
	
	class qsilber { //Quecksilberhändler
        name = "STR_Shops_Qsilber";
        side = "civ";
        conditions = "";
        items[] = {"qsilber_p"};
    };
	
	class holz { //Schreinerei
        name = "STR_Shops_Holz";
        side = "civ";
        conditions = "";
        items[] = {"holz_p"};
    };
	
	class turtleshop { //Tierschmuggler
        name = "STR_Shops_Turtleshop";
        side = "civ";
        conditions = "license_civ_turtle";
        items[] = {"turtle_s"};
    };
	
	class probe { //Wasserprobenabnehmer
        name = "STR_Shops_Probe";
        side = "civ";
        conditions = "";
        items[] = {"probe_p"};
    };
	
	class zinn { //Zinnhändler
        name = "STR_Shops_Zinn";
        side = "civ";
        conditions = "";
        items[] = {"zinn_s"};
    };
	
	// Händler als Feld

	class chemie { //Chemiefachhändler (Liquid-Ecstasy-Feld)
        name = "STR_Shops_Chemie";
        side = "civ";
        conditions = "";
        items[] = {"liq_ecstasy_u"};
    };
	
	class ethan { //Ethanverkäufer (LPG-Feld)
		name = "STR_Shops_Ethan";
		side = "civ";
		conditions = "";
		items[] = {"lpg_u"};
	};
	
	// Kombi-Routen
	
	class carbon { //Autofirma
        name = "STR_Shops_Carbon";
        side = "civ";
        conditions = "";
        items[] = {"carbon_c"};
    };
	
	class fenster { //Baustelle
		name = "STR_Shops_Fenster";
		side = "civ";
		conditions = "";
		items[] = {"fenster_c"};
	};
	
	class pistolen { //Waffenladen
		name = "STR_Shops_Pistolen";
		side = "civ";
		conditions = "";
		items[] = {"pistol_c"};
	};
	
	class bronze { //Bronzehändler
		name = "STR_Shops_Bronze";
		side = "civ";
		conditions = "";
		items[] = {"bronze_c"};
	};
	
	class pipe { //Opiumpfeifenhändler
        name = "STR_Shops_Pipe";
        side = "civ";
        conditions = "";
        items[] = {"pipe_c"};
    };
	
	class rifle { //Rebellenwaffenhändler
		name = "STR_Shops_Rifle";
		side = "civ";
		conditions = "";
		items[] = {"rifle_c"};
	};
	
	class frachtkiste {
		name = "STR_Shops_Frachtkiste";
		side = "civ";
		conditions = "";
		items[] = {"frachtkiste_p"};
	};
	
	
	// Cop Shop
	
    class cop {
        name = "STR_Shops_Cop";
        side = "cop";
        conditions = "";
        items[] = {"peach","obst1","obst2","backware1","backware2","backware3","essen_warm1","essen_warm2","essen_warm3","delikatesse","energy","warmdrink","waterbottle","fuelF","lockpick","spikeStrip","mauer","sperre","wand","schranke","lampe","tisch","defusekit","kidney"};
    };

	// PRS Shop
	
    class medicmarket {
        name = "STR_Shops_PRS";
        side = "med";
        conditions = "";
        items[] = {"peach","obst1","obst2","backware1","backware2","essen_warm1","essen_warm2","essen_warm3","delikatesse","energy","warmdrink","waterbottle","fuelF","lockpick","pille","impfstoff","antibiotika","abfuehrmittel","marihuana","antidepressiva","mauer","sperre","wand","generator","matratze","schranke","lampe","tisch","zelt","dixi","kidney"};
    };
	
	// Admin Shops
	
	class adminmarket {
        name = "STR_Shops_Market";
        side = "civ";
        conditions = "license_civ_admin1 && call life_adminlevel >= 5";
        items[] = {"peach","obst1","obst2","backware1","backware2","essen_warm1","essen_warm2","essen_warm3","delikatesse","energy","warmdrink","waterbottle","alkohol","limo","pickaxe","fuelE","angel","sense","schaufel","axt","spikeStrip","lockpick","fuelF","scalpel","defusekit","lampe","sperre","mauer","wand","schranke","dixi","tisch","generator","matratze","zelt","geld","boltcutter","blastingcharge","storagesmall","storagebig","kidney","storagebigextra"};
    };
	
	class admin1 {
        name = "STR_Shops_Market";
        side = "civ";
        conditions = "license_civ_admin1 && call life_adminlevel >= 5";
        items[] = {"peach","obst1","obst2","backware1","backware2","essen_warm1","essen_warm2","essen_warm3","delikatesse","energy","warmdrink","waterbottle","alkohol","limo","pickaxe","fuelE","angel","sense","schaufel","axt","spikeStrip","lockpick","fuelF","scalpel","defusekit","lampe","sperre","mauer","wand","schranke","dixi","tisch","generator","matratze","zelt","geld","boltcutter","blastingcharge","storagesmall","storagebig","kidney","storagebigextra"};
    };
};

/*
*    CLASS:
*        variable = Variable Name
*        displayName = Item Name
*        weight = Item Weight
*        buyPrice = Item Buy Price
*        sellPrice = Item Sell Price
*        illegal = Illegal Item
*        edible = Item Edible (-1 = Disabled)
*        icon = Item Icon
*        processedItem = Processed Item
*/
class VirtualItems {
    //Virtual Items
	
	//ROUTEN (A-Z)
	
	//LEGAL
	class alu_p { //Aluminiumblech	
		variable = "alu_p";
		displayName = "STR_Item_alu_p";
		weight = 4;
		buyPrice = -1;
		sellPrice = SALU_P;
		illegal = false;
		edible = -1;
		icon = "icons\ico_alu_p.paa";
		liquid = false;
		showPrice = true;
		proccesedItem = "";
	};	
		
	class alu_u { //Bauxit	
		variable = "alu_u";
		displayName = "STR_Item_alu_u";
		weight = 6;
		buyPrice = -1;
		sellPrice = -1;
		illegal = false;
		edible = -1;
		icon = "icons\ico_alu_u.paa";
		liquid = false;
		showPrice = false;
		proccesedItem = "alu_p";
	};	
		
	class nuclear_p { //Atommüll	
		variable = "nuclear_p";
		displayName = "STR_Item_nuclear_p";
		weight = 75;
		buyPrice = -1;
		sellPrice = SNUCLEAR_P;
		illegal = false;
		edible = -1;
		icon = "icons\ico_nuclear_p.paa";
		liquid = false;
		showPrice = true;
		proccesedItem = "";
	};	
		
	class nuclear_u { //Brennelemente	
		variable = "nuclear_u";
		displayName = "STR_Item_nuclear_u";
		weight = 75;
		buyPrice = -1;
		sellPrice = -1;
		illegal = false;
		edible = -1;
		icon = "icons\ico_nuclear_u.paa";
		liquid = false;
		showPrice = false;
		proccesedItem = "nuclear_p";
	};	
	
	class benzin_p { //Benzin	
		variable = "benzin_p";
		displayName = "STR_Item_benzin_p";
		weight = 4;
		buyPrice = -1;
		sellPrice = SBENZIN_P;
		illegal = false;
		edible = -1;
		icon = "icons\ico_oel_p.paa";
		liquid = true;
		showPrice = true;
		proccesedItem = "";
	};	
		
	class oel_u { //Rohöl	
		variable = "oel_u";
		displayName = "STR_Item_oel_u";
		weight = 9;
		buyPrice = -1;
		sellPrice = -1;
		illegal = false;
		edible = -1;
		icon = "icons\ico_oel_u.paa";
		liquid = true;
		showPrice = false;
		proccesedItem = "benzin_p";
	};	
		
	class bronze_c { //Bronze	
		variable = "bronze_c";
		displayName = "STR_Item_bronze_c";
		weight = 4;
		buyPrice = -1;
		sellPrice = SBRONZE_C;
		illegal = false;
		edible = -1;
		icon = "icons\ico_bronze_c.paa";
		liquid = false;
		showPrice = true;
		proccesedItem = "";
	};	
		
	class carbon_c { //CFK	
		variable = "carbon_c";
		displayName = "STR_Item_carbon_c";
		weight = 2;
		buyPrice = -1;
		sellPrice = SCARBON_C;
		illegal = false;
		edible = -1;
		icon = "icons\ico_carbon_c.paa";
		liquid = false;
		showPrice = true;
		proccesedItem = "";
	};	
		
	class diesel_p { //Diesel	
		variable = "diesel_p";
		displayName = "STR_Item_diesel_p";
		weight = 6;
		buyPrice = -1;
		sellPrice = SDIESEL_P;
		illegal = false;
		edible = -1;
		icon = "icons\ico_oel_p.paa";
		liquid = true;
		showPrice = true;
		proccesedItem = "";
	};	
		
	class eisen_p { //Eisenbarren	
		variable = "eisen_p";
		displayName = "STR_Item_eisen_p";
		weight = 4;
		buyPrice = -1;
		sellPrice = SEISEN_P;
		illegal = false;
		edible = -1;
		icon = "icons\ico_eisen_p.paa";
		liquid = false;
		showPrice = true;
		proccesedItem = "";
	};	
		
	class eisen_u { //Eisenerz	
		variable = "eisen_u";
		displayName = "STR_Item_eisen_u";
		weight = 6;
		buyPrice = -1;
		sellPrice = -1;
		illegal = false;
		edible = -1;
		icon = "icons\ico_eisen_u.paa";
		liquid = false;
		showPrice = false;
		proccesedItem = "eisen_p";
	};	
		
	class fishcan_c { //Fischkonserve
		variable = "fishcan_c";
		displayName = "STR_Item_fishcan_c";
		weight = 4;
		buyPrice = -1;
		sellPrice = SFISHCAN_C;
		illegal = false;
		edible = 45;
		icon = "icons\ico_fishcan_c.paa";
		liquid = false;
		showPrice = true;
		proccesedItem = "";
	};	
		
	class fenster_c { //Fenster	
		variable = "fenster_c";
		displayName = "STR_Item_fenster_c";
		weight = 5;
		buyPrice = -1;
		sellPrice = SFENSTER_C;
		illegal = false;
		edible = -1;
		icon = "icons\ico_fenster_c.paa";
		liquid = false;
		showPrice = true;
		proccesedItem = "";
	};	
		
	class fisch_u { //Fisch	
		variable = "fisch_u";
		displayName = "STR_Item_fisch_u";
		weight = 3;
		buyPrice = -1;
		sellPrice = -1;
		illegal = false;
		edible = -1;
		icon = "icons\ico_fisch_u.paa";
		liquid = false;
		showPrice = false;
		proccesedItem = "fisch_p";
	};	
		
	class fisch_p { //Fischfilet	
		variable = "fisch_p";
		displayName = "STR_Item_fisch_p";
		weight = 2;
		buyPrice = -1;
		sellPrice = SFISCH_P;
		illegal = false;
		edible = 50;
		icon = "icons\ico_fisch_p.paa";
		liquid = false;
		showPrice = true;
		proccesedItem = "";
	};	
		
	class glas_p { //Glas	
		variable = "glas_p";
		displayName = "STR_Item_glas_p";
		weight = 1;
		buyPrice = -1;
		sellPrice = SGLAS_P;
		illegal = false;
		edible = -1;
		icon = "icons\ico_glas_p.paa";
		liquid = false;
		showPrice = true;
		proccesedItem = "";
	};	
		
	class sand_u { //Sand	
		variable = "sand_u";
		displayName = "STR_Item_sand_u";
		weight = 3;
		buyPrice = -1;
		sellPrice = -1;
		illegal = false;
		edible = -1;
		icon = "icons\ico_sand_u.paa";
		liquid = false;
		showPrice = false;
		proccesedItem = "glas_p";
	};	
		
	class gold_p { //Goldbarren	
		variable = "gold_p";
		displayName = "STR_Item_gold_p";
		weight = 6;
		buyPrice = -1;
		sellPrice = SGOLD_P;
		illegal = false;
		edible = -1;
		icon = "icons\ico_gold_p.paa";
		liquid = false;
		showPrice = true;
		proccesedItem = "";
	};	
		
	class gold_u { //Golderz	
		variable = "gold_u";
		displayName = "STR_Item_gold_u";
		weight = 9;
		buyPrice = -1;
		sellPrice = -1;
		illegal = false;
		edible = -1;
		icon = "icons\ico_gold_u.paa";
		liquid = false;
		showPrice = false;
		proccesedItem = "gold_p";
	};	
		
	class milch_p { //H-Milch	
		variable = "milch_p";
		displayName = "STR_Item_milch_p";
		weight = 3;
		buyPrice = -1;
		sellPrice = SMILCH_P;
		illegal = false;
		edible = 100;
		icon = "icons\ico_milch_p.paa";
		liquid = true;
		showPrice = true;
		proccesedItem = "";
	};	
		
	class milch_u { //Milch	
		variable = "milch_u";
		displayName = "STR_Item_milch_u";
		weight = 3;
		buyPrice = -1;
		sellPrice = -1;
		illegal = false;
		edible = 100;
		icon = "icons\ico_milch_u.paa";
		liquid = true;
		showPrice = false;
		proccesedItem = "milch_p";
	};	
		
	class holz_p { //Holzbretter	
		variable = "holz_p";
		displayName = "STR_Item_holz_p";
		weight = 4;
		buyPrice = -1;
		sellPrice = SHOLZ_P;
		illegal = false;
		edible = -1;
		icon = "icons\ico_holz_p.paa";
		liquid = false;
		showPrice = true;
		proccesedItem = "";
	};	
		
	class holz_u { //Baumstamm	
		variable = "holz_u";
		displayName = "STR_Item_holz_u";
		weight = 5;
		buyPrice = -1;
		sellPrice = -1;
		illegal = false;
		edible = -1;
		icon = "icons\ico_holz_u.paa";
		liquid = false;
		showPrice = false;
		proccesedItem = "holz_p";
	};	
		
	class kaviar_p { //Kaviar	
		variable = "kaviar_p";
		displayName = "STR_Item_kaviar_p";
		weight = 1;
		buyPrice = -1;
		sellPrice = SKAVIAR_P;
		illegal = false;
		edible = 15;
		icon = "icons\ico_kaviar_p.paa";
		liquid = false;
		showPrice = true;
		proccesedItem = "";
	};	
		
	class brennstoff_p { //Kernbrennstoff	
		variable = "brennstoff_p";
		displayName = "STR_Item_brennstoff_p";
		weight = 75;
		buyPrice = -1;
		sellPrice = SBRENNSTOFF_P;
		illegal = false;
		edible = -1;
		icon = "icons\ico_brennstoff_p.paa";
		liquid = false;
		showPrice = true;
		proccesedItem = "";
	};	
		
	class brennstoff_u { //Uran-235	
		variable = "brennstoff_u";
		displayName = "STR_Item_brennstoff_u";
		weight = 75;
		buyPrice = -1;
		sellPrice = -1;
		illegal = false;
		edible = -1;
		icon = "icons\ico_brennstoff_u.paa";
		liquid = false;
		showPrice = false;
		proccesedItem = "brennstoff_p";
	};	
		
	class plastik_p { //Kunststoff	
		variable = "plastik_p";
		displayName = "STR_Item_plastik_p";
		weight = 3;
		buyPrice = -1;
		sellPrice = SPLASTIK_P;
		illegal = false;
		edible = -1;
		icon = "icons\ico_plastik_p.paa";
		liquid = false;
		showPrice = true;
		proccesedItem = "";
	};	
		
	class kupfer_p { //Kupferbarren	
		variable = "kupfer_p";
		displayName = "STR_Item_kupfer_p";
		weight = 4;
		buyPrice = -1;
		sellPrice = SKUPFER_P;
		illegal = false;
		edible = -1;
		icon = "icons\ico_kupfer_p.paa";
		liquid = false;
		showPrice = true;
		proccesedItem = "";
	};	
		
	class kupfer_u { //Kupfererz	
		variable = "kupfer_u";
		displayName = "STR_Item_kupfer_u";
		weight = 6;
		buyPrice = -1;
		sellPrice = -1;
		illegal = false;
		edible = -1;
		icon = "icons\ico_kupfer_u.paa";
		liquid = false;
		showPrice = false;
		proccesedItem = "kupfer_p";
	};	
	
	class food_s { //Lebensmittel (Verwendung nur für Handelspreise)
		variable = "food_s";
		displayName = "STR_Item_food_s";
		weight = 2;
		buyPrice = -1;
		sellPrice = SFOOD_S;
		illegal = false;
		edible = 40;
		icon = "icons\ico_food1_s.paa";
		liquid = false;
		showPrice = true;
		proccesedItem = "";
	};
		
	class food1_s { //Käse	
		variable = "food1_s";
		displayName = "STR_Item_food1_s";
		weight = 2;
		buyPrice = -1;
		sellPrice = SFOOD_S;
		illegal = false;
		edible = 40;
		icon = "icons\ico_food1_s.paa";
		liquid = false;
		showPrice = false;
		proccesedItem = "";
	};	
		
	class food2_s { //Fleisch	
		variable = "food2_s";
		displayName = "STR_Item_food2_s";
		weight = 2;
		buyPrice = -1;
		sellPrice = SFOOD_S;
		illegal = false;
		edible = 55;
		icon = "icons\ico_food2_s.paa";
		liquid = false;
		showPrice = false;
		proccesedItem = "";
	};	
		
	class food3_s { //Brot	
		variable = "food3_s";
		displayName = "STR_Item_food3_s";
		weight = 2;
		buyPrice = -1;
		sellPrice = SFOOD_S;
		illegal = false;
		edible = 45;
		icon = "icons\ico_food3_s.paa";
		liquid = false;
		showPrice = false;
		proccesedItem = "";
	};	
		
	class food4_s { //Obst	
		variable = "food4_s";
		displayName = "STR_Item_food4_s";
		weight = 2;
		buyPrice = -1;
		sellPrice = SFOOD_S;
		illegal = false;
		edible = 30;
		icon = "icons\ico_food4_s.paa";
		liquid = false;
		showPrice = false;
		proccesedItem = "";
	};	
		
	class lpg_u { //Ethan	
		variable = "lpg_u";
		displayName = "STR_Item_lpg_u";
		weight = 4;
		buyPrice = 1500;
		sellPrice = 250;
		illegal = false;
		edible = -1;
		icon = "icons\ico_lpg_u.paa";
		liquid = true;
		showPrice = false;
		proccesedItem = "lpg_p";
	};	
		
	class lpg_p { //LPG	
		variable = "lpg_p";
		displayName = "STR_Item_lpg_p";
		weight = 3;
		buyPrice = -1;
		sellPrice = SLPG_P;
		illegal = false;
		edible = -1;
		icon = "icons\ico_lpg_p.paa";
		liquid = true;
		showPrice = true;
		proccesedItem = "";
	};	
		
	class getreide_u { //Getreide	
		variable = "getreide_u";
		displayName = "STR_Item_getreide_u";
		weight = 5;
		buyPrice = -1;
		sellPrice = -1;
		illegal = false;
		edible = -1;
		icon = "icons\ico_getreide_u.paa";
		liquid = false;
		showPrice = false;
		proccesedItem = "getreide_p";
	};	
		
	class getreide_p { //Mehl	
		variable = "getreide_p";
		displayName = "STR_Item_getreide_p";
		weight = 3;
		buyPrice = -1;
		sellPrice = SGETREIDE_P;
		illegal = false;
		edible = -1;
		icon = "icons\ico_getreide_p.paa";
		liquid = false;
		showPrice = true;
		proccesedItem = "";
	};	
		
	class papier_p { //Papier	
		variable = "papier_p";
		displayName = "STR_Item_papier_p";
		weight = 2;
		buyPrice = -1;
		sellPrice = SPAPIER_P;
		illegal = false;
		edible = -1;
		icon = "icons\ico_papier_p.paa";
		liquid = false;
		showPrice = true;
		proccesedItem = "";
	};	
		
	class pistol_c { //Pistole	
		variable = "pistol_c";
		displayName = "STR_Item_pistol_c";
		weight = 6;
		buyPrice = -1;
		sellPrice = SPISTOL_C;
		illegal = false;
		edible = -1;
		icon = "icons\ico_pistol_c.paa";
		liquid = false;
		showPrice = true;
		proccesedItem = "";
	};	
		
	class qsilber_p { //Reines Quecksilber	
		variable = "qsilber_p";
		displayName = "STR_Item_qsilber_p";
		weight = 4;
		buyPrice = -1;
		sellPrice = SQSILBER_P;
		illegal = false;
		edible = -1;
		icon = "icons\ico_qsilber_p.paa";
		liquid = true;
		showPrice = true;
		proccesedItem = "";
	};	
		
	class qsilber_u { //Unreines Quecksilber	
		variable = "qsilber_u";
		displayName = "STR_Item_qsilber_u";
		weight = 6;
		buyPrice = -1;
		sellPrice = -1;
		illegal = false;
		edible = -1;
		icon = "icons\ico_qsilber_u.paa";
		liquid = true;
		showPrice = false;
		proccesedItem = "qsilber_p";
	};
	
		
	class kohle_s { //Steinkohle	
		variable = "kohle_s";
		displayName = "STR_Item_kohle_s";
		weight = 6;
		buyPrice = -1;
		sellPrice = SKOHLE_S;
		illegal = false;
		edible = -1;
		icon = "icons\ico_kohle_s.paa";
		liquid = false;
		showPrice = true;
		proccesedItem = "";
	};	
		
	class schrott_p { //Schrott	
		variable = "schrott_p";
		displayName = "STR_Item_schrott_p";
		weight = 4;
		buyPrice = -1;
		sellPrice = -1;
		illegal = false;
		edible = -1;
		icon = "icons\ico_schrott_p.paa";
		liquid = false;
		showPrice = false;
		proccesedItem = "";
	};

	class workbench_p { //Werkbank	
		variable = "workbench_p";
		displayName = "STR_Item_workbench_p";
		weight = 20;
		buyPrice = -1;
		sellPrice = -1;
		illegal = false;
		edible = -1;
		icon = "";
		liquid = false;
		showPrice = false;
		proccesedItem = "";
	};
	
	class destille_p { //Destille	
		variable = "destille_p";
		displayName = "STR_Item_destille_p";
		weight = 20;
		buyPrice = -1;
		sellPrice = -1;
		illegal = false;
		edible = -1;
		icon = "";
		liquid = false;
		showPrice = false;
		proccesedItem = "";
	};
		
	class waffenbody_p { //Waffenbody	
		variable = "waffenbody_p";
		displayName = "STR_Item_waffenbody_p";
		weight = 8;
		buyPrice = -1;
		sellPrice = -1;
		illegal = false;
		edible = -1;
		icon = "";
		liquid = false;
		showPrice = false;
		proccesedItem = "";
	};	
		
	class wasser_u { //Salzwasser	
		variable = "wasser_u";
		displayName = "STR_Item_wasser_u";
		weight = 2;
		buyPrice = -1;
		sellPrice = -1;
		illegal = false;
		edible = -1;
		icon = "icons\ico_wasser_u.paa";
		liquid = true;
		showPrice = false;
		proccesedItem = "wasser_p";
	};	
		
	class wasser_p { //Wasser	
		variable = "wasser_p";
		displayName = "STR_Item_wasser_p";
		weight = 2;
		buyPrice = -1;
		sellPrice = SWASSER_P;
		illegal = false;
		edible = 100;
		icon = "icons\ico_wasser_p.paa";
		liquid = true;
		showPrice = true;
		proccesedItem = "";
	};	
		
	class zinn_s { //Zinnbarren	
		variable = "zinn_s";
		displayName = "STR_Item_zinn_s";
		weight = 3;
		buyPrice = -1;
		sellPrice = SZINN_S;
		illegal = false;
		edible = -1;
		icon = "icons\ico_zinn_s.paa";
		liquid = false;
		showPrice = true;
		proccesedItem = "";
	};	
		
	class zucker_p { //Zucker	
		variable = "zucker_p";
		displayName = "STR_Item_zucker_p";
		weight = 7;
		buyPrice = -1;
		sellPrice = SZUCKER_P;
		illegal = false;
		edible = -1;
		icon = "icons\ico_zucker_p.paa";
		liquid = false;
		showPrice = true;
		proccesedItem = "";
	};	
		
	class zucker_u { //Zuckerrohr	
		variable = "zucker_u";
		displayName = "STR_Item_zucker_u";
		weight = 9;
		buyPrice = -1;
		sellPrice = -1;
		illegal = false;
		edible = -1;
		icon = "icons\ico_zucker_u.paa";
		liquid = false;
		showPrice = false;
		proccesedItem = "zucker_p";
	};
	
	//ILLEGAL
		
	class batterie_u { //leere Batterie	
		variable = "batterie_u";
		displayName = "STR_Item_batterie_u";
		weight = 3;
		buyPrice = -1;
		sellPrice = -1;
		illegal = true;
		edible = -1;
		icon = "icons\ico_batterie_u.paa";
		liquid = false;
		showPrice = false;
		proccesedItem = "batterie_p";
	};	
		
	class batterie_p { //volle Batterie	
		variable = "batterie_p";
		displayName = "STR_Item_batterie_p";
		weight = 3;
		buyPrice = -1;
		sellPrice = SBATTERIE_P;
		illegal = true;
		edible = -1;
		icon = "icons\ico_batterie_p.paa";
		liquid = false;
		showPrice = true;
		proccesedItem = "";
	};
	
	class frachtkiste_p { //Frachtkiste	
		variable = "frachtkiste_p";
		displayName = "STR_Item_frachtkiste_p";
		weight = 35;
		buyPrice = -1;
		sellPrice = SFRACHTKISTE_P;
		illegal = true;
		edible = -1;
		icon = "";
		liquid = false;
		showPrice = true;
		proccesedItem = "";
	};
		
	class meth_u { //Chemische Stoffe	
		variable = "meth_u";
		displayName = "STR_Item_meth_u";
		weight = 8;
		buyPrice = -1;
		sellPrice = -1;
		illegal = true;
		edible = -1;
		icon = "icons\ico_meth_u.paa";
		liquid = false;
		showPrice = false;
		proccesedItem = "meth_p";
	};	
		
	class meth_p { //Crystal Meth	
		variable = "meth_p";
		displayName = "STR_Item_meth_p";
		weight = 6;
		buyPrice = -1;
		sellPrice = SMETH_P;
		illegal = true;
		edible = -1;
		icon = "icons\ico_meth_p.paa";
		liquid = false;
		showPrice = true;
		proccesedItem = "";
	};
		
	class ecstasy_p { //Ecstasy	
		variable = "ecstasy_p";
		displayName = "STR_Item_ecstasy_p";
		weight = 5;
		buyPrice = -1;
		sellPrice = SECSTASY_P;
		illegal = true;
		edible = -1;
		icon = "icons\ico_ecstasy_p.paa";
		liquid = false;
		showPrice = true;
		proccesedItem = "";
	};	
		
	class ecstasy_u { //Orangenwurzel	
		variable = "ecstasy_u";
		displayName = "STR_Item_ecstasy_u";
		weight = 6;
		buyPrice = -1;
		sellPrice = -1;
		illegal = true;
		edible = -1;
		icon = "icons\ico_ecstasy_u.paa";
		liquid = false;
		showPrice = false;
		proccesedItem = "ecstasy_p";
	};		
		
	class cargo_u { //Schiffsfracht	
		variable = "cargo_u";
		displayName = "STR_Item_cargo_u";
		weight = 8;
		buyPrice = -1;
		sellPrice = -1;
		illegal = true;
		edible = -1;
		icon = "icons\ico_cargo_u.paa";
		liquid = false;
		showPrice = false;
		proccesedItem = "cargo1_p";
	};	
		
	class cargo1_p { //Gemälde	
		variable = "cargo1_p";
		displayName = "STR_Item_cargo1_p";
		weight = 3;
		buyPrice = -1;
		sellPrice = SCARGO1_P;
		illegal = true;
		edible = -1;
		icon = "icons\ico_cargo1_p.paa";
		liquid = false;
		showPrice = true;
		proccesedItem = "";
	};	
		
	class cargo2_p { //Skulpturen	
		variable = "cargo2_p";
		displayName = "STR_Item_cargo2_p";
		weight = 4;
		buyPrice = -1;
		sellPrice = SCARGO2_P;
		illegal = true;
		edible = -1;
		icon = "icons\ico_cargo2_p.paa";
		liquid = false;
		showPrice = false;
		proccesedItem = "";
	};	
		
	class cargo3_p { //Silberbesteck	
		variable = "cargo3_p";
		displayName = "STR_Item_cargo3_p";
		weight = 4;
		buyPrice = -1;
		sellPrice = SCARGO3_P;
		illegal = true;
		edible = -1;
		icon = "icons\ico_cargo3_p.paa";
		liquid = false;
		showPrice = false;
		proccesedItem = "";
	};
		
	class heroin_p { //Heroin	
		variable = "heroin_p";
		displayName = "STR_Item_heroin_p";
		weight = 4;
		buyPrice = -1;
		sellPrice = SHEROIN_P;
		illegal = true;
		edible = -1;
		icon = "icons\ico_heroin_p.paa";
		liquid = false;
		showPrice = true;
		proccesedItem = "";
	};	
		
	class rifle_c { //Kalaschnikow	
		variable = "rifle_c";
		displayName = "STR_Item_rifle_c";
		weight = 12;
		buyPrice = -1;
		sellPrice = SRIFLE_C;
		illegal = true;
		edible = -1;
		icon = "icons\ico_rifle_c.paa";
		liquid = false;
		showPrice = true;
		proccesedItem = "";
	};	
		
	class korallen_s { //Korallen	
		variable = "korallen_s";
		displayName = "STR_Item_korallen_s";
		weight = 4;
		buyPrice = -1;
		sellPrice = SKORALLEN_S;
		illegal = true;
		edible = -1;
		icon = "icons\ico_korallen_s.paa";
		liquid = false;
		showPrice = true;
		proccesedItem = "";
	};	
		
	class liq_ecstasy_p { //Liquid-Ecstasy	
		variable = "liq_ecstasy_p";
		displayName = "STR_Item_liq_ecstasy_p";
		weight = 5;
		buyPrice = -1;
		sellPrice = SLIQ_ECSTASY_P;
		illegal = true;
		edible = -1;
		icon = "icons\ico_liq_ecstasy_p.paa";
		liquid = true;
		showPrice = true;
		proccesedItem = "";
	};	
		
	class liq_ecstasy_u { //Natronlauge	
		variable = "liq_ecstasy_u";
		displayName = "STR_Item_liq_ecstasy_u";
		weight = 6;
		buyPrice = 2000;
		sellPrice = 400;
		illegal = true;
		edible = -1;
		icon = "icons\ico_liq_ecstasy_u.paa";
		liquid = true;
		showPrice = false;
		proccesedItem = "liq_ecstasy_p";
	};
		
	class morphin_p { //Morphin	
		variable = "morphin_p";
		displayName = "STR_Item_morphin_p";
		weight = 2;
		buyPrice = -1;
		sellPrice = SMORPHIN_P;
		illegal = true;
		edible = -1;
		icon = "icons\ico_morphin_p.paa";
		liquid = false;
		showPrice = true;
		proccesedItem = "";
	};	
		
	class opium_p { //Opium	
		variable = "opium_p";
		displayName = "STR_Item_opium_p";
		weight = 1;
		buyPrice = -1;
		sellPrice = SOPIUM_P;
		illegal = true;
		edible = -1;
		icon = "icons\ico_opium_p.paa";
		liquid = false;
		showPrice = true;
		proccesedItem = "";
	};	
		
	class mohn_u { //Mohn	
		variable = "mohn_u";
		displayName = "STR_Item_mohn_u";
		weight = 3;
		buyPrice = -1;
		sellPrice = -1;
		illegal = true;
		edible = -1;
		icon = "icons\ico_mohn_u.paa";
		liquid = false;
		showPrice = false;
		proccesedItem = "opium_p";
	};	
		
	class pipe_c { //Opiumpfeife	
		variable = "pipe_c";
		displayName = "STR_Item_pipe_c";
		weight = 5;
		buyPrice = -1;
		sellPrice = SPIPE_C;
		illegal = true;
		edible = -1;
		icon = "icons\ico_pipe_c.paa";
		liquid = false;
		showPrice = true;
		proccesedItem = "";
	};	
		
	class poppers_p { //Poppers	
		variable = "poppers_p";
		displayName = "STR_Item_poppers_p";
		weight = 4;
		buyPrice = -1;
		sellPrice = SPOPPERS_P;
		illegal = true;
		edible = -1;
		icon = "icons\ico_poppers_p.paa";
		liquid = true;
		showPrice = true;
		proccesedItem = "";
	};	
		
	class poppers_u { //Salpetrige Säure	
		variable = "poppers_u";
		displayName = "STR_Item_poppers_u";
		weight = 6;
		buyPrice = -1;
		sellPrice = -1;
		illegal = true;
		edible = -1;
		icon = "icons\ico_poppers_u.paa";
		liquid = true;
		showPrice = false;
		proccesedItem = "poppers_p";
	};	
		
	class turtle_s { //Schildkröte	
		variable = "turtle_s";
		displayName = "STR_Item_turtle_s";
		weight = 6;
		buyPrice = -1;
		sellPrice = STURTLE_S;
		illegal = true;
		edible = -1;
		icon = "icons\ico_turtle_s.paa";
		liquid = false;
		showPrice = true;
		proccesedItem = "";
	};
		
	class turtlecan_c { //Dosenschildkröte	
		variable = "turtlecan_c";
		displayName = "STR_Item_turtlecan_c";
		weight = 4;
		buyPrice = -1;
		sellPrice = STURTLECAN_C;
		illegal = true;
		edible = 30;
		icon = "icons\ico_turtlecan_c.paa";
		liquid = false;
		showPrice = true;
		proccesedItem = "";
	};
		
	class slop_u { //Schmutzwasser	
		variable = "slop_u";
		displayName = "STR_Item_slop_u";
		weight = 2;
		buyPrice = -1;
		sellPrice = -1;
		illegal = true;
		edible = -1;
		icon = "icons\ico_slop_u.paa";
		liquid = true;
		showPrice = false;
		proccesedItem = "probe_p";
	};	
		
	class probe_p { //Wasserprobe	
		variable = "probe_p";
		displayName = "STR_Item_probe_p";
		weight = 1;
		buyPrice = -1;
		sellPrice = SPROBE_P;
		illegal = true;
		edible = -1;
		icon = "icons\ico_probe_p.paa";
		liquid = true;
		showPrice = true;
		proccesedItem = "";
	};	
		
	class whiskey_c { //Whiskey	
		variable = "whiskey_c";
		displayName = "STR_Item_whiskey_c";
		weight = 2;
		buyPrice = -1;
		sellPrice = SWHISKEY_C;
		illegal = true;
		edible = 20;
		icon = "icons\ico_whiskey_c.paa";
		liquid = true;
		showPrice = true;
		proccesedItem = "";
	};	
		
	// MISC / Tools
		
	class pickaxe { //Spitzhacke	
		variable = "pickaxe";
		displayName = "STR_Item_pickaxe";
		weight = 2;
		buyPrice = 1150;
		sellPrice = 288;
		illegal = false;
		edible = -1;
		icon = "icons\ico_pickaxe.paa";
		liquid = false;
		showPrice = false;
		proccesedItem = "";
	};	
		
	class angel { //Angel	
		variable = "angel";
		displayName = "STR_Item_angel";
		weight = 1;
		buyPrice = 1100;
		sellPrice = 275;
		illegal = false;
		edible = -1;
		icon = "icons\ico_angel.paa";
		liquid = false;
		showPrice = false;
		proccesedItem = "";
	};	
		
	class sense { //Sense	
		variable = "sense";
		displayName = "STR_Item_sense";
		weight = 3;
		buyPrice = 1125;
		sellPrice = 281;
		illegal = false;
		edible = -1;
		icon = "icons\ico_sense.paa";
		liquid = false;
		showPrice = false;
		proccesedItem = "";
	};	
		
	class schaufel { //Schaufel	
		variable = "schaufel";
		displayName = "STR_Item_schaufel";
		weight = 2;
		buyPrice = 1350;
		sellPrice = 338;
		illegal = false;
		edible = -1;
		icon = "icons\ico_schaufel.paa";
		liquid = false;
		showPrice = false;
		proccesedItem = "";
	};	
		
	class axt { //Axt	
		variable = "axt";
		displayName = "STR_Item_axt";
		weight = 2;
		buyPrice = 1225;
		sellPrice = 306;
		illegal = false;
		edible = -1;
		icon = "icons\ico_axt.paa";
		liquid = false;
		showPrice = false;
		proccesedItem = "";
	};	
	
	// TRINKEN
	
	class energy { //Boosted	
		variable = "energy";
		displayName = "STR_Item_energy";
		weight = 1;
		buyPrice = 900;
		sellPrice = 180;
		illegal = false;
		edible = 100;
		icon = "icons\ico_energy.paa";
		liquid = false;
		showPrice = false;
		proccesedItem = "";
	};	
		
	class warmdrink { //Glühwein	
		variable = "warmdrink";
		displayName = "STR_Item_warmdrink";
		weight = 1;
		buyPrice = 700;
		sellPrice = 175;
		illegal = false;
		edible = 80;
		icon = "icons\ico_warmdrink.paa";
		liquid = false;
		showPrice = false;
		proccesedItem = "";
	};	
		
	class waterbottle { //Wasser	
		variable = "waterbottle";
		displayName = "STR_Item_waterbottle";
		weight = 1;
		buyPrice = 400;
		sellPrice = 100;
		illegal = false;
		edible = 100;
		icon = "icons\ico_waterbottle.paa";
		liquid = false;
		showPrice = false;
		proccesedItem = "";
	};	
		
	class alkohol { //Dithmarscher Dunkel	
		variable = "alkohol";
		displayName = "STR_Item_alkohol";
		weight = 1;
		buyPrice = 600;
		sellPrice = 150;
		illegal = false;
		edible = 50;
		icon = "icons\ico_alkohol.paa";
		liquid = false;
		showPrice = false;
		proccesedItem = "";
	};	
		
	class limo { //Oreidiges Radler	
		variable = "limo";
		displayName = "STR_Item_limo";
		weight = 1;
		buyPrice = 500;
		sellPrice = 125;
		illegal = false;
		edible = 50;
		icon = "icons\ico_limo.paa";
		liquid = false;
		showPrice = false;
		proccesedItem = "";
	};	
	
	// ESSEN
	
	class peach { //Pfirsich	
		variable = "peach";
		displayName = "STR_Item_pfirsich";
		weight = 1;
		buyPrice = 75;
		sellPrice = 75;
		illegal = false;
		edible = 15;
		icon = "icons\ico_peach.paa";
		liquid = false;
		showPrice = false;
		proccesedItem = "";
	};
	
	class obst1 { //Zitrone	
		variable = "obst1";
		displayName = "STR_Item_obst1";
		weight = 1;
		buyPrice = 120;
		sellPrice = 30;
		illegal = false;
		edible = 5;
		icon = "icons\ico_obst1.paa";
		liquid = false;
		showPrice = false;
		proccesedItem = "";
	};	
		
	class obst2 { //Kokosnuss	
		variable = "obst2";
		displayName = "STR_Item_obst2";
		weight = 1;
		buyPrice = 150;
		sellPrice = 38;
		illegal = false;
		edible = 10;
		icon = "icons\ico_obst2.paa";
		liquid = false;
		showPrice = false;
		proccesedItem = "";
	};	
		
	class backware1 { //Krustenmischbrot	
		variable = "backware1";
		displayName = "STR_Item_backware1";
		weight = 1;
		buyPrice = 205;
		sellPrice = 51;
		illegal = false;
		edible = 30;
		icon = "icons\ico_backware1.paa";
		liquid = false;
		showPrice = false;
		proccesedItem = "";
	};	
		
	class backware2 { //Plätzchen	
		variable = "backware2";
		displayName = "STR_Item_backware2";
		weight = 1;
		buyPrice = 350;
		sellPrice = 88;
		illegal = false;
		edible = 20;
		icon = "icons\ico_backware2.paa";
		liquid = false;
		showPrice = false;
		proccesedItem = "";
	};
	
	class backware3 { //für Cops
		variable = "backware3";
		displayName = "STR_Item_backware3";
		weight = 1;
		buyPrice = 400;
		sellPrice = 100;
		illegal = false;
		edible = 20;
		icon = "icons\Donut.paa";
		liquid = false;
		showPrice = false;
		proccesedItem = "";
	};
		
	class essen_warm1 { //Gänsebraten	
		variable = "essen_warm1";
		displayName = "STR_Item_essen_warm1";
		weight = 3;
		buyPrice = 800;
		sellPrice = 200;
		illegal = false;
		edible = 50;
		icon = "icons\ico_essen_warm1.paa";
		liquid = false;
		showPrice = false;
		proccesedItem = "";
	};	
		
	class essen_warm2 { //Döner mit viel scharf	
		variable = "essen_warm2";
		displayName = "STR_Item_essen_warm2";
		weight = 2;
		buyPrice = 580;
		sellPrice = 145;
		illegal = false;
		edible = 40;
		icon = "icons\ico_essen_warm2.paa";
		liquid = false;
		showPrice = false;
		proccesedItem = "";
	};	
		
	class essen_warm3 { //Pizza Frutti di Mare	
		variable = "essen_warm3";
		displayName = "STR_Item_essen_warm3";
		weight = 2;
		buyPrice = 620;
		sellPrice = 155;
		illegal = false;
		edible = 40;
		icon = "icons\ico_essen_warm3.paa";
		liquid = false;
		showPrice = false;
		proccesedItem = "";
	};	
		
	class delikatesse { //Haggis	
		variable = "delikatesse";
		displayName = "STR_Item_delikatesse";
		weight = 2;
		buyPrice = 750;
		sellPrice = 188;
		illegal = false;
		edible = 40;
		icon = "icons\ico_delikatesse.paa";
		liquid = false;
		showPrice = false;
		proccesedItem = "";
	};	
/*
    class defibrillator {
        variable = "defibrillator";
        displayName = "STR_Item_Defibrillator";
        weight = 4;
        buyPrice = 900;
        sellPrice = 450;
        illegal = false;
        edible = -1;
        icon = "icons\ico_defibrillator.paa";
    };

    class toolkit {
        variable = "toolkit";
        displayName = "STR_Item_Toolkit";
        weight = 4;
        buyPrice = 350;
        sellPrice = 100;
        illegal = false;
        edible = -1;
        icon = "\a3\weapons_f\items\data\UI\gear_toolkit_ca.paa";
    };
*/
    class fuelE {
        variable = "fuelEmpty";
        displayName = "STR_Item_FuelE";
        weight = 2;
        buyPrice = 1250;
        sellPrice = 313;
        illegal = false;
        edible = -1;
        icon = "icons\ico_fuelEmpty.paa";
		showPrice = false;
		liquid=false;
    };

    class fuelF {
        variable = "fuelFull";
        displayName = "STR_Item_FuelF";
        weight = 5;
        buyPrice = 2500;
        sellPrice = 650;
        illegal = false;
        edible = -1;
        icon = "icons\ico_fuel.paa";
		showPrice = false;
		liquid=false;
    };

    class spikeStrip {
        variable = "spikeStrip";
        displayName = "STR_Item_SpikeStrip";
        weight = 2;
        buyPrice = 500;
        sellPrice = 100;
        illegal = true;
        edible = -1;
        icon = "icons\ico_spikeStrip.paa";
		showPrice = false;
		liquid=false;
    };

    class lockpick {
        variable = "lockpick";
        displayName = "STR_Item_Lockpick";
        weight = 1;
        buyPrice = 2500;
        sellPrice = 75;
        illegal = true;
        edible = -1;
        icon = "icons\ico_lockpick.paa";
		showPrice = false;
		liquid=false;
    };

    class goldbar {
        variable = "goldBar";
        displayName = "STR_Item_GoldBar";
        weight = 30;
        buyPrice = -1;
        sellPrice = 240000;
        illegal = true;
        edible = -1;
        icon = "icons\ico_goldBar.paa";
		showPrice = false;
		liquid=false;
    };

    class blastingcharge {
        variable = "blastingCharge";
        displayName = "STR_Item_BCharge";
        weight = 15;
        buyPrice = 350000;
        sellPrice = 10000;
        illegal = true;
        edible = -1;
        icon = "icons\ico_blastingCharge.paa";
		showPrice = false;
		liquid=false;
    };

    class boltcutter {
        variable = "boltCutter";
        displayName = "STR_Item_BCutter";
        weight = 5;
        buyPrice = 250000;
        sellPrice = 10000;
        illegal = true;
        edible = -1;
        icon = "icons\ico_boltCutter.paa";
		showPrice = false;
		liquid=false;
    };

    class defusekit {
        variable = "defuseKit";
        displayName = "STR_Item_DefuseKit";
        weight = 2;
        buyPrice = 2500;
        sellPrice = 2000;
        illegal = true;
        edible = -1;
        icon = "icons\ico_defuseKit.paa";
		showPrice = false;
		liquid=false;
    };
	/*
	class dogfood {
        variable = "dogfood";
        displayName = "STR_Item_DogFood";
        weight = 5;
        buyPrice = 600;
        sellPrice = 300;
        illegal = true;
        edible = -1;
        icon = "";
		showPrice = false;
		liquid=false;
    };
	*/
    /*class storagesmall {
        variable = "storageSmall";
        displayName = "STR_Item_StorageBS";
        weight = 5;
        buyPrice = 250000;
        sellPrice = 50000;
        illegal = false;
        edible = -1;
        icon = "icons\ico_storageSmall.paa";
		showPrice = false;
		liquid=false;
    }; */

    class storagebig {
        variable = "storageBig";
        displayName = "STR_Item_StorageBL";
        weight = 10;
        buyPrice = 999999;
        sellPrice = 125000;
        illegal = false;
        edible = -1;
        icon = "icons\ico_storageBig.paa";
		showPrice = false;
		liquid=false;
    };
	class storagebigextra {
        variable = "storageBigextra";
        displayName = "STR_Item_StorageBE";
        weight = 20;
        buyPrice = 5000000;
        sellPrice = 1250000;
        illegal = false;
        edible = -1;
        icon = "icons\ico_storageBig.paa";
		showPrice = false;
		liquid=false;
    };
	class geld { //Falschgeld
        variable = "geld";
        displayName = "STR_Item_Money";
        weight = 0;
        buyPrice = -1;
        sellPrice = 2500;
        illegal = true;
        edible = -1;
        icon = "icons\ico_money.paa";
		showPrice = false;
		liquid=false;
    };
	class lampe { //Strahler
        variable = "lampe";
        displayName = "STR_Item_Lamp";
        weight = 2;
        buyPrice = 100;
        sellPrice = 100;
        illegal = false;
        edible = -1;
        icon = "icons\Strahler.paa";
		showPrice = false;
		liquid=false;
    };
	class pille { //Iboprohen
        variable = "pille";
        displayName = "STR_Item_Pille";
        weight = 2;
        buyPrice = 100;
        sellPrice = 100;
        illegal = false;
        edible = 50;
        icon = "";
		showPrice = false;
		liquid=false;
    };
	class abfuehrmittel { //Abführmittel
        variable = "abfuehrmittel";
        displayName = "STR_Item_Abfuehrmittel";
        weight = 2;
        buyPrice = 100;
        sellPrice = 100;
        illegal = false;
        edible = 50;
        icon = "";
		showPrice = false;
		liquid=false;
    };
	class marihuana { //Med. Marihuana
        variable = "marihuana";
        displayName = "STR_Item_Marihuana";
        weight = 2;
        buyPrice = 100;
        sellPrice = 100;
        illegal = false;
        edible = 50;
        icon = "";
		showPrice = false;
		liquid=false;
    };
	class antidepressiva { //Antidepressiva
        variable = "antidepressiva";
        displayName = "STR_Item_Antidepressiva";
        weight = 2;
        buyPrice = 100;
        sellPrice = 100;
        illegal = false;
        edible = 50;
        icon = "";
		showPrice = false;
		liquid=false;
    };
	class impfstoff { //Impfstoff
        variable = "impfstoff";
        displayName = "STR_Item_Impfstoff";
        weight = 5;
        buyPrice = -1;
        sellPrice = SIMPFSTOFF;
        illegal = false;
        edible = 50;
        icon = "";
		showPrice = false;
		liquid=false;
    };
	class antibiotika { //Antibiotika
        variable = "antibiotika";
        displayName = "STR_Item_Antibiotika";
        weight = 2;
        buyPrice = 100;
        sellPrice = 100;
        illegal = false;
        edible = 50;
        icon = "";
		showPrice = false;
		liquid=false;
    };
	class wand { //Mauer
        variable = "wand";
        displayName = "STR_Item_Mauer";
        weight = 2;
        buyPrice = 100;
        sellPrice = 100;
        illegal = false;
        edible = -1;
        icon = "icons\Mauer.paa";
		showPrice = false;
		liquid=false;
    };
	
	class mauer { //Pylone
        variable = "mauer";
        displayName = "STR_Item_Pylone";
        weight = 2;
        buyPrice = 100;
        sellPrice = 100;
        illegal = false;
        edible = -1;
        icon = "icons\Pylone.paa";
		showPrice = false;
		liquid=false;
    };
	
	class schranke { //Schranke
        variable = "schranke";
        displayName = "STR_Item_Schranke";
        weight = 2;
        buyPrice = 100;
        sellPrice = 100;
        illegal = false;
        edible = -1;
        icon = "icons\Schranke.paa";
		showPrice = false;
		liquid=false;
    };
	class sperre { //Barriere
        variable = "sperre";
        displayName = "STR_Item_Sperre";
        weight = 2;
        buyPrice = 100;
        sellPrice = 100;
        illegal = false;
        edible = -1;
        icon = "icons\Barriere.paa";
		showPrice = false;
		liquid=false;
    };
	class dixi { //Dixi
        variable = "dixi";
        displayName = "STR_Item_Dixi";
        weight = 2;
        buyPrice = 100;
        sellPrice = 100;
        illegal = false;
        edible = -1;
        icon = "icons\Dixi.paa";
		showPrice = false;
		liquid=false;
    };
	class tisch { //Table
        variable = "tisch";
        displayName = "STR_Item_Table";
        weight = 2;
        buyPrice = 100;
        sellPrice = 100;
        illegal = false;
        edible = -1;
        icon = "icons\Tisch.paa";
		showPrice = false;
		liquid=false;
    };
	class generator { //Generator
        variable = "generator";
        displayName = "STR_Item_Generator";
        weight = 2;
        buyPrice = 100;
        sellPrice = 100;
        illegal = false;
        edible = -1;
        icon = "icons\Generator.paa";
		showPrice = false;
		liquid=false;
    };
	class matratze { //matratze
        variable = "matratze";
        displayName = "STR_Item_matratze";
        weight = 2;
        buyPrice = 100;
        sellPrice = 100;
        illegal = false;
        edible = -1;
        icon = "icons\Matratze.paa";
		showPrice = false;
		liquid=false;
    };
	class zelt { //Tent
        variable = "zelt";
        displayName = "STR_Item_Tent";
        weight = 2;
        buyPrice = 100;
        sellPrice = 100;
        illegal = false;
        edible = -1;
        icon = "icons\Pavillion.paa";
		showPrice = false;
		liquid=false;
    };
	class brenn { //Brennkessel
        variable = "brenn";
        displayName = "STR_Item_brenn";
        weight = 2;
        buyPrice = -1;
        sellPrice = 100;
        illegal = false;
        edible = -1;
        icon = "";
		showPrice = false;
		liquid=false;
    };
	class scalpel { //Scalpel
        variable = "scalpel";
        displayName = "STR_Item_Scalpel";
        weight = 2;
        buyPrice = 15000;
        sellPrice = 5000;
        illegal = true;
        edible = -1;
        icon = "icons\Skalpell.paa";
		showPrice = false;
		liquid=false;
    };

	//Rebellen
	
	class kidney { //Niere
        variable = "kidney";
        displayName = "STR_Item_Kidney";
        weight = 3;
        buyPrice = 30000;
        sellPrice = "SNIERE";
        illegal = true;
        edible = -1;
        icon = "icons\Niere.paa";
		showPrice = false;
		liquid=false;
    };
};