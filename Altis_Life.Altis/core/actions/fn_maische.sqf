//moonshinescript made by spll3r
if(mdone) exitwith 
			{
				//h/int "Die Maische wurde bereits hergestellt";
				["Die Maische wurde bereits hergestellt","RED",10] spawn life_fnc_notification_system;
			 };
			 
if(life_inv_mais > 1 && life_inv_zucker > 0) then
	{		
		mdone = true;
		disableUserInput true;
		//h/int "Du maischt dass Wasser mit 2xMais und 1xZucker an.";
		["Du maischt dass Wasser mit 2xMais und 1xZucker an.","YELLOW",5] spawn life_fnc_notification_system;
		player playMoveNow "AinvPknlMstpSnonWnonDnon_medic_1";
		sleep 7;
		
		life_inv_mais = life_inv_mais - 2;
		life_carryWeight = life_carryWeight - 4;
		life_inv_zucker = life_inv_zucker - 1;
		life_carryWeight = life_carryWeight - 4;
		
		//h/int "Du kannst nun mit der Destillation beginnnen!";
		["Du kannst nun mit der Destillation beginnnen!","GREEN",5] spawn life_fnc_notification_system;
		disableUserInput false;
					
	} else { 
		//h/int "Zur Einmaischung benoetigst du 2xMais und 1xZucker";
		["Zur Einmaischung benoetigst du 2xMais und 1xZucker","RED",10] spawn life_fnc_notification_system;
	 };