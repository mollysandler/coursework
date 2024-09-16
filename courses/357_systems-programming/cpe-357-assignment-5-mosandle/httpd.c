#define _GNU_SOURCE
#include "net.h"
#include <stdio.h>
#include <stdlib.h>
#include <netdb.h>
#include <stdint.h>
#include <signal.h>
#include <string.h>
#include <unistd.h>
#include <sys/stat.h>
#include <sys/types.h>

#define NUM_ARGS 2 //the httpd file and the port to listen on

void validate_args(int argc, char* argv[]){ //checking there are exactly 2 arguments and argv[1] is within the port range
    if(argc != NUM_ARGS){ //too many or too few
        printf("Sorry, you have not entered the correct amount of arguments, please try again\n");
        exit(1);
    }
    if(!(1024 <= atoi(argv[1]) && atoi(argv[1]) <= 65535)){ //not in range
        printf("Sorry, this port number is not within range, please try again\n");
        exit(1);
    }
}

char *uint32_to_str(uint32_t i){ //making int into a string from assgn 2
    int length = snprintf(NULL, 0, "%lu", (unsigned long)i);       
    char* str = malloc(length + 1);                        
    snprintf(str, length + 1, "%lu", (unsigned long)i);     
    return str;
}

int mycat(char** str1, size_t* capacity, char* str2){ //concatanating what to print correctly 
    size_t str1_len = strlen(*str1); 
    size_t str2_len = strlen(str2); 
    size_t new_len = str2_len + str1_len + 1; //adding sizes together plus a null character

    if(*capacity < new_len){ //if we need to move spaces
        char* new_space = realloc(*str1, new_len); 
        if(new_space == NULL){
            return 1;
        }
        *capacity = new_len;
        *str1 = new_space;
    }
    strcat(*str1, str2);
    return 0;
}

int get_size(char *name){ //returns size of file with stat
    struct stat s;
    if(stat(name, &s) != 0){
        return 0;
    }
    else{
        int size = s.st_size;
        return size;
    }
}

FILE *open_file(int nfd, char *name){ //opens file and prints whats needed
    FILE *f = fopen(name, "r"); //opens file
    if(f == NULL){ //if no file, call the file not found html file
        char *newline = NULL;
        size_t h;
        char *sizing = uint32_to_str(get_size("html/404.html"));
        char* buf = strdup("HTTP/1.0 404 Not Found\r\n"); 
        size_t length = strlen(buf) + 1;
        mycat(&buf, &length, "Content-Type: text/html\r\n");
        mycat(&buf, &length, "Content-Length: ");
        mycat(&buf, &length, sizing);
        mycat(&buf, &length, "\r\n\r\n");
        FILE* file = fopen("html/404.html", "r");
        while(getline(&newline, &h, file) > 0){ 
            mycat(&buf, &length, newline);
        }
        fclose(file);
        write(nfd, buf, strlen(buf) + 1);
        free(newline);
        free(buf);
        free(sizing);
        //fclose(f);
        return NULL;
    }
    return f;
}//end of ofile


// int cgi_split(char* save[]){
//     for(int i = 0; i < strlen(save[1]); i++){
//         if(save[1][i] == '?'){
//             char *word;
//             char* args[1024];
//             char *space = save[1][i + 1];
//             int index = 0;
//             while((word = strsep(&space,"&")) != NULL){
//                 if(strcmp(word, "\0") != 0){
//                     char *word2 = strdup(word);
//                     args[index] = word2;
//                     index++;
//                 }
//             }
//             //call exec on the first cgi split with all others as args as an argv thing
//             //if success, work
//             //if fail, just print out an error message and take the L
//         }
//     }//end of if
//     return 0;
// }//end of cgi

