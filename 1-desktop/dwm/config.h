/* See LICENSE file for copyright and license details. */
/* appearance */

static const unsigned int borderpx  	 = 2;        /* border pixel of windows */
static const unsigned int gappx     	 = 10;	     /* gaps between windows */
static const unsigned int snap      	 = 12;       /* snap pixel */
static const unsigned int systraypinning = 0;        /* 0: sloppy systray follows selected monitor, >0: pin systray to monitor X */
static const unsigned int systrayspacing = 2;        /* systray spacing */
static const int systraypinningfailfirst = 1;        /* 1: if pinning fails, display systray on the first monitor, False: display systray on the last monitor*/
static const int showsystray        	 = 1;        /* 0 means no systray */
static const int showbar            	 = 0;        /* 0 means no bar */
static const int topbar             	 = 1;        /* 0 means bottom bar */
static const char *fonts[]          	 = { "DroidSansMono Nerd Font:size=14" };
static const char dmenufont[]       	 = "monospace:size=10";
static const char col_gray1[]       	 = "#222222";
static const char col_gray2[]       	 = "#444444";
static const char col_gray3[]         	 = "#bbbbbb";
static const char col_gray4[]       	 = "#eeeeee";
static const char col_cyan[]          	 = "#005577";
static const char *colors[][3]      	 = {
	/*               fg         bg         border   */
	[SchemeNorm] = { col_gray3, col_gray1, col_gray2 },
	[SchemeSel]  = { col_gray4, col_cyan,  "#D0D0D0" },
};

/* tagging */
static const char *tags[] = { "", "", "", "", "", "", "", "", "", "" };

static const Rule rules[] = {
	/* xprop(1):
	 *	WM_CLASS(STRING) = instance, class
	 *	WM_NAME(STRING) = title
	 */
	/* class      		instance    title        tags mask     iscentered	isfloating   monitor */
	{ "St",     			NULL,       NULL,        0,            1,		0,           -1 },
	{ "Gimp",     			NULL,       NULL,        0,            1,		1,           -1 },
	{ "qjackctl",  			NULL,       NULL,        0,            1,		1,           -1 },
	{ "jetbrains-studio",   NULL,       NULL,        1 << 1,       1,		1,           -1 },
	{ "Firefox",  			NULL,       NULL,        1 << 2,       1,		0,           -1 },
	{ "Surf",    			NULL,       NULL,        1 << 2,       1,		0,           -1 },
	{ "qutebrowser",		NULL,       NULL,        1 << 2,       1,		0,           -1 },
	{ "tabbed",   			NULL,       NULL,        1 << 2,       1,		0,           -1 },
	{ "Lutris",   			NULL,       NULL,        1 << 3,       1,		0,           -1 },
	{ "Wine",   			NULL,       NULL,        1 << 3,       1,		1,           -1 },
	{ "Steam",   			NULL,       NULL,        1 << 3,       1,		0,           -1 },
	{ "Pavucontrol",		NULL,       NULL,        1 << 4,       1,		0,           -1 },
	{ "mpv",				NULL,       NULL,        1 << 7,       1,		0,           -1 },
	{ "discord",			NULL,       NULL,        1 << 9,       1,		0,           -1 },
	{ NULL,	      			NULL,       "neomutt",   1 << 8,       1,		0,           -1 },
	{ NULL,   				NULL,       "ncmpcpp",   1 << 7,       0,		0,           -1 },
	{ NULL,	      			NULL,       "calcurse",  1 << 6,       0,		0,           -1 },
	{ NULL,	     		 	NULL,       "newsboat",  1 << 5,       0,		0,           -1 },
	{ NULL,	     		 	NULL,       "pulsemixer",1 << 4,       0,		0,           -1 },
};

/* layout(s) */
static const float mfact     = 0.55; /* factor of master area size [0.05..0.95] */
static const int nmaster     = 1;    /* number of clients in master area */
static const int resizehints = 0;    /* 1 means respect size hints in tiled resizals */

#include "fibonacci.c"
static const Layout layouts[] = {
	/* symbol     arrange function */
 	{ "[]=",      tile },
	{ "><>",      NULL },    /* no layout function means floating behavior */
	{ "[M]",      monocle },
 	{ "[@]",      spiral },
	{ "[\\]",     dwindle },    /* first entry is default */
};

