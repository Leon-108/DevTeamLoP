#include "..\..\script_macros.hpp"
/* file: fn_smartphone.sqf Author: Silex */
private["_display","_units","_type","_data","_index", "_dData","_rowData","_msg"];
_type = [_this,0,0] call BIS_fnc_param;
_data = [_this,1,0,["",[],0]] call BIS_fnc_param; 
disableSerialization;
waitUntil {!isNull findDisplay 88888};
_display = findDisplay 88888;
_cPlayerList = _display displayCtrl 88881;
_cMessageList = _display displayCtrl 88882;
_cMessageShow = _display displayCtrl 88887;  
_cMessageHeader = _display displayCtrl 88886; 
_cMessageHeader ctrlSetText format["Von:                 Nachricht:"];
ctrlEnable[887892,false];
switch(_type) do{ 
case 0: {   
	lbClear _cPlayerList;
	{
		if(alive _x && _x != player) then { 
			switch(side _x) do { 
				case west: {_type = "Polizist"};
				case civilian: {_type = "Zivilist"};
				case independent: {_type = "Medic"};
			};
			_cPlayerList lbAdd format["%1 [%2]",_x getVariable["realname", name _x],_type];
			_cPlayerList lbSetData [(lbSize _cPlayerList)-1,str(_x)];
		};
	 } forEach playableUnits;
	 lbSort _cPlayerList;
	 [[getPlayerUID player, player],"TON_fnc_msgRequest",false] spawn life_fnc_MP;
	 ctrlEnable[887892,false];
};
case 1: { 
	 _msg = [_data select 2,40] call KRON_StrLeft;
	 _rowData = [_data select 0, _data select 1, _data select 2, _data select 3];
	 _cMessageList lnbAddRow[_data select 3,format["%1 ...",_msg]];
	 _cMessageList lnbSetData[[((lnbSize _cMessageList) select 0)-1,0],str(_rowData)];
};
case 2: {
	ctrlEnable[887892,true];
	_target = lbData[88881,(lbCurSel 88881)];
	life_smartphoneTarget = call compile format["%1",_target];
};
case 3:
{
	lbClear _cMessageList;
    [[player],"TON_fnc_cleanupMessages",false] spawn life_fnc_MP;
    [[getPlayerUID player, player],"TON_fnc_msgRequest",false] spawn life_fnc_MP;
    ctrlSetText[88890, format["Nachricht zum lesen auswählen",0]]; 
	_cMessageShow ctrlSetText "";     
    
};
 case 4: {
	createDialog "Life_smartphone_schreiben";
	ctrlSetText[88886, format["Nachricht: %1",name life_smartphoneTarget]];
	if((__GETC__(life_adminlevel) < 1)) then { 
		ctrlShow[888897,false]; 
	};
};    
 /*case 5:
{       
    _index = [lbCurSel 88882, 0] call BIS_fnc_param;
    _dData = call compile(_cMessageList lnbData[_index, 0]); 
    [_dData select 4,"TON_fnc_delMessage",false] spawn life_fnc_MP;
    sleep 5;
	lbClear _cMessageList;
	[[getPlayerUID player, player],"TON_fnc_msgRequest",false] spawn life_fnc_MP;
    ctrlSetText[88890, "Nachricht zum lesen auswählen"];
	_cMessageShow ctrlSetText ""; 
	};
*/
};