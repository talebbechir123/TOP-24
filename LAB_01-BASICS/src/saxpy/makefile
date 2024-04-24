
#Compiler
CC = gcc

#Compiler flags
CFLAGS = -arch x86_64 -Wall -Wextra -Werror -g3  -fsanitize=address

#optimization
OFLAGS = -O1


#Target
all: saxpy

saxpy: main.c
	$(CC) $(CFLAGS) $(OFLAGS) -o saxpy main.c

clean:
	rm -Rf  saxpy *.o *.dSYM *~ saxpy-main.c.* 