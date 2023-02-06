TARGET ?= $(shell gcc -dumpmachine)

CCPOINT = cpoint

SRC := $(wildcard *.cpoint)
OBJECTS := $(patsubst %.cpoint, %.o, $(SRC))

CPOINTFLAGS=-c -target-triplet $(TARGET)

all: libstd.a

lib.a: $(OBJECTS)
	ar -rc $@ $^

%.o: %.cpoint
	$(CCPOINT) $(CPOINTFLAGS) $< -o $@

clean:
	make -C c_api clean
	rm -f ./*.o ./*.a ./*.ll ./*.log ./*.temp
