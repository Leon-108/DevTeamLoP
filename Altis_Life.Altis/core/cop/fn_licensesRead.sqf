/*
	File: fn_licensesRead.sqf
	Author: Bryan "Tonic" Boardwine
	
	Description:
	Outprints the licenses.
*/
params [
	["_civ","",[""]],
	["_licenses",(localize "STR_Cop_NoLicenses"),[""]]
];
[parseText format["<t color='#FF0000'><t size='2'>%1</t></t><br/><t color='#FFD700'><t size='1.5'>%2</t></t><br/>%3",_civ,(localize "STR_Cop_Licenses"),_licenses],"RED",10] spawn life_fnc_notification_system;