/* key definitions */
#define MODKEY Mod4Mask
#define TAGKEYS(KEY,TAG) \
	{ MODKEY,                       KEY,      view,           {.ui = 1 << TAG} }, \
	{ MODKEY|ControlMask,           KEY,      toggleview,     {.ui = 1 << TAG} }, \
	{ MODKEY|ShiftMask,             KEY,      tag,            {.ui = 1 << TAG} }, \
	{ MODKEY|ControlMask|ShiftMask, KEY,      toggletag,      {.ui = 1 << TAG} },

/* helper for spawning shell commands in the pre dwm-5.0 fashion */
#define SHCMD(cmd) { .v = (const char*[]){ "/bin/sh", "-c", cmd, NULL } }

/* commands */
static char dmenumon[2] = "0"; /* component of dmenucmd, manipulated in spawn() */
static const char *dmenucmd[]	 = { "dmenu_run", "-m", dmenumon, "-fn", dmenufont, "-nb", col_gray1, "-nf", col_gray3, "-sb", col_cyan, "-sf", col_gray4, NULL };
static const char *roficmd[]   	 = { "rofi", "-show","run", "-lines", "15","-width", "60", "-padding", "50", "-columns", "3", "-font", "NotoSans 14", "-scroll-method", "1", NULL };
static const char *termcmd[]   	 = { "st", NULL };
static const char *qbcmd[]  	 = { "qutebrowser", NULL };
static const char *lutriscmd[] 	 = { "lutris", NULL };
static const char *lockcmd[]	 = { "i3lock-fancy", NULL };
static const char *backlinccmd[] = { "xbacklight", "-inc", "10", NULL };
static const char *backldeccmd[] = { "xbacklight", "-dec", "10", NULL };
// static const char *volupcmd[] 	 = { "amixer", "set", "Master", "5%+", NULL };
// static const char *voldowncmd[]	 = { "amixer", "set", "Master", "5%-", NULL };
// static const char *volmutecmd[]	 = { "amixer", "set", "Master", "toggle", NULL };
static const char *volupcmd[] 	 = { "pactl", "set-sink-volume", "1", "+5%", NULL };
static const char *voldowncmd[]	 = { "pactl", "set-sink-volume", "1", "-5%", NULL };
static const char *volmutecmd[]	 = { "pactl", "set-sink-mute", "1", "toggle", NULL };
static const char *refbarcmd[]	 = { "refbar", NULL };
static const char *rangercmd[]	 = { "st", "-e", "ranger", NULL };

#include "movestack.c"
#include "focusurgent.c"
#include <X11/XF86keysym.h>

