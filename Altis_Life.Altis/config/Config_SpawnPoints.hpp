/*
*    Format:
*        3: STRING (Conditions) - Must return boolean :
*            String can contain any amount of conditions, aslong as the entire
*            string returns a boolean. This allows you to check any levels, licenses etc,
*            in any combination. For example:
*                "call life_coplevel && license_civ_someLicense"
*            This will also let you call any other function.
*
*/
class CfgSpawnPoints {

    class Altis {
        class Civilian {
            class Kavala {
                displayName = "Kavala";
                spawnMarker = "civ_spawn_1";
                icon = "\a3\ui_f\data\map\MapControl\watertower_ca.paa";
                conditions = "";
            };
						
            class Athira {
                displayName = "Athira";
                spawnMarker = "civ_spawn_3";
                icon = "\a3\ui_f\data\map\MapControl\watertower_ca.paa";
                conditions = "";
            };

            class Pyrgos {
                displayName = "Pyrgos";
                spawnMarker = "civ_spawn_2";
                icon = "\a3\ui_f\data\map\MapControl\watertower_ca.paa";
                conditions = "";
            };

            class Feres {
                displayName = "Feres";
                spawnMarker = "civ_spawn_4";
                icon = "\a3\ui_f\data\map\MapControl\watertower_ca.paa";
                conditions = "";
            };
			
			 class Airfield {
                displayName = "Flughafen";
                spawnMarker = "civ_spawn_5";
                icon = "\a3\ui_f\data\map\MapControl\watertower_ca.paa";
                conditions = "";
            };
			
			 class Zaros {
                displayName = "Zaros";
                spawnMarker = "civ_spawn_7";
                icon = "\a3\ui_f\data\map\MapControl\watertower_ca.paa";
                conditions = "";
            };
			
			 class Outpost {
                displayName = "Außenposten";
                spawnMarker = "Rebelop_Spawn";
                icon = "\a3\ui_f\data\map\MapControl\watertower_ca.paa";
                conditions = "";
            };

            class RebelN {
                displayName = "Reb. Lager";
                spawnMarker = "rebel_spawn";
                icon = "\a3\ui_f\data\map\MapControl\bunker_ca.paa";
                conditions = "license_civ_rebacess";
            };

            class Kap_Makrinos {
                displayName = "Kap Makrinos";
                spawnMarker = "civ_spawn_6";
                icon = "\a3\ui_f\data\map\MapControl\bunker_ca.paa";
                conditions = "license_civ_rebel";
            };
			
			class Admin {
                displayName = "Admin HQ";
                spawnMarker = "admin1_car";
                icon = "\a3\ui_f\data\map\MapControl\watertower_ca.paa";
                conditions = "call life_adminlevel >= 3";
            };
			
			class Kartell {
                displayName = "Geisterhotel";
                spawnMarker = "kartell_spawn";
                icon = "\a3\ui_f\data\map\MapControl\watertower_ca.paa";
                conditions = "license_civ_kartell";
            };
			/*
			class SSG {
                displayName = "SSG HQ";
                spawnMarker = "ssg_spawn";
                icon = "\a3\ui_f\data\map\MapControl\watertower_ca.paa";
                conditions = "license_civ_ssg";
            };
			*/
			class PA {
                displayName = "Private Army HQ";
                spawnMarker = "pa_spawn";
                icon = "\a3\ui_f\data\map\MapControl\watertower_ca.paa";
                conditions = "license_civ_pa";
            };
			
			class Dithmarschen {
                displayName = "Dithmarschen";
                spawnMarker = "dm_spawn";
                icon = "\a3\ui_f\data\map\MapControl\watertower_ca.paa";
                conditions = "license_civ_dm";
            };
			
			class Srevers {
                displayName = "Srevers HQ";
                spawnMarker = "srevers_spawn";
                icon = "\a3\ui_f\data\map\MapControl\watertower_ca.paa";
                conditions = "license_civ_srevers";
            };
			class BHG {
                displayName = "BHG HQ";
                spawnMarker = "bhg_car_garage";
                icon = "\a3\ui_f\data\map\MapControl\watertower_ca.paa";
                conditions = "license_civ_bhg";
            };
			
