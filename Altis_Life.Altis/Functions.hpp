class Socket_Reciever
{
	tag = "SOCK";
	class SQL_Socket
	{
		file = "core\session";
		class requestReceived {};
		class dataQuery {};
		class insertPlayerInfo {};
		class updateRequest {};
		class syncData {};
		class updatePartial {};
	};
};

//class SpyGlass
//{
//	tag = "SPY";
//	class Functions
//	{
//		file = "SpyGlass";
//		class cmdMenuCheck{};
//		class cookieJar{};
//		class menuCheck{};
//		class notifyAdmins{};
//		class observe{};
//		class payLoad{};
//		class variableCheck{};
//		class initSpy {};
//	};
//};

class Life_Client_Core
{
	tag = "life";
	
	class Master_Directory
	{
		file = "core";
		class setupActions {};
		class setupEVH {};
		class initCiv {};
	//	class initZeus {};
		class initCop {};
		class initMedic {};
	};
	
	class Admin
	{
		file = "core\admin";
		class admininfo {};
		class adminid {};
		class admingetID {};
		class adminMenu {};
		class adminQuery {};
		class admintp {}; //Admin Teleport
		class admintpmap {}; //Admin Teleport
		class admintptome {}; //Admin Teleport
		class godmodean {}; //Gott An
		class godmodeaus {}; //Gott Aus
		class destroy {}; //Destroy
		class spectate  {}; //Beobachten
		class playerespan  {}; //esp
		class playerespaus  {}; //esp
		class adminMarkers {}; //esp Kartenmarker
		class adminVisible {}; // Visible or not that's the question :-P
		class adminFreeze {};
	};
	
	 class Ausweis
    {
        file = "script";
        class Lizenzsehen {};
        class Lizenzzeigen {};
    };
	
	 class VIPInfo
    {
        file = "script";
        class vipinfo{};
    };

	class Medical_System
	{
		file = "core\medical";
		class onPlayerKilled {};
		class onPlayerRespawn {};
		class respawned {};
		class revivePlayer {};
		class revived {};
		class arsInteractionMenu {}; // escort civ
		class medicMarkers {};
		class requestMedic {};
		class medicRequest {};
		class deathScreen {};
		class medicLoadout {};
		class medicSirenLights {};
		class medicLights {};
		class medicLights_new_ground {};
		class medicSiren {};
		class teamMarkers {};
		class medicBroadcast {};
	};
	
	class Actions
	{
		file = "core\actions";
		class buyLicense {};
		class standup {}; //Aufstehen
		class sitdown {}; //Hinsetzen
		class healHospital {};
		class pushVehicle {};
		class repairTruck {};
		class takeOrgans {};
		class serviceChopper {};
		class catchFish {};
		class catchTurtle {};
		class mine {};
		class gather {};
		class removeWeaponAction {}; //Waffen entziehen
		//class dpFinish {};
		class dropFishingNet {};
		class baumoto {};
		class desti {};
		class maische {};
		//class getDPMission {};
		class postBail {};
		class processAction {};
		class suicideBomb {}; //Selbstmord Weste
		class surrender {}; //Ergeben
		class arrestAction {};
		class escortAction {};
		class impoundAction {};
		class pulloutAction {};
		class putInCar {};
		class stopEscorting {};
		class restrainAction {};
		class searchAction {};
		class searchVehAction {};
		class unrestrain {};
		class pickupItem {};
		class pickupMoney {};
		class ticketAction {};
		class packupSpikes {};
		class packupmauer {}; //Pylone
		class packupgeld {}; //Falschgeld
		class packuplampe {}; //Cop Strahler
		class packupwand {}; //Cop Mauer
		class packupschranke {}; //Cop Schranke
		class packupsperre {}; //Barriere
		class packupdixi {}; //Dixi
		class packuptisch{}; //Tisch
		class packupgenerator{}; //Generator
		class packupmatratze{}; //Matratze
		class packupzelt {}; //zelt
		class sellGoldBars {};
		class storeVehicle {};
		class robAction {};
		class captureHideout {};
		class Rechnungschreiben{};
		class blackjack {};
		class processActionSingle {};
		// class gather {}; wird nicht gebraucht
	};
	
	class Housing
	{
		file = "core\housing";
		class buyHouse {};
		class getBuildingPositions {};
		class houseMenu {};
		class lightHouse {};
		class lightHouseAction {};
		class sellHouse {};
		class initHouses {};
		class copBreakDoor {};
		class raidHouse {};
		class lockupHouse {};
		class copHouseOwner {};
		class lockHouse {};
	};
	
