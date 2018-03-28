#include "..\..\script_macros.hpp"
/*
	File: fn_p_openMenu.sqf
	Author: Bryan "Tonic" Boardwine
	
	Description:
	Opens the players virtual inventory menu
*/
if(!alive player || dialog) exitWith {}; //Prevent them from opening this for exploits while dead.
createDialog "playerSettings";
disableSerialization;

switch(playerSide) do
{
	case west: 
	{
		ctrlShow[2011,false];
		ctrlShow[9801,false];
		ctrlShow[2090,false];
	};
	
	case independent:  
	{
		ctrlShow[2011,false];
		ctrlShow[2012,false];
		ctrlShow[9900,false];
		ctrlShow[9800,false];
		ctrlShow[9801,false];
		ctrlShow[2090,false];
	}; 
	
	case civilian:
	{
		ctrlShow[2012,false];
		ctrlShow[9900,false];
		ctrlShow[9800,false];
		
	};
};
if (player getVariable["Re-strained",FALSE]) then {
	ctrlEnable[2011,false];
	ctrlEnable[2014,false];
};
if (!((player getVariable ["admin",0]) isEqualTo 0)) then {
	ctrlEnable[2011,false];
};
ctrlShow[2091,false];
if ((license_civ_bhg) && (name player select [1,3] isEqualTo "BHG")) then {
		ctrlShow[2091,true];
};


if(__GETC__(life_adminlevel) < 1) then
{
	ctrlShow[2020,false];
	ctrlShow[2021,false];
};

[] call life_fnc_p_updateMenu;

if(__GETC__(life_adminlevel) < 1) then
{
	ctrlShow[2020,false];
	ctrlShow[2021,false];
};
