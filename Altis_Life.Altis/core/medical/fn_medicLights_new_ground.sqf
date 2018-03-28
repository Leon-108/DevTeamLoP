/*
	File: fn_copLights.sqf
	@Author: Tonic
	
	Description:
	Adds the light effect to cop vehicles, specifically the offroad.
*/

// LHM START

private ["_vehicle","_lightBlue","_lightleftFront","_lightrightFront","_lightrightBack","_lightleftBack","_leftRed","_brightness","_attach","_day","_colorLight"];

_vehicle = _this select 0;

if (isNil "_vehicle" || isNull _vehicle || !(_vehicle getVariable "lights")) exitWith {};

_lightBlue = [0.02,0.02,10];
_lightYellow = [10, 10, 0.1];
_lightWhite = [1,1,1.1];

switch (typeOf _vehicle) do {
	case "C_Hatchback_01_F": { _attach = [[-0.6, 2, -0.95],[0.6, 2, -0.95],[-0.63, -2.37, -0.3],[0.55, -2.37, -0.3],[-0.77, 1.7, -0.5],[0.70, 1.7, -0.5]]; _colorLight = _lightBlue;};
	case "C_Hatchback_01_sport_F": { _attach = [[-0.6, 2, -0.95],[0.6, 2, -0.95],[-0.63, -2.37, -0.3],[0.55, -2.37, -0.3],[-0.77, 1.7, -0.5],[0.70, 1.7, -0.5]]; _colorLight = _lightBlue;};
	case "C_SUV_01_F": { _attach = [[-0.4, 2.3, -0.55], [0.4, 2.3, -0.52], [-0.92, -2.75, -0.19], [0.89, -2.73, -0.19], [-0.78, 2.05, -0.48], [0.78, 2.05, -0.48]]; _colorLight = _lightBlue;};
	case "C_Offroad_02_unarmed_F": { _attach = [[-0.55, 2.1, -0.6],[0.45, 2.1, -0.6],[-0.76, -1.63, -0.37],[0.66, -1.63, -0.37],[-0.52, 2.08, -0.4],[0.44, 2.08, -0.4]]; _colorLight = _lightBlue;};
	/*
	case "B_Heli_Transport_01_F": { _attach = [[-0.5, 0.0, 0.96], [0.5, 0.0, 0.96]]; };
	case "I_MRAP_03_hmg_F": { _attach = [[-0.37, 0.0, 0.56], [0.37, 0.0, 0.56]]; };
	case "B_APC_Wheeled_01_cannon_F": { _attach = [[-1, -2.8, 0.55], [1, -2.8, 0.55]]; };
	case "B_MRAP_01_hmg_F": { _attach = [[-1, -2.8, 0.55], [1, -2.8, 0.55]]; };
	case "O_MRAP_02_hmg_F": { _attach = [[-1, -2.8, 0.50], [1, -2.8, 0.50]]; };
	case "O_MRAP_02_F": { _attach = [[-1, -2.8, 0.55], [1, -2.8, 0.55]]; };
	case "B_T_VTOL_01_infantry_F": { _attach = [[-7.6,3.3,-1.2],[7.65,3.35,-1.1]];};
	case "B_T_VTOL_01_vehicle_F": { _attach = [[-7.6,3.3,-1.2],[7.65,3.35,-1.1]];};
	case "O_Heli_Transport_04_bench_F": { _attach = [[-0.37, 0.0, 0.56], [0.37, 0.0, 0.56]];};
	case "C_Van_02_transport_F": { _attach = [[0.75,3.95,-0.2], [-0.75,3.95,-0.2]];};
	case "O_T_LSV_02_unarmed_F" : { _attach = [[-0.9,2.15, -0.05], [0.575,2.15,-0.05]];};
    case "B_T_LSV_01_unarmed_F" : { _attach = [[-0.5,2.1,-0.6], [0.6,2.1,-0.6]];};
	case "B_GEN_Offroad_01_gen_F": { _attach = [[-0.45, 0.0, 0.56], [0.37, 0.0, 0.56]]; _colorLight = _lightBlue; };
	case "C_Offroad_01_F": { _attach = [[-0.45, 0.0, 0.56], [0.37, 0.0, 0.56]]; _colorLight = _lightBlue; };
	case "B_MRAP_01_F": { _attach = [[-1, -2.8, 0.55], [1, -2.8, 0.55]]; _colorLight = _lightBlue; };
	case "B_Quadbike_01_F": { _attach = [[-0.4, 1, 0], [0.4, 1, 0]]; _colorLight = _lightBlue; };
	case "C_Van_01_box_F": { _attach = [[-0.75, 0.2, 1.55], [0.67, 0.2, 1.55]]; _colorLight = _lightBlue; }; 
	case "B_Heli_Light_01_F": { _attach = [[-0.37, 0.0, 0.56], [0.37, 0.0, 0.56]]; _colorLight = _lightBlue; };
	case "O_Heli_Light_02_unarmed_F": { _attach = [[-0.90,1.26,0.45], [0.90,1.26,0.45]]; _colorLight = _lightBlue; };
	case "I_Heli_Transport_02_F": { _attach = [[-1.79,0.98,-2.48], [1.79,0.98,-2.48]]; _colorLight = _lightBlue; };
	case "C_Offroad_01_repair_F": { _attach = [[-0.45, 0.0, 0.50], [0.37, 0.0, 0.50]]; _colorLight = _lightYellow; };
	case "I_MRAP_03_F": { _attach = [[-0.37, 0.0, 0.56], [0.37, 0.0, 0.56]]; _colorLight = _lightBlue; };
	case "B_Heli_Transport_03_unarmed_F": { _attach = [[-0.37, 0.0, 0.56], [0.37, 0.0, 0.56]]; _colorLight = _lightBlue; };
	case "O_Heli_Transport_04_F": { _attach = [[-0.37, 0.0, 0.56], [0.37, 0.0, 0.56]]; _colorLight = _lightBlue; };
	case "B_Truck_01_covered_F": { _attach = [[-1.2, 4.85, -0.45], [1.25, 4.85, -0.45]]; _colorLight = _lightBlue; };
	case "O_T_VTOL_02_infantry_F":{ _attach = [[-7,-1.25,-0.1],[7,-1.25,-0.1]];_colorLight = _lightBlue; };
	case "I_Heli_light_03_unarmed_F": { _attach = [[-1.23,4.7,-1.42],[1.23,4.7,-1.42]];_colorLight = _lightBlue; };
	case "C_Van_02_medevac_F": { _attach = [[0.5,1.6,1.15], [-0.5,1.6,1.15]]; _colorLight = _lightBlue; };
	case "C_Van_02_service_F": { _attach = [[0.5,1.6,1.15], [-0.5,1.6,1.15]]; _colorLight = _lightYellow; }; */
};


