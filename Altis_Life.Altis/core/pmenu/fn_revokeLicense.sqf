/*
 File: fn_revokeLicense.sqf
 Author: Michael Francis

 Description:
 Allows cops to revoke individual licenses, or all licenses. Vehicle related only.
*/
private["_display","_curTarget","_Btn1","_Btn2","_Btn3","_Btn4","_Btn5","_Btn6","_Btn7"];
createDialog "revokeLicense_Menu";
disableSerialization;
//private _curTarget = life_pInact_curTarget;
//params ["_curTarget"];
if(isNull life_pInact_curTarget) exitWith {
	//h/int "Wrong target!"; 
	["Wrong target!","RED",10] spawn life_fnc_notification_system;
	closeDialog 0;
}; //Bad target
if(!isPlayer life_pInact_curTarget && side life_pInact_curTarget isEqualTo civilian) exitWith {
	//h/int "Cannot perform this action!"; 
	["Cannot perform this action!","RED",10] spawn life_fnc_notification_system;
	closeDialog 0;
}; //Bad side check?
_display = findDisplay 41000;
_Btn1 = _display displayCtrl 41002;
_Btn2 = _display displayCtrl 41003;
_Btn3 = _display displayCtrl 41004;
_Btn4 = _display displayCtrl 41005;
_Btn5 = _display DisplayCtrl 41006;
_Btn6 = _display DisplayCtrl 41007;
//_Btn7 = _display DisplayCtrl 41008;
//life_pInact_curTarget = _curTarget;
//Führerschein Lizenz
_Btn1 buttonSetAction "[[10],""life_fnc_removeLicenses"",life_pInact_curTarget,FALSE] spawn life_fnc_MP; closeDialog 0;";
//LKW Führerschein Lizenz
_Btn2 buttonSetAction "[[11],""life_fnc_removeLicenses"",life_pInact_curTarget,FALSE] spawn life_fnc_MP; closeDialog 0;";
//Pilotenschein Lizenz
_Btn3 buttonSetAction "[[12],""life_fnc_removeLicenses"",life_pInact_curTarget,FALSE] spawn life_fnc_MP; closeDialog 0;";
//Bootsschein Lizenz
_Btn4 buttonSetAction "[[13],""life_fnc_removeLicenses"",life_pInact_curTarget,FALSE] spawn life_fnc_MP; closeDialog 0;";
//Weapon License
_Btn5 buttonSetAction "[[14],""life_fnc_removeLicenses"",life_pInact_curTarget,FALSE] spawn life_fnc_MP; closeDialog 0;";
//Alle Scheine
_Btn6 buttonSetAction "[[15],""life_fnc_removeLicenses"",life_pInact_curTarget,FALSE] spawn life_fnc_MP; closeDialog 0;";

