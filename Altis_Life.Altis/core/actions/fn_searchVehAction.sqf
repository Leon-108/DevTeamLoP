/*
	File: fn_searchVehAction.sqf
*/
private["_vehicle","_data"];
_vehicle = cursorTarget;
if((_vehicle isKindOf "Car") || !(_vehicle isKindOf "Air") || !(_vehicle isKindOf "Ship")) then
{
	_owners = _vehicle getVariable "vehicle_info_owners";
	if(isNil {_owners}) exitWith {};
	life_action_inUse = true;
	//h/int localize "STR_NOTF_Searching";
	[localize "STR_NOTF_Searching","YELLOW",5] spawn life_fnc_notification_system;
	sleep 3;
	life_action_inUse = false;
	if(player distance _vehicle > 10 || !alive player || !alive _vehicle) exitWith {
		//h/int localize "STR_NOTF_SearchVehFail";
		[localize "STR_NOTF_SearchVehFail","RED",10] spawn life_fnc_notification_system;
	};
	//_inventory = [(_vehicle getVariable "vehicle_info_inv")] call fnc_veh_inv;
	//if(isNil {_inventory}) then {_inventory = "Nothing in storage."};
	_owners = [_owners] call life_fnc_vehicleOwners;
	
	if(_owners isEqualTo "any<br/>") then
	{
		_owners = "No owners, impound it<br/>";
	};
	//h/int parseText format[localize "STR_NOTF_SearchVeh",_owners];
	[parseText format[localize "STR_NOTF_SearchVeh",_owners],"GREEN",5] spawn life_fnc_notification_system;
};