/*
Created by Mokomoko
Date: 04.08.2014
Related Forum Post: http://www.altisliferpg.com/topic/4812-tutorial-how-to-increase-the-fuel-usage/
*/
private["_vehicleToFuel","_velocityOfVehicle","_fuelConsumption"];
while{true} do
{
	_vehicleToFuel = (vehicle player);
	if(isEngineOn _vehicleToFuel && ((driver _vehicleToFuel) isEqualTo player) && !(_vehicleToFuel isKindOf "Air") && (_vehicleToFuel != player) ) then
	{
		_velocityOfVehicle = sqrt(((velocity _vehicleToFuel select 0)^2)+((velocity _vehicleToFuel select 1)^2))*3.6;
		_fuelConsumption = _velocityOfVehicle/150000 + 0.0001;
		if(_fuelConsumption > 0.002) then
		{
			_fuelConsumption = 0.002;
		};
		_vehicleToFuel setFuel ((fuel _vehicleToFuel)-_fuelConsumption);
		//h/int format["Benzinverbrauch: %1L/km",_fuelConsumption*10000/2];
		if(fuel _vehicleToFuel < 0.2 && fuel _vehicleToFuel > 0.18) then
		{
			//h/int "Dein Tank ist gleich leer, fahre schnell zur nächsten Tankstelle.";
			["Dein Tank ist gleich leer, fahre schnell zur nächsten Tankstelle.","YELLOW",5] spawn life_fnc_notification_system;
		}
		else
		{
			if(fuel _vehicleToFuel < 0.02) then
			{
				//h/int "Klopf, Klopf, Dein Tank ist jeden moment leer!";
				["Klopf, Klopf, Dein Tank ist jeden moment leer!","RED",5] spawn life_fnc_notification_system;
			};
		};
	};
	sleep 2;
};