# Makefile for program1
PROGRAM1_SOURCES = AVL_S.c S.c
PROGRAM1_HEADERS = S.h
PROGRAM1_OBJECTS = $(PROGRAM1_SOURCES:.c=.o)
PROGRAM1_EXECUTABLE = S

# Makefile for program2
PROGRAM2_SOURCES = AVL_T.c T.c
PROGRAM2_HEADERS = T.h
PROGRAM2_OBJECTS = $(PROGRAM2_SOURCES:.c=.o)
PROGRAM2_EXECUTABLE = T

# Compiler and flags
CC = gcc
CFLAGS = -Wall -Wextra -std=c11

# Targets
all: $(PROGRAM1_EXECUTABLE) $(PROGRAM2_EXECUTABLE)

$(PROGRAM1_EXECUTABLE): $(PROGRAM1_OBJECTS)
	$(CC) $(CFLAGS) -o $@ $^

$(PROGRAM2_EXECUTABLE): $(PROGRAM2_OBJECTS)
	$(CC) $(CFLAGS) -o $@ $^

%.o: %.c $(PROGRAM1_HEADERS) $(PROGRAM2_HEADERS)
	$(CC) $(CFLAGS) -c $< -o $@

clean:
	rm -f $(PROGRAM1_OBJECTS) $(PROGRAM1_EXECUTABLE) $(PROGRAM2_OBJECTS) $(PROGRAM2_EXECUTABLE)

