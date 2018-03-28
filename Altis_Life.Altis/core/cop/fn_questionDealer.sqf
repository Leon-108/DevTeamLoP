/*
	File: fn_questionDealer.sqf
	Author: Bryan "Tonic" Boardwine
	modified by moeck (Lost of Paradise)
	
	Description:
	Questions the drug dealer and sets the sellers wanted.
*/
private["_sellers","_names","_players","_val"];
_sellers = (_this select 0) getVariable["sellers",[]];
if(count _sellers isEqualTo 0) exitWith {
	//h/int localize "STR_Cop_DealerQuestion"
	[localize "STR_Cop_DealerQuestion","YELLOW",5] spawn life_fnc_notification_system;
}; //No data.
life_action_inUse = true;
_names = "";
_players =[];
_val = 200000;
{ _players pushBackUnique (getPlayerUID _x); } forEach allPlayers;
{
	if(_x select 2 > 1) then
	{
		if (_x select 0 in _players) then {
			[[_x select 0,_x select 1,"483",_val],"life_fnc_wantedAdd",false,false] spawn life_fnc_MP;
		};
	};
	
	_names = _names + format["%1<br/>",_x select 1];
} foreach _sellers;

//h/int parseText format[(localize "STR_Cop_DealerMSG")+ "<br/><br/>%1",_names];
[parseText format[(localize "STR_Cop_DealerMSG")+ "<br/><br/>%1",_names],"GREEN",15] spawn life_fnc_notification_system;
(_this select 0) setVariable["sellers",[],true];
life_action_inUse = false;