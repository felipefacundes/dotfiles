/* See LICENSE file for copyright and license details. */

/* appearance */
static const unsigned int borderpx  = 1;        /* border pixel of windows */
static const unsigned int snap      = 32;       /* snap pixel */
static const int showbar            = 1;        /* 0 means no bar */
static const int topbar             = 1;        /* 0 means bottom bar */
static const char *fonts[]          = { "monospace:size=10" };
static const char dmenufont[]       = "monospace:size=10";
static const char col_gray1[]       = "#222222";
static const char col_gray2[]       = "#444444";
static const char col_gray3[]       = "#bbbbbb";
static const char col_gray4[]       = "#eeeeee";
static const char col_green1[]       = "#6cff00";
static const char col_cyan1[]       = "#00f7ff";
static const char col_cyan2[]       = "##005577";
static const char col_abacate1[]    = "#bdff00";
static const char col_abacate2[]    = "#7aa400";
static const char col_abacate3[]    = "#394d00";
static const char *colors[][3]      = {
	/*                    fg         bg         border   */
	[SchemeNorm] = { col_green1, col_abacate3, col_abacate3 },
	[SchemeSel]  = { col_abacate3, col_abacate2, col_abacate1 },
};

/* tagging */
static const char *tags[] = { "1", "2", "3", "4", "5", "6", "7", "8", "9", "10" };

static const Rule rules[] = {
	/* xprop(1):
	 *	WM_CLASS(STRING) = instance, class
	 *	WM_NAME(STRING) = title
	 */
	/* class      instance    title       tags mask     isfloating   monitor */
	{ "Gimp",     NULL,       NULL,       0,            1,           -1 },
	{ "Firefox",  NULL,       NULL,       1 << 8,       0,           -1 },
};

/* layout(s) */
static const float mfact     = 0.55; /* factor of master area size [0.05..0.95] */
static const int nmaster     = 1;    /* number of clients in master area */
static const int resizehints = 1;    /* 1 means respect size hints in tiled resizals */

static const Layout layouts[] = {
	/* symbol     arrange function */
	{ "[]=",      tile },    /* first entry is default */
	{ "><>",      NULL },    /* no layout function means floating behavior */
	{ "[M]",      monocle },
};

/* key definitions */
#define MODKEY Mod1Mask
#define TAGKEYS(KEY,TAG) \
	{ Mod4Mask,                       KEY,      view,           {.ui = 1 << TAG} }, \
	{ Mod4Mask|ControlMask,           KEY,      toggleview,     {.ui = 1 << TAG} }, \
	{ Mod4Mask|ShiftMask,             KEY,      tag,            {.ui = 1 << TAG} }, \
	{ Mod4Mask|ControlMask|ShiftMask, KEY,      toggletag,      {.ui = 1 << TAG} },

/* helper for spawning shell commands in the pre dwm-5.0 fashion */
#define SHCMD(cmd) { .v = (const char*[]){ "/bin/bash", "-c", cmd, NULL } }

/* commands */
static char dmenumon[2] = "0"; /* component of dmenucmd, manipulated in spawn() */
static const char *dmenucmd[] = { "dmenu_run", "-m", dmenumon, "-fn", dmenufont, "-nb", col_gray1, "-nf", col_gray3, "-sb", col_abacate2, "-sf", col_gray4, NULL };
static const char *termcmd[]  = { "sakura", "-m", NULL };
static const char *roficmd[]  = { "rofi", "-show", "drun", "-theme", ".config/rofi/center.rasi", NULL };
static const char *menucmd[]  = { ".config/rofi/rofimenu2.sh", NULL };
static const char *volupcmd[]  = { "pactl", "set-sink-volume", "0", "+5%", NULL };
static const char *voldowncmd[]  = { "pactl", "set-sink-volume", "0", "-5%", NULL };
static const char *mutecmd[]  = { "pactl", "set-sink-mute", "0", "toggle", NULL };
static const char *brightnessupcmd[]  = { "light", "-A", "2", NULL };
static const char *brightnessdowncmd[]  = { "light", "-U", "2", NULL };

