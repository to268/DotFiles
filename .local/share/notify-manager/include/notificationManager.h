#ifndef NOTIFICATION_MANAGER_H
#define NOTIFICATION_MANAGER_H

#include <libnotify/notification.h>

#define MAX_CONTENT_LENGTH 4096

typedef struct Notif {
    char *title;
    char *cmd;
    char *iconPath;
    unsigned int timeout;
    unsigned int frequency;
    unsigned int signal;
    NotifyUrgency urgency;
} Notif;

void sendNotif(const struct Notif *notif);
void getContent(const char *cmd, char *out);
void finishproccess(int signum);
void registerSignals(void);
void checkForPendingNotifications(int time);
void sighandler(int signum);
void loop(void);

#endif
