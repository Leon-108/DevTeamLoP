/*
	File: setWeaponBench.sqf
	Author: moeck

*/

private _tentSpawnPosition = player modelToWorld[0,5,0];//player modelToWorld[0,5,0];
private _tentdir = 0;
player playMoveNow "AinvPknlMstpSnonWnonDnon_medic_1";
sleep 2;
	_tent = createVehicle ["CamoNet_BLUFOR_F", _tentSpawnPosition, [] ,0, "CAN_COLLIDE"];
	_tent setDir _tentDir;
	_tent setVectorUp (surfaceNormal _tentSpawnPosition);
	_tent enableSimulation false;
	_tent allowDamage false;
	_tent setDir (getDir player);
	_tent setpos (player modelToWorld[0,5,0]);
sleep 2;
	//Workbench 1
	_watertank1pos= _tent modelToWorld[-2.2,1.5,-1.8];
	_watertank1 = createvehicle ["Land_WaterTank_F", _watertank1pos, [] , 0, "CAN_COLLIDE"];
	_watertank1 setVectorDirAndUp [(vectorDir _tent),(vectorUp _tent)];
	_watertank1 attachTo [_tent];
	//_watertank1 addaction [localize ("STR_Process_Rifle"),life_fnc_processActionSingle,"rifle",0,false,false,"",' life_inv_waffenbody_p > 0 && life_inv_holz_p > 0 &&!life_is_processing && !life_action_inUse'];
sleep 2;
	_watertank2pos= _tent modelToWorld[2.2,1.5,-1.8];
	_watertank2 = createvehicle ["Land_WaterTank_F", _watertank2pos, [] , 0, "CAN_COLLIDE"];
	_watertank2 setVectorDirAndUp [(vectorDir _tent),(vectorUp _tent)];
	_watertank2 attachTo [_tent];
	_watertank2 enableSimulation false;
sleep 1;
player playMoveNow "AinvPknlMstpSnonWnonDnon_medic_1";
sleep 3;
	_tablepos = _tent modelToWorld[0,1.4,-1.6];
	_table = createvehicle ["Land_WoodenTable_small_F", _tablepos, [] , 0, "CAN_COLLIDE"];
	_table setVectorDirAndUp [(vectorDir _tent),(vectorUp _tent)];
	_table attachTo [_tent];
	_table enableSimulation false;
sleep 3;
	_eimerpos = _table modelToWorld[0,0,0.42];
	_eimer = createvehicle ["Land_Bucket_clean_F", _eimerpos, [] , 0, "CAN_COLLIDE"];
	_eimer setVectorDirAndUp [(vectorDir _tent),(vectorUp _tent)];
	_eimer attachTo [_table];
	_eimer enableSimulation false;
	_eimer addaction [localize ("STR_Process_Whiskey"),life_fnc_processActionSingle,"whiskey",0,false,false,"",' life_inv_getreide_u > 0 && life_inv_wasser_p > 0 &&!life_is_processing && !life_action_inUse'];

