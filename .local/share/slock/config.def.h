/* user and group to drop privileges to */
static const char *user  = "tony";
static const char *group = "wheel";

static const char *colorname[NUMCOLS] = {
	[INIT] =   "#000000",     /* after initialization */
	[INPUT] =  "#405577",   /* during input */
	[FAILED] = "#cc3333",   /* wrong password */
	[CAPS] = "#accfaf",         /* CapsLock on */
};

/* treat a cleared input like a wrong password (color) */
static const int failonclear = 1;

/* allow control key to trigger fail on clear */
static const int controlkeyclear = 1;
