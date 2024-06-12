CC = gcc
CFLAGS = -Wall -std=c99 -pedantic
MAIN = fe_test
OBJS = task3.o

all : $(MAIN) evens odds

$(MAIN) : $(OBJS)
	$(CC) $(CFLAGS) -o $(MAIN) $(OBJS)

evens : evens.o
	$(CC) $(CFLAGS) -o evens evens.o

odds : odds.o
	$(CC) $(CFLAGS) -o odds odds.o

odds.o : odds.c odds.h
	$(CC) $(CFLAGS) -c odds.c
	
evens.o : evens.c evens.h
	$(CC) $(CFLAGS) -c evens.c
clean :
	rm *.o $(MAIN) core
