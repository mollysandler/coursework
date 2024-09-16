CC = gcc
CFLAGS = -Wall -std=c99 -pedantic
SERVER = asgn6
SERVER_OBJS = task1.o array_list.o ops.o
PROGS = $(CLIENT) $(SERVER)

all : $(PROGS)

$(SERVER) : $(SERVER_OBJS)
	$(CC) $(CFLAGS) -o $(SERVER) $(SERVER_OBJS)

task1.o : task1.c array_list.h ops.h
	$(CC) $(CFLAGS) -c task1.c

array_list.o : array_list.c array_list.h
	$(CC) $(CFLAGS) -c array_list.c

ops.o : ops.c ops.h
	$(CC) $(CFLAGS) -c ops.c

clean :
	rm *.o $(PROGS) core
