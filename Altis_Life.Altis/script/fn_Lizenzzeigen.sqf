#include "..\script_macros.hpp"
//Author: PierreAmyf ### Some edits by Lost of Paradise (Sebi, Oktas) 
if(isServer)exitWith{};
private["_ziel", "_rang", "_marke", "_org", "_message", "_rang","_name"];
if(vehicle player != player )exitWith{};
_ziel = cursorTarget;
if(isNull _ziel) then {_ziel = player;};    
if(!(_ziel isKindOf "Man")) then {_ziel = player;};  
if(!(alive _ziel)) then {_ziel = player;};
if(player distance _ziel > 6) exitWith {
	[parseText format ["<t color='#FFFF00'>Deine Arme sind viel zu kurz um den Ausweis zu zeigen! Geh näher ran.</t>"],"PURPLE",5] spawn life_fnc_notification_system;
}; // Nix mehr mit auf 500m Ausweis zeigen.

private _flag = "";
switch(playerSide)do {
/*	case west:{ 
		_rang = "Paradise Police Dept."; 
		_marke = "marke_cop";
		_org = "Paradise Police Department";
		_flag = "cop";
	};
*/
 case west:{
  switch (call life_coplevel) do{
   case 1: { _rang = "Recruit"; };
   case 2: { _rang = "Officer"; };
   case 3: { _rang = "Inspector"; };
   case 4: { _rang = "Detective"; };
   case 5: { _rang = "Corporal"; };
   case 6: { _rang = "Sheriff"; };
   case 7: { _rang = "Sergeant"; };
   case 8: { _rang = "Lieutenant"; };
   case 9: { _rang = "Leitung"; };
  };
  _marke = "marke_cop";
  _org = "Paradise Police Department";
  _flag = "cop";
  };

 case independent:{
  switch (call life_mediclevel) do{
   case 1: { _rang = "Rettungsanitäter"; };
   case 2: { _rang = "Notfallsanitäter"; };
   case 3: { _rang = "Assistenzarzt"; };
   case 4: { _rang = "Arzt"; };
   case 5: { _rang = "Notarzt"; };
   case 6: { _rang = "Facharzt"; };
   case 7: { _rang = "Oberarzt"; };
   case 8: { _rang = "PRS Leitung"; };
   default { _rank =  "Error";};
  };
  _marke = "marke_medic";
  _org = "Paradise Rescue Service";
 };
 case civilian:{
	_flag = "civ";
	_rang = "Zivilist";
	_org = "Republik Altis";
	_marke = "marke_ziv";
	if (license_civ_dm && (((name player) select [count (name player)-12,12]) isEqualTo "Dithmarscher")) then { _marke = "marke_dm"; _org = "Dithmarscher";};
	if ((license_civ_srevers) && (((name player) select [count (name player)-7,7]) isEqualTo "Srevers")) then { _marke = "marke_ziv";_org = "Srevers"; };
    if ((license_civ_kartell) && (name player select [1,7] isEqualTo "Kartell")) then { _marke = "marke_kartell"; _org = "Kartell";};
	if ((license_civ_presse) && (name player select [1,6] isEqualTo "Kirche")) then { _marke = "marke_priester"; _org = "Kirche";};
	if ((license_civ_bhg) && (name player select [1,3] isEqualTo "BHG")) then { _marke = "marke_bhg"; _org = "Bounty Hunter Group";};
};  
};
if ((side _ziel isEqualTo west) && (playerSide isEqualTo civilian)) then {
	private _licenses =[];
	private _text ="";
	_licensesConfigs = "getNumber(_x >> 'showPolice') isEqualTo 1" configClasses (missionConfigFile >> "Licenses");
	{
		_string = "";
		private _license = (configName _x);
		private _name = getText(missionConfigFile >> "Licenses" >> _license >> "displayName");
		if(missionNamespace getVariable LICENSE_VARNAME(_license,_flag)) then {
			_string = format["<t size='1' color='#3ADF00'>%1: %2</t><br/>",(localize _name),(localize "STR_Global_Yes")];
		} else {
			_string = format["<t size='1' color='#FF0000'>%1: %2</t><br/>",(localize _name),(localize "STR_Global_No")];
		};
		_licenses pushback _string;
	} foreach _licensesConfigs;
	_text = _licenses joinString "";
	_message = format["<img size='10' color='#FFFFFF' image='icons\%1.paa'/><br/><br/><t size='2.5' color='#F4FA58'>%2</t><br/><t size='1.8'>%3</t><br/><t size='1'>%4</t><br/>%5",_marke, name player, _rang, _org,_text];
} else {
	_message = format["<img size='10' color='#FFFFFF' image='icons\%1.paa'/><br/><br/><t size='2.5' color='#F4FA58'>%2</t><br/><t size='1.8'>%3</t><br/><t size='1'>%4</t><br/>",_marke, name player, _rang, _org];
};

[[player, _message],"life_fnc_Lizenzsehen",_ziel,false] spawn life_fnc_MP;