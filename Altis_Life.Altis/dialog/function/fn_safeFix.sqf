/*
	I am so tired of writing this.
*/
private["_vault"];
_vault = _this select 0;
if(!(_vault getVariable["safe_open",false])) exitWith {
	//h/int localize "STR_Cop_VaultLocked"
	[localize "STR_Cop_VaultLocked","RED",10] spawn life_fnc_notification_system;
};

life_action_inUse = true;

//Setup the progress bar
disableSerialization;
_title = localize "STR_Cop_RepairVault";
5 cutRsc ["life_progress","PLAIN"];
_ui = uiNamespace getVariable "life_progress";
_progressBar = _ui displayCtrl 38201;
_titleTxt = _ui displayCtrl 38202;
_titleTxt ctrlSetText format["%2 (1%1)...","%",_title];
_progressBar progressSetPosition 0.01;
_cP = 0.01;

while {true} do
{
	if(animationState player != "AinvPknlMstpSnonWnonDnon_medic_1") then {
		[[player,"AinvPknlMstpSnonWnonDnon_medic_1"],"life_fnc_animSync",true,false] spawn life_fnc_MP;
		player playMoveNow "AinvPknlMstpSnonWnonDnon_medic_1";
	};
	sleep 0.26;
	if(isNull _ui) then {
		5 cutRsc ["life_progress","PLAIN"];
		_ui = uiNamespace getVariable "life_progress";
		_progressBar = _ui displayCtrl 38201;
		_titleTxt = _ui displayCtrl 38202;
	};
	_cP = _cP + .012;
	_progressBar progressSetPosition _cP;
	_titleTxt ctrlSetText format["%3 (%1%2)...",round(_cP * 100),"%",_title];
	if(_cP >= 1 OR !alive player) exitWith {};
	if(life_interrupted) exitWith {};
};

//Kill the UI display and check for various states
5 cutText ["","PLAIN"];
player playActionNow "stop";
if(!alive player) exitWith {life_action_inUse = false;};
if(life_interrupted) exitWith {
	life_interrupted = false; 
	//t/itleText[localize "STR_NOTF_ActionCancel","PLAIN"]; 
	[localize "STR_NOTF_ActionCancel","RED",10] spawn life_fnc_notification_system;
	life_action_inUse = false;
};

life_action_inUse = false;

_vault setVariable["safe_open",false,true];
//h/int localize "STR_Cop_VaultRepaired";
[localize "STR_Cop_VaultRepaired","GREEN",5] spawn life_fnc_notification_system;
[[0,"STR_Cop_VaultRepaired",true,[_unit getVariable["realname", name _unit], profileName]],"life_fnc_broadcast",civilian,false] spawn life_fnc_MP;
[[0,"STR_Cop_VaultRepaired",true,[_unit getVariable["realname", name _unit], profileName]],"life_fnc_broadcast",west,false] spawn life_fnc_MP;
[[0,"STR_Cop_VaultRepaired",true,[_unit getVariable["realname", name _unit], profileName]],"life_fnc_broadcast",independent,false] spawn life_fnc_MP;		