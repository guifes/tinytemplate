# Set executable name based on the platform
ifeq ($(OS), Windows_NT)
    EXE := tt.exe
    LIB := libtinytemplate.a
    GCC := $(MINGWPATH)/gcc
    AR := $(MINGWPATH)/ar
else
    EXE := tt
    LIB := libtinytemplate.a
    GCC := $(MINGWPATH)/gcc
    AR := $(MINGWPATH)/ar
endif

all: $(EXE)

# Main target
$(EXE): src/cli.c src/tinytemplate.c 3p/xjson.c
	$(GCC) $^ -o $@ -Wall -Wextra -g -I3p

# Build static library
lib: $(LIB)

$(LIB): src/tinytemplate.o
	$(AR) rcs $@ $^

src/tinytemplate.o: src/tinytemplate.c
	$(GCC) -c $< -o $@

clean:
	rm -f tt tt.exe $(LIB) src/tinytemplate.o