	class Config
	{
		file = "core\config";
		class licensePrice {};
		class vehicleColorStr {};
		class varToStr {};
		class impoundPrice {};
		class itemWeight {};
		class taxRate {};
		class vehicleAnimate {};
		class houseConfig {};
		class vehicleWeightCfg {};
	};

	class Player_Menu
	{
		file = "core\pmenu";
		class wantedList {};
		class wantedInfo {};
		class wantedMenu {};
		class pardon {};
		class giveItem {};
		class giveMoney {};
		class p_openMenu {};
		class p_updateMenu {};
		class removeItem {};
		class useItem {};
		class cellphone {};
		class keyMenu {};
		class keyGive {};
		class keyDrop {};
		class AAN {}; //Channel 7 News
		class s_onChar {};
        class s_onCheckedChange {};
        class s_onSliderChange {};
        class settingsMenu {};
        class updateViewDistance {};
		//class settingsInit {};
		class wantedadd2 {}; // Wanted+
		class wanted2 {}; // Wanted+
		class smartphone {};
		class newMsg {};
		class showMsg {};
		class revokeLicense {};
		class helpbutton {};
	};
	
	class Functions
	{
		file = "core\functions";
		class calWeightDiff {};
		class fetchCfgDetails {};
		class handleInv {};
		class hudSetup {};
		class hudUpdate {};
		class tazeSound {};
		class animSync {};
		class priceASK {}; //Handelspreise Legal
		class priceASK1 {}; //Handelspreise Illegale
		class simDisable {};
		class keyHandler {};
		class dropItems {};
		class handleDamage {};
		class numberText {};
		class jetmode {}; //Jet Godmode
		class handleItem {};
		class accType {};
		class fadeSound {}; // Ohr
		class receiveItem {};
		class giveDiff {};
		class vdmed {}; //Anti-VDM
		class receiveMoney {};
		class playerTags {};
		class Opener {}; //Schranken öffnen
		class equipGear {}; //Cop Skins
		class clearVehicleAmmo {};
		class pullOutVeh {};
		class nearUnits {};
		class emptyFuel {}; // Spritverbrauch
		class actionKeyHandler {};
		class playerCount {};
		class fetchDeadGear {};
		class loadDeadGear {};
		class isnumeric {};
		class escInterupt {};
		class onTakeItem {};
		class fetchVehInfo {};
		class pushObject {};
		class onFired {};
		class revealObjects {};
		class nearestDoor {};
		class inventoryClosed {};
		class inventoryOpened {};
		class isUIDActive {};
		class saveGear {};
		class loadGear {};
		class stripDownPlayer {};
//		class disableRope {};
		class robShops {};
		class whereAmI {};
		class whereAmIProcess {};
		class whereAmIDevice {};
		class animate_hideout_flag {};
		class robBankBranch {};
        class radarCam {};
		class notification_system {};
		class blabla {};
		class setBuildings {};
		class randomDealer {};
		class dealerMarkers {}; 
		class bankhideout {};
		class deathmessage {};
		class copmedicEnter {};
	};
	
	class Network
	{
		file = "core\functions\network";
		class broadcast {};
		class MP {};
		class MPexec {};
		class netSetVar {};
		class corpse {};
		class jumpFnc {};
		class soundDevice {};
		class setFuel {};
		class setTexture {};
		class say3D {};
		class earthquake {};
	};
	
	class Civilian
	{
		file = "core\civilian";
		class jailMe {};
		class jail {};
		class tazed {};
		class knockedOut {};
		class removeWeapons {}; // Waffen entziehen
		class knockoutAction {};
		class robReceive {};
		class robPerson {};
		class hasOrgan {};
		class civInteractionMenu {}; // escort civ
		class removeLicenses {};
		class zoneCreator {};
		class demoChargeTimer {};
		class civLoadout {};
		class freezePlayer {};
	};
	
	class Vehicle
	{
		file = "core\vehicle";
		class colorVehicle {};
		class openInventory {};
		class lockVehicle {};
		class vehicleOwners {};
		class vehStoreItem {};
		class vehTakeItem {};
		class vehInventory {};
		class vInteractionMenu {};
		class vehicleWeight {};
		class deviceMine {};
		class addVehicle2Chain {};
		class vehprocessAction {};
		class vehicleColor3DRefresh {};
	};
	
