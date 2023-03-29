TARGET ?= $(shell gcc -dumpmachine)

CCPOINT = cpoint

SRC := $(wildcard *.cpoint)
OBJECTS := $(patsubst %.cpoint, %.o, $(SRC))

CPOINTFLAGS=-c -target-triplet $(TARGET)

all: lib.a

lib.a: $(OBJECTS)
	ar -rc $@ $^

%.o: %.cpoint
	$(CCPOINT) $(CPOINTFLAGS) $< -o $@

clean:
	rm -f ./*.o ./*.a ./*.ll ./*.log ./*.temp
