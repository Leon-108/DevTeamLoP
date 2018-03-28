#include "..\..\script_macros.hpp"
/*
	File: fn_dropItems.sqf
	Author: Bryan "Tonic" Boardwine
	
	Description:
	Called on death, player drops any 'virtual' items they may be carrying.
*/
private["_obj","_unit","_item","_value"];
params [["_unit",objNull,[objNull]]];

{
	if (_x isEqualType "") then {_item = _x;} else {_item = configName _x};
    private _value = ITEM_VALUE(_item);
    private _itemName = ITEM_VARNAME(_item);
	
	call {
		if (_item isEqualTo "waterbottle") exitWith {
			if (_value > 0) then {
                _pos = _unit modelToWorld[(random (2)),(random (2)),0];
                _pos = [(_pos select 0),(_pos select 1),0];
                _obj = "Land_BottlePlastic_V1_F" createVehicle _pos;
                [[_obj],"life_fnc_simDisable",nil,true] spawn life_fnc_MP;
                _obj setPos _pos;
                _obj setVariable ["item",[_item,_value],true];
                missionNamespace setVariable [_itemName,0];
            };
		};
		if (_item in ["backware1","backware2","essen_warm1","essen_warm2","essen_warm3"]) exitWith {
			if (_value > 0) then {
                _pos = _unit modelToWorld[(random (2)),(random (2)),0];
                _pos = [(_pos select 0),(_pos select 1),0];
                _obj = "Land_TacticalBacon_F" createVehicle _pos;
                [[_obj],"life_fnc_simDisable",nil,true] spawn life_fnc_MP;
                _obj setPos _pos;
                _obj setVariable ["item",[_item,_value],true];
                missionNamespace setVariable [_itemName,0];
            };
		};
		if (_item isEqualTo "axt") exitWith {
			if (_value > 0) then {
				_pos = _unit modelToWorld[(random (2)),(random (2)),0];
				_obj = "Land_Axe_F" createVehicle _pos;
                [[_obj],"life_fnc_simDisable",nil,true] spawn life_fnc_MP;
                _obj setPos _pos;
                _obj setVariable ["item",[_item,_value],true];
                missionNamespace setVariable [_itemName,0];
				
			};		
		};
		if (_item isEqualTo "schaufel") exitWith {
			if (_value > 0) then {
				_pos = _unit modelToWorld[(random (2)),(random (2)),0];
				_obj = "Land_Shovel_F" createVehicle _pos;
                [[_obj],"life_fnc_simDisable",nil,true] spawn life_fnc_MP;
                _obj setPos _pos;
                _obj setVariable ["item",[_item,_value],true];
                missionNamespace setVariable [_itemName,0];
				
			};		
		};
		if (_item in ["energy","alkohol","limo","warmdrink"]) exitWith {
			if (_value > 0) then {
                _pos = _unit modelToWorld[(random (2)),(random (2)),0];
                _pos = [(_pos select 0),(_pos select 1),0];
                _obj = "Land_Can_V3_F" createVehicle _pos;
                [[_obj],"life_fnc_simDisable",nil,true] spawn life_fnc_MP;
                _obj setPos _pos;
                _obj setVariable ["item",[_item,_value],true];
                missionNamespace setVariable [_itemName,0];
            };
		};
		if (_item isEqualTo "fuelE") exitWith {
			if (_value > 0) then {
                _pos = _unit modelToWorld[(random (2)),(random (2)),0];
                _pos = [(_pos select 0),(_pos select 1),0];
                _obj = "Land_CanisterFuel_F" createVehicle _pos;
                [[_obj],"life_fnc_simDisable",nil,true] spawn life_fnc_MP;
                _obj setPos _pos;
                _obj setVariable ["item",[_item,_value],true];
                missionNamespace setVariable [_itemName,0];
            };
		};
		if (_item isEqualTo "fuelF") exitWith {
			if (_value > 0) then {
                _pos = _unit modelToWorld[(random (2)),(random (2)),0];
                _pos = [(_pos select 0),(_pos select 1),0];
                _obj = "Land_CanisterFuel_F" createVehicle _pos;
                [[_obj],"life_fnc_simDisable",nil,true] spawn life_fnc_MP;
                _obj setPos _pos;
                _obj setVariable ["item",[_item,_value],true];
                missionNamespace setVariable [_itemName,0];
            };
		};
		if (_item isEqualTo "life_8cash") exitWith {
			if (CASH > 0) then {
                _pos = _unit modelToWorld[(random (2)),(random (2)),0];
                _pos = [(_pos select 0),(_pos select 1),0];
                _obj = "Land_Money_F" createVehicle _pos;
                [[_obj],"life_fnc_simDisable",nil,true] spawn life_fnc_MP;
                _obj setPos _pos;
                _obj setVariable ["item",["money",missionNamespace getVariable [_item,0]],true];
                missionNamespace setVariable ["CASH",0];
            };
		};
		if (_value > 0) then {
			_pos = _unit modelToWorld[(random (2)),(random (2)),0];
			_pos = [(_pos select 0),(_pos select 1),0];
			_obj = "Land_Suitcase_F" createVehicle _pos;
			[[_obj],"life_fnc_simDisable",nil,true] spawn life_fnc_MP;
			_obj setPos _pos;
			_obj setVariable ["item",[_item,_value],true];
			missionNamespace setVariable [_itemName,0];
		};
	};
} foreach (("true" configClasses (missionConfigFile >> "VirtualItems")) + ["life_8cash"]);