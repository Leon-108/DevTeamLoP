/*
	fn_equipGear.sqf
	
	Description:
	Initializes custom gear textures
*/
params [
	["_unit",objNull,[objNull]],
	"_type"
];
private _path = "";
if(playerSide isEqualTo west) exitWith {
	(unitBackpack player) setObjectTextureGlobal [0,""];
	if (_type isEqualTo "U_Rangemaster") exitWith {
			_path = "textures\Person_Skins_Cop\PPD_Hemd.paa";
			_unit setObjectTextureGlobal [0,_path];
	};
	if (_type isEqualTo "U_B_CombatUniform_mcam") exitWith {
		_path = "textures\Person_Skins_Cop\PPD_Jacke.paa";
		_unit setObjectTextureGlobal [0,_path];
	};
	if ((license_cop_swat || license_cop_swatazubi || license_cop_swatcmd) && (_type isEqualTo "U_B_CTRG_1")) exitWith {
		_path = "textures\Person_Skins_Cop\SWAT.paa";
		_unit setObjectTextureGlobal [0,_path];
	};
};
if (playerSide isEqualTo independent) exitWith {
	(unitBackpack player) setObjectTextureGlobal [0,""];
	if(_type isEqualTo "U_I_HeliPilotCoveralls") then {
			_path = "textures\klamotten_prs.paa";
			_unit setObjectTextureGlobal [0,_path];
		};	
	};
if (playerSide isEqualTo civilian) exitWith {
	if (license_civ_dm && (((name _unit) select [count (name _unit)-12,12]) isEqualTo "Dithmarscher")) exitWith {
		if(_type isEqualTo "U_B_CombatUniform_mcam_vest") then {
			_path = "textures\Fahrzeug_Skins\dm\dmanzug.paa";
			_unit setObjectTextureGlobal [0,_path];
		};
	};
/*	if (license_civ_presse) exitWith {
		if(_type isEqualTo "U_Marshal") then {
			_path = "textures\Priester.paa";
			_unit setObjectTextureGlobal [0,_path];
		};
	};
*/	
	if ((license_civ_srevers) && (((name _unit) select [count (name _unit)-7,7]) isEqualTo "Srevers")) exitWith {
		if (_type isEqualTo "U_I_CombatUniform") then {
			_path = "textures\Fahrzeug_Skins\srevers\anzug.paa";
			_unit setObjectTextureGlobal [0,_path];
		};
		if (_type isEqualTo "U_B_CTRG_3") then {
			_path = "textures\Fahrzeug_Skins\evers\anzug.paa";
			_unit setObjectTextureGlobal [0,_path];
		};
	};
	
	if ((license_civ_bhg) && (((name _unit) select [1,3]) isEqualTo "BHG")) exitWith {
		if (_type isEqualTo "U_B_GEN_Commander_F") then {
			_path = "textures\Fahrzeug_Skins\bhg\anzug.paa";
			_unit setObjectTextureGlobal [0,_path];
		};
	};
	/*
	if ((license_civ_sr) && (((name _unit) select [1,2]) isEqualTo "SR")) exitWith {
		if (_type isEqualTo "U_B_CTRG_1") then {
			_path = "textures\Fahrzeug_Skins\sr\anzug.paa";
			_unit setObjectTextureGlobal [0,_path];
		};
	};
	*/
	if ((license_civ_king) && (((name _unit) select [1,4]) isEqualTo "KING")) exitWith {
		if (_type isEqualTo "U_O_FullGhillie_sard") then {
			_unit setObjectTextureGlobal [0,"#(ai,64,64,1)Fresnel(1.3,7)"];
			_unit setObjectTextureGlobal [1,"textures\Fahrzeug_Skins\king\anzug.paa"];
		};
	};
};
