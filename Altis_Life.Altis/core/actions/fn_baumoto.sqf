//script made by spll3r hersteller fia'n brenna
#include "..\..\script_macros.hpp"
if(life_inv_brenn > 1) then
{ 
//h/int "Du kannst nicht mehr als 2 Brennkessel herstellen!";
["Du kannst nicht mehr als 2 Brennkessel herstellen!","RED",10] spawn life_fnc_notification_system;
} else {
		if(life_inv_bauma > 19) then
		{
			//h/int "Dein Brennkessel ist in wenigen Sekunden fertig!";
			["Dein Brennkessel ist in wenigen Sekunden fertig!","YELLOW",5] spawn life_fnc_notification_system;
			life_inv_bauma =  life_inv_bauma - 20;
			life_carryWeight = life_carryWeight - 60;
			sleep 10;
			life_inv_brenn = life_inv_brenn + 1;
			life_carryWeight = life_carryWeight + 2;
			//h/int "Bitte sehr!";
			["Bitte sehr!","GREEN",5] spawn life_fnc_notification_system;
			sleep 4;
			//h/int "TIPP: Bau deine Anlage auf ebener Flaeche auf. Es Duerfen keine Haeuser, Baeume, Strassen, etc in unmittelbarer Umgebung sein!";
			["TIPP: Bau deine Anlage auf ebener Flaeche auf. Es Duerfen keine Haeuser, Baeume, Strassen, etc in unmittelbarer Umgebung sein!","PINK",10] spawn life_fnc_notification_system;
		} else { 
			//h/int "Du brauchst mindestens 20 Baumaterialien!";
			["Du brauchst mindestens 20 Baumaterialien!","RED",10] spawn life_fnc_notification_system;
	    };
};







