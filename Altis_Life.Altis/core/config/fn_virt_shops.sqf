/*
	File: fn_virt_shops.sqf
	Author: Bryan "Tonic" Boardwine
	
	Description:
	Config for virtual shops.
*/
private["_shop","_val"];
_shop = _this select 0;
if ( vehicle player != player ) exitWith {
	//h/int "Du kannst nicht aus dem Auto heraus verkaufen."; 
	["Du kannst nicht aus dem Auto heraus verkaufen.","RED",10] spawn life_fnc_notification_system;
	closeDialog 0;
};
switch (_shop) do
{
	case "market": {["Altis Markt",["water","bier","rabbit","apple","redgull","tbacon","doner","pickaxe","fuelF","peach","storagebig","schnaps","goatraw","sheepraw","rabbitraw","wolfraw","wolf1raw"]]};
	case "medicmarket": {["PRS Markt",["water","coffee","donuts","apple","pille","redgull","tbacon","doner","lockpick","fuelF","peach","mauer","sperre","wand","schranke","lampe","dixi","tisch","generator","matratze","zelt","kidney"]]};
	case "rebelmarket": {["Rebellen Markt",["water","bier","rabbit","apple","redgull","tbacon","doner","schnaps","lockpick","storagebig","pickaxe","fuelF","scalpel","peach","geld","boltcutter","blastingcharge","goatraw","sheepraw","rabbitraw","wolfraw","wolf1raw"]]};
	case "wongs": {["Wong's Food Cart",["turtlesoup","turtle"]]};
	case "organ": {["Organ Dealer",["kidney"]]};
	case "gang": {["Gang Market", ["water","bier","rabbit","apple","redgull","tbacon","doner","lockpick","pickaxe","fuelF","peach","boltcutter","blastingcharge"]]};
	case "coffee": {["Stratis Coffee Club",["coffee","donuts"]]};
	case "heroin": {["Drogen Dealer",["cocainep","heroinp","methp","marijuana","frogp","badcocaine","krokodile"]]};
	case "oil": {["Öl Händler",["oilp"]]};
	case "fishmarket": {["Altis Fisch Markt",["salema","ornate","mackerel","mullet","tuna","catshark"]]};
	case "glass": {["Altis Glas Händler",["glass"]]};
	case "iron": {["Papier/Edelmetall Händler",["iron_r","copper_r","goldp"]]};
	case "diamond": {["Diamant Händler",["diamond","diamondc"]]};
	case "salt": {["Salz Händler",["salt_r"]]};
	case "adminmarket": {["Admin Markt",["donuts","coffee","spikeStrip","water","rabbit","apple","lockpick","doner","redgull","fuelF","scalpel","defusekit","lampe","sperre","mauer","wand","schranke","dixi","tisch","generator","matratze","zelt","geld","boltcutter","blastingcharge","storagesmall","storagebig","kidney"]]};
	case "cop": {["Polizei Markt",["donuts","coffee","spikeStrip","water","rabbit","apple","redgull","fuelF","defusekit","lockpick","lampe","sperre","mauer","wand","schranke","tisch","kidney"]]};
	case "cement": {["Reifen Händler",["cement"]]};
	case "admin1": {["Admin Markt",["water","bier","rabbit","apple","redgull","tbacon","doner","lockpick","pickaxe","fuelF","peach","donuts","coffee","spikeStrip","boltcutter","blastingcharge","storagebig","defusekit"]]};
	case "muschel": {["perlen Händler",["muschelu","muschelp"]]};
	case "silber": {["Silber Händler",["silberu","silberp"]]};
	case "pils": {["Bier Händler",["pilsu","pilsp"]]};
	case "brennstab": {["Tabak Händler",["brennstabp"]]};
    case "schmuck": {["Schmuck Händler",["schmuck"]]};
	case "atomwaffe": {["Illegaler Zigaretten Händler",["atomwaffe"]]};
	case "kerosin": {["Kerosin Händler /Atommüll Versiegelung",["kerosin","awastep"]]};
    case "gold": {["Gold Buyer",["goldbar"]]};
	case "bleiglas": {["Blei-Glas Händler",["bleigp"]]};
	case "radioaktiv": {["Atom Händler",["radioaktivp"]]};
	case "legierung": {["Legierungsbestandteil Händler",["bleilp"]]};
	case "gangheroin": {["Drogen Dealer",["cocainep","heroinp","methp","marijuana","frogp","badcocaine","krokodile"]]};
};