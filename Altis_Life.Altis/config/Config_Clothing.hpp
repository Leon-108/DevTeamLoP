/*
*    ARRAY FORMAT:
*        0: STRING (Classname)
*        1: STRING (Display Name, leave as "" for default)
*        2: SCALAR (Price)
*        3: STRING (Conditions) - Must return boolean :
*            String can contain any amount of conditions, aslong as the entire
*            string returns a boolean. This allows you to check any levels, licenses etc,
*            in any combination. For example:
*                "call life_coplevel && license_civ_someLicense"
*            This will also let you call any other function.
*
*   Clothing classnames can be found here: https://community.bistudio.com/wiki/Arma_3_CfgWeapons_Equipment
*   Backpacks/remaining classnames can be found here (TIP: Search page for "pack"): https://community.bistudio.com/wiki/Arma_3_CfgVehicles_EMPTY
*
*/
class Clothing {
    class bruce {
        title = "STR_Shops_C_Bruce";
        conditions = "";
        side = "civ";
        uniforms[] = {
            { "NONE", $STR_C_Remove_uniforms, 0, "" },
            { "U_C_Poloshirt_stripped", "", 250, "" },
            { "U_C_Poloshirt_redwhite", "", 250, "" },
            { "U_C_Poloshirt_salmon", "", 250, "" },
            { "U_C_Poloshirt_blue", "", 250, "" },
            { "U_C_Poloshirt_burgundy", "", 250, "" },
            { "U_C_Poloshirt_tricolour", "", 250, "" },
            { "U_C_Poor_2", "", 250, "" },
            { "U_C_man_sport_1_F","",1000, "" },
			{"U_C_man_sport_3_F","",1000,""},
			{"U_C_man_sport_2_F","",1000,""},
			{"U_C_Man_casual_4_F","",1000,""},
			{"U_C_Man_casual_5_F","",1000,""},
			{"U_C_Man_casual_6_F","",1000,""},
			{"U_C_Poor_2","Rag tagged clothes",1000,""},
			{"U_IG_Guerilla2_2","Green stripped shirt & Pants",1000,""},
			{"U_IG_Guerilla3_1","Brown Jacket & Pants",1000,""},
			{"U_C_Man_casual_2_F","",1000,""},
			{"U_C_Man_casual_3_F","",1000,""},
			{"U_C_Man_casual_1_F","",1000,""},
			{"U_IG_Guerilla2_3","The Outback Rangler",1000,""},
			{"U_C_HunterBody_grn","The Hunters Look",1000,""},
			{"U_C_WorkerCoveralls","Mechanic Coveralls",1000,""},
			{"U_OrestesBody","Surfing On Land",1000,""},
			{"U_NikosBody","Freizeit",1000,""},
			{"U_Marshal","Marschal",5000,""},
			{"U_NikosAgedBody","Anzug",5000,""},
			{"U_I_C_Soldier_Bandit_4_F","",1000,""},
			{"U_I_C_Soldier_Bandit_1_F","",1000,""},
			{"U_I_C_Soldier_Bandit_2_F","",1000,""},
			{"U_I_C_Soldier_Bandit_5_F","",1000,""},
			{"U_I_C_Soldier_Bandit_3_F","",1000,""},
			{"U_IG_Guerilla1_1","",1000,"license_civ_donator1 || (license_civ_rebacess && license_civ_rebel)"},
			{"U_IG_leader","",1000,"license_civ_donator1 || (license_civ_rebacess && license_civ_rebel)"},
			{"U_O_CombatUniform_ocamo","",1000,"license_civ_donator1 || (license_civ_rebacess && license_civ_rebel)"},
			{"U_I_G_resistanceLeader_F","",1000,"license_civ_donator1 || (license_civ_rebacess && license_civ_rebel)"},
			{"U_I_G_Story_Protagonist_F","",1000,"license_civ_donator1 || (license_civ_rebacess && license_civ_rebel)"},			
			{"U_O_PilotCoveralls","",1000,"license_civ_donator1 || (license_civ_rebacess && license_civ_rebel)"},
			{"U_O_CombatUniform_oucamo","",1000,"license_civ_donator1 || (license_civ_rebacess && license_civ_rebel)"},
			{"U_O_SpecopsUniform_ocamo","",1000,"license_civ_donator1 || (license_civ_rebacess && license_civ_rebel)"},
			{"U_O_SpecopsUniform_blk","",1000,"license_civ_donator1 || (license_civ_rebacess && license_civ_rebel)"},
			{"U_O_OfficerUniform_ocamo","",1000,"license_civ_donator1 || (license_civ_rebacess && license_civ_rebel)"},
			{"U_O_T_Officer_F","",1000,"license_civ_donator1 || (license_civ_rebacess && license_civ_rebel)"},
			{"U_B_CombatUniform_mcam_vest","",1000,"license_civ_donator1 || (license_civ_rebacess && license_civ_rebel)"},
			{"U_B_T_Soldier_SL_F","",1000,"license_civ_donator1 || (license_civ_rebacess && license_civ_rebel)"},
			{"U_B_T_Soldier_F","",1000,"license_civ_donator1 || (license_civ_rebacess && license_civ_rebel)"},
			{"U_B_T_Soldier_AR_F","",1000,"license_civ_donator1 || (license_civ_rebacess && license_civ_rebel)"},
			{"U_I_CombatUniform_shortsleeve","",1000,"license_civ_donator1 || (license_civ_rebacess && license_civ_rebel)"},
			{"U_I_CombatUniform_tshirt","",1000,"license_civ_donator1 || (license_civ_rebacess && license_civ_rebel)"},
			{"U_B_T_Sniper_F","",75000,"license_civ_donator1 || (license_civ_rebacess && license_civ_rebel)"},
			{"U_C_Scientist","Schutzanzug",30000,"license_civ_donator1 || (license_civ_rebacess && license_civ_rebel)"},
			{"U_O_GhillieSuit","",75000,"license_civ_donator1 || (license_civ_rebacess && license_civ_rebel2)"},
			{"U_B_FullGhillie_sard","",250000,"license_civ_donator1 || (license_civ_rebacess && license_civ_rebel2)"},
			{"U_B_T_FullGhillie_tna_F","",250000,"license_civ_donator1 || (license_civ_rebacess && license_civ_rebel2)"},
			{"U_B_CTRG_3","",1000,"license_civ_srevers"},
			{"U_I_CombatUniform","",1000,"license_civ_kartell || license_civ_srevers"},
			{"U_O_FullGhillie_sard","King",250000,"license_civ_king"},
			{"U_B_GEN_Commander_F","BHG",1000,"license_civ_bhg"}
        };
        headgear[] = {
            { "NONE", $STR_C_Remove_headgear, 0, "" },
            {"H_Bandanna_camo","Camo Bandanna",250,""},
			{"H_Bandanna_surfer","Surfer Bandanna",250,""},
			{"H_Bandanna_gry","Grey Bandanna",250,""},
			{"H_Bandanna_cbr","",250,""},
			{"H_Bandanna_khk","Khaki Bandanna",250,""},
			{"H_Bandanna_sgg","Sage Bandanna",250,""},
			{"H_StrawHat","Straw Fedora",250,""},
			{"H_Booniehat_tan","",250,""},
			{"H_Helmet_Skate","",1000,""},
			{"H_Hat_blue","",250,""},
			{"H_Hat_brown","",250,""},
			{"H_Hat_checker","",250,""},
			{"H_Hat_grey","",250,""},
			{"H_Hat_tan","",250,""},
			{"H_Cap_blu","",250,""},
			{"H_Cap_grn","Cap (Green White)",250,""},
			{"H_Cap_grn_BI","",250,""},
			{"H_BandMask_blk","Cap (Green)",250,""},
			{"H_Cap_oli","",250,""},
			{"H_Cap_red","",250,""},
			{"H_Cap_tan","",250,""},
			{"H_Cap_brn_SPECOPS","",150,"license_civ_donator1 || (license_civ_rebacess && license_civ_rebel)"},
			{"H_Cap_tan_specops_US","",150,"license_civ_donator1 || (license_civ_rebacess && license_civ_rebel)"},
			{"H_Cap_khaki_specops_UK","",150,"license_civ_donator1 || (license_civ_rebacess && license_civ_rebel)"},
			{"H_Cap_blk_Raven","",150,"license_civ_donator1 || (license_civ_rebacess && license_civ_rebel)"},
			{"H_Cap_surfer","",150,"license_civ_donator1"},
			{"H_StrawHat_dark","",225,"license_civ_donator1"},
			{"H_Hat_camo","",265,"license_civ_donator1"},
			{"H_TurbanO_blk","",265,"license_civ_donator1"},
			{"H_Booniehat_dgtl","",425,"license_civ_donator1 || (license_civ_rebacess && license_civ_rebel)"},
			{"H_Booniehat_mcamo","",425,"license_civ_donator1"},
			{"H_Booniehat_indp","",425,"license_civ_donator1"},
			{"H_Booniehat_oli","",425,"license_civ_donator1"},
			{"H_Booniehat_khk","",425,"license_civ_donator1"},
			{"H_Booniehat_dirty","",425,"license_civ_donator1"},
			{"H_Bandanna_mcamo","",200,"license_civ_donator1"},
			{"H_MilCap_tna_F","",350,"license_civ_donator1 || (license_civ_rebacess && license_civ_rebel)"},
			{"H_MilCap_ghex_F","",350,"license_civ_donator1 || (license_civ_rebacess && license_civ_rebel)"},
			{"H_MilCap_oucamo","",350,"license_civ_donator1"},
			{"H_MilCap_rucamo","",350,"license_civ_donator1"},
			{"H_MilCap_dgtl","",350,"license_civ_donator1"},
			{"H_MilCap_blue","",350,"license_civ_donator1"},
			{"H_MilCap_mcamo","",350,"license_civ_donator1"},
			{"H_Shemag_tan","",300,"license_civ_donator1 || (license_civ_rebacess && license_civ_rebel)"},
			{"H_Shemag_olive","",300,"license_civ_donator1 || (license_civ_rebacess && license_civ_rebel)"},
			{"H_Shemag_khk","",300,"license_civ_donator1 || (license_civ_rebacess && license_civ_rebel)"},
			{"H_ShemagOpen_khk","",300,"license_civ_donator1 || (license_civ_rebacess && license_civ_rebel)"},
			{"H_Beret_blk","",150,"license_civ_donator1"},
			{"H_Watchcap_blk","",850,"license_civ_donator1 || (license_civ_rebacess && license_civ_rebel)"},
			{"H_Watchcap_camo","",850,"license_civ_donator1 || (license_civ_rebacess && license_civ_rebel)"},
		    {"H_Watchcap_sgg","",850,"license_civ_donator1 || (license_civ_rebacess && license_civ_rebel)"},
			{"H_Booniehat_tna_F","",850,"license_civ_donator1 || (license_civ_rebacess && license_civ_rebel)"},
			{"H_Helmet_Skate","",10000,"license_civ_donator1"},
			{"H_HelmetB_tna_F","",100000,"license_civ_donator1 || (license_civ_rebacess && license_civ_rebel)"},
			{"H_HelmetCrew_O_ghex_F","",100000,"license_civ_donator1 || (license_civ_rebacess && license_civ_rebel)"},
			{"H_HelmetB_Enh_tna_F","",100000,"license_civ_donator1 || (license_civ_rebacess && license_civ_rebel)"},
			{"H_HelmetB_Light_tna_F","",100000,"license_civ_donator1 || (license_civ_rebacess && license_civ_rebel)"},
			{"H_CrewHelmetHeli_B","",100000,"license_civ_donator1"},
			{"H_CrewHelmetHeli_O","",100000,"license_civ_donator1"},
			{"H_CrewHelmetHeli_I","",100000,"license_civ_donator1"},
			{"H_HelmetLeaderO_ghex_F","",100000,"license_civ_donator1 || (license_civ_rebacess && license_civ_rebel)"},
			{"H_HelmetSpecB","",100000,"license_civ_donator1 || (license_civ_rebacess && license_civ_rebel2)"},
			{"H_HelmetSpecB_blk","",100000,"license_civ_donator1 || (license_civ_rebacess && license_civ_rebel2)"},
			{"H_HelmetSpecB_paint2","",100000,"license_civ_donator1 || (license_civ_rebacess && license_civ_rebel2)"},
			{"H_HelmetSpecB_snakeskin","",100000,"license_civ_donator1 || (license_civ_rebacess && license_civ_rebel2)"}
        };
        goggles[] = {
            { "NONE", $STR_C_Remove_goggles, 0, "" },
            { "G_Shades_Black", "", 20, "" },
            { "G_Shades_Blue", "", 20, "" },
            { "G_Shades_Green", "", 20, "" },
            { "G_Shades_Red", "", 20, "" },
            { "G_Sport_Blackred", "", 25, "" },
            { "G_Sport_BlackWhite", "", 25, "" },
            { "G_Sport_Blackyellow", "", 25, "" },
            { "G_Sport_Checkered", "", 25, "" },
            { "G_Sport_Greenblack", "", 25, "" },
            { "G_Sport_Red", "", 25, "" },
            { "G_Lowprofile", "", 30, "" },
            { "G_Squares", "", 50, "" },
            { "G_Aviator", "", 100, "" },
            { "G_Combat", "", 125, "" },
            { "G_Lady_Mirror", "", 150, "" },
            { "G_Lady_Dark", "", 150, "" },
            { "G_Lady_Blue", "", 150, "" },
			{"G_Balaclava_blk","",55,"license_civ_donator1"},
			{"G_Balaclava_combat","",55,"license_civ_donator1"},
			{"G_Balaclava_lowprofile","",55,"license_civ_donator1"},
			{"G_Balaclava_oli","",55,"license_civ_donator1"},
			{"G_Bandanna_aviator","",55,"license_civ_donator1"},
			{"G_Bandanna_beast","",55,"license_civ_donator1"},
			{"G_Bandanna_blk","",55,"license_civ_donator1"},
			{"G_Bandanna_khk","",55,"license_civ_donator1"},
			{"G_Bandanna_oli","",55,"license_civ_donator1"},
			{"G_Bandanna_sport","",55,"license_civ_donator1"},
			{"G_Bandanna_tan","",55,"license_civ_donator1"},
			{"G_Tactical_Black","",65,"license_civ_donator1"},
			{"G_Tactical_Clear","",65,"license_civ_donator1"},
			{"G_Spectacles","",50,"license_civ_donator1"},
			{"G_Spectacles_Tinted","",50,"license_civ_donator1"},
			{"G_Squares_Tinted","",50,"license_civ_donator1"},
			{"G_Bandanna_shades","",100,"license_civ_donator1"},
			{"G_Balaclava_TI_G_blk_F","",100,"license_civ_donator1"},
			{"G_Balaclava_TI_blk_F","",100,"license_civ_donator1"},
			{"G_Balaclava_TI_G_tna_F","",100,"license_civ_donator1"},
			{"G_Balaclava_TI_tna_F","",100,"license_civ_donator1"}
        };
        vests[] = {
            { "NONE", $STR_C_Remove_vests, 0, "" },
			{"V_BandollierB_cbr","",5000,"license_civ_donator1 || (license_civ_rebacess && license_civ_rebel)"},
			{"V_BandollierB_ghex_F","",5000,"license_civ_donator1 || (license_civ_rebacess && license_civ_rebel)"},
			{"V_TacChestrig_cbr_F","",15000,"license_civ_donator1 || (license_civ_rebacess && license_civ_rebel)"},
			{"V_TacChestrig_grn_F","",15000,"license_civ_donator1 || (license_civ_rebacess && license_civ_rebel)"},
			{"V_TacChestrig_oli_F","",15000,"license_civ_donator1 || (license_civ_rebacess && license_civ_rebel)"},
			{"V_HarnessOGL_ghex_F","",1500,"license_civ_donator1 || (license_civ_rebacess && license_civ_rebel)"},
			{"V_HarnessO_brn","",25000,"license_civ_donator1 || (license_civ_rebacess && license_civ_rebel)"},
			{"V_HarnessO_ghex_F","",25000,"license_civ_donator1 || (license_civ_rebacess && license_civ_rebel)"},
			{"V_TacVest_khk","",50000,"license_civ_donator1 || (license_civ_rebacess && license_civ_rebel)"},
			{"V_TacVest_camo","",50000,"license_civ_donator1 || (license_civ_rebacess && license_civ_rebel)"},
			{"V_TacVest_blk","",50000,"license_civ_donator1 || (license_civ_rebacess && license_civ_rebel)"},
			{"V_PlateCarrier1_rgr","",100000,"license_civ_donator1 || (license_civ_rebacess && license_civ_rebel2)"}, 
			{"V_PlateCarrier1_tna_F","",100000,"license_civ_donator1 || (license_civ_rebacess && license_civ_rebel2)"},
			{"V_PlateCarrier1_rgr_noflag_F","",100000,"license_civ_donator1 || (license_civ_rebacess && license_civ_rebel2)"}, 
			{"V_PlateCarrier1_blk","",100000,"license_civ_donator1 || (license_civ_rebacess && license_civ_rebel2)"}
        };
        backpacks[] = {
            { "NONE", $STR_C_Remove_backpacks, 0, "" },
            { "B_AssaultPack_cbr", "", 1500, "" },
            { "B_AssaultPack_khk", "", 1500, "" },
            { "B_AssaultPack_dgtl", "", 1500, "license_civ_donator1" },
            { "B_AssaultPack_rgr", "", 1500, "license_civ_donator1" },
            { "B_AssaultPack_sgg", "", 1500, "license_civ_donator1" },
            { "B_AssaultPack_blk", "", 1500, "license_civ_donator1" },
            { "B_AssaultPack_mcamo", "", 1500, "license_civ_donator1" },
            { "B_AssaultPack_tna_f", "", 1500, "(395180 in (getDLCs 1)) && license_civ_donator1" }, //Apex DLC
            { "B_FieldPack_khk", "", 2000, "" },
            { "B_FieldPack_cbr", "", 2000, "" },
            { "B_FieldPack_blk", "", 2000, "license_civ_donator1" },
            { "B_FieldPack_ocamo", "", 2000, "license_civ_donator1" },
            { "B_FieldPack_oucamo", "", 2000, "license_civ_donator1" },
            { "B_FieldPack_oli", "", 2000, "license_civ_donator1" },
            { "B_FieldPack_ghex_f", "", 2000, "(395180 in (getDLCs 1)) && license_civ_donator1" }, //Apex DLC
            { "B_TacticalPack_oli", "", 3000, "" },
            { "B_TacticalPack_rgr", "", 3000, "license_civ_donator1" },
            { "B_TacticalPack_ocamo", "", 3000, "license_civ_donator1" },
            { "B_TacticalPack_mcamo", "", 3000, "license_civ_donator1" },
            { "B_TacticalPack_blk", "", 3000, "license_civ_donator1" },
            { "B_Kitbag_cbr", "", 5000, "" },
            { "B_Kitbag_mcamo", "", 5000, "license_civ_donator1" },
            { "B_Kitbag_sgg", "", 5000, "license_civ_donator1" },
            { "B_Kitbag_rgr", "", 5000, "license_civ_donator1" },
            { "B_Carryall_khk", "", 100000, "license_civ_donator1 || (license_civ_rebacess && license_civ_rebel)" },
            { "B_Carryall_cbr", "", 100000, "license_civ_donator1 || (license_civ_rebacess && license_civ_rebel)" },
            { "B_Carryall_ocamo", "", 100000, "license_civ_donator1" },
            { "B_Carryall_oucamo", "", 100000, "license_civ_donator1" },
            { "B_Carryall_mcamo", "", 100000, "license_civ_donator1" },
            { "B_Carryall_oli", "", 100000, "license_civ_donator1" },
            { "B_Carryall_ghex_f", "", 100000, "license_civ_donator1 && (395180 in (getDLCs 1))" }, //Apex DLC
            { "B_Bergen_mcamo_F", "", 150000, "license_civ_donator1 || (license_civ_rebacess && license_civ_rebel && (395180 in (getDLCs 1)))" }, //Apex DLC
            { "B_Bergen_hex_F", "", 150000, "license_civ_donator1 || (license_civ_rebacess && license_civ_rebel && (395180 in (getDLCs 1)))" }, //Apex DLC
			{ "B_Bergen_dgtl_f", "", 150000, "license_civ_donator1 || (license_civ_rebacess && license_civ_rebel && (395180 in (getDLCs 1)))" }, //Apex DLC
            { "B_Bergen_tna_f", "", 150000, "license_civ_donator1 || (license_civ_rebacess && license_civ_rebel && (395180 in (getDLCs 1)))" }, //Apex DLC
			{ "B_ViperLightHarness_blk_F", "", 1500, "license_civ_srevers && (395180 in (getDLCs 1))" }
        };
    };

