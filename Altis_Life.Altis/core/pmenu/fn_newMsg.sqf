#include "..\..\script_macros.hpp"
/*
	
	file: fn_newMsg.sqf
	Author: Silex
	
*/

private["_to","_type","_playerData","_msg"];
disableSerialization;

_type = [_this,0,-1] call BIS_fnc_param;
_playerData = [_this,1,-1] call BIS_fnc_param;
_msg = [_this,2,"",[""]] call BIS_fnc_param;
_pos = mapGridPosition player;

_display = findDisplay 88888;
_cPlayerList = _display displayCtrl 88881;
_cMessageEdit = _display displayCtrl 88884;

switch(_type) do
{
	case 0:
	{
		//life_smartphoneTarget = call compile format["%1",_playerData];
		ctrlSetText[88886, format["Nachricht an: %1",name life_smartphoneTarget]];
		if((__GETC__(life_adminlevel) < 1)) then
		{
			ctrlShow[888897,false];
		};
	};
	//normal message
	case 1:
	{
		if(isNUll life_smartphoneTarget) exitWith {
			//h/int format["Keine Person ausgwählt!"];
			["Keine Person ausgwählt!","RED",10] spawn life_fnc_notification_system;
		};
		ctrlShow[88885, false];
		if(_msg isEqualto "") exitWith {
			//h/int "Du musst eine Nachricht eingeben.";
			["Du musst eine Nachricht eingeben.","RED",10] spawn life_fnc_notification_system;
			ctrlShow[88885, true];
		};
		[[life_smartphoneTarget,_msg,player,0],"TON_fnc_handleMessages",false] spawn life_fnc_MP;
		//h/int format["Du hast eine Nachricht an %1 gesendet: %2",name life_smartphoneTarget,_msg];
		[format["Du hast eine Nachricht an %1 gesendet: %2",name life_smartphoneTarget,_msg],"PINK",5] spawn life_fnc_notification_system;
		ctrlShow[88885, true];
		closeDialog 88883;
	};
	//copmessage
	case 2:
	{
		if(({side _x isEqualto west} count playableUnits) isEqualto 0) exitWith {
			//h/int format["Das PPD ist derzeit nicht zu erreichen. Bitte versuchen Sie es spaeter nochmal."];
			["Das PPD ist derzeit nicht zu erreichen. Bitte versuchen Sie es spaeter nochmal.","RED",10] spawn life_fnc_notification_system;
		};
		ctrlShow[888895,false];
		if(_msg isEqualto "") exitWith {
			//h/int "Du musst eine Nachricht eingeben.";
			["Du musst eine Nachricht eingeben.","RED",10] spawn life_fnc_notification_system;
			ctrlShow[888895,true];
		};
		_msg = format["%1 Gesendet von Position [%2]",_msg,_pos];
		[[ObjNull,_msg,player,1],"TON_fnc_handleMessages",false] spawn life_fnc_MP;
		_to = "An das PPD";
		//h/int format["Du hast eine Nachricht an %1 gesendet %2",_to,_msg];
		[format["Du hast eine Nachricht an %1 gesendet : %2",_to,_msg],"PINK",15] spawn life_fnc_notification_system;
		ctrlShow[888895,true];
		closeDialog 887890;
	};
	//msgadmin
	case 3:
	{
		ctrlShow[888896,false];
		if(_msg isEqualto "") exitWith {
			//h/int "Du musst eine Nachricht eingeben.";
			["Du musst eine Nachricht eingeben.","RED",10] spawn life_fnc_notification_system;
			ctrlShow[888896,true];
		};
		[[ObjNull,_msg,player,2],"TON_fnc_handleMessages",false] spawn life_fnc_MP;
		_to = "An Admin";
		//h/int format["Du hast eine Nachricht an %1 gesendet : %2",_to,_msg];
		[format["Du hast eine Nachricht an %1 gesendet : %2",_to,_msg],"PINK",15] spawn life_fnc_notification_system;
		ctrlShow[888896,true];
		closeDialog 887890;
	};
	//emsrequest
	case 4:
	{
		if(({side _x isEqualto independent} count playableUnits) isEqualto 0) exitWith {
			//h/int format["Zurzeit ist kein Arzt im Dienst. Bitte probiere es spaeter nochmal."];
			["Zurzeit ist kein Arzt im Dienst. Bitte probiere es spaeter nochmal.","RED",10] spawn life_fnc_notification_system;
		};
		ctrlShow[888899,false];
		if(_msg isEqualto "") exitWith {
			//h/int "Du musst eine Nachricht eingeben.";
			["Du musst eine Nachricht eingeben.","RED",10] spawn life_fnc_notification_system;
			ctrlShow[888899,true];
		};
		_msg = format["%1 Gesendet von Position [%2]",_msg,_pos];
		[[ObjNull,_msg,player,3],"TON_fnc_handleMessages",false] spawn life_fnc_MP;
		//h/int format["Du hast den PRS verstaendigt.",_msg];
		[format["Du hast den PRS verstaendigt: %1",_msg],"PINK",15] spawn life_fnc_notification_system;
		ctrlShow[888899,true];
		closeDialog 887890;
	};
	//adminToPerson
	case 5:
	{
		if((call life_adminlevel) < 1) exitWith {
			//h/int "Du bist kein Admin!";
			["Du bist kein Admin!","RED",10] spawn life_fnc_notification_system;
		};
		if(isNULL life_smartphoneTarget) exitWith {
			//h/int format["Keine Person ausgewählt!"];
			["Keine Person ausgewählt!","RED",10] spawn life_fnc_notification_system;
		};
		if(_msg isEqualto "") exitWith {
			//h/int "Du musst eine Nachricht eingeben.";
			["Du musst eine Nachricht eingeben.","RED",10] spawn life_fnc_notification_system;
		};
		[[life_smartphoneTarget,_msg,player,4],"TON_fnc_handleMessages",false] spawn life_fnc_MP;
		//h/int format["Admin Nachricht gesendet an: %1 - Message: %2",name life_smartphoneTarget,_msg];
		[format["Admin Nachricht gesendet an: %1 - Message: %2",name life_smartphoneTarget,_msg],"PINK",15] spawn life_fnc_notification_system;
		closeDialog 88883;
	};
	//emergencyloading
	case 6:
	{
		ctrlShow[888901,false];
		ctrlShow[888900,false];
		if((__GETC__(life_adminlevel) < 1)) then
		{
			ctrlShow[888898,false];
			ctrlShow[888896,true];
		} else {
			ctrlShow[888898,true];
			ctrlShow[888896,false];
		};
		if (format["%1",player] in ["medic_1","medic_3","medic_4"]) then {
			ctrlShow[888900,true];
			ctrlShow[888901,false];
		};
		if (format["%1",player] in ["cop_16", "cop_17", "cop_18"]) then {
			ctrlShow[888901,true];
			ctrlShow[888900,false];
		};
	};
	//adminMsgAll
	case 7:
	{
		if((call life_adminlevel) < 1) exitWith {
			//h/int "You are not an admin!";
			["You are not an admin!","RED",10] spawn life_fnc_notification_system;
		};
		if(_msg isEqualto "") exitWith {
			//h/int "Du musst eine Nachricht eingeben.";
			["Du musst eine Nachricht eingeben.","RED",10] spawn life_fnc_notification_system;
		};
		[[ObjNull,_msg,player,5],"TON_fnc_handleMessages",false] spawn life_fnc_MP;
		//h/int format["Admin Nachricht an alle: %1",_msg];
		[format["Admin Nachricht an alle: %1",_msg],"PINK",15] spawn life_fnc_notification_system;
		closeDialog 887890;
	};
	//adacrequest
	case 8:
	{
		if(({side _x isEqualto east} count playableUnits) isEqualto 0) exitWith {
			//h/int format["Zurzeit ist kein ADAC im Dienst. Bitte probiere es später nochmal."];
			["Zurzeit ist kein ADAC im Dienst. Bitte probiere es später nochmal.","RED",10] spawn life_fnc_notification_system;
		};
		ctrlShow[888900,false];
		if(_msg isEqualto "") exitWith {
			//h/int "Du musst eine Nachricht eingeben.";
			["Du musst eine Nachricht eingeben.","RED",10] spawn life_fnc_notification_system;
			ctrlShow[888900,true];
		};
		[[ObjNull,_msg,player,6],"TON_fnc_handleMessages",false] spawn life_fnc_MP;
		//h/int format["Notruf wurde abgesetzt.",_msg];
		[format["Notruf wurde abgesetzt.",_msg],"PINK",15] spawn life_fnc_notification_system;
		ctrlShow[888900,true];
		closeDialog 887890;
	};
	//PRStoall
	case 9:
	{
		_slotName = format["%1",player];
		if !(_slotName in ["medic_1","medic_3","medic_4"] ) exitWith {
			//h/int "You are not an admin!";
			["Du hast nicht die Einsatzleitung","RED",10] spawn life_fnc_notification_system;
		};
		if(_msg isEqualto "") exitWith {
			//h/int "Du musst eine Nachricht eingeben.";
			["Du musst eine Nachricht eingeben.","RED",10] spawn life_fnc_notification_system;
		};
		[[ObjNull,_msg,player,7],"TON_fnc_handleMessages",false] spawn life_fnc_MP;
		//h/int format["Admin Nachricht an alle: %1",_msg];
		[format["PRS Nachricht an alle: %1",_msg],"PINK",15] spawn life_fnc_notification_system;
		closeDialog 887890;
	};
	//CopToAll
	case 10:
	{
		_slotName = format["%1",player];
		if !(_slotName in ["cop_16", "cop_17", "cop_18"] ) exitWith {
			//h/int "You are not an admin!";
			["Du hast nicht die Einsatzleitung","RED",10] spawn life_fnc_notification_system;
		};
		if(_msg isEqualto "") exitWith {
			//h/int "Du musst eine Nachricht eingeben.";
			["Du musst eine Nachricht eingeben.","RED",10] spawn life_fnc_notification_system;
		};
		[[ObjNull,_msg,player,8],"TON_fnc_handleMessages",false] spawn life_fnc_MP;
		//h/int format["Admin Nachricht an alle: %1",_msg];
		[format["Cop Nachricht an alle: %1",_msg],"PINK",15] spawn life_fnc_notification_system;
		closeDialog 887890;
	};
};