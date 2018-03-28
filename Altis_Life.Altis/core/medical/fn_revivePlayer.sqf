#include "..\..\script_macros.hpp"
/*
	File: fn_revivePlayer.sqf
	Author: Bryan "Tonic" Boardwine
	
	Description:
	Starts the revive process on the player.
*/
//private["_target","_revivable","_targetName","_ui","_progressBar","_titleTxt","_cP","_title"];
params ["_target"];
if(isNull _target) exitWith {}; //DAFUQ?@!%$!R?EFFD?TGSF?HBS?DHBFNFD?YHDGN?D?FJH

private _revivable = _target getVariable["Revive",FALSE];
if(_revivable) exitWith {};
if(_target getVariable ["Reviving",ObjNull] isEqualto player) exitWith {
	//h/int localize "STR_Medic_AlreadyReviving";
	[localize "STR_Medic_AlreadyReviving","RED",10] spawn life_fnc_notification_system;
};
if(player distance _target > 5) exitWith {};

//Fetch their name so we can shout it.
private _targetName = _target getVariable["name","Unknown"];
private _title = format[localize "STR_Medic_Progress",_targetName];
life_action_inUse = true; //Lockout the controls.

_target setVariable["Reviving",player,TRUE];
//Setup our progress bar
disableSerialization;
5 cutRsc ["life_progress","PLAIN"];
private _ui = uiNamespace getVariable ["life_progress",displayNull];
private _progressBar = _ui displayCtrl 38201;
private _titleTxt = _ui displayCtrl 38202;
_titleTxt ctrlSetText format["%2 (1%1)...","%",_title];
_progressBar progressSetPosition 0.01;
private _cP = 0.01;

_animations = [
	"AinvPknlMstpSnonWrflDnon_medic1",
	"AinvPknlMstpSnonWrflDnon_medic2",
	"AinvPknlMstpSnonWrflDnon_medic3",
	"AinvPknlMstpSnonWrflDnon_medic4",
	"AinvPknlMstpSnonWrflDnon_medic5",
	"AinvPknlMstpSnonWrflDnon_medic6"
];

//Lets reuse the same thing!
for "_i" from 0 to 1 step 0 do {
    if(!((animationState player) in _animations)) then {
		_rand = floor(random 6);
		player playMoveNow (_animations select _rand);
	};
    sleep .15;
    _cP = _cP + .01;
    _progressBar progressSetPosition _cP;
    _titleTxt ctrlSetText format ["%3 (%1%2)...",round(_cP * 100),"%",_title];
    if (_cP >= 1 || !alive player) exitWith {};
    if (life_istazed) exitWith {}; //Tazed
    //if (life_isknocked) exitWith {}; //Knocked
    if (life_interrupted) exitWith {};
    if (player getVariable ["Re-strained",false]) exitWith {};
    if (player distance _target > 4) exitWith {_badDistance = true;};
    if (_target getVariable ["Revive",false]) exitWith {};
    if (_target getVariable ["Reviving",objNull] != player) exitWith {};
};

//Kill the UI display and check for various states
5 cutText ["","PLAIN"];
player playMoveNow "AinvPknlMstpSnonWrflDnon_medicEnd";
if ( _targetName isEqualto "Unknown" ) exitWith { 
	//h/int format ["Du hast die Person leider nicht mehr retten können, daher hast Du sie bestattet und erhälst %1 Dollar",[(call life_revive_fee)] call life_fnc_numberText];
	[format ["Du hast die Person leider nicht mehr retten können, daher hast Du sie bestattet und erhälst %1 Dollar",[(call life_revive_fee)] call life_fnc_numberText],"RED",10] spawn life_fnc_notification_system;
	deleteVehicle _target;
	BANK = BANK + (call life_revive_fee);
	life_action_inUse = false;	
};
if(_target getVariable ["Reviving",ObjNull] != player) exitWith {
	//h/int localize "STR_Medic_AlreadyReviving"
	[localize "STR_Medic_AlreadyReviving","RED",10] spawn life_fnc_notification_system;
};
_target setVariable["Reviving",NIL,TRUE];
if(!alive player OR life_istazed) exitWith {life_action_inUse = false;};
if(_target getVariable["Revive",FALSE]) exitWith {
	//h/int localize "STR_Medic_RevivedRespawned"
	[localize "STR_Medic_RevivedRespawned","RED",10] spawn life_fnc_notification_system;
};
if((player getVariable["Re-strained",false])) exitWith {life_action_inUse = false;};
if(!isNil "_badDistance") exitWith {
	//t/itleText[localize "STR_Medic_TooFar","PLAIN"]; 
	[localize "STR_Medic_TooFar","RED",10] spawn life_fnc_notification_system;
	life_action_inUse = false;
};
if(life_interrupted) exitWith {
	life_interrupted = false; 
	//t/itleText[localize "STR_NOTF_ActionCancel","PLAIN"];
	[localize "STR_NOTF_ActionCancel","RED",10] spawn life_fnc_notification_system;	
	life_action_inUse = false;
};

BANK = BANK + (call life_revive_fee);
life_action_inUse = false;

_target setVariable["Revive",TRUE,TRUE];
[[profileName],"life_fnc_revived",_target,FALSE] spawn life_fnc_MP;
//t/itleText[format[localize "STR_Medic_RevivePayReceive",_targetName,[(call life_revive_fee)] call life_fnc_numberText],"PLAIN"];
[format[localize "STR_Medic_RevivePayReceive",_targetName,[(call life_revive_fee)] call life_fnc_numberText],"GREEN",5] spawn life_fnc_notification_system;	

sleep 0.6;
player reveal _target;