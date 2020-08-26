#include "widgets-handler.h"

static const Widget widgets[] = {
    /* Command          Update Interval    Update Signal*/
    { "mpd-status",               1,                0 },
    { "goal",                     60,               0 },
    { "packages",                 120,              0 },
    { "news",                     300,              0 },
    { "calendar",                 60,               0 },
    { "internet",                 10,               0 },
    { "volume",                   0,                10 },
    { "clock",                    10,               0 },
};

// Widget delimiter or \0 for nothing
static char *delim = " | ";

// Length of one widget output
#define CMDLENGTH 98
