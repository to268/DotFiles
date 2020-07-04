#include <stdio.h>
#include <stdlib.h>
#include <string.h>
#include <unistd.h>
#include <signal.h>
#include "config.h"
#include "widgets-handler.h"
#define LENGTH(X)   (sizeof(X)/sizeof(X[0]))

static char bar[LENGTH(widgets)][CMDLENGTH] = {0};
static int running = 1;

void finishproccess(int signum);
void loop(void);
void registersignals(void);
void sighandler(int signum);
void checkforupdates(int time);
void executecmd(int position, char *out);
void setbar(void);
void update(int position);
void replace(char *old, char *new);
void updateall(void);

void finishproccess(int signum){
    running = 0;
    exit(0);
}

void executecmd(int position, char *out){
    char *cmd = widgets[position].command;
    FILE *cmdfd = popen(cmd, "r");
    if(!cmdfd)
        return;
    fgets(out, CMDLENGTH-strlen(delim), cmdfd);
    pclose(cmdfd);
    // removes all new lines
    strtok(out, "\n");
}

void sighandler(int signum){
    // substract 34 to get the number after SIGRTMIN
    signum -= 34;
    // Update the proper widget
    for (int i = 0; i < LENGTH(widgets); i++) {
        if(widgets[i].signal == signum){
            update(i);
            setbar();
            break;
        }
    }
}

void update(int position){
    char new[CMDLENGTH];
    executecmd(position, new);
    // replace all new chars of the widget rather than overwrite it for optimisation purposes
    replace(bar[position], new);
}

void updateall(void){
    for (int i = 0; i < LENGTH(widgets); i++)
        update(i);
    setbar();
}

void replace(char *old, char *new){
    for(int i = 0; i < CMDLENGTH; i++){
        if(!(old[i] == new[i]))
            old[i] = new[i];
    }
}

void setbar(void){
    // add 18 due the command prefix and suffix
    char cmd[(LENGTH(widgets)*CMDLENGTH)+18];
    strcpy(cmd, "xsetroot -name '");
    for(int i = 0; i < LENGTH(widgets); i++){
        if(!strstr(bar[i], "NULL"))
            strcat(cmd, bar[i]);
        // add delimiter at the end if it's not the last one and if output is NULL don't output
        if(i != LENGTH(widgets) - 1 && !strstr(bar[i], "NULL"))
            strcat(cmd, delim);
    }
    strcat(cmd, "'");
    system(cmd);
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
    for (int i = 0; i < LENGTH(widgets); i++) {
        if (widgets[i].interval != 0 && time % widgets[i].interval == 0) {
            update(i);
            setbar();
        }
    }
}

void loop(void){
    // enable kill signal handler
    registersignals();

    // Initial Bar Launch
    updateall();

    // main loop
    int i = 1;
    while(running){
        checkforupdates(i);
        sleep(1.0); // check every second (avoid too many checks)
        i++;
    }
}
