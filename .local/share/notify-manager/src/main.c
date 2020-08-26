#include <stdio.h>
#include <stdlib.h>
#include <string.h>
#include <stdbool.h>
#include <unistd.h>
#include <signal.h>
#include <libnotify/notify.h>
#include <libnotify/notification.h>
#include "notificationManager.h"
#include "config.h"

int main(int argc, char **argv) {
    // Manage kill signals with sigaction for more compactibility
    struct sigaction sa;
    sa.sa_handler = finishproccess;
    sigaction(SIGTERM, &sa, NULL);
    sigaction(SIGINT, &sa, NULL);

    // main loop
    loop();
    return 0;
}
