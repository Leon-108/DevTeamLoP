/*
	File: fn_clearVehicleAmmo.sqf
	Author: Bryan "Tonic" Boardwine
	
	Description:
	Clears the vehicle of ammo types that we don't want.
*/
private["_vehicle","_veh"];
_vehicle = [_this,0,Objnull,[Objnull]] call BIS_fnc_param;
if(isNull _vehicle) exitWith {}; //DAFUQ
_veh = typeOf _vehicle;
/*
if(_veh isEqualTo "B_Boat_Armed_01_minigun_F") then
{
	_vehicle removeMagazinesTurret ["200Rnd_40mm_G_belt",[0]];
};
*/
if(_veh isEqualTo "B_APC_Wheeled_01_cannon_F") then 
{
	_vehicle removeMagazinesTurret ["60Rnd_40mm_GPR_Tracer_Red_shells",[0]];
	_vehicle removeMagazinesTurret ["40Rnd_40mm_APFSDS_Tracer_Red_shells",[0]];
};
if(_veh isEqualTo "O_Heli_Attack_02_black_F") then 
{
	_vehicle removeMagazinesTurret ["250Rnd_30mm_APDS_shells",[0]];
	_vehicle removeMagazinesTurret ["8Rnd_LG_scalpel",[0]];
	_vehicle removeMagazinesTurret ["38Rnd_80mm_rockets",[0]];
};


if(_veh isEqualTo "B_Heli_Transport_01_F") then 
{
	_vehicle removeMagazinesTurret ["2000Rnd_65x39_Belt_Tracer_Red",[1]];
	_vehicle removeMagazinesTurret ["2000Rnd_65x39_Belt_Tracer_Red",[2]];
};

if(_veh isEqualTo "O_Plane_CAS_02_F") then
{
	_vehicle removeMagazinesTurret ["500Rnd_Cannon_30mm_Plane_CAS_02_F",[-1]];
	_vehicle removeMagazinesTurret ["2Rnd_Missile_AA_03_F",[-1]];
	_vehicle removeMagazinesTurret ["4Rnd_Missile_AGM_01_F",[-1]];
	_vehicle removeMagazinesTurret ["2Rnd_Bomb_03_F",[-1]];
	_vehicle removeMagazinesTurret ["20Rnd_Rocket_03_HE_F",[-1]];
	_vehicle removeMagazinesTurret ["20Rnd_Rocket_03_AP_F",[-1]];
//	_vehicle removeMagazinesTurret ["120Rnd_CMFlare_Chaff_Magazine",[-1]];
};
if(_veh isEqualTo "I_Heli_light_03_dynamicLoadout_F") then
{
	{_vehicle removeWeapon _x} forEach weapons _vehicle;
    {_vehicle removeMagazine _x} forEach magazines _vehicle;
};
if (_veh isEqualTo "O_T_VTOL_02_infantry_F") then
{
  //Y-32 Infantry
  {_vehicle removeWeapon _x} forEach weapons _vehicle;
  {_vehicle removeMagazine _x} forEach magazines _vehicle;
};
if (_veh isEqualTo "O_T_VTOL_02_vehicle_F") then
{
  //Y-32 Vehicle
  {_vehicle removeWeapon _x} forEach weapons _vehicle;
  {_vehicle removeMagazine _x} forEach magazines _vehicle;
};
if (_veh isEqualTo "B_Plane_Fighter_01_Stealth_F") then
{
  //Black Wasp
  {_vehicle removeWeapon _x} forEach weapons _vehicle;
  {_vehicle removeMagazine _x} forEach magazines _vehicle;
};






clearWeaponCargoGlobal _vehicle;
clearMagazineCargoGlobal _vehicle;
clearItemCargoGlobal _vehicle;