			class Kirche {
                displayName = "Kirche";
                spawnMarker = "kirche_1";
                icon = "\a3\ui_f\data\map\MapControl\watertower_ca.paa";
                conditions = "license_civ_presse";
            };
			
			class King {
                displayName = "King HQ";
                spawnMarker = "king_spawn";
                icon = "\a3\ui_f\data\map\MapControl\watertower_ca.paa";
                conditions = "license_civ_king";
            };
			
			class Ghetto {
                displayName = "Ghetto Viertel";
                spawnMarker = "ghetto_spawn";
                icon = "\a3\ui_f\data\map\MapControl\watertower_ca.paa";
                conditions = "license_civ_ghetto";
            };
			
			class Fzentrum {
                displayName = "Forschungszentrum";
                spawnMarker = "fz_spawn";
                icon = "\a3\ui_f\data\map\MapControl\watertower_ca.paa";
                conditions = "license_civ_fzentrum";
            };
			
			class hideout1 {
                displayName = "Quartier: Kap Zefyris";
                spawnMarker = "hideout1_spawn";
                icon = "\a3\ui_f\data\map\MapControl\watertower_ca.paa";
                conditions = "license_civ_hideout1";
            };
			
			class hideout2 {
                displayName = "Quartier: Pyrsos";
                spawnMarker = "hideout2_spawn";
                icon = "\a3\ui_f\data\map\MapControl\watertower_ca.paa";
                conditions = "license_civ_hideout2";
            };
        };

        class Cop {
            class Kavala {
                displayName = "Kavala HQ";
                spawnMarker = "cop_spawn_1";
                icon = "\a3\ui_f\data\map\MapControl\lighthouse_CA.paa";
                conditions = "";
            };

            class Lakka {
                displayName = "Lakka HQ";
                spawnMarker = "cop_spawn_3";
                icon = "\a3\ui_f\data\map\MapControl\transmitter_CA.paa";
                conditions = "";
            };

            class Rodopoli {
                displayName = "Rodopoli HQ";
                spawnMarker = "cop_spawn_7";
                icon = "\a3\ui_f\data\map\MapControl\busstop_CA.paa";
                conditions = "";
            };

            class Pyrgos {
                displayName = "Pyrgos HQ";
                spawnMarker = "cop_spawn_5";
                icon = "\a3\ui_f\data\map\MapControl\watertower_CA.paa";
                conditions = "";
            };
			
            class Swat {
                displayName = "SWAT HQ";
                spawnMarker = "cop_spawn_8";
                icon = "\a3\ui_f\data\map\MapControl\bunker_ca.paa";
                conditions = "";
            };
        };

        class Medics {
            
            class Central {
                displayName = "Zentrale";
                spawnMarker = "medic_spawn_zen";
                icon = "\a3\ui_f\data\map\MapControl\hospital_ca.paa";
                conditions = "";
            };
			
			class Kavala {
                displayName = "Kavala";
                spawnMarker = "medic_spawn_1";
                icon = "\a3\ui_f\data\map\MapControl\hospital_ca.paa";
                conditions = "";
            };
			
            class SofiaPRS {
                displayName = "Sofia";
                spawnMarker = "medic_pyrgos";
                icon = "\a3\ui_f\data\map\MapControl\hospital_ca.paa";
                conditions = "";
            };
			
            class Autohof {
                displayName = "Autohof";
                spawnMarker = "medic_spawn_agios";
                icon = "\a3\ui_f\data\map\MapControl\hospital_ca.paa";
                conditions = "";
            };
			
            class Bergrettung {
                displayName = "Bergrettung";
                spawnMarker = "medic_spawn_pyrsos";
                icon = "\a3\ui_f\data\map\MapControl\hospital_ca.paa";
                conditions = "";
            };
        };
    };
};
