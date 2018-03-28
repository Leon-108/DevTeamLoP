#include "..\..\script_macros.hpp"
/*
	Author: Bryan "Tonic" Boardwine
	
	Description:
	Something about being a quitter.
*/
private["_unit","_unitID","_members","_action","_index"];
disableSerialization;

if((lbCurSel 2621) isEqualto -1) exitWith {
	//h/int localize "STR_GNOTF_TransferSelect"
	[localize "STR_GNOTF_TransferSelect","RED",10] spawn life_fnc_notification_system;
};
_unit = call compile format["%1",getSelData(2621)];

if(isNull _unit) exitWith {}; //Bad unit?
if(_unit isEqualto player) exitWith {
	//h/int localize "STR_GNOTF_TransferSelf"
	[localize "STR_GNOTF_TransferSelf","RED",10] spawn life_fnc_notification_system;
};

_action = [
	format[localize "STR_GNOTF_TransferMSG",_unit getVariable ["realname",name _unit]],
	localize "STR_Gang_Transfer",
	localize "STR_Global_Yes",
	localize "STR_Global_No"
] call BIS_fnc_guiMessage;

if(_action) then {
	_unitID = getPlayerUID _unit;
    if (_unitID isEqualTo "") exitWith {
		//h/int localize "STR_GNOTF_badUID";
		[localize "STR_GNOTF_badUID","RED",10] spawn life_fnc_notification_system;
	}; //Unlikely?
    group player setVariable ["gang_owner",_unitID,true];
    group player selectLeader _unit;
	[[_unit,group player],"TON_fnc_clientGangLeader",_unit,false] spawn life_fnc_MP; //Boot that bitch!
	[[3,group player],"TON_fnc_updateGang",false,false] spawn life_fnc_MP; //Update the database.
} else {
	//h/int localize "STR_GNOTF_TransferCancel";
	[localize "STR_GNOTF_TransferCancel","RED",10] spawn life_fnc_notification_system;
};
[] call life_fnc_gangMenu;