CC = gcc
CFLAGS = -Wall -std=c99 -pedantic
MAIN = ./download_stuff
OBJS = main.o

all : $(MAIN)

$(MAIN) : $(OBJS)
	$(CC) $(CFLAGS) -o $(MAIN) $(OBJS)

main.o : main.c
	$(CC) $(CFLAGS) -c main.c

clean :
	rm *.o $(MAIN) core