void tokenize(int nfd, char *given){
    char *word;
    char* save[3];  //max of three elements per call
    char *space = given;
    int count = 0;
    while((word = strsep(&space," ")) != NULL){
        if(strcmp(word, "\0") != 0){
            char *word2 = strdup(word);
            save[count] = word2;
            count++;
        }//end of tokenizing
    }

    char* path = strdup("html");
    size_t p_len = sizeof(path) + 1;
    mycat(&path, &p_len, save[1]);

    //if get request
    if(strcmp(save[0], "GET") == 0){
        char *newline = NULL;
        size_t h;
        char* mes = "HTTP/1.0 403 Permission Denied\r\nContent-Type: text/html\r\nContent-Length: 0\r\n\r\n";
        for(int i = 0; i < strlen(save[1]); i++){ //.. check
            if(save[1][i] == '.'){
                if(save[1][i + 1] == '.'){
                    write(nfd, mes, strlen(mes) + 1);
                    return;
                }
                else{
                    continue;
                }
            }
        }
        
        char* prefix = "/cgi-like/";
        size_t prefixlen = strlen(prefix);
        size_t otherlen = strlen(save[1]);

        if(otherlen >= prefixlen){
            int match = 1;
            for(int f = 0; f < prefixlen; f++){
                if(save[1][f] != prefix[f]){
                    match = 0;
                    break;
                }
            }
            if(match == 1){
                printf("cgi activated but not implemented\n");
            }
        }//end of checking for cgi

        char* buf = strdup("HTTP/1.0 200 OK\r\n");
        size_t length = strlen(buf) + 1;
        char* convert = uint32_to_str(get_size(path));
        mycat(&buf, &length, "Content-Type: text/html\r\n");
        mycat(&buf, &length, "Content-Length: ");
        mycat(&buf, &length, convert);
        mycat(&buf, &length, "\r\n\r\n");
        FILE* f = open_file(nfd, path);
        if(f != NULL){
            while(getline(&newline, &h, f) > 0){
                mycat(&buf, &length, newline);
            }
            fclose(f);
            write(nfd, buf, strlen(buf) + 1);
        }
        
        free(newline);
        free(buf);
        free(convert);
    }
//if head request
    if(strcmp(save[0], "HEAD") == 0){
        char* convert = uint32_to_str(get_size(path));
        char* buf = strdup("HTTP/1.0 200 OK\r\n");
        size_t length = strlen(buf) + 1;
        mycat(&buf, &length, "Content-Type: text/html\r\n");
        mycat(&buf, &length, "Content-Length: ");
        mycat(&buf, &length, convert);
        mycat(&buf, &length, "\r\n\r\n");
        write(nfd, buf, strlen(buf) + 1);

        free(buf);
        free(path);
        free(convert);
    }
    for(int g = 0; g < count; g++){
        free(save[g]);
    }
    free(word);
    free(path);
    free(space);
}

void handle_request(int nfd){
    FILE *network = fdopen(nfd, "r+");
    char *line = NULL;
    size_t size;
    ssize_t num;

   if(network == NULL){
        perror("fdopen");
        close(nfd);
        return;
   }

   while((num = getline(&line, &size, network)) >= 0){ //everything free here
        fprintf(network, "%s", line);
        tokenize(nfd, line);
        printf("%s", line);
   }
   free(line);
   fclose(network);
}

void run_service(int fd){
    while(1){
        int nfd = accept_connection(fd);
        if(nfd != -1){
        printf("Connection established\n");
        if(fork() == 0){
            signal(SIGPIPE, SIG_IGN);
            close(fd); //closing unneeded file descriptors
            fclose(stdin);
            //fclose(stdout);
            handle_request(nfd);
            exit(0);
        }
        printf("Connection closed\n");
      }
   }
}

int main(int argc, char* argv[]){ //main
   validate_args(argc, argv);
   short port = (short) atoi(argv[1]); //allowing the command line arg to work
   signal(SIGCHLD, SIG_IGN);
   int fd = create_service(port);
   if(fd != -1){
      printf("listening on port: %d\n", port);
      run_service(fd);
      close(fd);
   }
   return 0;
}//end of main
