/* See LICENSE file for copyright and license details. */
/* Default settings; can be overriden by command line. */

static int topbar = 1;                      /* -b  option; if 0, dmenu appears at bottom     */
static int centered = 1;                    /* -c option; centers dmenu on screen */
static int min_width = 500;                    /* minimum width when centered */
static unsigned int border_width = 3;

/* -fn option overrides fonts[0]; default X11 font or font set */
static const char *fonts[] = {
	"monospace:size=10"
};
static const char *prompt      = NULL;      /* -p  option; prompt to the left of input field */
static const char *colors[SchemeLast][2] = {
	/*     fg         bg       */
	[SchemeNorm] = {"#D3C6AA", "#1E2326" },
	[SchemeSel] = {"#1E2326", "#A7C080" },
	[SchemeOut] = {"#00ffff", "#000000"},
};
/* -l option; if nonzero, dmenu uses vertical list with given number of lines */
static unsigned int lines = 10;

/*
 * Characters not considered part of a word while deleting words
 * for example: " /?\"&[]"
 */
static const char worddelimiters[] = " ";