    class cop {
        title = "STR_Shops_C_Police";
        conditions = "";
        side = "cop";
        uniforms[] = {
            { "NONE", $STR_C_Remove_uniforms, 0, "" },
            {"U_Rangemaster","Standarduniform",100,"call life_coplevel >= 1"},
			{"U_B_CombatUniform_mcam","Standarduniform",100,"call life_coplevel >= 5"},
            {"U_B_Wetsuit","",100,"call life_coplevel >= 1"},
            {"U_C_Scientist","",100,"call life_coplevel >= 1"},
			{"U_I_G_resistanceLeader_F","UndercoverONLY",100,"call life_coplevel >= 3"},
			{"U_O_CombatUniform_oucamo","UndercoverONLY",100,"call life_coplevel >= 3"},
			{"U_O_SpecopsUniform_blk","UndercoverONLY",100,"call life_coplevel >= 3"},
			{"U_B_T_Soldier_SL_F","UndercoverONLY",100,"call life_coplevel >= 3"},
			{"U_O_OfficerUniform_ocamo","UndercoverONLY",100,"call life_coplevel >= 3"},
			{"U_B_T_Sniper_F","UndercoverONLY",100,"call life_coplevel >= 3"},
			{"U_O_GhillieSuit","UndercoverONLY",100,"call life_coplevel >= 3"},
			{"U_B_FullGhillie_sard","UndercoverONLY",100,"call life_coplevel >= 3"},
			{"U_B_T_FullGhillie_tna_F","UndercoverONLY",100,"call life_coplevel >= 3"},
			{"U_B_CTRG_1","SWAT Uniform",100,"license_cop_swat || license_cop_swatazubi || license_cop_swatcmd"},
			{"U_B_survival_uniform","SWAT Survival",100,"license_cop_swat || license_cop_swatazubi || license_cop_swatcmd"},
			{"U_Marshal","",100,"license_cop_swatazubi|| call life_coplevel >= 7 ||license_cop_swat || license_cop_swatcmd"}
        };
        headgear[] = {
            { "NONE", $STR_C_Remove_headgear, 0, "" },
            {"H_Cap_blu","",120,"call life_coplevel >= 1"},			//Caps
            {"H_Cap_blk_ION","",120,"call life_coplevel >= 1"},
            {"H_Cap_blk","",120,"call life_coplevel >= 1"},
            {"H_Cap_police","",120,"call life_coplevel >= 1"},
            {"H_Beret_blk_POLICE","",120,"call life_coplevel >= 1"},	//Standardbarret (nur schwarz)	
            {"H_Bandanna_gry","",120,"call life_coplevel >= 1"},		//Kopftuch
            {"G_Diving","",500,"call life_coplevel >= 1"},	
			{"H_Booniehat_mcamo","",120,"call life_coplevel >= 2"},	//weicher Hut
            {"H_Booniehat_dgtl","",120,"call life_coplevel >= 2"},		
            {"H_Booniehat_indp","",120,"call life_coplevel >= 2"},	
            {"H_Booniehat_khk_hs","",120,"call life_coplevel >= 2"},	
            {"H_Watchcap_blk","",120,"call life_coplevel >= 2"},		//Muetze
			{"H_MilCap_mcamo","",100,"call life_coplevel >= 3"}, 		//Militärmützen
            {"H_MilCap_blue","",100,"call life_coplevel >= 3"}, 
            {"H_HelmetB_light_black","",120,"call life_coplevel >= 3"},
            {"H_HelmetB_black","",120,"call life_coplevel >= 3"},		
            {"H_HelmetB_plain_mcamo","",75,"call life_coplevel >= 3"},		   	
			{"H_Hat_checker","",280,"call life_coplevel >= 3"},	//Huete
			{"H_StrawHat","",280,"call life_coplevel >= 3"},
			{"H_PilotHelmetHeli_B","",500,"call life_coplevel >= 4"},	
            {"H_PilotHelmetHeli_I","",500,"call life_coplevel >= 4"},	
            {"H_HelmetSpecB_blk","",75,"call life_coplevel >= 4"}, 	//Verbesserter Kampfhelm
            {"H_Beret_Colonel","",500,"call life_coplevel >= 4"},	
			{"H_Beret_02","",100,"call life_coplevel >= 6"},			//Nato Barret
			{"H_Hat_brown","",100,"call life_coplevel >= 9"},	
            {"H_StrawHat_dark","",100,"call life_coplevel >= 9"},
			{"H_Hat_grey","",280,"call life_coplevel >= 9"},
			{"H_HelmetB_camo","SWAT",100,"license_cop_swatazubi || license_cop_swat || license_cop_swatcmd"},
			{"H_ShemagOpen_khk","",100,"license_cop_swatazubi || call life_coplevel > 4 || license_cop_swat || license_cop_swatcmd"},
            {"H_Shemag_khk","",100,"license_cop_swatazubi || call life_coplevel > 4 || license_cop_swat || license_cop_swatcmd"},
            {"H_Shemag_olive","",100,"license_cop_swatazubi || call life_coplevel > 4 || license_cop_swat || license_cop_swatcmd"},
            {"H_Shemag_tan","",100,"license_cop_swatazubi || call life_coplevel > 4 || license_cop_swat || license_cop_swatcmd"},
            {"H_Bandanna_surfer_blk","",100,"license_cop_swatazubi || license_cop_swat || license_cop_swatcmd"}
        };
        goggles[] = {
            { "NONE", $STR_C_Remove_goggles, 0, "" },
            { "G_Squares", "", 10, "" },
            { "G_Shades_Blue", "", 20, "" },
            { "G_Sport_Blackred", "", 20, "" },
            { "G_Sport_Checkered", "", 20, "" },
            { "G_Sport_Blackyellow", "", 20, "" },
            { "G_Sport_BlackWhite", "", 20, "" },
            { "G_Shades_Black", "", 25, "" },
            { "G_Lowprofile", "", 30, "" },
            { "G_Combat", "", 55, "" },
            { "G_Aviator", "", 100, "" },
            { "G_Lady_Mirror", "", 150, "" },
            { "G_Lady_Dark", "", 150, "" },
            { "G_Lady_Blue", "", 150, "" },
			{"G_Squares_Tinted","",100,"call life_coplevel >= 7"},
			{"G_Spectacles_Tinted","",100,"call life_coplevel >= 7"},
			{"G_Balaclava_blk","",100,"license_cop_swat || license_cop_swatazubi || license_cop_swatcmd"},
            {"G_Balaclava_lowprofile","",100,"license_cop_swat || license_cop_swatazubi || license_cop_swatcmd"},
            {"G_Balaclava_combat","",100,"license_cop_swat || license_cop_swatazubi || license_cop_swatcmd"},
            {"G_Balaclava_oli","",100,"license_cop_swat || license_cop_swatazubi || license_cop_swatcmd"},
            {"G_Tactical_Clear","",100,"license_cop_swat || license_cop_swatazubi || license_cop_swatcmd"},
            {"G_Tactical_Black","",100,"license_cop_swat || license_cop_swatazubi || license_cop_swatcmd"},
			{"G_Balaclava_TI_G_blk_F","",100,"license_cop_swat || license_cop_swatazubi || license_cop_swatcmd"},
			{"G_Balaclava_TI_G_tna_F","",100,"license_cop_swat || license_cop_swatazubi || license_cop_swatcmd"},
			{"G_Balaclava_TI_blk_F","",100,"license_cop_swat || license_cop_swatazubi || license_cop_swatcmd"},
			{"G_Balaclava_TI_tna_F","",100,"license_cop_swat || license_cop_swatazubi || license_cop_swatcmd"}
        };
        vests[] = {
            { "NONE", $STR_C_Remove_vests, 0, "" },
            {"V_TacVest_blk_POLICE","",2000,""},
			{"V_PlateCarrier1_blk","",2000,""},
			{"V_RebreatherIR","",1000,""},
			{"V_TacVest_khk","UndercoverONLY",2000,"call life_coplevel >= 3"},
			{"V_TacVest_blk","UndercoverONLY",2000,"call life_coplevel >= 3"},
			{"V_BandollierB_cbr","UndercoverONLY",2000,"call life_coplevel >= 3"},
			{"V_PlateCarrier1_tna_F","UndercoverONLY",2000,"call life_coplevel >= 3"}
        };
        backpacks[] = {
            { "NONE", $STR_C_Remove_backpacks, 0, "" },
            { "B_Carryall_cbr", "", 3500, "" },
			{ "B_Carryall_ocamo","",3500,""},
            { "B_Carryall_mcamo","",3500,""},
            { "B_Bergen_dgtl_F","",5000,""},
            { "B_Bergen_dgtl_F", "", 5000,""},
            { "B_Kitbag_cbr","UndercoverONLY",5000,"call life_coplevel >= 3"},
            { "B_Carryall_khk","UndercoverONLY",5000,"call life_coplevel >= 3"}
        };
    };

