/////////////////////////////////////////////////////////////////
/////////// This File was Edited by GUI D3V by Shinji ///////////
/////////////////////////////////////////////////////////////////
class life_weapon_shop {
   idd = 38400;
   name = "life_weapon_shop";
   movingenable = 0;
   enablesimulation = 1;
   class controlsBackground
   {
       class RscTitleBackground : Life_RscText
       {
           colorbackground[] = {"(profilenamespace getvariable ['GUI_BCG_RGB_R',0.3843])", "(profilenamespace getvariable ['GUI_BCG_RGB_G',0.7019])", "(profilenamespace getvariable ['GUI_BCG_RGB_B',0.8862])", "(profilenamespace getvariable ['GUI_BCG_RGB_A',0.7])"};
           idc = -1;
           x = 0.1;
           y = 0.2;
           w = 0.26 * safezoneW;
           h = (1 / 25);
       };
       class MainBackground : Life_RscText
       {
           colorbackground[] = {0,0,0,0.7};
           idc = -1;
           x = 0.1;
           y = 0.2 + (11 / 250);
           w = 0.26 * safezoneW;
           h = 0.6 - (22 / 250);
       };
       class Title : Life_RscTitle
       {
           colorbackground[] = {0,0,0,0};
           idc = 38401;
           text = "";
           x = 0.1;
           y = 0.2;
           w = 0.26 * safezoneW;
           h = (1 / 25);
       };
       class itemInfo : Life_RscStructuredText
       {
           idc = 38404;
           sizeex = 0.035;
           x = 0.11;
           y = 0.68;
           w = 0.26 * safezoneW;
           h = 0.2;
       };
       class FilterList : Life_RscCombo
       {
           idc = 38402;
           onlbselchanged = "_this call life_fnc_weaponShopFilter";
           x = 0.11;
           y = 0.64;
           w = 0.26 * safezoneW;
       };
   };
   class controls
   {
       class itemList : Life_RscListBox
       {
           idc = 38403;
           onlbselchanged = "_this call life_fnc_weaponShopSelection";
           sizeex = 0.035;
           x = 0.11;
           y = 0.25;
           w = 0.26 * safezoneW;
           h = 0.38;
       };
       class ButtonBuySell : Life_RscButtonMenu
       {
           idc = 38405;
           text = "$STR_Global_Buy";
           onbuttonclick = "[] spawn life_fnc_weaponShopBuySell; true";
           x = 0.1;
           y = 0.8 - (1 / 25);
           w = (6.25 / 40);
           h = (1 / 25);
       };
       class ButtonClose : Life_RscButtonMenu
       {
           text = "$STR_Global_Close";
           onbuttonclick = "closeDialog 0;";
           x = 0.3 * safezoneW - (6.25 / 40);
           y = 0.8 - (1 / 25);
           w = (6.25 / 40);
           h = (1 / 25);
           idc = 1000;
       };
       class ButtonMags : Life_RscButtonMenu
       {
           idc = 38406;
           text = "$STR_Global_Mags";
           onbuttonclick = "_this call life_fnc_weaponShopMags; _this call life_fnc_weaponShopFilter";
           x = 0.1;
           y = 0.8 + (1 / 250 / (safezoneW / safezoneH));
           w = (6.25 / 40);
           h = (1 / 25);
       };
       class ButtonAccs : Life_RscButtonMenu
       {
           idc = 38407;
           text = "$STR_Global_Accs";
           onbuttonclick = "_this call life_fnc_weaponShopAccs; _this call life_fnc_weaponShopFilter";
           x = 0.3 * safezoneW - (6.25 / 40);
           y = 0.8 + (1 / 250 / (safezoneW / safezoneH));
           w = (6.25 / 40);
           h = (1 / 25);
       };
   };
};
/////////////////////////////////////////////////////////////////
////////////////////////// FILE END /////////////////////////////
/////////////////////////////////////////////////////////////////
