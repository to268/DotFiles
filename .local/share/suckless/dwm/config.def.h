/* See LICENSE file for copyright and license details. */

/* appearance */
static const unsigned int borderpx  = 1;        /* border pixel of windows */
static const unsigned int gappx     = 4;        /* gaps between windows */
static const unsigned int snap      = 32;       /* snap pixel */
static const int swallowfloating    = 0;        /* 1 means swallow floating windows by default */
static const int showbar            = 1;        /* 0 means no bar */
static const int topbar             = 1;        /* 0 means bottom bar */
static const char *fonts[]          = { "mono:pixelsize=13;1:antialias=true:autohint=true", "Noto Color Emoji:scale=0.85:style=Regular;2:antialias=true:autohint=true" };
static const char dmenufont[]       = "mono:pixelsize=13;1:antialias=true:autohint=true";
static const char col_gray1[]       = "#3c3836";
static const char col_gray2[]       = "#504945";
static const char col_white1[]      = "#ebdbb2";
static const char col_white2[]      = "#fbf1c7";
static const char col_orange[]      = "#fe8019";
static const char col_red[]         = "#fb4934";
static const char *colors[][3]      = {
	/*               fg         bg         border   */
	[SchemeNorm] = { col_white1, col_gray1, col_gray2 },
	[SchemeSel]  = { col_white2, col_red,  col_orange },
};

/* tagging */
static const char *tags[] = { "1", "2", "3", "4", "5", "6", "7", "8", "9", "10" };

static const Rule rules[] = {
	/* xprop(1):
	 *	WM_CLASS(STRING) = instance, class
	 *	WM_NAME(STRING) = title
	 */
	/* class     instance  title           tags mask  isfloating  isterminal  noswallow  monitor */
	{ "Gimp",    NULL,     NULL,           1 << 8,    0,          0,           1,        -1 },
	{ "Firefox", NULL,     NULL,           1 << 8,    0,          0,           0,        -1 },
	{ "St",      NULL,     NULL,           0,         0,          1,           0,        -1 },
	{ NULL,      NULL,     "Event Tester", 0,         0,          0,           1,        -1 }, /* xev */
};

/* layout(s) */
static const float mfact     = 0.50; /* factor of master area size [0.05..0.95] */
static const int nmaster     = 1;    /* number of clients in master area */
static const int resizehints = 1;    /* 1 means respect size hints in tiled resizals */
static const int lockfullscreen = 1; /* 1 will force focus on the fullscreen window */

#include "tcl.c"
#include "fibonacci.c"
#include "grid.c"

