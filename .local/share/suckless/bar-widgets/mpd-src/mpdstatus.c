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
#include <stdio.h>
#include <stdlib.h>
#include <string.h>
#include <mpd/client.h>

static int isempty = 1;

// simple function to retrieve mpd status
void getmpdstat() {
    struct mpd_song * song;
	const char * title;
	const char * artist;
	int elapsed = 0, total = 0;
    struct mpd_connection * conn ;
    if (!(conn = mpd_connection_new("localhost", 0, 30000)) ||
        mpd_connection_get_error(conn)){
            return;
    }

    mpd_command_list_begin(conn, true);
    mpd_send_status(conn);
    mpd_send_current_song(conn);
    mpd_command_list_end(conn);

    struct mpd_status* theStatus = mpd_recv_status(conn);
        if ((theStatus) && (mpd_status_get_state(theStatus) == MPD_STATE_PLAY)) {
                mpd_response_next(conn);
                song = mpd_recv_song(conn);
                title = mpd_song_get_tag(song, MPD_TAG_TITLE, 0);
                artist = mpd_song_get_tag(song, MPD_TAG_ARTIST, 0);

                elapsed = mpd_status_get_elapsed_time(theStatus);
                total = mpd_status_get_total_time(theStatus);
                printf("🎵 %s - %s %.2d:%.2d/%.2d:%.2d 🎵\n", artist, title, elapsed/60, elapsed%60, total/60, total%60);
                isempty = 0;
                mpd_song_free(song);
        }
		mpd_response_finish(conn);
		mpd_connection_free(conn);
}

int main(void){
    getmpdstat();
    if(isempty)
        printf("NULL\n");
    return 0;
}
