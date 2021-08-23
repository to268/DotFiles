/*
 * Copyright © 2021 Guillot Tony <tony.guillot@protonmail.com>
 * This program is free software: you can redistribute it and/or modify
 * it under the terms of the GNU General Public License as published by
 * the Free Software Foundation, either version 3 of the License, or
 * (at your option) any later version.
 *
 * This program is distributed in the hope that it will be useful,
 * but WITHOUT ANY WARRANTY; without even the implied warranty of
 * MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
 * GNU General Public License for more details.
 *
 * You should have received a copy of the GNU General Public License
 * along with this program.  If not, see <http://www.gnu.org/licenses/>.
 */
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
