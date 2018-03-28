/*
	Author: Bryan "Tonic" Boardwine
	
	Description:
	Blasting charge is used for the federal reserve vault and nothing  more.. Yet.
*/
private["_vault","_handle"];
_vault = [_this,0,ObjNull,[ObjNull]] call BIS_fnc_param;
if(isNull _vault) exitWith {}; //Bad object
if(typeOf _vault != "Land_CargoBox_V1_F") exitWith {
	//h/int localize "STR_ISTR_Blast_VaultOnly"
	[localize "STR_ISTR_Blast_VaultOnly","RED",10] spawn life_fnc_notification_system;
};
if({side _x isEqualto west} count playableUnits < 7 ) exitWith {
	//h/int "Es müssen mindestens 7 Polizisten für die Bank da sein."
	["Es müssen mindestens 7 Polizisten für die Bank da sein.","RED",10] spawn life_fnc_notification_system;
};
if(_vault getVariable["chargeplaced",false]) exitWith {
	//h/int localize "STR_ISTR_Blast_AlreadyPlaced"
	[localize "STR_ISTR_Blast_AlreadyPlaced","RED",10] spawn life_fnc_notification_system;
};
if(_vault getVariable["safe_open",false]) exitWith {
	//h/int localize "STR_ISTR_Blast_AlreadyOpen"
	[localize "STR_ISTR_Blast_AlreadyOpen","RED",10] spawn life_fnc_notification_system;
};
if(!([false,"blastingcharge",1] call life_fnc_handleInv)) exitWith {}; //Error?
[[[1,2],"STR_ISTR_Bolt_AlertFed",true,[]],"life_fnc_broadcast",true,false] spawn life_fnc_MP;
_vault setVariable["chargeplaced",true,true];
[[1,localize "STR_ISTR_Blast_Placed"],"life_fnc_broadcast",west,false] spawn life_fnc_MP;
//h/int localize "STR_ISTR_Blast_KeepOff";
[localize "STR_ISTR_Blast_KeepOff","GREEN",5] spawn life_fnc_notification_system;
_handle = [] spawn life_fnc_demoChargeTimer;
[[],"life_fnc_demoChargeTimer",west,false] spawn life_fnc_MP;

waitUntil {scriptDone _handle};
sleep 0.9;
if(!(fed_bank getVariable["chargeplaced",false])) exitWith {
	//h/int localize "STR_ISTR_Blast_Disarmed"
	[localize "STR_ISTR_Blast_Disarmed","PINK",5] spawn life_fnc_notification_system;
};

_bomb = "Bo_GBU12_LGB_MI10" createVehicle [getPosATL fed_bank select 0, getPosATL fed_bank select 1, (getPosATL fed_bank select 2)+0.5];
fed_bank setVariable["chargeplaced",false,true];
fed_bank setVariable["safe_open",true,true];

//h/int localize "STR_ISTR_Blast_Opened";
[localize "STR_ISTR_Blast_Opened","GREEN",5] spawn life_fnc_notification_system;