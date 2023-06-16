#include <stdlib.h>
#include <stdio.h>
#include <unistd.h>
#include <string.h>

int main (int argc, char *argv[]){
    
    printf("%s,%dn", "USER ID:",getuid());
    printf("%s,%dn", "EXEC ID:",geteuid());

    printf("Enter OS command:");
    char line[100];
    fgets(line,sizeof(line),stdin);
    line[strlen(line) - 1] = " ";
    char * s = line;
    char * command[5];
    int i = 0;
    while(s){
        command[i] = strsep(&s," ");
        i++;
    }
    command[i] = NULL;
    execvp(command[0],command)
}