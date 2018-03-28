#include "..\..\script_macros.hpp"
//moonshinescript made by spll3r

_gather = "schnaps"; 
_val = 1;
_diff = [_gather,_val,life_carryWeight,life_maxWeight] call life_fnc_calWeightDiff;
if(_diff isEqualTo 0) exitWith {
	//h/int localize "STR_NOTF_InvFull";
	[localize "STR_NOTF_InvFull","RED",10] spawn life_fnc_notification_system;
};

if(mdone) then
	{
		//h/int "Du destillierst nun den Schnaps!";
		["Du destillierst nun den Schnaps!","YELLOW",5] spawn life_fnc_notification_system;
		disableUserInput true;
		player playMoveNow "AinvPknlMstpSnonWnonDnon_medic_1";
		sleep 7;
		player playMoveNow "AinvPknlMstpSnonWnonDnon_medic_1";
		sleep 7;
		[true,"schnaps",1] call life_fnc_handleInv;
		/*
		*/
		//h/int "Der Durchlauf ist fertig!";
		["Der Durchlauf ist fertig!","GREEN",5] spawn life_fnc_notification_system;
		mdone = false;
		disableUserInput false;
	} else { 
		//h/int "Zur Destillation muss sich Maische im Brennkessel befinden!";
		["Zur Destillation muss sich Maische im Brennkessel befinden!","RED",10] spawn life_fnc_notification_system;
	};