/*
	Author: Sebi
	http://www.lostofparadise.de/
*/
//t/itleText ["••• ESP AKTIV •••","PLAIN",1];
["••• ESP AKTIV •••","WHITE",5] spawn life_fnc_notification_system;
sleep 1;
//[1] call life_fnc_espMarkers;
onEachFrame  {         
	{if(side _x != side player) then     
		{drawIcon3D ["", [0.1, 0.1, 255, 2], position _x, 0.1, 0.1, 45, (format ["%2:%1m",player distance _x, name _x]), 1, 0.04, "PuristaMedium"]    }    
	else    
		{drawIcon3D ["", [3, 0, 255, 2], position _x, 0.1, 0.1, 45, (format ["%2:%1m",player distance _x, name _x]), 1, 0.04, "PuristaMedium"]    };   
	} 
	foreach allunits;
};
//[] spawn TON_fnc_MapMarkersAdmin;