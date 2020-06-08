#include <stdio.h>
#include <stdlib.h>
#include <string.h>
#include <unistd.h>
#include <signal.h>
#include "config.h"
#include "widgets-handler.h"

int main(void){

    signal(SIGTERM, finishproccess);
	signal(SIGINT, finishproccess);
	loop();
    sleep(5);
    return 0;
}
