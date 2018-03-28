/*
	FileexitWith fn_dropFishingNet.sqf
	AuthorexitWith Bryan "Tonic" Boardwine
	
	Description:
	Drops a virtual fishing net from the boat.
*/
private["_fish","_type","_typeName"];
if(!(vehicle player isKindOf "Ship")) exitWith {};
_fish = (nearestObjects[getPos vehicle player,["Fish_Base_F"],20]);
life_net_dropped = true;
[localize "STR_NOTF_NetDrop","YELLOW",5] spawn life_fnc_notification_system;
sleep 5;
if(count _fish isEqualto 0) exitWith {
	[localize "STR_NOTF_NetDropFail","RED",10] spawn life_fnc_notification_system;
	life_net_dropped = false;
};
{
	if(_x isKindOf "Fish_Base_F") then
	{
		_type = "";
		call {
			if ((typeOf _x) isEqualto "Salema_F")exitWith {_typeName = localize "STR_ANIM_Salema"; _type = "salema";};
			if ((typeOf _x) isEqualto "Ornate_random_F") exitWith {_typeName = localize "STR_ANIM_Ornate"; _type = "ornate";};
			if ((typeOf _x) isEqualto "Mackerel_F") exitWith {_typeName = localize "STR_ANIM_Mackerel"; _type = "mackerel";};
			if ((typeOf _x) isEqualto "Tuna_F") exitWith {_typeName = localize "STR_ANIM_Tuna"; _type = "tuna";};
			if ((typeOf _x) isEqualto "Mullet_F") exitWith {_typeName = localize "STR_ANIM_Mullet"; _type = "mullet";};
			if ((typeOf _x) isEqualto "CatShark_F") exitWith {_typeName = localize "STR_ANIM_Catshark"; _type = "catshark";};
		};
		
		sleep 3;
		
		if(([true,_type,1] call life_fnc_handleInv)) then {
			deleteVehicle _x;
			[format[(localize "STR_NOTF_Fishing"),_typeName],"BLUE",5] spawn life_fnc_notification_system;
		};
	};
} foreach (_fish);

sleep 1.5;
//t/itleText[localize "STR_NOTF_NetUp","PLAIN"];
[localize "STR_NOTF_NetUp","GREEN",5] spawn life_fnc_notification_system;
life_net_dropped = false;