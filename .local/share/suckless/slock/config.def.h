/* user and group to drop privileges to */
static const char *user  = "tony";
static const char *group = "wheel";

static const char *colorname[NUMCOLS] = {
	[INIT] =   "#282828",     /* after initialization */
	[INPUT] =  "#fe8019",   /* during input */
	[FAILED] = "#fb4934",   /* wrong password */
	[CAPS] = "#fabd2f",         /* CapsLock on */
};

/* treat a cleared input like a wrong password (color) */
static const int failonclear = 1;

/* allow control key to trigger fail on clear */
static const int controlkeyclear = 1;
