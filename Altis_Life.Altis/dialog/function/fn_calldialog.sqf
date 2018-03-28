/*
	File: fn_calldialog.sqf
	Author: alleskapot & Lifted
	Thanks again for all the help alleskapot!
	Description:
	Calls the Dialog.
    
*/
if(!createDialog "channel") exitWith {
	//h/int "Failed Creating Dialog"; //Couldn't create the menu?
	["Failed Creating Dialog","RED",10] spawn life_fnc_notification_system; //Couldn't create the menu?
}; 
disableSerialization;