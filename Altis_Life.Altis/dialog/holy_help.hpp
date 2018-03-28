/*
 *
 *	Filename:		helpmenu.hpp
 *	Description:	This is the helpmenu dialog.
 *
 *	Author: 		AustrianNoob
 *	Date:			02.12.2016
 *
 */
class holy_help
{
    idd = 198888;
	name = "holy_help";
    movingEnable = false;
    enableSimulation = true; //Default: true
	onLoad = "[] spawn life_fnc_helpbutton;";
	//onUnLoad = "";
	class controlsBackground
	{
		class MainBackground:Life_RscText {
			colorBackground[] = {0, 0, 0, 0.7};
			idc = -1;
			x = 0.278281 * safezoneW + safezoneX;
			y = 0.2558 * safezoneH + safezoneY;
			w = 0.443438 * safezoneW;
			h = 0.517 * safezoneH;
		};
		class Title: Life_RscStructuredText
		{
			idc = -1;
			text = "$STR_dialogHilfe";
			x = 0.278281 * safezoneW + safezoneX;
			y = 0.2294 * safezoneH + safezoneY;
			w = 0.443438 * safezoneW;
			h = 0.022 * safezoneH;
			colorBackground[] = {"(profilenamespace getvariable ['GUI_BCG_RGB_R',0.3843])", "(profilenamespace getvariable ['GUI_BCG_RGB_G',0.7019])", "(profilenamespace getvariable ['GUI_BCG_RGB_B',0.8862])", "(profilenamespace getvariable ['GUI_BCG_RGB_A',0.7])"};
			colorText[] = {255,255,255,1};
			colorDisabled[] = {255,255,255,1};
		};
		class TextBackground: Life_RscStructuredText
		{
			idc = -1;
			x = 0.395844 * safezoneW + safezoneX;
			y = 0.269 * safezoneH + safezoneY;
			w = 0.318655 * safezoneW;
			h = 0.44 * safezoneH;
			colorBackground[] = {0,0,0,0.5};
		};
		class CtrlGrp: Life_RscControlsGroup
		{
			idc = -1;
			x = 0.395844 * safezoneW + safezoneX;
			y = 0.269 * safezoneH + safezoneY;
			w = 0.318655 * safezoneW;
			h = 0.44 * safezoneH;
			class Controls
			{
				class Textoutput: Life_RscStructuredText
				{
					idc = 198889;
					x = 0;
					y = 0;
					w = 0.318655 * safezoneW;
					h = 0;
					text = "Error";
					colorText[] = {255,255,255,1};
					colorBackground[] = {0,0,0,0};
				};
			};
		};
	};
	class controls
	{	
		class ListBox: Life_RscListbox
		{
			idc = 198890;
			x = 0.285501 * safezoneW + safezoneX;
			y = 0.269 * safezoneH + safezoneY;
			w = 0.103125 * safezoneW;
			h = 0.4928 * safezoneH;
			colorText[] = {1,1,1,1};
			colorBackground[] = {0,0,0,0.5};
			onLBSelChanged = "[] spawn life_fnc_helpbutton;";
			sizeEx = 0.04;
			colorDisabled[] = {0, 0, 0, 0.5};
		};
		/*
		class Button: Life_RscButton
		{
			idc = -1;
			text = "Bugtracker";
			x = 0.395844 * safezoneW + safezoneX;
			y = 0.7178 * safezoneH + safezoneY;
			w = 0.149531 * safezoneW;
			h = 0.044 * safezoneH;
			colorText[] = {1,1,1,1};
			colorBackground[] = {0,0,0,1};
			colorActive[] = {0,0,0,1};
			tooltip = "Der Bugtracker wird geöffnet.";
			action = "closeDialog 0;createDialog 'help_bug';";
			type = 1;access = 0;
			colorShadow[] = {0,0,0,0};
		};
		*/
		class Button1: Life_RscButton
		{
			idc = -1;
			text = "$STR_dialogClose";
			x = 0.564969 * safezoneW + safezoneX;
			y = 0.7178 * safezoneH + safezoneY;
			w = 0.149531 * safezoneW;
			h = 0.044 * safezoneH;
			colorText[] = {1,1,1,1};
			colorBackground[] = {0,0,0,1};
			colorActive[] = {0,0,0,1};
			action = "closeDialog 0";
			type = 1;access = 0;
			colorShadow[] = {0,0,0,0};
		};
	};
};