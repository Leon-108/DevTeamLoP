/*
	fn_setBuildings.sqf
	Author: moeck
*/
params["_data"];
{	if (_x select 0 isEqualTo "mil_dot") then {
		createMarkerLocal [(_x select 1), (_x select 2)];
		(_x select 1) setMarkerType "mil_dot";
		(_x select 1) setMarkerTextLocal (_x select 3);
		(_x select 1) setMarkerColorLocal (_x select 4);
	} else { 
		private _obj= (_x select 0)createVehicleLocal [0,0,0]; 
		_obj setPosWorld(_x select 1); 
		_obj setVectorDirAndUp (_x select 2);
		_obj enableSimulation(_x select 3); 
		_obj allowDamage(_x select 4); 
		if!((_x select 5) isEqualTo "")then{_obj call compile(_x select 5);}; 
		if!((_x select 6) isEqualTo "")then{_obj setVehicleVarName (_x select 6);};
	};
	nil; 
} count [_data];