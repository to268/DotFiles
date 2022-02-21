/* See LICENSE file for copyright and license details. */
/* Default settings; can be overriden by command line. */

static int topbar = 1;                      /* -b  option; if 0, dmenu appears at bottom     */
static int incremental = 0;                 /* -r  option; if 1, outputs text each time a key is pressed */
static int fuzzy = 1;                      /* -F  option; if 0, dmenu doesn't use fuzzy matching     */
/* -fn option overrides fonts[0]; default X11 font or font set */
static const char *fonts[] = {
	"mono:pixelsize=13:antialias=true:autohint=true",
	"Noto Color Emoji:scale=0.85:style=Regular;2:antialias=true:autohint=true"
};
static const char *prompt      = NULL;      /* -p  option; prompt to the left of input field */
static const char *colors[SchemeLast][2] = {
	/*     fg         bg       */
	[SchemeNorm] = { "#ebdbb2", "#3c3836" },
	[SchemeSel] = { "#fbf1c7", "#fb4934" },
	[SchemeOut] = { "#282828", "#83a598" },
	[SchemeSelHighlight] = { "#fabd2f", "#fb4934" },
	[SchemeNormHighlight] = { "#fabd2f", "#3c3836" },
};
/* -l option; if nonzero, dmenu uses vertical list with given number of lines */
static unsigned int lines      = 0;
/* -h option; minimum height of a menu line */
static unsigned int lineheight = 0;
static unsigned int min_lineheight = 8;

/*
 * Characters not considered part of a word while deleting words
 * for example: " /?\"&[]"
 */
static const char worddelimiters[] = " ";
