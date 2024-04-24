
#Compiler
CC = gcc

#Compiler flags
CFLAGS = -arch x86_64 -Wall -Wextra -Werror -g3 

#optimization
OFLAGS = -Ofast


#Target
all: vector1

vector.o: vector.c vector.h
	$(CC) $(CFLAGS) $(OFLAGS) -c vector.c

compute.o: compute.c compute.h vector.o
	$(CC) $(CFLAGS) $(OFLAGS) -c  compute.c
	
vector1: main.c  compute.o  
	$(CC) $(CFLAGS) $(OFLAGS) -o vector1 main.c compute.o vector.o

clean:
	rm -Rf  vector1 *.o *.dSYM *~