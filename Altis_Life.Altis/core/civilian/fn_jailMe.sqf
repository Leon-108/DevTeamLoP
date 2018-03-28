#include "..\..\script_macros.hpp"
/*
	File: fn_jailMe.sqf
	Author Bryan "Tonic" Boardwine
	
	Description:
	Once word is received by the server the rest of the jail execution is completed.
*/
private["_ret","_bad","_time","_bail","_esc","_countDown","_time"];
params [
	["_ret",[],[[]]]
	,["_bad",false,[false]]
	,["_time",15,[0]] //##80
];

_time = time + (_time * 60); //x Minutes

if (count _ret > 0) then { life_bail_amount = (_ret select 3); } else { life_bail_amount = 20000; /*_time = time + (10 * 60); */};
_esc = false;
_bail = false;

if(_time <= 0) then { _time = time + (15 * 60); hintC "Please Report to Admin: JAIL_FALLBACK_15, time is zero!"; };

[_bad,_time] spawn {
    life_canpay_bail = false;
    if (_this select 0) then {
        sleep ( (_this select 1) * 0.5 );
    } else {
       sleep ( (_this select 1) * 0.2 );
    };
    life_canpay_bail = true;
};

for "_i" from 0 to 1 step 0 do {
    if ((round(_time - time)) > 0) then {
        _countDown = [(_time - time),"MM:SS"] call BIS_fnc_secondsToString;
        hintSilent parseText format [(localize "STR_Jail_Time")+ "<br/> <t size='2'><t color='#FF0000'>%1</t></t><br/><br/>" +(localize "STR_Jail_Pay")+ " %3<br/>" +(localize "STR_Jail_Price")+ " $%2",_countDown,[life_bail_amount] call life_fnc_numberText,if (life_canpay_bail) then {"Yes"} else {"No"}];
    };
    player forceWalk true;
    
    if(player distance (getMarkerPos "jail1_marker") > 180) exitWith
	{
		_esc = true;
	};

    if (life_bail_paid) exitWith {
        _bail = true;
    };

    if ((round(_time - time)) < 1) exitWith {hint ""};
    if (!alive player && ((round(_time - time)) > 0)) exitWith {};
    sleep 0.1;
};

switch (true) do
{
	case (_bail) :
	{
		life_is_arrested = false;
		life_bail_paid = false;
		//h/int localize "STR_Jail_Paid";
		[localize "STR_Jail_Paid","PINK",5] spawn life_fnc_notification_system;
		serv_wanted_remove = [player];
		player setPos (getMarkerPos "jail_release");
		[] call life_fnc_stripDown_Player;
		[] call life_fnc_civLoadout;
		[[getPlayerUID player],"life_fnc_wantedRemove",false,false] spawn life_fnc_MP;
		[5] call SOCK_fnc_updatePartial;
	};
	
	case (_esc) :
	{
		life_is_arrested = false;
		//h/int localize "STR_Jail_EscapeSelf";
		[localize "STR_Jail_EscapeSelf","PINK",5] spawn life_fnc_notification_system;
		[[0,format["%1 ist aus dem Gefängnis ausgebrochen!",profileName]],"life_fnc_broadcast",nil,false] spawn life_fnc_MP;
		[[getPlayerUID player,profileName,"901"],"life_fnc_wantedAdd",false,false] spawn life_fnc_MP;
		[5] call SOCK_fnc_updatePartial;
	};
	
	case (alive player && !_esc && !_bail) :
	{
		life_is_arrested = false;
		//h/int localize "STR_Jail_Released";
		[localize "STR_Jail_Released","PINK",5] spawn life_fnc_notification_system;
		[[getPlayerUID player],"life_fnc_wantedRemove",false,false] spawn life_fnc_MP;
		player setPos (getMarkerPos "jail_release");
		[] call life_fnc_stripDown_Player;
		[] call life_fnc_civLoadout;
		[5] call SOCK_fnc_updatePartial;
	};
};
player forceWalk false;