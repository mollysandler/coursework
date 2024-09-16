#define _GNU_SOURCE
#include "net.h"
#include <stdio.h>
#include <stdlib.h>
#include <netdb.h>
#include <dirent.h>
#include <stdint.h>
#include <string.h>
#include <unistd.h>
#include <sys/stat.h>
#include <sys/types.h>

#define NUM_ARGS 2
#define PORT 3000


void validate_args(int argc, char* argv[]){
    if(argc != NUM_ARGS){
        printf("something went wrong\n");
        return;
    }
    if(!(1024 <= atoi(argv[1]) && atoi(argv[1]) <= 65535)){
        printf("something went wrong\n");
    }
}

FILE *open_file(char *name){
    FILE *f = fopen(name, "r");
    if(f == NULL){
        printf("404 File Not Found"); //will this be written to the client?
        exit(1);
    }
    return f;
}//end of ofile

void handle_request(int nfd)
{
   FILE *network = fdopen(nfd, "r+");
   char *line = NULL;
   size_t size;
   ssize_t num;

   if (network == NULL)
   {
      perror("fdopen");
      close(nfd);
      return;
   }

   while ((num = getline(&line, &size, network)) >= 0)
   {
      fprintf(network, "%s", line);
      printf("%s", line);
   }

   free(line);
   fclose(network);
}

void run_service(int fd)
{
   while (1)
   {
      int nfd = accept_connection(fd);
      if (nfd != -1)
      {
         printf("Connection established\n");
           if(fork() == 0){
            signal(SIGPIPE, SIG_IGN);
            //close(fd);
            //fclose(stdin);
            //fclose(stdout);
            handle_request(nfd);
            printf("Connection closed\n");
            exit(0);
        }
      }
   }
}

int main(int argc, char* argv[])
{
   validate_args(argc, argv);
   //FILE *file = open_file(argv[1]);

   int fd = create_service(PORT);
   if (fd != -1)
   {
      printf("listening on port: %d\n", PORT);
      signal(SIGCHLD, SIG_IGN);
      run_service(fd);
      close(fd);
   }

   return 0;
}
