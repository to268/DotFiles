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
#include "widgets-handler.h"

static const Widget widgets[] = {
    /* Command          Update Interval    Update Signal*/
    { "mpd-status",               1,                0 },
    { "packages",                 120,              0 },
    { "news",                     300,              0 },
    { "calendar",                 60,               0 },
    { "internet",                 15,               0 },
    { "battery",                  15,               0 },
    { "volume",                   0,                10 },
    { "clock",                    10,               0 },
};

// Widget delimiter or \0 for nothing
static char *delim = " | ";

// Length of one widget output
#define CMDLENGTH 98
