PROG = gensite
CC = gcc

CXXFLAGS = -g -lefence

#LDFLAGS += `sdl2-config --libs` -lSDL2_mixer -lSDL2_image -lSDL2_ttf -lm

OUT = bin

SEARCHPATH += src include
vpath %.c $(SEARCHPATH)
vpath %.h $(SEARCHPATH)

#DEPS += defs.h structs.h

OBJS += bin/main.o

#OBJS = $(patsubst %,$(OUT)/%,$(_OBJS))

# top-level rule to create the program.
all: $(PROG)

# linking the program.
$(PROG): $(OBJS)
	$(CC) -o $(OUT)/$@ $(OBJS) $(LDFLAGS)

#Todo get the pattern sub stuff working eventually
bin/main.o: src/main.c
	@mkdir -p $(OUT)
	$(CC) $(CFLAGS) $(CXXFLAGS) -c -o $@ $<

# compiling other source files.
#$(OBJS): %.c %.h $(DEPS)
#	@mkdir -p $(OUT)
#	$(CC) $(CFLAGS) $(CXXFLAGS) -c -o $@ $<
	
# cleaning everything that can be automatically recreated with "make".
clean:
	$(RM) -rf $(OUT) $(PROG)

