waitUntil {!(isNull (findDisplay 46))};
disableSerialization;
_rscLayer = "osefStatusBar" call BIS_fnc_rscLayer;
_rscLayer cutRsc["osefStatusBar","PLAIN"];
private _civ = 0;
private _kartell = 0;
private _west = 0;
private _medic = 0;
0 spawn {
	for "_y" from 0 to 1 step 0 do
	{
		_west = 0;
		_medic = 0;
		_kartell = 0;
		_civ = 0;
		{
			if (side _x isEqualTo west) then {_west = _west + 1; };
			if (side _x isEqualTo independent) then { _medic = _medic + 1; };
			if (side _x isEqualTo civilian) then {
				if (name _x select [1,7] isEqualTo "Kartell") 
					then { _kartell = _kartell +1;} 
					else { _civ = _civ + 1; };
			};
		} count playableUnits > 0;
		uiSleep 5;
		((uiNamespace getVariable "osefStatusBar")displayCtrl 1000)ctrlSetText format["TS3: ts3.lostonparadise.de:11181 | Polizisten: %1 | Zivilisten: %2 | PRS: %3 | Kartell: %4", _west, _civ, _medic, _kartell];
	};
};