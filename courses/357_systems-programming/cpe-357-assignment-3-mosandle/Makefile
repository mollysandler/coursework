CC = gcc
CFLAGS = -Wall -std=c99 -pedantic
MAIN = tree
OBJS = new.o array_list.o

all : $(MAIN)

$(MAIN) : $(OBJS)
	$(CC) $(CFLAGS) -o $(MAIN) $(OBJS)

new.o : new.c array_list.h
	$(CC) $(CFLAGS) -c new.c array_list.h

array_list.o : array_list.c array_list.h
	$(CC) $(CFLAGS) -c array_list.c array_list.h

clean :
	rm *.o $(MAIN) core