static Key keys[] = {
	/* modifier                     key        function        argument */
	{ ControlMask,                  XK_F1,     spawn,          SHCMD ("cd ~ ; wget -nc https://raw.githubusercontent.com/felipefacundes/dotfiles/master/config/dwm/.dwm_help ; sakura -e less ~/.dwm_help") },
	{ MODKEY,                       XK_p,      spawn,          {.v = dmenucmd } },
	{ MODKEY|ShiftMask,             XK_Return, spawn,          {.v = termcmd } },
	{ Mod4Mask,                     XK_t,      spawn,          {.v = termcmd } },
	{ Mod4Mask,                     XK_n,      spawn,          SHCMD ("xdg-open ~") },
	{ ControlMask,                  XK_Escape, spawn,          SHCMD ("lxtask") },
	{ Mod4Mask,                     XK_Escape, spawn,          SHCMD ("sakura -t HTOP -e htop") },
	{ ControlMask|Mod4Mask,         XK_Escape, spawn,          SHCMD ("sakura -t GTOP -e gtop") },
	{ MODKEY|ControlMask,           XK_Escape, spawn,          SHCMD ("xkill") },
	{ ControlMask|Mod4Mask|ShiftMask,    XK_r, spawn,          SHCMD ("firefox --profile ~/.firefox-rofe/") },
	{ ControlMask|Mod4Mask,         XK_w,      spawn,          SHCMD ("firefox --new-tab https://www.qwant.com") },
	{ ControlMask|Mod4Mask,         XK_e,      spawn,          SHCMD ("firefox --new-tab https://www.ecosia.org/") },
	{ ControlMask|Mod4Mask,         XK_d,      spawn,          SHCMD ("firefox --new-tab https://duckduckgo.com/") },
	{ MODKEY|ControlMask,           XK_l,      spawn,          SHCMD ("i3lock") },
	{ MODKEY|ControlMask,           XK_t,      spawn,          SHCMD ("qbittorrent") },
	{ MODKEY|ControlMask,           XK_r,      spawn,          SHCMD ("sakura -e ffmpeg -video_size 1360x768 -framerate 25 -f x11grab -i :1.0 -f pulse -ac 2 -i default ~/Vídeos/Tela_$(date +%d-%m-%Y_%H:%M:%S).mkv") },
	{ MODKEY|ControlMask,           XK_b,      spawn,          SHCMD ("cd ~ ; mkdir -p .local/bin/ ; cd .local/bin/ ; wget -nc https://raw.githubusercontent.com/felipefacundes/dotfiles/master/config/dwm/barcomplete.sh ; pkill -9 barcomplete.sh ; cd ~ ; chmod +x .local/bin/barcomplete.sh ; .local/bin/barcomplete.sh") },
	{ MODKEY|ControlMask|ShiftMask, XK_BackSpace, spawn,       SHCMD ("openrc-shutdown --reboot now") },
	{ MODKEY|ControlMask|ShiftMask, XK_Delete,    spawn,       SHCMD ("openrc-shutdown --poweroff now") },
	{ 0,                            0x1008ff13, spawn,          {.v = volupcmd } },
	{ 0,                            0x1008ff11, spawn,          {.v = voldowncmd } },
	{ 0,                            0x1008ff12, spawn,          {.v = mutecmd } },
	{ 0,                            0x1008ff02, spawn,          {.v = brightnessupcmd } },
	{ 0,                            0x1008ff03, spawn,          {.v = brightnessdowncmd } },
	{ 0,                            0x1008ff2d, spawn,          SHCMD ("echo 0 > /sys/class/backlight/intel_backlight/brightness") },
	{ 0,                            0x0000ff61, spawn,          SHCMD ("cd ~ ; mkdir -p 'Imagens/Captura de Tela/' ; cd 'Imagens/Captura de Tela/' ; scrot 'Captura de tela de %d-%m-%Y %H:%M:%S.png' ; cd ~ ; mkdir -p .local/songs/ ; cd .local/songs/ ; wget -nc https://github.com/felipefacundes/dotfiles/blob/master/config/songs/camera_shutter.mp3?raw=true -O camera_shutter.mp3 ; play ~/.local/songs/camera_shutter.mp3") },
	{ ControlMask,                  0x0000ff61, spawn,          SHCMD ("cd ~ ; mkdir -p 'Imagens/Captura de Tela/' ; cd 'Imagens/Captura de Tela/' ; scrot -u 'Captura de tela de %d-%m-%Y %H:%M:%S.png' ; cd ~ ; mkdir -p .local/songs/ ; cd .local/songs/ ; wget -nc https://github.com/felipefacundes/dotfiles/blob/master/config/songs/camera_shutter.mp3?raw=true -O camera_shutter.mp3 ; play ~/.local/songs/camera_shutter.mp3") },
	{ MODKEY,                       0x0000ff61, spawn,          SHCMD ("cd ~ ; mkdir -p 'Imagens/Captura de Tela/' ; cd 'Imagens/Captura de Tela/' ; sleep 1; scrot -s 'Captura de tela de %d-%m-%Y %H:%M:%S.png' ; cd ~ ; mkdir -p .local/songs/ ; cd .local/songs/ ; wget -nc https://github.com/felipefacundes/dotfiles/blob/master/config/songs/camera_shutter.mp3?raw=true -O camera_shutter.mp3 ; play ~/.local/songs/camera_shutter.mp3") },
	{ MODKEY,                       XK_F2,     spawn,          {.v = roficmd } },
	{ MODKEY,                       XK_F1,     spawn,          {.v = menucmd } },
	{ ControlMask|Mod4Mask,         XK_f,      spawn,          SHCMD ("firefox") },
	{ MODKEY|ControlMask,           XK_w,      spawn,          SHCMD ("cd ~ ; mkdir -p Imagens/Wallpapers/ ; pkill -9 gifview ; pkill -9 feh ; feh --bg-scale $(find /home/$USER/Imagens/Wallpapers/ -name '*[jJpP][nNpP][gG]' | shuf -n1)") },
	{ MODKEY|ControlMask,           XK_g,      spawn,          SHCMD ("cd ~ ; mkdir -p Imagens/Wallpapers/GIFs/ ; pkill -9 feh ; pkill -9 gifview ; gifview --animate --window root $(find /home/$USER/Imagens/Wallpapers/GIFs/ -name '*[gG][iI][fF]' | shuf -n1)") },
	{ ControlMask|Mod4Mask,         XK_c,      spawn,          SHCMD ("xcompmgr") },
	{ MODKEY,                       XK_b,      togglebar,      {0} },
	{ MODKEY,                       XK_k,      focusstack,     {.i = +1 } },
	{ MODKEY,                       XK_j,      focusstack,     {.i = -1 } },
	{ MODKEY,                       XK_Tab,    focusstack,     {.i = +1 } },
	{ MODKEY|ShiftMask,             XK_Tab,    focusstack,     {.i = -1 } },
	{ Mod4Mask,                     XK_v,      incnmaster,     {.i = +1 } },
	{ Mod4Mask,                     XK_h,      incnmaster,     {.i = -1 } },
	{ MODKEY,                       XK_h,      setmfact,       {.f = -0.05} },
	{ MODKEY,                       XK_l,      setmfact,       {.f = +0.05} },
	{ MODKEY,                       XK_Return, zoom,           {0} },
    { Mod4Mask,                     XK_Tab,    view,           {0} },
	{ MODKEY|ShiftMask,             XK_c,      killclient,     {0} },
	{ MODKEY,                       XK_F4,     killclient,     {0} },
	{ Mod4Mask,                     XK_q,      killclient,     {0} },
	{ ControlMask,                  XK_q,      killclient,     {0} },
	{ MODKEY,                       XK_t,      setlayout,      {.v = &layouts[0]} },
	{ MODKEY,                       XK_e,      setlayout,      {.v = &layouts[0]} },
	{ MODKEY,                       XK_f,      setlayout,      {.v = &layouts[1]} },
	{ MODKEY,                       XK_m,      setlayout,      {.v = &layouts[2]} },
	{ Mod4Mask,                     XK_a,      setlayout,      {.v = &layouts[2]} },
	{ MODKEY,                       XK_space,  setlayout,      {0} },
	{ Mod4Mask,                     XK_e,      setlayout,      {0} },
	{ MODKEY|ShiftMask,             XK_space,  togglefloating,  {0} },
    { Mod4Mask,                     XK_f,      togglefloating,  {0} },
	{ MODKEY,                       XK_0,      view,           {.ui = ~0 } },
	{ MODKEY|ShiftMask,             XK_0,      tag,            {.ui = ~0 } },
	{ MODKEY,                       XK_2,      focusmon,       {.i = -1 } },
	{ MODKEY,                       XK_4,      focusmon,       {.i = +1 } },
	{ MODKEY,                       XK_1,      tagmon,         {.i = -1 } },
	{ MODKEY,                       XK_3,      tagmon,         {.i = +1 } },
	TAGKEYS(                        XK_1,                      0)
	TAGKEYS(                        XK_2,                      1)
	TAGKEYS(                        XK_3,                      2)
	TAGKEYS(                        XK_4,                      3)
	TAGKEYS(                        XK_5,                      4)
	TAGKEYS(                        XK_6,                      5)
	TAGKEYS(                        XK_7,                      6)
	TAGKEYS(                        XK_8,                      7)
	TAGKEYS(                        XK_9,                      8)
	TAGKEYS(                        XK_0,                      9)
	{ MODKEY|ShiftMask,             XK_q,      quit,           {0} },
	{ MODKEY|ControlMask,           XK_q,      spawn,          SHCMD ("pkill -9 barcomplete.sh ; pkill -9 [dD][wW][mM]") },
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
	{ ClkClientWin,         MODKEY,         Button2,        togglefloating,  {0} },
	{ ClkClientWin,         Mod4Mask,       Button1,        resizemouse,    {0} },
	{ ClkTagBar,            0,              Button1,        view,           {0} },
	{ ClkTagBar,            0,              Button3,        toggleview,     {0} },
	{ ClkTagBar,            MODKEY,         Button1,        tag,            {0} },
	{ ClkTagBar,            MODKEY,         Button3,        toggletag,      {0} },
};
