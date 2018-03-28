/*
	File: fn_restrain.sqf
	Author: Bryan "Tonic" Boardwine
	
	Description:
	Retrains the client.
*/
private["_cop","_player"];
_cop = [_this,0,Objnull,[Objnull]] call BIS_fnc_param;
if(isNull _cop) exitWith {};

//Monitor excessive restrainment
[] spawn
{
	private["_time"];
	while {true} do
	{
		_time = time;
		waitUntil {(time - _time) > (30 * 60)};
		
		if(!(player getVariable["Re-strained",FALSE])) exitWith {};
		if(!([west,getPos player,30] call life_fnc_nearUnits) && (player getVariable["Re-strained",FALSE]) && vehicle player isEqualTo player) exitWith {
			player setVariable["Re-strained",FALSE,TRUE];
			player setVariable["Escorting",FALSE,TRUE];
			player setVariable["transporting",false,true];
			detach player;
			[localize "STR_Cop_ExcessiveRestrain","PINK",5] spawn life_fnc_notification_system;
		};
	};
};

[format[localize "STR_Cop_Retrained",_cop getVariable["realname",name _cop]],"PINK",5] spawn life_fnc_notification_system;
player say3D "cuff";
private _timer = false;
while {player getVariable "Re-strained"} do
{
	//player setVariable ["oldGroup",group player];
	//[player] joinSilent grpNull;
	if(vehicle player isEqualTo player) then {
		player playMove "AmovPercMstpSnonWnonDnon_Ease";
		player allowDamage false;
		
	};
	_state = vehicle player;
	waitUntil {animationState player != "AmovPercMstpSnonWnonDnon_Ease" || !(player getvariable "Re-strained") || vehicle player != _state || !alive _cop};
			
	if(!alive player) exitWith
	{
		player setVariable ["Re-strained",false,true];
		player setVariable ["Escorting",false,true];
		player setVariable ["transporting",false,true];
		detach player;
	};
	
	if(!alive _cop) then {
		_run = [] spawn {
			sleep 5*60;
			if (player getVariable "Re-strained") exitWith {
				player setVariable ["Re-strained",false,true];
				player switchMove "AmovPercMstpSlowWrflDnon_SaluteIn";
				player setVariable ["Escorting",false,true];
				player setVariable ["transporting",false,true];
				player allowDamage true;
				detach player;
			};
		};
	};
	
	if(vehicle player != player) then
	{
		//disableUserInput true;
		if(driver (vehicle player) isEqualTo player) then {player action["eject",vehicle player];};
	};
};

//disableUserInput false;
if(alive player) then
{
	player switchMove "AmovPercMstpSlowWrflDnon_SaluteIn";
	player setVariable ["Escorting",false,true];
	player setVariable ["transporting",false,true];
	player allowDamage true;
	detach player;
	//_oldgroup = player getVariable ["oldGroup",group player];
	//player setVariable ["oldGroup",nil];
	//[player] joinSilent grpNull;
};