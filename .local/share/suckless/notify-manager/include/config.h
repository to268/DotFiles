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
#ifndef CONFIG_H
#define CONFIG_H

#include <libnotify/notification.h>
#include "notificationManager.h"

static const Notif notifs[] = {
    /* Title            Content Path    Icon Path   Timeout (ms)    Display frequency (sec)     Signal  Severity */
    { "Price of ZEC",  "price zec",     NULL,       4000,           3600,                       11,     NOTIFY_URGENCY_NORMAL },
};

#endif
