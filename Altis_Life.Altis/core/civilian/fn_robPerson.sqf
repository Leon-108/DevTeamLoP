#include "..\..\script_macros.hpp"
/*
	File: fn_robPerson.sqf
	Author: Bryan "Tonic" Boardwine
	
	Description:
	Getting tired of adding descriptions...
*/
private _robber = param [0];
if(isNull _robber) exitWith {}; //No one to return it to?

if(CASH > 0) then
{
	[[CASH],"life_fnc_robReceive",_robber,false] spawn life_fnc_MP;
	[[getPlayerUID _robber,_robber getVariable["realname",name _robber],"261B"],"life_fnc_wantedAdd",false,false] spawn life_fnc_MP;
	[[1,"STR_NOTF_Robbed",true,[_robber getVariable["realname",name _robber],profileName,[CASH] call life_fnc_numberText]],"life_fnc_broadcast",nil,false] spawn life_fnc_MP;
	[[player, _robber, CASH, 4, BANK, 0],"TON_fnc_handleDBLog",false] spawn life_fnc_MP; //By Nukefliege
	CASH = 0;
}
	else
{
	[[2,"STR_NOTF_RobFail",true,[profileName]],"life_fnc_broadcast",_robber,false] spawn life_fnc_MP;
};