#include "..\..\script_macros.hpp"
/*
    File:
    Author: Bryan "Tonic" Boardwine
   
    Description:
    Master configuration list / array for buyable vehicles & prices and their shop.
*/
private["_shop","_return"];
_shop = [_this,0,"",[""]] call BIS_fnc_param;
_ownedDLCs = getDLCs 1;
if(_shop isEqualto "") exitWith {[]};
_return = [];
switch (_shop) do
{
    case "donator1_car":
    {
        if(license_civ_donator1) then
        {
			if(288520 in _ownedDLCs) then //Kart DLC
			{
				_return set[count _return,
				["C_Kart_01_F",250000]];
			};
			
            _return set[count _return,
            ["B_Quadbike_01_F",13000]];
            _return set[count _return,
            ["C_Hatchback_01_F",16000]];
			_return set[count _return,
			["C_Offroad_01_F",20000]];
			_return set[count _return,
            ["B_G_Offroad_01_F",20000]];
			if(395180 in _ownedDLCs) then //APEX
			{
				_return set[count _return,
				["C_Offroad_02_unarmed_F",30000]];
				_return set[count _return,
				["B_CTRG_LSV_01_light_F",100000]];
				_return set[count _return,
				["B_T_LSV_01_unarmed_F",100000]];
				_return set[count _return,
				["O_T_LSV_02_unarmed_F",110000]];
			};
						
            _return set[count _return,
            ["C_SUV_01_F",35000]];
            _return set[count _return,
            ["C_Hatchback_01_sport_F",400000]];
            _return set[count _return,
            ["C_Van_01_transport_F",40000]];
            _return set[count _return,
            ["C_Van_01_box_F",60000]];
			if(571710 in _ownedDLCs) then // LAWS
			{
				_return set[count _return,
				["C_Van_02_transport_F",60000]];
				_return set[count _return,
				["C_Van_02_vehicle_F",166666]];
			};
		}
        else
        {
            //h/int "Du bist kein Donator!";
			["Du bist kein Donator!","RED",10] spawn life_fnc_notification_system;
        };
    };
	
	case "donator1_truck":
    {
        if(license_civ_donator1) then
        {
			_return set[count _return,
            ["I_Truck_02_transport_F",175000]];
            _return set[count _return,
            ["I_Truck_02_fuel_F",190000]];
            _return set[count _return,
            ["I_Truck_02_covered_F",200000]];
            _return set[count _return,
            ["B_Truck_01_transport_F",350000]];
            _return set[count _return,
            ["B_Truck_01_covered_F",500000]];
            _return set[count _return,
            ["O_Truck_03_transport_F",700000]];
            _return set[count _return,
            ["B_Truck_01_box_F",1400000]];
            _return set[count _return,
            ["B_Truck_01_ammo_F",1500000]];
            _return set[count _return,
            ["O_Truck_03_fuel_F",2000000]];
            _return set[count _return,
            ["O_Truck_03_covered_F",3500000]];
            _return set[count _return,
            ["O_Truck_03_repair_F",3600000]];
            _return set[count _return,
            ["B_Truck_01_fuel_F",3700000]];
            _return set[count _return,
            ["B_MRAP_01_F",7000000]];
            _return set[count _return,
            ["O_Truck_03_device_F",40000000]];
            _return set[count _return,
            ["O_MRAP_02_F",4200000]];
            _return set[count _return,
            ["I_MRAP_03_F",6400000]];
		}
        else
        {
            //h/int "Du bist kein Donator!";
			["Du bist kein Donator!","RED",10] spawn life_fnc_notification_system;
        };
    };
	
	case "donator1_air":
    {
        if(license_civ_donator1) then
        {
            _return set[count _return,
            ["B_Heli_Light_01_F",600000]];			
            _return set[count _return,
            ["C_Heli_Light_01_civil_F",600000]];
            _return set[count _return,
            ["O_Heli_Light_02_unarmed_F",1500000]];
            _return set[count _return,
            ["I_Heli_Transport_02_F",2700000]];
            _return set[count _return,
            ["I_Heli_light_03_unarmed_F",3500000]];
			
			if(304380 in _ownedDLCs) then // Heli DLC
			{
				_return set[count _return,
				["B_Heli_Transport_03_unarmed_F",3350000]];
				_return set[count _return,
				["O_Heli_Transport_04_fuel_F",3800000]];
				_return set[count _return,
				["O_Heli_Transport_04_box_F",3600000]];
				_return set[count _return,
				["O_Heli_Transport_04_bench_F",4000000]];
			};
			
			if(395180 in _ownedDLCs) then //APEX
			{
				_return set[count _return,
				["C_Plane_Civil_01_F",2000000]];
				_return set[count _return,
				["C_Plane_Civil_01_racing_F",2000000]];
				_return set[count _return,
				["B_T_VTOL_01_infantry_F",5000000]];
				_return set[count _return,
				["B_T_VTOL_01_vehicle_F",6666666]];
				_return set[count _return,
				["O_T_VTOL_02_infantry_F",52000000]];
			};
				
			_return set[count _return,
            ["O_Plane_CAS_02_F",46666666]];
			if(601670 in _ownedDLCs) then
			{
				_return set[count _return,
				["B_Plane_Fighter_01_Stealth_F",93333333]];
			};
		}
        else
        {
            //h/int "Du bist kein Donator!";
			["Du bist kein Donator!","RED",10] spawn life_fnc_notification_system;
        };
    };

 case "kart_shop":
    {
        if(license_civ_driver) then
        {
			if(288520 in _ownedDLCs) then
			{
				_return set[count _return,
				["C_Kart_01_F",250000]];
			};
        };
    };
   
    case "med_shop":
    {
		_return set[count _return,
		["B_Quadbike_01_F",3000]];		
		_return set[count _return,
		["C_Offroad_01_F",10000]];
		_return set[count _return,
		["C_Offroad_01_repair_F",10000]];
		
		if(__GETC__(life_mediclevel) > 1) then
		{
			_return set[count _return,
			["C_SUV_01_F",35000]];
			
			if(571710 in _ownedDLCs) then // LAWS
			{
				_return set[count _return,
				["C_Van_02_medevac_F",25000]];
				_return set[count _return,
                ["C_Van_02_service_F",25000]];
			};
			
			_return set[count _return,
			["B_Truck_01_covered_F",50000]];
		};
		
		if(__GETC__(life_mediclevel) > 2) then
		{
			_return set[count _return,
			
			["C_Hatchback_01_sport_F",10000]];
		};
		
		if(__GETC__(life_mediclevel) > 3) then
		{
			_return set[count _return,
			["B_MRAP_01_F",50000]];
		};
    };
   
    case "med_air_hs": 
	{
		_return set[count _return,
		["B_Heli_Light_01_F",75000]];
		
		if(__GETC__(life_mediclevel) > 1) then
		{
			_return set[count _return,
			["I_Heli_light_03_unarmed_F",100000]];
		};
		
		if(__GETC__(life_mediclevel) > 2) then
		{
			_return set[count _return,
			["I_Heli_Transport_02_F",125000]];
		};
		
		if(__GETC__(life_mediclevel) > 4) then
		{
			if(304380 in _ownedDLCs) then // Heli DLC
			{
				_return set[count _return,
				["B_Heli_Transport_03_unarmed_F",125000]];
				_return set[count _return,
				["O_Heli_Transport_04_F",125000]];
			};
		};
	};
   
    case "civ_car":
    {
		_return set[count _return,
		["B_Quadbike_01_F",13000]];
        if(license_civ_driver) then
        {
			_return set[count _return,
            ["C_Hatchback_01_F",16000]];
            _return set[count _return,
            ["C_Offroad_01_F",20000]];
			
			if(395180 in _ownedDLCs) then //APEX
			{
				_return set[count _return,
				["C_Offroad_02_unarmed_F",30000]];
				_return set[count _return,
				["B_CTRG_LSV_01_light_F",100000]];
				_return set[count _return,
				["B_T_LSV_01_unarmed_F",100000]];
				_return set[count _return,
				["O_T_LSV_02_unarmed_F",110000]];
			};
			_return set[count _return,
            ["C_SUV_01_F",35000]];
            _return set[count _return,
            ["C_Hatchback_01_sport_F",400000]];
            _return set[count _return,
            ["C_Van_01_transport_F",40000]];
            _return set[count _return,
            ["C_Van_01_box_F",60000]];
			if(571710 in _ownedDLCs) then // LAWS
			{
				_return set[count _return,
				["C_Van_02_transport_F",60000]];
				_return set[count _return,
				["C_Van_02_vehicle_F",166666]];
			};
        }
        else
        {
            //h/int "Du hast keinen Führerschein!";
			["Du hast keinen Führerschein!","RED",10] spawn life_fnc_notification_system;
        };
    };
   
    case "civ_truck":
    {
        if(license_civ_truck) then
        {
            _return set[count _return,
            ["I_Truck_02_transport_F",175000]];
            _return set[count _return,
            ["I_Truck_02_fuel_F",190000]];
            _return set[count _return,
            ["I_Truck_02_covered_F",200000]];
            _return set[count _return,
            ["B_Truck_01_transport_F",350000]];
            _return set[count _return,
            ["B_Truck_01_covered_F",500000]];
            _return set[count _return,
            ["O_Truck_03_transport_F",700000]];
            _return set[count _return,
            ["B_Truck_01_box_F",1400000]];
            _return set[count _return,
            ["B_Truck_01_ammo_F",1500000]];
            _return set[count _return,
            ["O_Truck_03_fuel_F",2000000]];
            _return set[count _return,
            ["O_Truck_03_covered_F",3500000]];
            _return set[count _return,
            ["O_Truck_03_repair_F",3600000]];
            _return set[count _return,
            ["B_Truck_01_fuel_F",3700000]];
            _return set[count _return,
            ["B_MRAP_01_F",7000000]];
            _return set[count _return,
            ["O_Truck_03_device_F",40000000]];
        }
        else
        {
            //h/int "Du hast keinen Führerschein!";
			["Du hast keinen Führerschein!","RED",10] spawn life_fnc_notification_system;
        };
    };
   
    case "reb_car":
    {
        if(license_civ_rebel) then
        {
            _return set[count _return,
            ["B_Quadbike_01_F",13000]];
            _return set[count _return,
            ["B_G_Offroad_01_F",20000]];
			
			if(395180 in _ownedDLCs) then
			{
				_return set[count _return,
				["B_CTRG_LSV_01_light_F",100000]];
				_return set[count _return,
				["B_T_LSV_01_unarmed_F",100000]];
				_return set[count _return,
				["O_T_LSV_02_unarmed_F",110000]];
			};
			if(571710 in _ownedDLCs) then // LAWS
			{
				_return set[count _return,
				["C_Van_02_transport_F",60000]];
				_return set[count _return,
				["C_Van_02_vehicle_F",166666]];
			};
			_return set[count _return,
            ["B_Heli_Light_01_F",750000]];
			
			if(304380 in _ownedDLCs) then
			{
				_return set[count _return,
				["O_Heli_Transport_04_bench_F",4000000]];
			};
			
        //  _return set[count _return,
        //  ["B_G_Offroad_01_armed_F",850000]];
        };
    };

	case "reb_car1":
    {
        if(license_civ_rebel2) then
        {
            _return set[count _return,
            ["O_MRAP_02_F",4200000]];
            _return set[count _return,
            ["I_MRAP_03_F",6400000]];
	    };
    };
   
    case "presse_car_shop":
    {
        if(license_civ_presse) then
        {
            _return set[count _return,
            ["C_SUV_01_F",35000]];
        };
    };

    case "admin1_car":
    {
        if(license_civ_admin1) then
        {
			if(288520 in _ownedDLCs) then
			{
				_return set[count _return,
				["C_Kart_01_F",100]];
			};
			
            _return set[count _return,
            ["B_Quadbike_01_F",100]];
            _return set[count _return,
            ["C_Hatchback_01_F",100]];
            _return set[count _return,
            ["C_Offroad_01_F",100]];
			
			if(395180 in _ownedDLCs) then
			{
				_return set[count _return,
				["C_Offroad_02_unarmed_F",100]];
				_return set[count _return,
				["B_T_LSV_01_unarmed_F",100]];
				_return set[count _return,
				["O_T_LSV_02_unarmed_F",100]];
			};
				
            _return set[count _return,
            ["C_SUV_01_F",100]];
            _return set[count _return,
            ["C_Hatchback_01_sport_F",100]];
            _return set[count _return,
            ["C_Van_01_transport_F",100]];
            _return set[count _return,
            ["C_Van_01_box_F",100]];
			_return set[count _return,
            ["C_Van_01_fuel_F",100]];
			if(571710 in _ownedDLCs) then // LAWS
			{
				_return set[count _return,
				["C_Van_02_transport_F",60000]];
				_return set[count _return,
				["C_Van_02_vehicle_F",166666]];
			};
			_return set[count _return,
            ["I_Truck_02_transport_F",100]];
            _return set[count _return,
            ["I_Truck_02_fuel_F",100]];
            _return set[count _return,
            ["I_Truck_02_covered_F",100]];
            _return set[count _return,
            ["B_Truck_01_transport_F",100]];
            _return set[count _return,
            ["B_Truck_01_covered_F",100]];
            _return set[count _return,
            ["O_Truck_03_transport_F",100]];
            _return set[count _return,
            ["B_Truck_01_box_F",100]];
            _return set[count _return,
            ["B_Truck_01_ammo_F",100]];
            _return set[count _return,
            ["O_Truck_03_fuel_F",100]];
            _return set[count _return,
            ["O_Truck_03_covered_F",100]];
            _return set[count _return,
            ["O_Truck_03_repair_F",100]];
            _return set[count _return,
            ["B_Truck_01_fuel_F",100]];
            _return set[count _return,
            ["B_MRAP_01_F",100]];
            _return set[count _return,
            ["O_Truck_03_device_F",100]];
			_return set[count _return,
            ["B_G_Offroad_01_F",100]];
			_return set[count _return,
            ["O_MRAP_02_F",100]];
            _return set[count _return,
            ["I_MRAP_03_F",100]];
            _return set[count _return,
            ["B_Heli_Light_01_F",100]];			
            _return set[count _return,
            ["C_Heli_Light_01_civil_F",100]];
            _return set[count _return,
            ["O_Heli_Light_02_unarmed_F",100]];
            _return set[count _return,
            ["I_Heli_Transport_02_F",100]];
            _return set[count _return,
            ["I_Heli_light_03_unarmed_F",100]];
			
			if(304380 in _ownedDLCs) then
			{
				_return set[count _return,
				["B_Heli_Transport_03_unarmed_F",100]];
				_return set[count _return,
				["O_Heli_Transport_04_fuel_F",100]];
				_return set[count _return,
				["O_Heli_Transport_04_box_F",100]];
				_return set[count _return,
				["O_Heli_Transport_04_bench_F",100]];
			};
			
			if(395180 in _ownedDLCs) then
			{
				_return set[count _return,
				["C_Plane_Civil_01_F",100]];
				_return set[count _return,
				["C_Plane_Civil_01_racing_F",100]];
				_return set[count _return,
				["B_T_VTOL_01_infantry_F",100]];
				_return set[count _return,
				["B_T_VTOL_01_vehicle_F",100]];
				_return set[count _return,
				["O_T_VTOL_02_infantry_F",100]];
			};
			
            _return set[count _return,
            ["O_Plane_CAS_02_F",100]];
			_return set[count _return,
            ["I_Plane_Fighter_04_F",100]];
			_return set[count _return,
            ["O_Plane_Fighter_02_Stealth_F",100]];
			_return set[count _return,
            ["O_Plane_Fighter_02_F",100]];
			_return set[count _return,
            ["B_Plane_Fighter_01_F",100]];
			_return set[count _return,
            ["B_Plane_Fighter_01_Stealth_F",100]];
			_return set[count _return,
            ["O_Truck_03_ammo_F",100]];
            _return set[count _return,
            ["B_APC_Tracked_01_CRV_F",100]];
            _return set[count _return,
            ["O_APC_Tracked_02_cannon_F",100]];
            _return set[count _return,
			["B_MBT_01_cannon_F",100]];
            _return set[count _return,
            ["B_APC_Wheeled_01_cannon_F",100]];
            _return set[count _return,
            ["B_MBT_01_TUSK_F",100]];
            _return set[count _return,
            ["I_APC_Wheeled_03_cannon_F",100]];
            _return set[count _return,
            ["B_MRAP_01_hmg_F",100]];
            _return set[count _return,
            ["O_MRAP_02_hmg_F",100]];
            _return set[count _return,
            ["I_MRAP_03_hmg_F",100]];
            _return set[count _return,
            ["I_MBT_03_cannon_F",100]];
            _return set[count _return,
            ["B_MBT_01_arty_F",100]];
            _return set[count _return,
            ["O_MBT_02_arty_F",100]];
            _return set[count _return,
            ["O_MBT_02_cannon_F",100]];
            _return set[count _return,
            ["B_MBT_01_mlrs_F",100]];
			_return set[count _return,
            ["B_Heli_Transport_01_F",100]];
			_return set[count _return,
            ["O_Heli_Attack_02_black_F",100]];
			_return set[count _return,
            ["B_Heli_Attack_01_F",100]];
			_return set[count _return,
            ["B_Heli_Light_01_armed_F",100]];
			_return set[count _return,
            ["I_Heli_light_03_F",100]];
			
			if(304380 in _ownedDLCs) then
			{
				_return set[count _return,
				["B_Heli_Transport_03_F",100]];
			};
			_return set[count _return,
            ["O_APC_Wheeled_02_rcws_F",100]];
			_return set[count _return,
            ["I_MBT_03_cannon_F",100]];
        };
    };
 
    case "dm_car":
    {
        if(license_civ_dm) then
        {
			if(304380 in _ownedDLCs) then
			{
				_return set[count _return,
				["O_Heli_Transport_04_bench_F",4000000]];
			};
			
            _return set[count _return,
            ["B_MRAP_01_F",7000000]];
            _return set[count _return,
            ["I_Heli_light_03_unarmed_F",3500000]];
			_return set[count _return,
            ["O_Truck_03_device_F",40000000]];
        };
    };
	
    case "evers_car":
    {
        if(license_civ_evers) then
        {
            _return set[count _return,
            ["B_MRAP_01_F",7000000]];
            _return set[count _return,
            ["I_MRAP_03_F",6400000]];
        };
    }; 
   
    case "ssg_car":
    {
        if(license_civ_ssg) then
        {
            _return set[count _return,
            ["B_MRAP_01_F",7000000]];
            _return set[count _return,
            ["C_SUV_01_F",35000]];
            _return set[count _return,
            ["I_Heli_light_03_unarmed_F",3500000]];
            _return set[count _return,
            ["B_Truck_01_covered_F",500000]];
            _return set[count _return,
            ["B_Heli_Light_01_F",600000]];
        };
    };
	
    case "pa_car":
    {
        if(license_civ_pa) then
        {
            _return set[count _return,
            ["B_Heli_Light_01_F",600000]];
            _return set[count _return,
            ["B_MRAP_01_F",7000000]];
            _return set[count _return,
            ["I_MRAP_03_F",6400000]];
            
        };
    };
   
 /*       case "x_car":
    {
        if(license_civ_x) then
        {
            _return set[count _return,
            ["I_MRAP_03_F",6400000]];
            _return set[count _return,
            ["B_MRAP_01_F",7000000]];
        };
    };*/
   
        case "k_car":
    {
        if(license_civ_kartell) then
        {
        //  _return set[count _return,
        //  ["I_Heli_light_03_unarmed_F",3500000]];
           _return set[count _return,
            ["B_Heli_Light_01_F",600000]];
           if(395180 in _ownedDLCs) then { 
				_return set[count _return,
				["O_T_LSV_02_unarmed_F",110000]];
			};
			_return set[count _return,
            ["B_MRAP_01_F",7000000]];
            _return set[count _return,
            ["I_MRAP_03_F",6400000]];
        };
    }; 
   
    case "cop_car":
    {
        _return set[count _return,
        ["C_SUV_01_F",15000]];
        _return set[count _return,
		["C_Offroad_01_F",7500]];
        if(__GETC__(life_coplevel) > 1) then
        {
			if(288520 in _ownedDLCs) then
			{
				_return set[count _return,
				["C_Kart_01_Blu_F",25000]];
			};
			
            _return set[count _return,
            ["C_Hatchback_01_sport_F",25000]];
            _return set[count _return,
            ["B_Truck_01_covered_F",140000]];

			
			if(395180 in _ownedDLCs) then
			{
				_return set[count _return,
				["B_T_LSV_01_unarmed_F",100000]];
				_return set[count _return,
				["O_T_LSV_02_unarmed_F",100000]];
				_return set [count _return,
				["C_Offroad_02_unarmed_F",20000]];
			};
			if(571710 in _ownedDLCs) then // LAWS
			{
				_return set[count _return,
				["C_Van_02_transport_F",60000]];
			};
        };
       
		if(__GETC__(life_coplevel) > 2 || license_cop_swatazubi || license_cop_swat) then
        {
            _return set[count _return,
            ["B_MRAP_01_F",140000]];
        };
	   
	    if(__GETC__(life_coplevel) > 3 || license_cop_swatazubi || license_cop_swat) then
        {
            _return set[count _return,
            ["I_MRAP_03_F",200000]];
			_return set[count _return,
            ["O_MRAP_02_F",200000]];
        };
       
        /*if(__GETC__(life_coplevel) > 6) then
        {
        //  _return set[count _return,
        //  ["I_MRAP_03_hmg_F",275000]];
            _return set[count _return,
            ["O_MRAP_02_F",200000]];
        };*/
		
		if(license_cop_swat || __GETC__(life_coplevel) > 4) then
		{
			_return set[count _return,
			["I_Truck_02_covered_F",100000]];
			_return set[count _return,
			["B_Truck_01_box_F",140000]];
		};

    };
   
    case "civ_air":
    {
        if(license_civ_air) then
        {
            _return set[count _return,
            ["B_Heli_Light_01_F",600000]];
            _return set[count _return,
            ["C_Heli_Light_01_civil_F",600000]];
            _return set[count _return,
            ["O_Heli_Light_02_unarmed_F",1500000]];
            _return set[count _return,
            ["I_Heli_Transport_02_F",2700000]];
            _return set[count _return,
            ["I_Heli_light_03_unarmed_F",3500000]];
			
			if(304380 in _ownedDLCs) then
			{
				_return set[count _return,
				["B_Heli_Transport_03_unarmed_F",3350000]];
				_return set[count _return,
				["O_Heli_Transport_04_fuel_F",3800000]];
				_return set[count _return,
				["O_Heli_Transport_04_box_F",3600000]];
			};
			
			if(395180 in _ownedDLCs) then
			{
				_return set[count _return,
				["C_Plane_Civil_01_F",2000000]];
				_return set[count _return,
				["C_Plane_civil_01_racing_F",2000000]];
				_return set[count _return,
				["B_T_VTOL_01_infantry_F",5000000]];
				_return set[count _return,
				["B_T_VTOL_01_vehicle_F",6666666]];
				_return set[count _return,
				["O_T_VTOL_02_infantry_F",52000000]];
			};
			
            _return set[count _return,
            ["O_Plane_CAS_02_F",46666666]];
			
			if(601670 in _ownedDLCs) then
			{
				_return set[count _return,
				["B_Plane_Fighter_01_Stealth_F",93333333]];
			};
        };
    };
   
    case "cop_air":
    {
        if(__GETC__(life_coplevel) > 1) then
        {
            _return set[count _return,
            ["B_Heli_Light_01_F",100000]];
        };
        if(__GETC__(life_coplevel) > 2 || license_cop_swatazubi || license_cop_swat) then
        {
            _return set[count _return,
            ["I_Heli_light_03_unarmed_F",160000]];
        };
		if(__GETC__(life_coplevel) > 3 || license_cop_swatazubi || license_cop_swat) then
        {
			if(304380 in _ownedDLCs) then
			{
				_return set[count _return,
				["B_Heli_Transport_03_unarmed_F",200000]];
			};
        };
		if(__GETC__(life_coplevel) > 5 || license_cop_swatazubi || license_cop_swat) then
        {
			if(395180 in _ownedDLCs) then
			{
				_return set[count _return,
				["B_T_VTOL_01_infantry_F",250000]];
				_return set[count _return,
				["B_T_VTOL_01_vehicle_F",250000]];
			};
        };
        if(__GETC__(life_coplevel) > 6 || license_cop_swatazubi || license_cop_swat) then
        {
			if(304380 in _ownedDLCs) then
			{
				_return set[count _return,
				["O_Heli_Transport_04_bench_F",200000]];
			};
        };
    };
   
    case "civ_ship":
    {
        if(license_civ_boat) then
        {
            _return set[count _return,
            ["C_Rubberboat",4500]];
            _return set[count _return,
            ["C_Boat_Civil_01_F",150000]];
            _return set[count _return,
            ["B_SDV_01_F",70000]];
            _return set[count _return,
            ["I_C_Boat_Transport_02_F",150000]];
            _return set[count _return,
            ["C_Scooter_Transport_01_F",50000]];
        };
    };
 
    case "cop_ship":
    {
        _return set[count _return,
        ["B_Boat_Transport_01_F",300]];
        _return set[count _return,
        ["C_Boat_Civil_01_police_F",20000]];
        _return set[count _return,
        ["I_C_Boat_Transport_02_F",20000]];
        _return set[count _return,
        ["C_Scooter_Transport_01_F",5000]];
       
        if(__GETC__(life_coplevel) > 2 || license_cop_swatazubi || license_cop_swat) then
        {
            _return set[count _return,
            ["O_Boat_Armed_01_hmg_F",75000]];
            _return set[count _return,
            ["B_SDV_01_F",30000]];
        };
    };
   
    case "ars_ship":
    {
        _return =
        [
            ["B_Boat_Transport_01_F",3000],
            ["C_Boat_Civil_01_rescue_F",3000],
            ["B_SDV_01_F",3000],
			["O_Lifeboat",3000],
            ["C_Scooter_Transport_01_F",5000]
        ];
    };
};
 
_return;