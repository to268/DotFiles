#include <bits/types/sigset_t.h>
#include <stdlib.h>
#include <stdio.h>
#include <string.h>
#include <unistd.h>
#include <signal.h>
#include "config.h"
#include "widgets-handler.h"
#define LENGTH(X)   (sizeof(X)/sizeof(X[0]))

void finishproccess(int signum);
void loop(void);
void registersignals(void);
void getcmds(int time);

void finishproccess(int signum){
    exit(0);
}

void sighandler(int sig){

}

void registersignals(void){
    for(int i = 0; i < LENGTH(widgets); i++){
        if(widgets[i].signal > 0){
            signal(SIGRTMIN+widgets[i].signal, sighandler);
            sigset_t *sigset;
            // sigaction sa_mask
            sigemptyset(sigset);
            sigaddset(sigset, SIGRTMIN+widgets[i].signal);
        }
    }
}

void getcmds(int time){
    const Widget* cur;
    for (int i = 0; i < LENGTH(widgets) ; i++) {
        cur = widgets + i;
        if ((cur->interval != 0 && time % cur->interval == 0) | time == -1) {
            // update()
        }
    }
}

void loop(void){
    registersignals();

    int i = 0;
    getcmds(-1);
    while(i < 2){
        getcmds(i);
        // set status
        sleep(1.0);
        i++;
    }
}
