private["_unit"];
_unit = player;
[false,_unit,0] call life_fnc_vipinfo;
[parseText "<t color='#1e90ff'><t size='1.1'><t align='center'>Willkommen bei<br/><t color='#ffffff'><t size='1.3'>Lost on Paradise | Altis Life<br/><t color='#1e90ff'><t size='1.1'><t align='center'>Euer Administrator<br/><t color='#ffffff'><t size='1'><t align='center'>Mr.Richi<br/><t color='#1e90ff'><t size='1.1'><t align='center'>Community Management<br/><t color='#ffffff'><t size='1'><t align='center'>Phil Ace, Jonas<br/><t color='#1e90ff'><t size='1.1'><t align='center'>Supporter<br/><t color='#ffffff'><t size='1'><t align='center'>Unsere Supporter stehen dir im Teamspeak 3 zur Verfügung<br/><t color='#1e90ff'><t size='1.1'><t align='center'>Forum<br/><t color='#ffffff'><t size='1'><t align='center'>www.lostonparadise.de<br/><t color='#1e90ff'><t size='1.1'><t align='center'>Teamspeak 3 Server<br/><t color='#ffffff'><t size='1'><t align='center'>ts3.lostonparadise.de:11181<br/><t color='#1e90ff'><t size='1.1'><t align='center'>Server Regeln und Changelogs<br/><t color='#ffffff'><t size='1'><t align='center'>Sind im Forum zu finden, lest sie euch unbedingt durch","YELLOW",30] spawn life_fnc_notification_system;
/*[] spawn {
    sleep 15;
    [
        [
            ["Willkommen bei","<t align = 'center' size = '0.7'>%1</t><br/>"],
            ["Lost on Paradise | Altis Life","<t align = 'center' size ='1'>%1</t><br/>"]
        ]
    ] spawn BIS_fnc_typeText;
    sleep 10;
    [
        [
            ["Euer Administrator","<t align = 'center' size = '0.7'>%1</t><br/>"],
            ["Mr.Richi","<t align = 'center' size ='1'>%1</t><br/>"]
        ]
    ] spawn BIS_fnc_typeText;
    sleep 10;
    [
        [
            ["Community Management","<t align = 'center' size = '0.7'>%1</t><br/>"],
            ["Ewald, Rene Sneipa","<t align = 'center' size ='1'>%1</t><br/>"]
        ]
    ] spawn BIS_fnc_typeText;
    sleep 11;
    [
        [
            ["Supporter","<t align = 'center' size = '0.7'>%1</t><br/>"],
            ["Unsere Supporter stehen dir im Teamspeak 3 zur Verfügung!","<t align = 'center' size ='1'>%1</t><br/>"]
        ]
    ] spawn BIS_fnc_typeText;
	 sleep 10;
    [
        [
            ["Besuche uns unter","<t align = 'center' size = '0.7'>%1</t><br/>"],
            ["www.lostonparadise.de","<t align = 'center' size ='1'>%1</t><br/>"]
        ]
	] spawn BIS_fnc_typeText;
	 sleep 10;
    [
        [
            ["Teamspeak 3 Server","<t align = 'center' size = '0.7'>%1</t><br/>"],
            ["ts3.lostonparadise.de:11181","<t align = 'center' size ='1'>%1</t><br/>"]
        ]
	] spawn BIS_fnc_typeText;
		 sleep 10;
    [
        [
            ["Server Regeln und Changelogs","<t align = 'center' size = '0.7'>%1</t><br/>"],
            ["Sind im Forum zu finden, lest sie euch unbedingt durch!","<t align = 'center' size ='1'>%1</t><br/>"]
        ]
	] spawn BIS_fnc_typeText;

};*/
	