_attenuation = [0.05, 0, 500, 100];//[0.181, 0, 1000, 130];
_flareSize = 0.2;
_flareMaxDistance = 100;

_lightleftFrontWhite = createVehicle ["#lightpoint", getPos _vehicle, [], 0, "CAN_COLLIDE"];
sleep 0.2;
_lightleftFrontWhite setLightColor  _lightWhite;
_lightleftFrontWhite setLightBrightness 0;
_lightleftFrontWhite lightAttachObject [_vehicle, _attach select 4];
_lightleftFrontWhite setLightAttenuation _attenuation;
_lightleftFrontWhite setLightFlareSize _flareSize;
_lightleftFrontWhite setLightFlareMaxDistance _flareMaxDistance;
_lightleftFrontWhite setLightUseFlare true;
_lightleftFrontWhite setLightDayLight true;

_lightrightFrontWhite = createVehicle ["#lightpoint", getPos _vehicle, [], 0, "CAN_COLLIDE"];
sleep 0.2;
_lightrightFrontWhite setLightColor  _lightWhite;
_lightrightFrontWhite setLightBrightness 0;
_lightrightFrontWhite lightAttachObject [_vehicle, _attach select 5];
_lightrightFrontWhite setLightAttenuation _attenuation;
_lightrightFrontWhite setLightFlareSize _flareSize;
_lightrightFrontWhite setLightFlareMaxDistance _flareMaxDistance;
_lightrightFrontWhite setLightUseFlare true;
_lightrightFrontWhite setLightDayLight true;