    class dive {
        title = "STR_Shops_C_Diving";
        conditions = "license_civ_dive";
        side = "civ";
        uniforms[] = {
            { "NONE", $STR_C_Remove_uniforms, 0, "" },
            { "U_B_Wetsuit", "", 2000, "" }
        };
        headgear[] = {
            { "NONE", $STR_C_Remove_headgear, 0, "" }
        };
        goggles[] = {
            { "NONE", $STR_C_Remove_goggles, 0, "" },
            { "G_Diving", "", 500, "" }
        };
        vests[] = {
            { "NONE", $STR_C_Remove_vests, 0, "" },
            { "V_RebreatherB", "", 5000, "" }
        };
        backpacks[] = {
            { "NONE", $STR_C_Remove_backpacks, 0, "" }
        };
    };

    class gun_clothing {
        title = "STR_Shops_C_Gun";
        conditions = "license_civ_gun";
        side = "civ";
        uniforms[] = {
            { "NONE", $STR_C_Remove_uniforms, 0, "" }
        };
        headgear[] = {
            { "NONE", $STR_C_Remove_headgear, 0, "" }
        };
        goggles[] = {
            { "NONE", $STR_C_Remove_goggles, 0, "" }
        };
        vests[] = {
            { "NONE", $STR_C_Remove_vests, 0, "" },
            { "V_Rangemaster_belt", "", 4900, "" }
        };
        backpacks[] = {
            { "NONE", $STR_C_Remove_backpacks, 0, "" }
        };
    };
    class med_clothing {
        title = "STR_MAR_EMS_Clothing_Shop";
        conditions = "";
        side = "med";
        uniforms[] = {
            { "NONE", $STR_C_Remove_uniforms, 0, "" },
            {"U_I_HeliPilotCoveralls","PRS",100,""},
			{"U_C_Scientist","PRS Praktikant",100,""},
			{"U_C_Paramedic_01_F","",100,"call life_mediclevel >= 5"},
			{"U_B_Wetsuit","",1000,""},
			{"U_C_ConstructionCoverall_Blue_F","",100,""}
        };
        headgear[] = {
            { "NONE", $STR_C_Remove_headgear, 0, "" },
            {"H_Bandanna_camo","Camo Bandanna",120,""},
			{"H_Bandanna_surfer","Surfer Bandanna",130,""},
			{"H_Bandanna_gry","Grey Bandanna",150,""},
			{"H_Bandanna_cbr","",165,""},
			{"H_Bandanna_surfer","",135,""},
			{"H_Bandanna_khk","Khaki Bandanna",145,""},
			{"H_Bandanna_sgg","Sage Bandanna",160,""},
			{"H_StrawHat","Straw Fedora",225,""},
			{"H_BandMask_blk","Hat & Bandanna",300,""},
			{"H_Booniehat_tan","",425,""},
			{"H_Helmet_Skate","",425,""},
			{"H_Hat_blue","",310,""},
			{"H_Hat_brown","",276,""},
			{"H_Hat_checker","",340,""},
			{"H_Hat_grey","",280,""},
			{"H_Hat_tan","",265,""},
			{"H_Cap_blu","",150,""},
			{"H_Cap_grn","",150,""},
			{"H_Cap_grn_BI","",150,""},
			{"H_Cap_oli","",150,""},
			{"H_Cap_red","",150,""},
			{"H_Cap_tan","",150,""},
			{"H_Beret_blk","",150,""},
			{"H_Beret_grn","",850,""},
			{"H_Beret_red","",850,""},
			{"H_Watchcap_blk","",850,""},
			{"H_Watchcap_camo","",850,""},
			{"H_Watchcap_sgg","",850,""},
			{"H_Booniehat_tna_F","",850,""},
			{"H_HelmetB_tna_F","",850,""},
			{"H_HelmetCrew_O_ghex_F","",850,""},
			{"H_HelmetB_Enh_tna_F","",850,""},
			{"H_HelmetB_Light_tna_F","",850,""},
			{"H_MilCap_tna_F","",850,""},
			{"H_MilCap_ghex_F","",850,""},
			{"H_HelmetLeaderO_ghex_F","",850,""},
			{"H_EarProtectors_yellow_F","",850,""},
			{"H_HeadBandage_stained_F","",850,""},
			{"H_HeadBandage_clean_F","",850,""},
			{"H_HeadBandage_bloody_F","",850,""},
			{"H_Hat_Safari_olive_F","",850,""},
			{"H_Hat_Safari_sand_F","",850,""},
			{"H_Construction_basic_yellow_F","",850,""}
        };
        goggles[] = {
            { "NONE", $STR_C_Remove_goggles, 0, "" },
            { "G_Diving", "", 500, "" },
			{"G_Shades_Black","",25,""},
			{"G_Shades_Blue","",20,""},
			{"G_Sport_Blackred","",20,""},
			{"G_Sport_Checkered","",20,""},
			{"G_Sport_Blackyellow","",20,""},
			{"G_Sport_BlackWhite","",20,""},
			{"G_Squares","",10,""},
			{"G_Aviator","",100,""},
			{"G_Lady_Mirror","",150,""},
			{"G_Lady_Dark","",150,""},
			{"G_Lady_Blue","",150,""},
			{"G_Lowprofile","",30,""},
			{"G_Combat","",55,""},
			{"G_Bandanna_shades","",100,""}
        };
        vests[] = {
            { "NONE", $STR_C_Remove_vests, 0, "" },
            {"V_RebreatherB", "", 1000, ""},
			{"V_Safety_orange_F","",100,""},
			{"V_Safety_yellow_F","",100,""},
			{"V_LegStrapBag_black_F","",100,""},
			{"V_Pocketed_black_F","",100,""}
        };
        backpacks[] = {
            { "NONE", $STR_C_Remove_backpacks, 0, "" },
            {"B_Carryall_oli","",5000,""},
            {"B_Carryall_khk","",5000,""},
            {"B_Carryall_cbr","",5000,""}
        };
    };

