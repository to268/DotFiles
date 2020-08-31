#include <stdio.h>
#include <stdlib.h>
#include <string.h>
#include <strings.h>
#include <unistd.h>
#include <signal.h>
#include <libnotify/notify.h>
#include <libnotify/notification.h>
#include "notificationManager.h"
#include "config.h"
#define LENGTH(X)   (sizeof(X)/sizeof(X[0]))

void sendNotif(const struct Notif *notif);
void getContent(const char *cmd, char *out);
void finishproccess(int signum);
void registerSignals(void);
void checkForPendingNotifications(int time);
void sighandler(int signum);
void loop(void);

static unsigned int running = 1;
static unsigned int canBeDisturb = 1;

void finishproccess(int signum) {
    running = 0;
    exit(0);
}

void getContent(const char *cmd, char *out) {
    // Execute the command and store the content
    FILE *cmdfd = popen(cmd, "r");
    if (!cmdfd)
        return;
    fgets(out, MAX_CONTENT_LENGTH, cmdfd);
    pclose(cmdfd);
    return;
}

void sighandler(int signum) {
    // substract 34 to get the number after SIGRTMIN
    signum -= 34;
    // Find the notif and display it
    for (int i = 0; i < LENGTH(notifs); i++) {
        if(notifs[i].signal == signum){
            sendNotif(&notifs[i]);
            break;
        }
    }
}

void registerSignals(void) {
    struct sigaction sa;
    for(int i = 0; i < LENGTH(notifs); i++){
        if(notifs[i].signal > 0){
            sa.sa_handler = sighandler;
            sigaction(SIGRTMIN+notifs[i].signal, &sa, NULL);
        }
    }
}

void sendNotif(const struct Notif *notif) {
    // Get content
    char data[MAX_CONTENT_LENGTH];
    getContent(notif->cmd, data);
    if (!strcmp(data, "NULL")) {
        bzero(data, MAX_CONTENT_LENGTH);
        return;
    }
    notify_init("notify-manager");
    NotifyNotification *not = notify_notification_new(notif->title, data, NULL);
    notify_notification_set_timeout(not, notif->timeout);
    notify_notification_set_urgency(not, notif->urgency);
    if (notif->iconPath != NULL) {
        GdkPixbuf *pixbuf = gdk_pixbuf_new_from_file(notif->iconPath, NULL);
        notify_notification_set_icon_from_pixbuf(not, pixbuf);
    }
    if (!notify_notification_show(not, NULL)) {
        perror("failed to show the notification\n");
        return;
    }
    g_object_unref(not);
    notify_uninit();
}

void checkForPendingNotifications(int time) {
    for (int i = 0; i < LENGTH(notifs); i++) {
        if (notifs[i].frequency != 0 && time % notifs[i].frequency == 0) {
            sendNotif(&notifs[i]);
        }
    }
}

void loop(void) {
    // Register signals
    registerSignals();

    // main loop
    int i = 1;
    while(running) {
        // Check if needed to send a notification
        checkForPendingNotifications(i);
        sleep(1.0);
        i++;
    }
}
