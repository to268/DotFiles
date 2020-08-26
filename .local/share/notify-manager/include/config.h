#ifndef CONFIG_H
#define CONFIG_H

#include <libnotify/notification.h>
#include "notificationManager.h"

static const Notif notifs[] = {
    /* Title            Content Path    Icon Path   Timeout (ms)    Display frequency (sec)     Signal  Severity */
    { "Price of BTC",  "price btc",     NULL,       4000,           3600,                       11,     NOTIFY_URGENCY_NORMAL },
};

#endif
