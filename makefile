# Determine the platform
OS := $(shell uname)

# Set executable name based on the platform
ifeq ($(OS), Windows_NT)
    EXE := tt.exe
    GCC := $(MINGWPATH)/gcc
else
    EXE := tt
    GCC := $(MINGWPATH)/gcc
endif

all: $(EXE)

$(EXE): src/cli.c src/tinytemplate.c 3p/xjson.c
	$(GCC) $^ -o $@ -Wall -Wextra -g -I3p

clean:
	rm -f tt tt.exe
