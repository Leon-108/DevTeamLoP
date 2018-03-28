/* 
	
	Author: Sebi
	http://www.lostofparadise.de/
	
*/
/* 
	
	Author: Sebi
	http://www.lostofparadise.de/
	
*/
//t/itleText ["••• ESP DEAKTIVIERT •••","PLAIN",1];
["••• ESP DEAKTIVIERT •••","WHITE",5] spawn life_fnc_notification_system;
//[0] call life_fnc_espMarkers;
onEachFrame {};
sleep 1;
LIFE_ID_PlayerTags = ["LIFE_PlayerTags","onEachFrame","life_fnc_playerTags"] call BIS_fnc_addStackedEventHandler;
//[] spawn TON_fnc_MapMarkersAdmin;
