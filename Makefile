CC = gcc

CFLAGS = -g -O2 -Wall -Wextra -pedantic -fsanitize=address
LDFLAGS = -g -Wall -Wextra -O2 -fsanitize=address
EXEC = snippet_test
SOURCES = $(wildcard *.c)
OBJECTS = $(SOURCES:.c=.o)

.PHONY: all clean

all: $(EXEC)

%.o: %.c %.h
	gcc -o $@ -c $< $(CFLAGS)

$(EXEC): $(OBJECTS)
	gcc -o $@ $< $(LDFLAGS)

clean:
	-rm *.o
	-rm $(EXEC)



