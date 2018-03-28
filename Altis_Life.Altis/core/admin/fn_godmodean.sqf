/* 
	
	Author: OktasLP
	http://www.lostofparadise.de/
	
*/

if (alive player) then 
{
	player setDamage 0;
	player allowDamage false;
	player setVariable["god-mode",true,true];
	//t/itleText ["••• GODMODE AKTIVIERT, ADMIN LOADOUT WIRD GELADEN. •••","PLAIN",1];
	["••• GODMODE AKTIVIERT, ADMIN LOADOUT WIRD GELADEN. •••","WHITE",5] spawn life_fnc_notification_system;
	sleep 1;
	removeHeadgear player;
	removeVest player;
	removeAllWeapons player;
	removeBackpack player;
	player setVariable ["admin",3,true];
	//h/intSilent parseText format["<t size='1.2' color='#31B404'> Achtung, %1. Dein Godmode deaktiviert sich wenn Du gestorben, festgenommen oder getazert bist. Beachte, dass Du dein Godmode dann erneut aktivieren musst. Nach dem einloggen bedeutet der Godmodeanzug nicht, dass Du noch Godmode hast!</t>", name player];
	[parseText format["<t size='1.2' color='#31B404'> Achtung, %1. Dein Godmode deaktiviert sich wenn Du gestorben, festgenommen oder getazert bist. Beachte, dass Du dein Godmode dann erneut aktivieren musst. Nach dem einloggen bedeutet der Godmodeanzug nicht, dass Du noch Godmode hast!</t>", name player],"WHITE",5] spawn life_fnc_notification_system;
	player forceAddUniform "U_B_Protagonist_VR";
	player addItem "ItemGPS";
	player assignItem "ItemGPS";
	player addItem "NVGoggles_OPFOR";
	player assignItem "NVGoggles_OPFOR";
	if(backpack player != "") then {(unitBackpack player) setObjectTextureGlobal [0,""];};
}else{
	//h/int "Fehler 502";
	["Fehler 502","RED",10] spawn life_fnc_notification_system;
};