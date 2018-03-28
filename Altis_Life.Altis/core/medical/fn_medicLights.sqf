#include "..\..\script_macros.hpp"
/*
	File: fn_medicLights.sqf
	@Author: Tonic modified by moeck (Lost of Paradise)
	
	Description:
	Adds the light effect to cop vehicles, specifically the offroad.
*/

// LHM START

private ["_vehicle","_lightRed","_lightYellow","_lightBlue","_lightleft","_lightright","_leftRed","_brightness","_attach"];

_vehicle = _this select 0;

if (isNil "_vehicle" || isNull _vehicle || !(_vehicle getVariable "lights")) exitWith {};
//Definition der Farben
_lightRed = [1, 0.1, 0.1]; 
_lightBlue = [0.1, 0.1, 20];
_lightYellow = [20, 20, 0.1]; 
_lightleft = createVehicle ["#lightpoint", getPos _vehicle, [], 0, "CAN_COLLIDE"];
sleep 0.2;
_lightright = createVehicle ["#lightpoint", getPos _vehicle, [], 0, "CAN_COLLIDE"];
sleep 0.2;

switch (typeOf _vehicle) do {
	case "B_GEN_Offroad_01_gen_F": { _attach = [[-0.45, 0.0, 0.56], [0.37, 0.0, 0.56]]; 
							 _lightleft setLightColor _lightBlue;
							 _lightright setLightColor _lightBlue;
	};
	case "C_Offroad_01_F": { _attach = [[-0.45, 0.0, 0.56], [0.37, 0.0, 0.56]]; 
							 _lightleft setLightColor _lightBlue;
							 _lightright setLightColor _lightBlue;
	};
	case "B_MRAP_01_F": { _attach = [[-1, -2.8, 0.55], [1, -2.8, 0.55]]; 
						   _lightleft setLightColor _lightBlue;
						   _lightright setLightColor _lightBlue;	
	};
	case "C_SUV_01_F": { _attach = [[-0.4, 2.3, -0.55], [0.4, 2.3, -0.55]]; 
						_lightleft setLightColor _lightBlue;
						_lightright setLightColor _lightBlue;
	};
	case "B_Quadbike_01_F": { _attach = [[-0.4, 1, 0], [0.4, 1, 0]]; 
						_lightleft setLightColor _lightBlue;
						_lightright setLightColor _lightBlue;
	};
	case "C_Van_01_box_F": { _attach = [[-0.75, 0.2, 1.55], [0.67, 0.2, 1.55]]; 
							 _lightleft setLightColor _lightBlue;
							 _lightright setLightColor _lightBlue;
	}; 
	case "B_Heli_Light_01_F": { _attach = [[-0.37, 0.0, 0.56], [0.37, 0.0, 0.56]]; 
								_lightleft setLightColor _lightBlue;
								_lightright setLightColor _lightBlue;
	};
	case "O_Heli_Light_02_unarmed_F": { _attach = [[-0.90,1.26,0.45], [0.90,1.26,0.45]]; 
									_lightleft setLightColor _lightBlue;
									_lightright setLightColor _lightBlue;
	};
	case "I_Heli_Transport_02_F": { _attach = [[-1.79,0.98,-2.48], [1.79,0.98,-2.48]]; 
								_lightleft setLightColor _lightBlue;
								_lightright setLightColor _lightBlue;
	};
	case "C_Offroad_01_repair_F": { _attach = [[-0.45, 0.0, 0.50], [0.37, 0.0, 0.50]]; 
									_lightleft setLightColor _lightYellow;
									_lightright setLightColor _lightYellow;
	};
	case "I_MRAP_03_F": { _attach = [[-0.37, 0.0, 0.56], [0.37, 0.0, 0.56]]; 
								_lightleft setLightColor _lightBlue;
								_lightright setLightColor _lightBlue;
	};
	case "B_Heli_Transport_03_unarmed_F": { _attach = [[-0.37, 0.0, 0.56], [0.37, 0.0, 0.56]]; 
								_lightleft setLightColor _lightBlue;
								_lightright setLightColor _lightBlue;
	};
	case "O_Heli_Transport_04_F": { _attach = [[-0.37, 0.0, 0.56], [0.37, 0.0, 0.56]]; 
								_lightleft setLightColor _lightBlue;
								_lightright setLightColor _lightBlue;
	};
	case "O_Heli_Transport_04_medevac_F": { _attach = [[-0.37, 0.0, 0.56], [0.37, 0.0, 0.56]]; 
								_lightleft setLightColor _lightBlue;
								_lightright setLightColor _lightBlue;
	};
	case "O_Heli_Transport_04_bench_F": { _attach = [[-0.37, 0.0, 0.56], [0.37, 0.0, 0.56]]; 
								_lightleft setLightColor _lightBlue;
								_lightright setLightColor _lightBlue;
	};
	case "B_Truck_01_covered_F": { _attach = [[-1.2, 4.85, -0.45], [1.25, 4.85, -0.45]]; 
								_lightleft setLightColor _lightBlue;
								_lightright setLightColor _lightBlue;
	};
	case "O_T_VTOL_02_infantry_F":{ _attach = [[-7,-1.25,-0.1],[7,-1.25,-0.1]];
								_lightleft setLightColor _lightBlue;
								_lightright setLightColor _lightBlue;
	};
	case "I_Heli_light_03_unarmed_F": { _attach = [[-1.23,4.7,-1.42],[1.23,4.7,-1.42]];
								_lightleft setLightColor _lightBlue;
								_lightright setLightColor _lightBlue;
	};
	case "C_Hatchback_01_sport_F": { _attach = [[-0.6, 2, -0.95], [0.6, 2, -0.95]]; 
								_lightleft setLightColor _lightBlue;
								_lightright setLightColor _lightBlue;	
	};
	case "C_Van_02_medevac_F": { _attach = [[0.5,1.6,1.15], [-0.5,1.6,1.15]]; 
								_lightleft setLightColor _lightBlue;
								_lightright setLightColor _lightBlue;	
	};
	case "C_Van_02_service_F": { _attach = [[0.5,1.6,1.15], [-0.5,1.6,1.15]]; 
								_lightleft setLightColor _lightYellow;
								_lightright setLightColor _lightYellow;	
	};
	
	
};

