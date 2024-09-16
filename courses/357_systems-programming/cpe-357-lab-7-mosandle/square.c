#define _GNU_SOURCE
#include <stdio.h>
#include <stdlib.h>
#include <stdint.h>
#include <string.h>
#include <unistd.h>

int doing(int n){
	int one[2];
	int two[2];
	int three[2];

	pipe(one);
	pipe(two);
	pipe(three);

		if(fork() == 0){
			//child1
			close(one[1]);
			close(two[0]);
			close(three[0]);
			close(three[1]);
			while(1){
				int j;
				int f = read(one[0], &j, sizeof(int));
				if(f == EOF){
					close(two[1]);
					close(one[0]);
					break;
				}
				j = j * j;
				write(two[1], &j, sizeof(int));
			}	
			exit(0);
		}
		
		else{
			if(fork() == 0){
				//child2
				close(one[1]);
				close(one[0]);
				close(two[1]);
				close(three[0]);
				while(1){
					int i;
					int r = read(two[0], &i, sizeof(int));
					if(r == EOF){
						close(three[1]);
						close(two[0]);
						break;
					}
					i = i + 1;
					write(three[1], &i, sizeof(int));
					//printf("%d\n", i);
				}
				exit(0);
			}
		}
		//parent code
		close(one[0]);
		close(two[1]);
		close(two[0]);
		close(three[1]);

		write(one[1], &n, sizeof(int));
		read(three[0], &n, sizeof(int));	
		printf("%d\n", n);
		close(one[1]);
		close(three[0]);
	return 0;
}

int main(int argc, char* argv[]){
	char* line = NULL;
	size_t size;
	while(getline(&line, &size, stdin) > 0){
		int given = atoi(line);
		doing(given);
	}
	return 0;
}
