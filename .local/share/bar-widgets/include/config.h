#include "widgets-handler.h"

static const Widget widgets[] = {
    /* Command          Update Interval    Update Signal*/
    { "./mpd-status",           1,                  10 },
    { "calendar",               0,                  11 },
    { "internet",               0,                  0  },
};

// Widget delimiter or \0 for nothing
static char *delim = " ";

// Length of one widget output
#define CMDLENGTH 98
