/*
 *
 *	Filename:		fn_helpbutton.sqf
 *	Description:	Script of the help dialog
 *
 *	Creator: 		Sebastian Kemper (Lost on Paradise)
 */
private ["_dialogID","_dialog","_beschreibung","_listbox","_textbox","_listitems","_lbindex"];
disableSerialization;
_dialogID = 198888; //IDD
_dialog = (findDisplay _dialogID);
_listbox = _dialog displayCtrl 198890;
_textbox = _dialog displayCtrl 198889;
_listitems = ["Information","Steuerung","Spieler Guide","Fahrzeuge","Versicherungen","Anfängerrouten","Routen","Bank- und Tankstellenraub"]; //<- TEXT1 = CASE 0 , TEXT2 = CASE 1, ...
_lbauswahl = lbCurSel 198890;
_beschreibung = "";

if(!dialog) then {createDialog "holy_helpmenu"}; //Zum überprüfen ob bereits Menüs geöffnet sind
waitUntil {!isNull (_dialog)};

switch(_lbauswahl) do {
	default {
		_lbindex = 0;
		lbClear 198890;
		{
		lbAdd[198890, _x];
		lbSetData[198890, _lbindex, _lbindex];
		_lbindex = _lbindex +1;		
		} forEach _listitems;
		lbSetCurSel[198890, 0];
	};
	case 0: {
		_beschreibung = "<t color='#1e90ff'><t size='1.7'><t align='center'>Information</t><br/><br/><t color='#1e90ff'><t size='1.1'><t align='center'>Willkommen bei<br/><t color='#ffffff'><t size='1.3'>Lost on Paradise | Altis Life<br/><t color='#1e90ff'><t size='1.1'><t align='center'>Euer Administrator<br/><t color='#ffffff'><t size='1'><t align='center'>Mr.Richi<br/><t color='#1e90ff'><t size='1.1'><t align='center'>Community Management<br/><t color='#ffffff'><t size='1'><t align='center'>Phil Ace, Jonas<br/><t color='#1e90ff'><t size='1.1'><t align='center'>Supporter<br/><t color='#ffffff'><t size='1'><t align='center'>Unsere Supporter stehen dir im Teamspeak 3 zur Verfügung<br/><t color='#1e90ff'><t size='1.1'><t align='center'>Forum<br/><t color='#ffffff'><t size='1'><t align='center'>www.lostonparadise.de<br/><t color='#1e90ff'><t size='1.1'><t align='center'>Teamspeak 3 Server<br/><t color='#ffffff'><t size='1'><t align='center'>ts3.lostonparadise.de:11181<br/><t color='#1e90ff'><t size='1.1'><t align='center'>Server Regeln und Changelogs<br/><t color='#ffffff'><t size='1'><t align='center'>Sind im Forum zu finden, lest sie euch unbedingt durch";
	};
	case 1: {
		_beschreibung = "
		<t color='#1e90ff'><t size='1.7'><t align='center'>Tastenbelegung</t><br/>
				<br/><t color='#ffffff'><t size='1.0'>
				Z: Öffnen des Player Menüs<br/>
				U: Fahrzeuge auf und zu sperren / Häuser auf und zu sperren<br/>
				F: Cop Sirene (nur Cops/PRS)<br/>
				R: Cop Yelp (Nur Cops)<br/>
				Ä: Cop Durchsage (nur Cops)<br/>
				T: Fahrzeug Laderaum, Haus Lager<br/>
				Strg + N: Navigationsgerät öffnen<br/>
				Rechtes Shift: 	 Paradise News schreiben (Nur Cop/PRS)<br/>
				Links Shift + R: Restrain erst nach Knockout<br/>
				Links Shift + G: Niederschlagen (nur Zivilist, gebraucht zum ausrauben)<br/>
				Links Shift + 1: Ergeben<br/>
				Links Shift + Leertaste: Springen<br/>
				Links Shift + L: Aktivieren vom Blaulicht (nur Cops/PRS).<br/>
				Links Shift + P: Ohrstöpsel (4 Stufen)<br/>
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
				Links Windows: Haupt Interaktions-Taste<br/>
				";
	};
	case 2: {
		_beschreibung = "
<t color='#1e90ff'><t size='1.7'><t align='center'>Anfänger Guide</t><br/>
<br/>
<t color='#ffffff'><t size='1.0'>
				Herzlich willkommen auf unserer Insel!<br/>
				In diesem Menüpunkt erhältst du grundlegende Information zu der Funktionsweise<br/>
				unserer Routen sowie einen kleinen Leitfaden für den Anfang.<br/>
				Solltest du bereits mit Arma 3 Altis Life vertraut sein kannst du auch direkt zum<br/>
				Anfängerleitfaden hinunterscrollen oder beim Menüpunkt deiner Wahl einsteigen<br/>
				<br/>
				Alle anderen Spieler begrüßen wir in dieser Arma Variation recht herzlich. <br/>
				Ihr findet im Folgenden die wichtisten Punkte zum Spielen auf unserem Server, <br/>
				die grundlegende Steuerung setzten wir hier bereits voraus.<br/>
				Solltet ihr irgendwelche Fragen haben, so wendet euch gerne an unseren Support im<br/>
				TS3 (IP steht unter dem Punkt Information), oder fragt andere Spieler im Side Chat.<br/>
				<br/>
				Was ist das Ziel in diesem Spiel?<br/>
				Ein wirkliches Ziel gibt es nicht. Viele würden sagen Geld verdienen, Andere jagen <br/>
				dem großen Ruhm nach. Letztlich ist das Ziel geile RPs zu führen und Spaß zu haben!<br/>
				<br/>
				Ihr seid also ein Roleplay-Server, was bedeutet das genau?<br/>
				Roleplay bedeutet du suchst dir einen Namen und eine Identität aus und spielst diese<br/>
				dann. Dafür ist es wichtig, dass du dir einen roleplaykonformen Vor- und Nachnamen<br/>
				zulegst (also nicht xXHe4dLPXx) und deine Rolle auch beibehältst (also nicht jedes<br/>
				mal das angibst was dir den Kopf rettet). Alles weitere wirst du schon sehen. <br/>
				<br/>
				Gut, was brauche ich noch bevor es losgehen kann?<br/>
				Ein paar grundlegende Dinge sind immer wichtig, hier eine kleine Übersicht:<br/>
				- Ein Rucksack (erhältlich beim Kleidungsladen) um mehr Items im I- und Z-Inventar <br/>
				transportieren zu können.<br/>
				- Toolkids (erzältlich im Shop/Baumarkt) um dein Fahrzeug bei einem Unfall per Windows-<br/>
				Taste reparieren zu können.<br/>
				- First Aid Kids (Shop/Baumarkt) um deine Verletzungen bei Unfällen behandeln zu können.<br/>
				- Essen und Trinken (Markt) um bei Kräften zu bleiben und nicht tot umzukippen (passiert<br/>
				wenn Hunger- oder Durstleiste bei 0 sind!<br/>
				- Ein Fahrzeug (Autohändler) um mehr transportieren zu können. Zu Anfang empfielt sich <br/>
				ein Quad (vergiss aber den Führerschein beim Lizenzamt nicht!)<br/>
				<br/>
				So das hab ich alles,, und wie verdiene ich jetzt Geld?<br/>
				Geld verdienen geht auf viele Methoden. Ob du jetzt Bandit bist und andere ausraubst<br/>
				oder ein Taxiunternehmen aufbaust, Geld lässt sich auf jede beliebige Art verdienen!<br/>
				Die aber wohl gängigste ist das Farmen. Hierzu gibt es auch die ganzen Routen bei<br/>
				bei uns auf der Karte. Das läuft so ab, dass du mit einem Fahrzeug zu einer Mine<br/>
				deiner Wahl fährst, dort dein Fahrzeug mit dem Rohstoff auffüllst und zum Verarbeiter<br/>
				schipperst. Dort verarbeitest du das Zeug und verkaufst es anschließend beim passenden<br/>
				Händler. Was zusammen gehört entnimmst du am Besten dem Routenwiki in diesem Menü oder<br/>
				im Forum.<br/>
				Jedoch gibt es einige Punkte zu beachten:<br/>
				1. Zum Abbauen vieler Rohstoffe benötigt: Für Kohle und Erze benötigst du eine<br/>
				Spitzhacke, für viele Flüssigkeiten einen Kanister etc. Dies entnimmst du auch dem <br/>
				Routenwiki.<br/>
				2. Für 99% benötigst du eine Lizenz, diese bekommst du für BARGELD beim Lizenzamt <br/>
				in jeder Stadt oder direkt am Verarbeiter.<br/>
				3. Die Symbole auf der Karte sagen dir, ob es sich um eine Mine/Feld (Quadrat), einen<br/>
				Verarbeiter (Dreieck) oder einen Händler (Kreis) handelt.<br/>
				4. Einige Routen sind flüssig, diese benötigen ein spezielles Tankfahrzeug!<br/>
				5. Einige Routen sind auf dem Wasser, für diese benötigt man ein Boot!<br/>
				6. Einige Routen sind sehr langgezogen und lohnen sich nur mit einem Helikopter<br/>
				7. Viele Routen sind illegal, diese erkennt ihr an der Orangen Farbe der Marker auf der<br/>
				Karte. Lasst euch bei diesen nicht von der Polizei erwischen, sonst gibts ein Ticket!<br/>
				Davor sind diese Routen aber auch lukrativer!<br/>
				<br/>
				Einige Ausnahmen:<br/>
				- Kohle und vieles Andere besitzt keinen Verarbeiter<br/>
				- Bei Eisenerz erhält man sowohl Eisen- als auch Zinnbarren<br/>
				- Kunststoff wird beim Verarbeiten zum Feststoff<br/>
				- Bei Schiffsfracht erhält man aus Frachtkisten zu 25% Gemälde mit 100% Wert, zu 25%<br/>
				Skulpturen mit 80% Wert und zu 50% Silberbesteck mit 20% Wert. Feld zu Verarbeiter ist<br/>
				dabei eine Bootroute, Verarbeiter zu Händler eine Heliroute. Garagen sind am Verarbeiter<br/>
				<br/>
				Wie fange ich jetzt am Besten an?<br/>
				Für den Anfang empfielt sich ein Rucksuck und ein Quad, damit zum Pfirsichfeld, dort mit<br/>
				Q Pfirsiche ernten und diese wieder am Markt verkaufen. Wer gern etwas weiter fährt kann<br/>
				diese Route auch von Verladerampe zum Supermarkt direkt am Markt und wieder zurück<br/>
				fahren. Bringt etwas mehr Geld, benötigt aber eine Lizenz für <br/>
				Sobald dann eine Spitzhacke, eine Kohlelizenz und ein Offroader drin sind empfielt sich<br/>
				Kohle von der Mine zum Kraftwerk zu befördern und dort zu verkaufen. Farmen ist, wie <br/>
				überall sonst auch, mit Q möglich.<br/>
				Anschließend empfielen sich dann Kupfer, Eisen und Alluminium. Bei allen dreien ist der<br/>
				gemeinsame Verarbieter die Erzschmelze.<br/>
				Alternativen stehen genügend zur Verfügung. So kann man stattdessen Getreide fahren, oder<br/>
				sich statt Offroader einen Jetski kaufen und mit einem Netz Fische fangen, oder statt <br/>
				einem Zamak für 200k einen Tanker kaufen und Wasser oder Milch machen. <br/>
				Boot und FlüssigkeitsLKWs sind in der Regel auch immer kosteneffizienter, weshalb sich<br/>
				dies bei gutem Preis der Routen sehr lohnen kann!<br/>
				<br/>
				Sobald ihr dann mal über etwas mehr Geld verdient einfach den die Fahrzeuge nach der Reihe<br/>
				hochkaufen, damit ihr im Falle, dass eines Bumm macht, ihr noch das nächst Kleinere habt <br/>
				und nicht wieder mit dem Offroader anfangen müsst!<br/>
				<br/>
				Was hat es denn mit der Versicherung auf sich?<br/>
				Einige Fahrzeuge sind versichert, siehe dazu Punkt Versicherungen!<br/>
				<br/>
				Was tue ich denn jetzt wenn ich überfallen werde?<br/>
				Es wird euch immer wieder passieren, dass euch jemand an euer Geld will, vor allem bei<br/>
				Händlern warten diese Leute immer gerne. Falls das passiert ruft über das Handy die <br/>
				Polizei, diese hilft euch aus und ist nahe Kavala auch schnell zur Stelle!<br/>
				<br/>
				Damit solltet ihr für den Anfang gut gerüstet sein und ihr wünschen euch viel Spaß beim <br/>
				loslegen! </t><br/>
				
";
	};
	case 3: {
		_beschreibung = "
<t color='#1e90ff'><t size='1.7'><t align='center'>Fahrzeuge</t><br/>
<br/>
<t color='#ffffff'><t size='1.00'>
				Hier eine kleine Übersicht über fast alle Fahrzeuge mit Kosten und Frachtraum.<br/>
				Fahrzeugname		Kosten				Frachtraum<br/>
				Quad					 15.000 €		  25<br/>
				Offroader				 30.000 €		  80<br/>
				MB 4WD					 45.000 €		 100<br/>
				Truck					 51.000 €		 120<br/>
				Truck Box				110.000 €		 160<br/>
				Van						187.000 €		 200<br/>
				Van Transport			187.000 €		 200<br/>
				Zamak					288.000 €		 300<br/>
				Zamak abgedeckt			524.000 €		 340<br/>
				Hemtt					716.000 €		 400<br/>
				Tempest				  1.500.000 €		 460<br/>
				Hemtt abgedeckt		  1.917.000 €		 540<br/>
				Tempest abgedeckt	  2.418.000 €		 640<br/>
				Tempest Repair		  3.111.000 €		 750<br/>
				Hemtt Ammo			  4.935.000 €		 870<br/>
				Hemtt Box			  8.596.000 €		1000<br/>
				Tempest Gerät		 50.000.000 €		1200<br/>
				Tempest Munnition	250.000.000 €		2000<br/>
				<br/>
				Jetski					 30.000 €		 100<br/>
				Schlauchboot			 50.000 €		 175<br/>
				SDV						350.000 €		 350<br/>
				Motorboot			  1.000.000 €	 	 450<br/>
				RHIB				  3.500.000 €		 820<br/>
				<br/>
				Truck Tanken			200.000 €		 250<br/>
				Zamak Tanken		  1.200.000 €		 450<br/>
				Hemtt Tanken		  7.000.000 €		 950<br/>
				Tempest Tanken		 40.000.000 €		1150<br/>
				<br/>
				M900					990.000 €		 150<br/>
				Hummingbird				900.000 €		  90<br/>
				Orca				  1.950.000 €		 280<br/>
				Hellcat				  4.500.000 €		 150<br/>
				Mohawk				  4.950.000 €		 380<br/>
				Huron				  6.800.000 €		 460<br/>
				Taru Transport		 12.000.000 €		 750<br/>
				Caesar Racing		  7.000.000 €		 700<br/>
				Xi'an				 87.000.000 €		1000<br/>
				Jet1				 70.000.000 €		3000<br/>
				Jet2				140.000.000 €		3000<br/>
				<br/>
				Taru Tanken			 30.000.000 €		 900<br/>
				<br/>
				SUV						 52.500 €		  50<br/>
				Limo					 24.000 €		  40<br/>
				Sportlimo				600.000 €		  60<br/>
				Prowler light			150.000 €		 100<br/>
				Prowler					150.000 €		 100<br/>
				Qilin					150.000 €		 100<br/>
				Strider				  9.600.000 €		 100<br/>
				Hunter				  10.500.000 €		 100<br/>
				Ifrit				   6.300.000 €		 100<br/>
				Caesar				   3.000.000 €		 250<br/>
				Blackfish Transport	  10.000.000 €		 350<br/>
				Blackfish Infanterie   7.500.000 €		 400</t><br/>
								
";
	};
	case 4: {
		_beschreibung = "
<t color='#1e90ff'><t size='1.7'><t align='center'>Versicherungen</t><br/>
<br/>
<t color='#ffffff'><t size='1.00'>
				Was hat es mit der Versicherung auf sich?<br/>
				Einige Fahrzeuge sind versichert. Dies bedeutet, dass ihr sie in der Versicherungszentrale<br/>
				(siehe Karte) im Falle einer Explosion billiger wieder erhalten könnt, als wie wenn ihr sie <br/>
				neu kaufen müsstet. <br/>
				<br/>
				Folgende Fahrzeuge sind ab Kauf kostenlos versichert, andere Fahrzeuge lassen sich nicht <br/>
				versichern (Nein eine Haftpflicht ist bei uns nicht für jedes Fahrzeug nötig, nein das ist<br/>
				nicht illegal :P )<br/><br/>
				Fahrzeug				Eigenbeteiligung<br/><br/>
				Truck Boxer				    50.000$<br/>
				Hemtt					   200.000$<br/>
				Hemmt Munnition			 2.000.000$<br/>
				Tempest Gerät			 5.000.000$<br/>
				Tempest Munnition		10.000.000$<br/>
				<br/>
				Zamak Tanken			   350.000$<br/>
				Tempest Tanken			 5.000.000$<br/>
				<br/>
				Taru Tansport			 6.000.000$<br/>
				Caesnar Racing			   800.000$<br/>
				Xi'an					 3.000.000$<br/>
				Blackfish Transport		 9.000.000$<br/>
				<br/>
				Taru Tanken				 6.000.000$</t><br/>

";
	};
	case 5: {
		_beschreibung = "
<t color='#1e90ff'><t size='1.7'><t align='center'>Anfängerrouten</t><br/>
<br/>
<t size='1.25'><t align='left'>1. Lebensmittellieferung</t><br/>
<t color='#ffffff'><t size='1.025'>Du bist ganz neu auf der Insel und suchst Arbeit? Dann solltest du hier anfangen. Transportiere <t color='#75D5FF'>Fleisch, Käse, Brot und Obst</t> von der <t color='#FFC730'>Verladerampe</t> zum <t color='#FF5F56'>Supermarkt</t> am Kavala Marktplatz. Die Lizenz <t color='#4968ff'>Lebensmittellieferung</t> kostet <strong>$2.000.</strong><br/>
<br/>
				Folgt in Kürze, siehe solange Forum unter lostonparadise.de direkt oben in der Leiste<br/>
				-> Routenwiki</t><br/>
";
	};
	case 6: {
		_beschreibung = "
<t color='#1e90ff'><t size='1.7'><t align='center'>Routen</t><br/>
<br/>
<t color='#ffffff'><t size='1.05'>
				Folgt in Kürze, siehe solange Forum unter lostonparadise.de direkt oben in der Leiste<br/>
				-> Routenwiki</t><br/>

";
	};
	case 7: {
		_beschreibung = "
<t color='#1e90ff'><t size='1.7'><t align='center'>Gebäude zum Ausrauben</t><br/>
<br/>
<t color='#ffffff'><t size='1.00'>
				Gebäude die man ausrauben kann gibt es bei uns 4 Verschiedene, hier von schwer nach leicht geordnet:<br/>
				- Zentralbank<br/>
				- Bankfiliale<br/>
				- Tankstelle<br/>
				* Bankruine<br/>
				<br/>
				Die Zentralbank<br/>
				Sie ist der zentrale Lagerort für Gold auf der Insel und gut gesichert. Nicht wenige sind hier<br/>
				schon gescheitert!<br/>
				Der Gewinn beträgt 1-2 Goldbarren pro Zivilisten auf der Insel (+Kartell). Ein Goldbarren ist<br/>
				240.000$ wert und wiegt 30kg!<br/>
				Die Spielregeln sind jedoch denkbar simpel:<br/>
				- 10 Civs gegen 10 Cops. Haben die Zivilisten nicht alle den gleichen Nachnamen oder das gleiche<br/>
				Tag, so müssen alle teilnehmenden Parteien der Polizei zu beginn per SMS mitgeteilt werden!<br/>
				- Eine Bank darf erst 1h nach Restart begonnen werden und die letzte vorangegangene Bank muss<br/>
				1h her sein.<br/>
				- Jeder Civ im Umkreis von 1-2km darf von der Polizei erschossen werden, sobald das Tor angefangen<br/>
				wird zu knacken. Die Räuber dürfen im selben Umkreis auf alle Civs schießen. <br/>
				- Es müssen 7 Cops auf der Insel sein, damit eine Bank gestartet werden kann<br/>
				- Weiteres ist in den Serverregeln nachzulesen!<br/>
				<br/>
				Die Bankfillialen<br/>
				Die etwas kleinere Version der Zentralbank mit deutlich kleinerem Gewinn, dafür ohne gepanzerte<br/>
				Fahrzeuge auf beiden Seiten, ohne Drohne auf Copseite und nur 5vs5!<br/>
				<br/>
				Der Tankstellenraub<br/>
				Eher eine Beschäftigung für zwischendurch, bietet für Einsteiger jedoch eine gute Möglichkeit<br/>
				Geld auf illegale Art zu machen, ohne Farmen zu müssen. Hier kommen Cops meist im Streifenwage<br/>
				angefahren. Entsprechend sollte man auch nicht übertreiben!<br/>
				<br/>
				Die Bankruine<br/>
				Dies ist die etwas andere Art des Ausraubens. Das Ummauerte Gebiet ist eine Todeszone, hier<br/>
				knallen sich Civs auch gerne gegenseitig ab um an den Loot zu kommen. Generell gilt die Regel:<br/>
				was die vor die Flinte kommt wird erschossen, sonst bist du der Nächste!<br/>
				Hier bekommt man zufällige Items heraus, diese kann man dann einlagern und bei gutem Preis<br/>
				verkaufen oder direkt ein paar Händler anfliegen. Möglich ab 15 Zivilisten (+Kartell)</t><br/>

";
	};
};
private ["_beschreibung"];
_textbox ctrlSetStructuredText parseText format["%1",_beschreibung];
_textbox ctrlSetPosition [0,0,0.318655 * safezoneW,ctrlTextHeight _textbox];
_textbox ctrlCommit 0;