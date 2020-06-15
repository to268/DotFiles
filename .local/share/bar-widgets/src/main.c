#include <stdio.h>
#include <stdlib.h>
#include <string.h>
#include <unistd.h>
#include <signal.h>
#include "config.h"
#include "widgets-handler.h"

int main(void){
    /* Optionnals arguments */

    // Kill process handlers
    struct sigaction sa;
    sa.sa_handler = finishproccess;
    sigaction(SIGTERM, &sa, NULL);
    sigaction(SIGINT, &sa, NULL);

    // launch main loop to handle widgets
	loop();
    sleep(5); // test timeout
    return 0;
}
