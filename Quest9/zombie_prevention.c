#include <stdio.h>
#include <stdlib.h>
#include <unistd.h>
// #include <sys/wait.h>

int main() {
    int n = 3;  // number of child processes
    pid_t pid;

    for(int i = 0; i < n; i++) {

        pid = fork();

        if(pid < 0) {
            printf("Fork failed\n");
            return 1;
        }

        // Child process
        if(pid == 0) {
            printf("Child Process: PID = %d, Parent PID = %d\n", getpid(), getppid());
            sleep(2);  // simulate work
            printf("Child %d exiting...\n", getpid());
            exit(0);
        }
    }

    // Parent process cleans zombies
    for(int i = 0; i < n; i++) {
        pid_t child = wait(NULL);
        printf("Parent cleaned up child with PID = %d\n", child);
    }

    printf("No zombie processes remain.\n");

    return 0;
}
