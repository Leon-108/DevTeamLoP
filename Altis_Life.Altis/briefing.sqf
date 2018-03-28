waitUntil {!isNull player && player isEqualTo player};
if(player diarySubjectExists "rules")exitwith{};

player createDiarySubject ["serverrules","Serverregeln"];
player createDiarySubject ["controls","Steuerung"];

	player createDiaryRecord ["serverrules",
		[
			"Information", 
				"
				Server Regeln und Changelogs sind auf www.lostonparadise.de zu finden.<br/>
				Wir weisen darauf hin das wir an eine Altis Globale Bannlist angeschlossen sind, im Fall eines Geldhacks oder sonstige Hacks wird der Bann auf sehr vielen Deutschen Servern automatisch übertragen.<br/>
				"
		]
	];

	player createDiaryRecord ["controls",
		[
			"",
				"
				Z: Öffnen des Player Menüs<br/>
				U: Fahrzeuge auf und zu sperren / Häuser auf und zu sperren<br/>
				F: Cop Sirene (nur Cops/PRS)<br/>
				R: Cop Yelp (Nur Cops)<br/>
				Ä: Cop Durchsage (nur Cops)<br/>
				T: Fahrzeug Laderaum, Haus Lager<br/>
				Strg + n: Navigationsgerät öffnen<br/>
				Rechtes Shift: 	 Paradise News schreiben (Nur Cop/PRS)<br/>
				Links Shift + R: Restrain erst nach Knockout<br/>
				Links Shift + G: Niederschlagen (nur Zivilist, gebraucht zum ausrauben)<br/>
				Links Shift + 1: Ergeben<br/>
				Links Shift + Leertaste: Springen<br/>
				Links Shift + L: Aktivieren vom Blaulicht (nur Cops/PRS).<br/>
				Links Shift + P: (Ohrstöpsel) Umgebungsgeräusche leiser schalten für eine ordentliche Konversation! 4 Stufen Funktion<br/>
				Links Shift + Num Pad: 0: Uniformen Skin laden (nur Gruppierungen, Cops/PRS)<br/>
				Links Shift + Num Pad: 1: Pinkeln<br/>
				Links Shift + Num Pad: 2: Kniebeugen Langsam<br/>
				Links Shift + Num Pad: 3: Taekwondo<br/>
				Links Shift + Num Pad: 4: Winken (geht nur mit Waffe/Fernglas)<br/>
				Links Shift + Num Pad: 5: Hi (geht nur mit Waffe/Fernglas)<br/>
				Links Shift + Num Pad: 6: Kopfschütteln (geht nur mit Waffe/Fernglas)<br/>
				Links Shift + Num Pad: 7: Nicken<br/>
				Links Shift + Num Pad: 8: Richtung zeigen (geht nur mit Waffe/Fernglas)<br/>
				Links Shift + Num Pad: 9: Deckung suchen (geht nur mit Waffe/Fernglas)<br/>
				Links Windows: Haupt Interaktions-Taste, wird gebraucht um Items/Geld aufzuheben, Fahrzeuge zu reparieren und für Cops um mit Zivilisten zu interagieren. Unter ESC->Configure->Controls->Custom->Use Action 10 kann man die Taste umlegen.<br/>
				"
		]
	];