_lightleftFront = createVehicle ["#lightpoint", getPos _vehicle, [], 0, "CAN_COLLIDE"];
sleep 0.2;
_lightleftFront setLightColor  _colorLight;
_lightleftFront setLightBrightness 0;
_lightleftFront lightAttachObject [_vehicle, _attach select 0];
_lightleftFront setLightAttenuation _attenuation;
_lightleftFront setLightFlareSize _flareSize;
_lightleftFront setLightFlareMaxDistance _flareMaxDistance;
_lightleftFront setLightUseFlare true;
_lightleftFront setLightDayLight true;

_lightrightBack = createVehicle ["#lightpoint", getPos _vehicle, [], 0, "CAN_COLLIDE"];
sleep 0.2;
_lightrightBack setLightColor  _colorLight;
_lightrightBack setLightBrightness 0;
_lightrightBack lightAttachObject [_vehicle, _attach select 3];
_lightrightBack setLightAttenuation [0.1, 0, 500, 100];
_lightrightBack setLightFlareSize _flareSize;
_lightrightBack setLightFlareMaxDistance _flareMaxDistance;
_lightrightBack setLightUseFlare true;
_lightrightBack setLightDayLight true;

_lightrightFront = createVehicle ["#lightpoint", getPos _vehicle, [], 0, "CAN_COLLIDE"];
sleep 0.2;
_lightrightFront setLightColor  _colorLight;
_lightrightFront setLightBrightness 0;
_lightrightFront lightAttachObject [_vehicle, _attach select 1];
_lightrightFront setLightAttenuation _attenuation;
_lightrightFront setLightFlareSize _flareSize;
_lightrightFront setLightFlareMaxDistance _flareMaxDistance;
_lightrightFront setLightUseFlare true;
_lightrightFront setLightDayLight true;

_lightleftBack = createVehicle ["#lightpoint", getPos _vehicle, [], 0, "CAN_COLLIDE"];
sleep 0.2;
_lightleftBack setLightColor  _colorLight;
_lightleftBack setLightBrightness 0;
_lightleftBack lightAttachObject [_vehicle, _attach select 2];
_lightleftBack setLightAttenuation [0.1, 0, 500, 100];
_lightleftBack setLightFlareSize _flareSize;
_lightleftBack setLightFlareMaxDistance _flareMaxDistance;
_lightleftBack setLightUseFlare true;
_lightleftBack setLightDayLight true;


_leftRed = true;  
while {(alive _vehicle)} do { 
	_now = date;
	_hour = _now select 3;
	if (_hour > 4 && _hour <= 19) then {
		_brightness = 90;
		//_day = true;
	} else {
		_brightness = 5;
		//_day = false;
	};
	// h/int format ["DEBUG: lights: %1 \n Vehicle Player: %2",!(_vehicle getVariable "lights"),!(vehicle player !=player)];
	if (!(_vehicle getVariable "lights")) exitWith {};
	if (_leftRed) then {  
		_leftRed = false;  
		_lightrightFront setLightBrightness 0;
		_lightleftFrontWhite setLightBrightness 0;
		_lightleftBack setLightBrightness 0;  
		sleep 0.35;
		_lightleftFront setLightBrightness _brightness;
		_lightrightFrontWhite setLightBrightness _brightness;
		_lightrightBack setLightBrightness _brightness;  
		sleep 0.12;
		_lightleftFront setLightBrightness 0;
		_lightrightBack setLightBrightness 0;
		sleep 0.12;
		_lightleftFront setLightBrightness _brightness;
		_lightrightBack setLightBrightness _brightness; 
	} else {  
		_leftRed = true;  
		_lightleftFront setLightBrightness 0;  
		_lightrightFrontWhite setLightBrightness 0;  
		_lightrightBack setLightBrightness 0;  
		sleep 0.35;
		_lightrightFront setLightBrightness _brightness;
		_lightleftFrontWhite setLightBrightness _brightness;
		_lightleftBack setLightBrightness _brightness;  
		sleep 0.12;
		_lightrightFront setLightBrightness 0;  
		_lightleftBack setLightBrightness 0;  
		sleep 0.12;
		_lightrightFront setLightBrightness _brightness;
		_lightleftBack setLightBrightness _brightness; 
	};
	sleep 0.12;  
};  
deleteVehicle _lightleftFront;
deleteVehicle _lightrightBack;
deleteVehicle _lightrightFront;
deleteVehicle _lightleftFrontWhite;
deleteVehicle _lightrightFrontWhite;
deleteVehicle _lightleftBack;

// LHM END