static const Layout layouts[] = {
	/* symbol     arrange function */
	{ "[]=",      tile },    /* first entry is default */
	{ "><>",      NULL },    /* no layout function means floating behavior */
	{ "[M]",      monocle },
	{ "HHH",      grid },
	{ "|||",      tcl },
 	{ "[@]",      spiral },
 	{ "[\\]",      dwindle },
	{ NULL,       NULL },
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
static const char *dmenucmd[] = { "dmenu_run", "-m", dmenumon, "-fn", dmenufont, "-nb", col_gray1, "-nf", col_white1, "-sb", col_red, "-sf", col_white2, NULL };
static const char *termcmd[]  = { "st", NULL };

static Key keys[] = {
	/* modifier                     key        function        argument */
	{ MODKEY,                       XK_d,      spawn,          {.v = dmenucmd } },
	{ MODKEY,                       XK_Return, spawn,          {.v = termcmd } },
	{ MODKEY,                       XK_b,      togglebar,      {0} },
	{ MODKEY,                       XK_j,      focusstack,     {.i = +1 } },
	{ MODKEY,                       XK_k,      focusstack,     {.i = -1 } },
	{ MODKEY|ShiftMask,             XK_j,      rotatestack,    {.i = +1 } },
	{ MODKEY|ShiftMask,             XK_k,      rotatestack,    {.i = -1 } },
	{ MODKEY,                       XK_i,      incnmaster,     {.i = +1 } },
	{ MODKEY|ShiftMask,             XK_d,      incnmaster,     {.i = -1 } },
	{ MODKEY,                       XK_h,      setmfact,       {.f = -0.05} },
	{ MODKEY,                       XK_l,      setmfact,       {.f = +0.05} },
	{ MODKEY,                       XK_Tab,    view,           {0} },
	{ MODKEY,                       XK_c,      killclient,     {0} },
	{ MODKEY,                       XK_t,      setlayout,      {.v = &layouts[0]} },
	{ MODKEY|ShiftMask,             XK_t,      setlayout,      {.v = &layouts[4]} },
	{ MODKEY,                       XK_f,      setlayout,      {.v = &layouts[1]} },
	{ MODKEY,                       XK_g,      setlayout,      {.v = &layouts[3]} },
	{ MODKEY,                       XK_m,      setlayout,      {.v = &layouts[2]} },
	{ MODKEY,                       XK_r,      setlayout,      {.v = &layouts[5]} },
	{ MODKEY|ShiftMask,             XK_r,      setlayout,      {.v = &layouts[6]} },
	{ MODKEY|ControlMask,           XK_comma,  cyclelayout,    {.i = -1 } },
	{ MODKEY|ControlMask,           XK_period, cyclelayout,    {.i = +1 } },
	{ MODKEY|ShiftMask,             XK_f,      fullscreen,     {0} },
 	{ MODKEY,                       XK_space,  zoom,           {0} },
	{ MODKEY|ControlMask,           0x29,      view,           {.ui = ~0 } },
	{ MODKEY|ShiftMask,             0x29,      tag,            {.ui = ~0 } },
	{ MODKEY,                       0x70, focusmon,            {.i = -1 } },
	{ MODKEY,                       0x6e, focusmon,            {.i = +1 } },
	{ MODKEY|ShiftMask,             0x50,  tagmon,             {.i = -1 } },
	{ MODKEY|ShiftMask,             0x4e,  tagmon,             {.i = +1 } },
	{ MODKEY|ShiftMask,             0xff55,  setgaps,          {.i = -1 } },
	{ MODKEY|ShiftMask,             0xff56,  setgaps,          {.i = +1 } },
	{ MODKEY|ShiftMask,             0x3d,    setgaps,          {.i = 0  } },
	{ MODKEY|ControlMask,           0xff55,  setborderpx,      {.i = -1 } },
	{ MODKEY|ControlMask,           0xff56,  setborderpx,      {.i = +1 } },
	{ MODKEY|ControlMask,           0x3d, 	 setborderpx,      {.i = 0 } },
    /* Azerty
	TAGKEYS(                        0x26,                      0)
 	TAGKEYS(                        0xe9,                      1)
 	TAGKEYS(                        0x22,                      2)
 	TAGKEYS(                        0x27,                      3)
 	TAGKEYS(                        0x28,                      4)
 	TAGKEYS(                        0x2d,                      5)
 	TAGKEYS(                        0xe8,                      6)
 	TAGKEYS(                        0x5f,                      7)
 	TAGKEYS(                        0xe7,                      8)
 	TAGKEYS(                        0xe0,                      9)
    */
    /* True Dvorak */
	TAGKEYS(                        0x26,                      0)
 	TAGKEYS(                        0x5b,                      1)
 	TAGKEYS(                        0x7b,                      2)
 	TAGKEYS(                        0x28,                      3)
 	TAGKEYS(                        0x2b,                      4)
 	TAGKEYS(                        0x3d,                      5)
 	TAGKEYS(                        0x29,                      6)
 	TAGKEYS(                        0x7d,                      7)
 	TAGKEYS(                        0x5d,                      8)
 	TAGKEYS(                        0x2a,                      9)
	{ MODKEY|ShiftMask,             XK_q,      quit,           {0} },
};

/* button definitions */
/* click can be ClkTagBar, ClkLtSymbol, ClkStatusText, ClkWinTitle, ClkClientWin, or ClkRootWin */
static Button buttons[] = {
	/* click                event mask      button          function        argument */
	{ ClkLtSymbol,          0,              Button1,        setlayout,      {0} },
	{ ClkLtSymbol,          0,              Button3,        setlayout,      {.v = &layouts[2]} },
	{ ClkStatusText,        0,              Button2,        spawn,          {.v = termcmd } },
	{ ClkClientWin,         MODKEY,         Button1,        movemouse,      {0} },
	{ ClkClientWin,         MODKEY,         Button2,        togglefloating, {0} },
	{ ClkClientWin,         MODKEY,         Button3,        resizemouse,    {0} },
	{ ClkTagBar,            0,              Button1,        view,           {0} },
	{ ClkTagBar,            0,              Button3,        toggleview,     {0} },
	{ ClkTagBar,            MODKEY,         Button1,        tag,            {0} },
	{ ClkTagBar,            MODKEY,         Button3,        toggletag,      {0} },
};
