#include <stdio.h>
#include <stdlib.h>
#include <string.h>
#include <unistd.h>
#include <signal.h>
#include <string.h>
#include "config.h"
#include "widgets-handler.h"

int main (void) {

    // Kill process handlers with sigaction for more compactibility
    struct sigaction sa;
    sa.sa_handler = finishproccess;
    sigaction(SIGTERM, &sa, NULL);
    sigaction(SIGINT, &sa, NULL);

    // launch the main loop to handle widgets
	loop();
    return 0;
}
