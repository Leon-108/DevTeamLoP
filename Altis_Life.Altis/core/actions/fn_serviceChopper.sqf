/*
	File: fn_serviceChopper.sqf
	Author: Bryan "Tonic" Boardwine
	
	Description:
	Main functionality for the chopper service paid, to be replaced in later version.
*/
disableSerialization;
private["_search","_ui","_progress","_cP","_pgText","_title"];
if(life_action_inUse) exitWith {
	//h/int localize "STR_NOTF_Action"
	[localize "STR_NOTF_Action","RED",10] spawn life_fnc_notification_system;
};
_search = nearestObjects[getPos air_sp, ["Air"],5];
if(count _search isEqualTo 0) exitWith {
	//h/int localize "STR_Service_Chopper_NoAir"
	[localize "STR_Service_Chopper_NoAir","RED",10] spawn life_fnc_notification_system;
};
if(CASH < 1000) exitWith {
	//h/int localize "STR_Serive_Chopper_NotEnough"
	[localize "STR_Serive_Chopper_NotEnough","RED",10] spawn life_fnc_notification_system;
};
CASH = CASH - 1000;
life_action_inUse = true;
_title = localize "STR_Service_Chopper_Servicing";
5 cutRsc ["life_progress","PLAIN"];
_ui = uiNameSpace getVariable "life_progress";
_progress = _ui displayCtrl 38201;
_pgText = _ui displayCtrl 38202;
_pgText ctrlSetText format["%2 (1%1)...","%",_title];
_progress progressSetPosition 0.01;
_cP = 0.01;

while {true} do
{
	sleep  0.2;
	_cP = _cP + 0.01;
	_progress progressSetPosition _cP;
	_pgText ctrlSetText format["%2 (%1%2)...",round(_cP * 100),"%",_title];
	if(_cP >= 1) exitWith {};
};

if(!alive (_search select 0) || (_search select 0) distance air_sp > 10) exitWith {
	life_action_inUse = false; 
	//h/int localize "STR_Service_Chopper_Missing"
	[localize "STR_Service_Chopper_Missing","RED",10] spawn life_fnc_notification_system;
};
if(!local (_search select 0)) then
{
	[[(_search select 0),1],"life_fnc_setFuel",(_search select 0),false] spawn life_fnc_MP;
}
	else
{
	(_search select 0) setFuel 1;
};
(_search select 0) setDamage 0;

5 cutText ["","PLAIN"];
//t/itleText [localize "localize "STR_Service_Chopper_Done"","PLAIN"];
[localize "STR_Service_Chopper_Done","GREEN",10] spawn life_fnc_notification_system;
life_action_inUse = false;