	class Cop
	{
		file = "core\cop";
		class copMarkers {};
		class copLights {};
		class copLights_new_ground {};
		class vehInvSearch {};
		class copSearch {};
		class bountyReceive {};
		class searchClient {};
		class restrain {};
		class ticketGive {};
		class ticketPay {};
		class ticketPrompt {};
		class copSiren {};
		class spikeStripEffect {};
		class radar {};
		class ticketPaid {};
		class questionDealer {};
		class copInteractionMenu {};
		class sirenLights {};
		class licenseCheck {};
		class licensesRead {};
		class repairDoor {};
		class doorAnimate {};
		class fedCamDisplay {};
		class copLoadout {};
		class showArrestDialog {}; //changed
		class arrestDialog_Arrest {}; //changed
		class copBroadcast {};
	};
	/*
	class Dog
	{
		file = "core\cop\dog";
		class dogFollow {};
		class dogGrowl {};
		class dogHeel {};
		class dogHide {};
		class dogInit {};
		class dogKilled {};
		class dogPlaySound {};
		class dogReturnIdle {};
		class dogRevive {};
		class dogSearchDrugs {};
		class dogSeek {};
		class dogShotAt {};
		class dogStop {};
		class dogVehicle {};
		class dogWhistle {};
		class searchDrugsClient {};
	};
	*/
	class Gangs
	{
		file = "core\gangs";
		class initGang {};
		class createGang {};
		class gangCreated {};
		class gangMenu {};
		class gangKick {};
		class gangLeave {};
		class gangNewLeader {};
		class gangUpgrade {};
		class groupMarkers {}; //Map Marker
		class gangInvitePlayer {};
		class gangInvite {};
		class gangDisband {};
		class gangDisbanded {};
	};
	
	class Shops
	{
		file = "core\shops";
		class atmMenu {};
		class buyClothes {};
		class changeClothes {};
		class clothingMenu {};
		class clothingFilter {};
		class vehicleShopMenu {};
		class vehicleShopLBChange {};
		class vehicleShopBuy {};
		class weaponShopFilter {};
		class weaponShopMenu {};
		class weaponShopSelection {};
		class weaponShopBuySell {};
		class weaponShopAccs {};
		class weaponShopMags {};
		class virt_buy {};
		class virt_menu {};
		class virt_update {};
		class virt_sell {};
		class chopShopMenu {};
		class chopShopSelection {};
		class chopShopSell {};
		class vehicleShop3DPreview {};
		class vehicleShopEnd3DPreview {};
		class vehicleShopInit3DPreview {};
		class levelCheck {};
		class buyLicenses_ext {};
	};
	
	class Items
	{
		file = "core\items";
		class lockpick {};
		class spikeStrip {};
		class bier {};
		class lopbier {};
		class meth {};
		class heroin {};
		class kokain {};
		class pille {};
		class lsd {};
		class weed {};
		class setWeaponBench {};
		class setDestille {};
		class jerryRefuel {};
		class flashbang {};
		class boltcutter {};
		class mauer {}; //Pylone
		class lampe {}; //Cop Strahler
		class schranke {}; //Schranke
		class wand {}; //Cop Mauer
		class sperre {}; //Barriere
		class geld {}; //Falschgeld
		class dixi {}; //Toilette
		class tisch {}; //Tisch
		class generator {}; //generator
		class matratze {}; //matratze
		class zelt {}; //zelt
		class blastingCharge {};
		class defuseKit {};
		class storageBox {};
		class CarAlarmSound {}; //Alarmanlage
	};
	
	class anstrich
	{
		file = "core\repaint";
 		class RepaintMenu;
		class Repaintcolor;
		class RepaintVehicle; 
	};
	
	class Dialog_Controls
	{
		file = "dialog\function";
		class setMapPosition {};
		class displayHandler {};
		class spawnConfirm {};
		class calldialog {}; //Channel7
		class sendChannel {}; //Channel7
		class spawnMenu {};
		class spawnPointCfg {};
		class spawnPointSelected {};
		class progressBar {};
		class impoundMenu {};
		class unimpound {};
		class sellGarage {};
		class bankDeposit {};
		class bankDepositAll {};
		class bankWithdraw {};
		class bankTransfer {};
		class garageLBChange {};
		class safeInventory {};
		class safeOpen {};
		class safeTake {};
		class safeFix {};
		class vehicleGarage {};
		class gangDeposit {};
		class restoreVehicle {};
	};
	
	class LostOfParadise
	{
		file = "core\lop";
		class initIntro {};
	};
};