static Key keys[] = {
	/* modifier             key 	 					function			argument */
	{ MODKEY,    	      	XK_p,     					spawn,				{.v = roficmd } },
	{ MODKEY,				XK_Return, 					spawn,				{.v = termcmd } },
	{ MODKEY|ShiftMask,		XK_l,	   					spawn,				{.v = lockcmd } },
	{ MODKEY,				XK_1,	   					spawn,				{.v = rangercmd } },
	{ MODKEY,				XK_3,	   		   			spawn,				{.v = qbcmd } },
	{ MODKEY,				XK_4,	   		   			spawn,				{.v = lutriscmd } },
	{ MODKEY,               XK_Escape, 		  			togglebar,			{0} },
	{ MODKEY,               XK_j,      		  			focusstack,			{.i = +1 } },
	{ MODKEY,               XK_k,      		  			focusstack,			{.i = -1 } },
	{ MODKEY,               XK_i,      		  			incnmaster,			{.i = +1 } },
	{ MODKEY,               XK_d,      		  			incnmaster,			{.i = -1 } },
	{ MODKEY,               XK_h,      		  			setmfact,			{.f = -0.05} },
	{ MODKEY,               XK_l,      		  			setmfact,			{.f = +0.05} },
	{ MODKEY|ShiftMask,     XK_j,      		  			movestack,			{.i = +1 } },
	{ MODKEY|ShiftMask,     XK_k,      		  			movestack,			{.i = -1 } },
	{ MODKEY|ShiftMask,     XK_Return, 		  			zoom,				{0} },
	{ Mod1Mask,             XK_Tab,    		  			view,				{0} },
	{ MODKEY,				XK_q,      		  			killclient,			{0} },
	{ MODKEY,	        	XK_s,      		  			setlayout,			{.v = &layouts[0]} },
	{ MODKEY,               XK_m,	   		  			setlayout,			{.v = &layouts[1]} },
	{ MODKEY,               XK_f,      		  			setlayout,			{.v = &layouts[2]} },
	{ MODKEY|ShiftMask,     XK_m,      		  			setlayout,			{.v = &layouts[3]} },
	{ MODKEY|ShiftMask,     XK_s,	   		  			setlayout,			{.v = &layouts[4]} },
	{ MODKEY|ShiftMask,     XK_space,  		  			setlayout,			{0} },
	{ MODKEY,             	XK_space,  		  			togglefloating,		{0} },
	{ MODKEY,               XK_F12,     				view,				{.ui = ~0 } },
	{ MODKEY|ShiftMask,     XK_F12,      				tag,				{.ui = ~0 } },
	{ MODKEY,               XK_comma,  		   			focusmon,			{.i = -1 } },
	{ MODKEY,               XK_period, 		   			focusmon,			{.i = +1 } },
	{ MODKEY|ShiftMask,     XK_comma,  		   			tagmon,				{.i = -1 } },
	{ MODKEY|ShiftMask,     XK_period, 		   			tagmon,				{.i = +1 } },
	{ MODKEY,     			XK_minus, 		   			setgaps,			{.i = -5 } },
	{ MODKEY,     			XK_equal, 		   			setgaps,			{.i = +5 } },
	{ MODKEY|ShiftMask,		XK_equal, 		   			setgaps,			{.i = 0 } },
	{ 0,					XF86XK_MonBrightnessUp,		spawn,				{.v = backlinccmd } },
	{ 0,					XF86XK_MonBrightnessDown,	spawn,				{.v = backldeccmd } },
	{ 0,	 				XF86XK_AudioRaiseVolume,	spawn,				{.v = volupcmd } },
	{ 0, 					XF86XK_AudioLowerVolume,	spawn,				{.v = voldowncmd } },
	{ 0, 					XF86XK_AudioMute,			spawn,				{.v = volmutecmd } },
	{ Mod1Mask,				XK_Shift_L,					spawn,				{.v = refbarcmd } },
	TAGKEYS(                XK_F1,						0)
	TAGKEYS(                XK_F2,						1)
	TAGKEYS(                XK_F3,						2)
	TAGKEYS(                XK_F4,						3)
	TAGKEYS(                XK_F5,						4)
	TAGKEYS(                XK_F6,						5)
	TAGKEYS(                XK_F7,						6)
	TAGKEYS(                XK_F8,						7)
	TAGKEYS(                XK_F9,						8)
	TAGKEYS(                XK_F10,						9)
	TAGKEYS(                XK_3,						2)
	TAGKEYS(                XK_4,						3)
	{ MODKEY,               XK_u,						focusurgent,		{0} },
	{ MODKEY|ShiftMask,     XK_e,						quit,				{0} },
};

/* button definitions */
/* click can be ClkTagBar, ClkLtSymbol, ClkStatusText, ClkWinTitle, ClkClientWin, or ClkRootWin */
static Button buttons[] = {
	/* click                event mask      button          function        argument */
	{ ClkLtSymbol,          0,              Button1,        setlayout,      {0} },
	{ ClkLtSymbol,          0,              Button3,        setlayout,      {.v = &layouts[2]} },
	{ ClkWinTitle,          0,              Button2,        zoom,           {0} },
	{ ClkStatusText,        0,              Button2,        spawn,          {.v = termcmd } },
	{ ClkClientWin,         MODKEY,         Button1,        movemouse,      {0} },
	{ ClkClientWin,         MODKEY,         Button2,        togglefloating, {0} },
	{ ClkClientWin,         MODKEY,         Button3,        resizemouse,    {0} },
	{ ClkTagBar,            0,              Button1,        view,           {0} },
	{ ClkTagBar,            0,              Button3,        toggleview,     {0} },
	{ ClkTagBar,            MODKEY,         Button1,        tag,            {0} },
	{ ClkTagBar,            MODKEY,         Button3,        toggletag,      {0} },
};

