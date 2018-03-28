#include "..\..\script_macros.hpp"
/*
	fn_randomDealer.sqf
	Author: moeck
*/
_data = [];
//Dealer 1 
if (dealer_1 isEqualTo "drogendealer_a_1") then {
	_data pushback ["Land_CashDesk_F", [7557.69,18358.7,132.693], [[-0.825594,-0.564264,0.000666749],[0.00228673,-0.00216418,0.999995]],false,false,"_this addAction[(localize ""STR_Shops_Dealer""),life_fnc_virt_menu,""dealer""];;_this addAction[""Dealer abfragen!"",life_fnc_questionDealer,"""",0,false,false,"""",' vehicle player == player && player distance _target < 5 && playerSide == west && !life_action_inUse '];","dealer1"];
	life_dealerMarkers pushback ["mil_dot","drogendealer_a_1", [7557.743,18358.873,0],"Drogendealer Minas","ColorEAST"];
};
if (dealer_1 isEqualTo "drogendealer_a_2") then {
	_data pushback ["Land_CashDesk_F", [10179.7,15919.6,121.419], [[0.94289,-0.333083,0.00376857],[-0.00399679,0,0.999992]],false,false,"_this addAction[(localize ""STR_Shops_Dealer""),life_fnc_virt_menu,""dealer""];_this addAction[""Dealer abfragen!"",life_fnc_questionDealer,"""",0,false,false,"""",' vehicle player == player && player distance _target < 5 && playerSide == west && !life_action_inUse '];","dealer1"];
	life_dealerMarkers pushback ["mil_dot","drogendealer_a_2", [10179.393,15919.607,0],"Drogendealer Dionysios","ColorEAST"];
};
if (dealer_1 isEqualTo "drogendealer_a_3") then {
	_data pushback ["Land_Sunshade_02_F", [13876.7,17182.1,16.8635], [[0,0.999956,0.00932853],[-0.0253228,-0.00932554,0.999636]],false,false,"",""];
	_data pushback ["Land_Sun_chair_F", [13877.1,17182.7,16.8932], [[-0.785701,0.618607,0],[0,0,1]],false,false,"",""];
	_data pushback ["Land_CashDesk_F", [13873.9,17176,16.8008], [[0.430495,-0.902593,0],[0,0,1]],false,false,"_this addAction[(localize ""STR_Shops_Dealer""),life_fnc_virt_menu,""dealer""];_this addAction[""Dealer abfragen!"",life_fnc_questionDealer,"""",0,false,false,"""",' vehicle player == player && player distance _target < 5 && playerSide == west && !life_action_inUse '];","dealer1"];
	life_dealerMarkers pushback ["mil_dot","drogendealer_a_3", [13873.621,17176.004,0],"Drogendealer Gravia","ColorEAST"];
};
//Dealer 2
if (dealer_2 isEqualTo "drogendealer_b_1") then {
	_data pushback ["Land_CashDesk_F", [14336.7,13045.2,4.07494], [[-0.0853299,0.996353,7.15154e-005],[0.000838105,0,1]],false,false,"_this addAction[(localize ""STR_Shops_Dealer""),life_fnc_virt_menu,""dealer""];_this addAction[""Dealer abfragen!"",life_fnc_questionDealer,"""",0,false,false,"""",' vehicle player == player && player distance _target < 5 && playerSide == west && !life_action_inUse '];","dealer2"];
	life_dealerMarkers pushback ["mil_dot","drogendealer_b_1", [14337.6,13045.003,0],"Drogendealer Sagonisi","ColorEAST"];
};
if (dealer_2 isEqualTo "drogendealer_b_2") then {
	_data pushback ["Land_CashDesk_F", [15804,11078.3,22.773], [[-0.567283,-0.823521,-0.00186921],[-0.0013439,-0.00134403,0.999998]],false,false,"_this addAction[(localize ""STR_Shops_Dealer""),life_fnc_virt_menu,""dealer""];_this addAction[""Dealer abfragen!"",life_fnc_questionDealer,"""",0,false,false,"""",' vehicle player == player && player distance _target < 5 && playerSide == west && !life_action_inUse '];","dealer2"];
	life_dealerMarkers pushback ["mil_dot","drogendealer_b_2", [15803.979,11078.284,0],"Drogendealer Faronaki","ColorEAST"];
};
//Dealer 3
if (dealer_3 isEqualTo "drogendealer_c_1") then {
	_data pushback ["Land_CashDesk_F", [20601.9,20132.4,56.0673], [[-0.686059,0.727545,0.000335524],[0.00048906,0,1]],false,false,"_this addAction[(localize ""STR_Shops_Dealer""),life_fnc_virt_menu,""dealer""];_this addAction[""Dealer abfragen!"",life_fnc_questionDealer,"""",0,false,false,"""",' vehicle player == player && player distance _target < 5 && playerSide == west && !life_action_inUse '];","dealer3"];
	life_dealerMarkers pushback ["mil_dot","drogendealer_c_1", [20598.3,20119.584,0],"Drogendealer Pefkas","ColorEAST"];
};
//Dealer 3
if (dealer_3 isEqualTo "drogendealer_c_2") then {
	_data pushback ["Land_CashDesk_F", [21576.4,17177.2,21.6472], [[0.931673,0.35229,-0.0887531],[0.121748,-0.0725897,0.989903]],false,false,"_this addAction[(localize ""STR_Shops_Dealer""),life_fnc_virt_menu,""dealer""];_this addAction[""Dealer abfragen!"",life_fnc_questionDealer,"""",0,false,false,"""",' vehicle player == player && player distance _target < 5 && playerSide == west && !life_action_inUse '];","dealer3"];
	life_dealerMarkers pushback ["mil_dot","drogendealer_c_1", [21576.402,17177.137,0],"Drogendealer Paros","ColorEAST"];
};

