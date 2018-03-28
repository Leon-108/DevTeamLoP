/*
	Author: Tobias 'Xetoxyc' Sittenauer

	File: fn_removeWeapons.sqf
*/

private["_cop"];
_exempt = [ "Binocular", "ItemWatch", "ItemCompass", "ItemGPS", "ItemMap", "NVGoggles", "FirstAidKit", "ToolKit", "Chemlight_red", "Chemlight_yellow", "Chemlight_green", "Chemlight_blue", "optic_ACO_grn_smg" ];
_cop = [_this,0,Objnull,[objNull]] call BIS_fnc_param;
if(_cop isEqualTo player) exitWith {}; //WTF?

if(isNull _cop) exitWith {}; //Error check?

{
    if (!(_x in _exempt)) then {
        player removeWeapon _x;
    };
} forEach weapons player;
{
    if (!(_x in _exempt)) then {
        player removeItemFromBackpack _x;
    };
} forEach backpackItems player;
{
    if (!(_x in _exempt)) then {
            player removeMagazine _x;
    };
} forEach magazines player;
{
    if (!(_x in _exempt)) then {
        player removeItemFromUniform _x;
    };
} forEach uniformItems player;

{
    if (!(_x in _exempt)) then {
        player removeItemFromVest _x;
    };
} forEach vestItems player;

[[0,format["%1's Waffen wurden von %2 beschlagnahmt!", name player, name _cop]],"life_fnc_broadcast",true,false] spawn life_fnc_MP;

