#ifndef WIDGETS_HANDLER
#define WIDGETS_HANDLER

typedef struct Widget{
	char* command;
	unsigned int interval;
	unsigned int signal;
}Widget;

void finishproccess(int signum);
void loop(void);

#endif
