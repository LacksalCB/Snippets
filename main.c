#include <stdio.h>
#include <string.h>
#include <stdlib.h>


int main(int argc, char** argv){
	char cmd[1024] = "sh snippets.sh";
	
	if (argc == 1) {
		system(cmd);
		return 0;
	}

	for (int i = 1; i < argc; i++) {
		strcat(cmd, " ");
		strcat(cmd, argv[i]);
	}

	system(cmd);

    return 0;
}