    class kart {
        title = "STR_Shops_C_Kart";
        conditions = "";
        side = "civ";
        uniforms[] = {
            { "NONE", $STR_C_Remove_uniforms, 0, "" },
            { "U_C_Driver_1_black", "", 1500, "" },
            { "U_C_Driver_1_blue", "", 1500, "" },
            { "U_C_Driver_1_red", "", 1500, "" },
            { "U_C_Driver_1_orange", "", 1500, "" },
            { "U_C_Driver_1_green", "", 1500, "" },
            { "U_C_Driver_1_white", "", 1500, "" },
            { "U_C_Driver_1_yellow", "", 1500, "" },
            { "U_C_Driver_2", "", 3500, "" },
            { "U_C_Driver_1", "", 3600, "" },
            { "U_C_Driver_3", "", 3700, "" },
            { "U_C_Driver_4", "", 3700, "" }
        };
        headgear[] = {
            { "NONE", $STR_C_Remove_headgear, 0, "" },
            { "H_RacingHelmet_1_black_F", "", 1000, "" },
            { "H_RacingHelmet_1_red_F", "", 1000, "" },
            { "H_RacingHelmet_1_white_F", "", 1000, "" },
            { "H_RacingHelmet_1_blue_F", "", 1000, "" },
            { "H_RacingHelmet_1_yellow_F", "", 1000, "" },
            { "H_RacingHelmet_1_green_F", "", 1000, "" },
            { "H_RacingHelmet_1_F", "", 2500, "" },
            { "H_RacingHelmet_2_F", "", 2500, "" },
            { "H_RacingHelmet_3_F", "", 2500, "" },
            { "H_RacingHelmet_4_F", "", 2500, "" }
        };
        goggles[] = {
            { "NONE", $STR_C_Remove_goggles, 0, "" }
        };
        vests[] = {
            { "NONE", $STR_C_Remove_vests, 0, "" }
        };
        backpacks[] = {
            { "NONE", $STR_C_Remove_backpacks, 0, "" }
        };
    };
	
	//Kartell
	class kartell {
        title = "STR_Shops_C_Kartell";
        conditions = "license_civ_kartell";
        side = "civ";
        uniforms[] = {
            { "NONE", $STR_C_Remove_uniforms, 0, "" },
            { "U_Marshal", "", 2000, "" },
			{ "U_I_C_Soldier_Para_1_F", "", 2000, "" },
			{ "U_I_C_Soldier_Para_2_F", "", 2000, "" },
			{ "U_I_C_Soldier_Para_3_F", "", 2000, "" },
			{ "U_I_C_Soldier_Para_5_F", "", 2000, "" },
			{ "U_I_C_Soldier_Para_4_F", "", 2000, "" },
			{ "U_I_C_Soldier_Camo_F", "", 2000, "" }
        };
        headgear[] = {
            { "NONE", $STR_C_Remove_headgear, 0, "" }
        };
        goggles[] = {
            { "NONE", $STR_C_Remove_goggles, 0, "" }
        };
        vests[] = {
            { "NONE", $STR_C_Remove_vests, 0, "" }
        };
        backpacks[] = {
            { "NONE", $STR_C_Remove_backpacks, 0, "" },
			{ "B_Carryall_ghex_F", "", 5000, "" }
        };
    };
};