{	
	private _obj= (_x select 0)createVehicleLocal [0,0,0]; 
	_obj setPosWorld(_x select 1); 
	_obj setVectorDirAndUp (_x select 2);
	_obj enableSimulation(_x select 3); 
	_obj allowDamage(_x select 4); 
	if!((_x select 5) isEqualTo "")then{_obj call compile(_x select 5);}; 
	if!((_x select 6) isEqualTo "")then{_obj setVehicleVarName (_x select 6);};
} count (_data);


/*count [

	["Land_CashDesk_F", [7557.69,18358.7,132.693], [[-0.825594,-0.564264,0.000666749],[0.00228673,-0.00216418,0.999995]],false,false,"_this addAction[(localize ""STR_Shops_Dealer""),life_fnc_virt_menu,""dealer""];","dealer1"]
	,["mil_dot","drogendealer_a_1", [7557.743,18358.873,0],"Drogendealer Minas","ColorEAST"]
	,["Land_CashDesk_F", [10179.7,15919.6,121.419], [[0.94289,-0.333083,0.00376857],[-0.00399679,0,0.999992]],false,false,"_this addAction[(localize ""STR_Shops_Dealer""),life_fnc_virt_menu,""dealer""];","dealer1"]
	,["mil_dot","drogendealer_a_2", [10179.393,15919.607,0],"Drogendealer Dionysios","ColorEAST"]
	,["Land_Sunshade_02_F", [13876.7,17182.1,16.8635], [[0,0.999956,0.00932853],[-0.0253228,-0.00932554,0.999636]],false,false,"",""]
	,["Land_Sun_chair_F", [13877.1,17182.7,16.8932], [[-0.785701,0.618607,0],[0,0,1]],false,false,"",""]
	,["Land_CashDesk_F", [13873.9,17176,16.8008], [[0.430495,-0.902593,0],[0,0,1]],false,false,"_this addAction[(localize ""STR_Shops_Dealer""),life_fnc_virt_menu,""dealer""];","dealer1"]
	,["mil_dot","drogendealer_a_3", [13873.621,17176.004,0],"Drogendealer Gravia","ColorEAST"]
	,["Land_CashDesk_F", [14336.7,13045.2,4.07494], [[-0.0853299,0.996353,7.15154e-005],[0.000838105,0,1]],false,false,"_this addAction[(localize ""STR_Shops_Dealer""),life_fnc_virt_menu,""dealer""];","dealer2"]
	,["mil_dot","drogendealer_b_1", [14337.6,13045.003,0],"Drogendealer Sagonisi","ColorEAST"]
	,["Land_CashDesk_F", [15804,11078.3,22.773], [[-0.567283,-0.823521,-0.00186921],[-0.0013439,-0.00134403,0.999998]],false,false,"_this addAction[(localize ""STR_Shops_Dealer""),life_fnc_virt_menu,""dealer""];","dealer2"]
	,["mil_dot","drogendealer_b_2", [15803.979,11078.284,0],"Drogendealer Faronaki","ColorEAST"]
	,["Land_CashDesk_F", [20601.9,20132.4,56.0673], [[-0.686059,0.727545,0.000335524],[0.00048906,0,1]],false,false,"_this addAction[(localize ""STR_Shops_Dealer""),life_fnc_virt_menu,""dealer""];","dealer3"]
	,["mil_dot","drogendealer_c_1", [20598.3,20119.584,0],"Drogendealer Pefkas","ColorEAST"]
	,["Land_CashDesk_F", [21576.4,17177.2,21.6472], [[0.931673,0.35229,-0.0887531],[0.121748,-0.0725897,0.989903]],false,false,"_this addAction[(localize ""STR_Shops_Dealer""),life_fnc_virt_menu,""dealer""];","dealer3"]
	,["mil_dot","drogendealer_c_1", [21576.402,17177.137,0],"Drogendealer Paros","ColorEAST"]
];*/








