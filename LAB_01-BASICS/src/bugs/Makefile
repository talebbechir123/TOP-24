
#Compiler
CC = gcc

#Compiler flags
CFLAGS = -arch x86_64 -Wall -Wextra -Werror -g3 

#optimization
OFLAGS = -O3


#Target
all: bugs

bugs: main.c
	$(CC) $(CFLAGS) $(OFLAGS) -o bugs main.c

clean:
	rm -Rf  bugs *.o *.dSYM *~  