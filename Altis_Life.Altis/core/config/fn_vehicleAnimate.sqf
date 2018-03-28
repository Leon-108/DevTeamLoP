/*
	File: fn_vehicleAnimate.sqf
	Author: Bryan "Tonic" Boardwine
	
	Description:
	Pass what you want to be animated.
*/
private["_vehicle","_animate","_state"];
_vehicle = [_this,0,Objnull,[Objnull]] call BIS_fnc_param;
if(isnull _vehicle) exitwith {}; //FUCK
_animate = [_this,1,"",["",[]]] call BIS_fnc_param;
_preset = [_this,2,false,[false]] call BIS_fnc_param;
if(!_preset) then
{
	if(count _animate > 1) then
	{
		{
			_vehicle animate[_x select 0,_x select 1];
		} foreach _animate;
	}
		else
	{
		_vehicle animate[_animate select 0,_animate select 1];
	};
}
	else
{
	switch (_animate) do
	{
		case "civ_littlebird":
		{
			if (typeOf _vehicle isEqualTo "C_Heli_Light_01_civil_F") then {
				_vehicle animate ["addTread",0];
			};
			if (typeOf _vehicle isEqualTo "B_Heli_Light_01_F") then {
				_vehicle animate ["AddCargoHook_COver",0];
			};
			_vehicle lockCargo [2,true];
			_vehicle lockCargo [3,true];
			_vehicle lockCargo [4,true];
			_vehicle lockCargo [5,true];
		};
		case "service_truck":
		{
			//waitUntil{!isNil {_vehicle getVariable "color"}};
			_vehicle animate ["HideServices", 0];
			_vehicle animate ["HideDoor3", 1];
		};
		
		case "med_offroad":
		{
			if(typeOf _vehicle isEqualTo "C_Offroad_01_F") then {
				_vehicle animate ["HidePolice",0];
				_vehicle animate ["HideConstruction",0];
				_vehicle animate ["HideBumper2",0];
				_vehicle animate ["HideDoor3",1];
				_vehicle animate ["HideBumper1",1];
			};
			
			//_vehicle animate ["HidePolice", 0];
			_vehicle setVariable["lights",false,true];
		};
		
		case "cop_offroad":
		{
			if(typeOf _vehicle isEqualTo "C_Offroad_01_F") then {
				_vehicle animate ["HidePolice",0];
				_vehicle animate ["HideBumper1",0];
				_vehicle animate ["HideBumper2",1];
			};
			if(typeOf _vehicle isEqualTo "C_Van_02_transport_F") then {
				_vehicle animate ["lights_em_hide",0];
				_vehicle animate ["spare_tyre_holder_hide",0];
				_vehicle animate ["spare_tyre_hide",0];
				_vehicle animate ["LED_lights_hide",0];
				_vehicle animate ["side_protective_frame_hide",0];
				_vehicle animate ["front_protective_frame_hide",0];
				_vehicle animate ["led_lights_door4_hide",0];
				_vehicle animate ["led_lights_door5_hide",0];
				_vehicle animate ["lights_em_1_side_hide",0];
				_vehicle animate ["lights_em_2_side_hide",0];
				_vehicle animate ["lights_em_1_door5_hide",0];
				_vehicle animate ["lights_em_2_door4_hide",0];
				_vehicle animate ["beacon_front_hide",1];
				_vehicle animate ["beacon_rear_hide",1];
				_vehicle animate ["lights_em_1_roof_front_hide",1];
				_vehicle animate ["lights_em_2_roof_front_hide",1];
				_vehicle animate ["lights_em_1_roof_rear_hide",1];
				_vehicle animate ["lights_em_2_roof_rear_hide",1];
				_vehicle setObjectMaterialGlobal [3,"\a3\Data_f\Lights\Car_Beacon_Blue_emit.rvmat"]; //Blau
			};
			_vehicle setVariable["lights",false,true];
		};
	};
};