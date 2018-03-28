#include "..\..\script_macros.hpp"
/*
	Author: Bryan "Tonic" Boardwine
	
	Description:
	Notifies members that the gang has been disbanded.
*/
private["_group"];
_group = param [0,grpNull,[grpNull]];
if(isNull _group) exitWith {}; //Fail horn please.
if(!isNull (findDisplay 2620)) then {closedialog 2620};
//h/int localize "STR_GNOTF_DisbandWarn_2";
[localize "STR_GNOTF_DisbandGangCanc","RED",10] spawn life_fnc_notification_system;
[player] joinSilent (createGroup civilian);
if(count units _group isEqualTo 0) then {
	deleteGroup _group;
};
