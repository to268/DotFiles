#include <stdio.h>
#include <stdlib.h>
#include <string.h>
#include <unistd.h>
#include <signal.h>
#include <string.h>
#include "config.h"
#include "widgets-handler.h"

void help(void);

int main(int argc, char **argv){

    for (int i = 0; i < argc; i++) {
        if(strcmp("-h", argv[i]) || strcmp("--help", argv[i]))
            help();
    }

    // Kill process handlers with sigaction for more compactibility
    struct sigaction sa;
    sa.sa_handler = finishproccess;
    sigaction(SIGTERM, &sa, NULL);
    sigaction(SIGINT, &sa, NULL);

    // launch the main loop to handle widgets
	loop();
    return 0;
}

void help(void){
    printf("bar-widgets is a program to customise the status bar.\nIn order to use custom widgets, you need to edit include/config.h.\nPlease read the README.md for more information.\n");
    exit(0);
}
