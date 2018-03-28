#include "..\..\script_macros.hpp"
/*
    File: fn_captureHideout.sqf
    Author: Bryan "Tonic" Boardwine

    Description:
    Blah blah.
*/
private["_group","_hideout","_action","_cpRate","_cP","_progressBar","_title","_titleTxt","_ui","_flagTexture"];
private _hideout = (nearestObjects[getPosATL player,["FlagPole_F"],25]) select 0;
private _group = _hideout getVariable ["gangOwner",grpNull];
private _civs = (civilian countSide playableUnits);
if (life_firstrob) exitWith {
	//h/int "Jo man es war gerade Weltuntergang und das Hideout ist noch verschlossen!"
	["Jo man es war gerade Weltuntergang und das Hideout ist noch verschlossen!","RED",10] spawn life_fnc_notification_system;
};
if (isNil {group player getVariable "gang_name"}) exitWith {
	//t/itleText[localize "STR_GNOTF_CreateGang","PLAIN"];
	[localize "STR_GNOTF_CreateGang","RED",10] spawn life_fnc_notification_system;
};
if (_civs < 25) exitWith {
	//t/itleText["Es müssen min. 25 Zivilisten auf der Insel sein.","PLAIN"];
	["Es müssen min. 25 Zivilisten auf der Insel sein.","RED",10] spawn life_fnc_notification_system;
};
if (_group isEqualTo group player) exitWith {
	//t/itleText[localize "STR_GNOTF_Controlled","PLAIN"]
	[localize "STR_GNOTF_Controlled","RED",10] spawn life_fnc_notification_system;
};
if ((_hideout getVariable ["inCapture",false])) exitWith {
	//h/int localize "STR_GNOTF_onePersonAtATime";
	[localize "STR_GNOTF_onePersonAtATime","RED",10] spawn life_fnc_notification_system;
};

if ((count units group player) > 5) exitWith {
	["Ihr dürft max. 5 Leute in der Gang sein","RED",10] spawn life_fnc_notification_system;
};

private "_action";

private _cpRate = 0;
if (!isNull _group) then {
    _gangName = _group getVariable ["gang_name",""];
    _action = [
        format [localize "STR_GNOTF_AlreadyControlled",_gangName],
        localize "STR_GNOTF_CurrentCapture",
        localize "STR_Global_Yes",
        localize "STR_Global_No"
    ] call BIS_fnc_guiMessage;

    _cpRate = 0.002;
} else {
    _cpRate = 0.001;
};

if (!isNil "_action" && {!_action}) exitWith {
	//t/itleText[localize "STR_GNOTF_CaptureCancel","PLAIN"];
	[localize "STR_GNOTF_CaptureCancel","RED",10] spawn life_fnc_notification_system;
};
life_action_inUse = true;

//Setup the progress bar
disableSerialization;
private _title = localize "STR_GNOTF_Capturing";
"progressBar" cutRsc ["life_progress","PLAIN"];
private _ui = uiNamespace getVariable "life_progress";
private _progressBar = _ui displayCtrl 38201;
private _titleTxt = _ui displayCtrl 38202;
_titleTxt ctrlSetText format ["%2 (1%1)...","%",_title];
_progressBar progressSetPosition 0.01;
private _cP = 0.01;

for "_i" from 0 to 1 step 0 do {
    if (animationState player != "AinvPknlMstpSnonWnonDnon_medic_1") then {
       [[player,"AinvPknlMstpSnonWnonDnon_medic_1"],"life_fnc_animSync",true,false] spawn life_fnc_MP;
        player switchMove "AinvPknlMstpSnonWnonDnon_medic_1";
        player playMoveNow "AinvPknlMstpSnonWnonDnon_medic_1";
    };
    sleep 0.3;
    if (isNull _ui) then {
        "progressBar" cutRsc ["life_progress","PLAIN"];
        _ui = uiNamespace getVariable "life_progress";
        _progressBar = _ui displayCtrl 38201;
        _titleTxt = _ui displayCtrl 38202;
    };
    _cP = _cP + _cpRate;
    _progressBar progressSetPosition _cP;
    _titleTxt ctrlSetText format ["%3 (%1%2)...",round(_cP * 100),"%",_title];
    _hideout setVariable ["inCapture",true,true];
    if (_cP >= 1 || !alive player) exitWith {_hideout setVariable ["inCapture",false,true];};
    if (life_istazed) exitWith {_hideout setVariable ["inCapture",false,true];}; //Tazed
    if (life_interrupted) exitWith {_hideout setVariable ["inCapture",false,true];};
};

//Kill the UI display and check for various states
"progressBar" cutText ["","PLAIN"];
player playActionNow "stop";
if (!alive player || life_istazed) exitWith {life_action_inUse = false;_hideout setVariable ["inCapture",false,true];};
if (player getVariable ["Re-strained",false]) exitWith {life_action_inUse = false;_hideout setVariable ["inCapture",false,true];};
if (life_interrupted) exitWith {
	life_interrupted = false; 
	//t/itleText[localize "STR_GNOTF_CaptureCancel","PLAIN"]; 
	[localize "STR_GNOTF_CaptureCancel","RED",10] spawn life_fnc_notification_system;
	life_action_inUse = false;
	_hideout setVariable ["inCapture",false,true];
};
life_action_inUse = false;

//t/itleText[localize "STR_GNOTF_Captured","PLAIN"];
[localize "STR_GNOTF_CaptureCancel","RED",10] spawn life_fnc_notification_system;
private _flagTexture = [
        "\A3\Data_F\Flags\Flag_red_CO.paa",
        "\A3\Data_F\Flags\Flag_green_CO.paa",
        "\A3\Data_F\Flags\Flag_blue_CO.paa",
        "\A3\Data_F\Flags\Flag_white_CO.paa",
        "\A3\Data_F\Flags\flag_fd_red_CO.paa",
        "\A3\Data_F\Flags\flag_fd_green_CO.paa",
        "\A3\Data_F\Flags\flag_fd_blue_CO.paa",
        "\A3\Data_F\Flags\flag_fd_orange_CO.paa"
    ] call BIS_fnc_selectRandom;
_hideout setFlagTexture _flagTexture;
life_hideout_flag = [_hideout, _flagTexture];
publicVariable "life_hideout_flag";
//[[_hideout], "life_fnc_animate_hideout_flag", true, true] spawn life_fnc_MP;
[[[0,1],"STR_GNOTF_CaptureSuccess",true,[name player,(group player) getVariable "gang_name"]],"life_fnc_broadcast",true,false] spawn life_fnc_MP;
if (player distance (getMarkerPos "gang_area_1") < 50) then { 
	life_hideout_gang = (group player) getVariable ["gang_name",""];
	publicVariable "life_hideout_gang";
};
_hideout setVariable ["inCapture",false,true];
_hideout setVariable ["gangOwner",group player,true];
