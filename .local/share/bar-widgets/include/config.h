#include "widgets-handler.h"

static const Widget widgets[] = {
    /* Command  Update Interval    Update Signal*/
    { "./mpd-status",           0,                  10 },
};

// Widget delimiter
static char *delim = "";

// Time to wait before updating any widgets
#define TIME 1.0

// Length of one widget output
#define CMDLENGTH 95