//_lightleft setLightColor _lightBlue;
_lightleft setLightBrightness 0;
_lightleft lightAttachObject [_vehicle, _attach select 0];
_lightleft setLightAttenuation [0.181, 0, 1000, 130];
_lightleft setLightIntensity 20;
_lightleft setLightFlareSize 0.38;
_lightleft setLightFlareMaxDistance 150;
_lightleft setLightUseFlare true;
_lightleft setLightDayLight true;

//_lightright setLightColor _lightBlue;
_lightright setLightBrightness 0;
_lightright lightAttachObject [_vehicle, _attach select 1];
_lightright setLightAttenuation [0.181, 0, 1000, 130];
_lightright setLightIntensity 20;
_lightright setLightFlareSize 0.38;
_lightright setLightFlareMaxDistance 150;
_lightright setLightUseFlare true;
_lightright setLightDayLight true;

_now = date;
_hour = _now select 3;
if (_hour > 5 && _hour <= 20) then {
	_brightness = 60;
} else {
	_brightness = 15;
};

_leftRed = true;  
while {(alive _vehicle)} do { 
	//h/int format ["DEBUG: lights: %1 \n Vehicle Player: %2",!(_vehicle getVariable "lights"),!(vehicle player !=player)];
	if (!(_vehicle getVariable "lights")) exitWith {};
	if (_leftRed) then {  
		_leftRed = false;  
		_lightright setLightBrightness 0;  
		sleep 0.05;
		_lightleft setLightBrightness _brightness;  
	} else {  
		_leftRed = true;  
		_lightleft setLightBrightness 0;  
		sleep 0.05;
		_lightright setLightBrightness _brightness;  
	};
	sleep 0.22;  
};  
deleteVehicle _lightleft;
deleteVehicle _lightright;

// LHM END<<<<