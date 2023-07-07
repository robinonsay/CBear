CC := gcc
CPPCHECK := cppcheck
OUT ?= $(abspath ./)/out
LIB_NAME := CBear
TARGET := $(OUT)/lib$(LIB_NAME).so
CFLAGS := --debug -std=c99 -Wall
LINK_FLAGS :=
LINK_DIRS :=
LINK_LIBS :=
INCLUDE_DIR := -I./include
SRCS:= $(wildcard ./src/*.c)
LINUX_SRCS := $(wildcard ./src/linux/*.c)
LINUX_LIBS := 
PLATFORM ?= LINUX

export CC OUT

.PHONY: clean

all: $(TARGET)

$(TARGET): $(OUT)
	if [ "$(PLATFORM)" = "LINUX" ]; then \
	$(CPPCHECK) $(SRCS) $(LINUX_SRCS)&& \
	$(CC) -shared $(CFLAGS) $(INCLUDE_DIR) -fPIC -o $@ $(SRCS) $(LINUX_SRCS) $(LINUX_LIBS); \
	fi

$(OUT):
	if ! [ -d $(OUT) ]; then \
		mkdir $(OUT); \
	fi

clean:
	if [ -d $(OUT) ]; then \
		rm -rf $(OUT); \
	fi


