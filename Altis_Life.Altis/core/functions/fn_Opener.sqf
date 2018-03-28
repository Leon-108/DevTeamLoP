{
	if (typeOf _x isEqualTo "Land_BarGate_F") then {
		if (_x animationPhase "Door_1_rot" isEqualTo 1) then {
			_x animate ["Door_1_rot", 0];
		}else{
			_x animate ["Door_1_rot", 1];
		};
	};
	if (typeOf _x in ["Land_ConcreteWall_01_l_gate_F","Land_ConcreteWall_01_m_gate_F"]) then {
		if (_x animationPhase "Door_1_move" isEqualTo 1) then {
			_x animate ["Door_1_move", 0];
		}else{
			_x animate ["Door_1_move", 1];
		};
	};
} forEach (nearestObjects [player, ["Land_BarGate_F","Land_ConcreteWall_01_l_gate_F","Land_ConcreteWall_01_m_gate_F"], 25]); //25 bedeutet ab einer nähe von 25 Metern zur Schranke, kann belibig geändert werden