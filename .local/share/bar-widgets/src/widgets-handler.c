#include <stdlib.h>
#include <stdio.h>
#include <string.h>
#include <unistd.h>
#include <signal.h>
#include "config.h"
#include "widgets-handler.h"
#define LENGTH(X)   (sizeof(X)/sizeof(X[0]))

static char bar[LENGTH(widgets)][CMDLENGTH] = {0};

void finishproccess(int signum);
void loop(void);
void registersignals(void);
void sighandler(int signum);
void checkforupdates(int time);
void executecmd(int position, char *out);

void finishproccess(int sig){
    exit(0);
}

void executecmd(int position, char *out){
    char *cmd = widgets[position].command;
    FILE *cmdfd = popen(cmd, "r");
    if(!cmdfd)
        return;
    fgets(out, CMDLENGTH, cmdfd);
    pclose(cmdfd);
    printf("out: %s\n", out);
}

void sighandler(int signum){
    // substract 34 to get the number after SIGRTMIN
    signum -= 34;
    // Update the proper widget
    for (int i = 0; i < LENGTH(widgets); i++) {
        if(widgets[i].signal == signum){
            executecmd(i, bar[i]);
            printf("Updated module with the signal number: %d\n", signum);
            break;
        }
    }
}

void registersignals(void){
    struct sigaction sa;
    for(int i = 0; i < LENGTH(widgets); i++){
        if(widgets[i].signal > 0){
            sa.sa_handler = sighandler;
            sigaction(SIGRTMIN+widgets[i].signal, &sa, NULL);
        }
    }
}

void checkforupdates(int time) {
    const Widget *cur;
    for (int i = 0; i < LENGTH(widgets); i++) {
        cur = widgets + i;
        if ((cur->interval != 0 && time % cur->interval == 0) | time == -1) {
            // setstatus()
        }
    }
}

void loop(void){
    // enable kill signal handler
    registersignals();

    // Initial Bar Launch
    checkforupdates(-1);

    // main loop (infinite loop at final)
    int i = 0;
    while(i < 4){
        checkforupdates(i);
        sleep(TIME); // check every n seconds (avoid too many checks)
        i++;
    }
}
