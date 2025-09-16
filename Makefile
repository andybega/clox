
NAME := clox

CFLAGS := -std=c99
CFLAGS += -O0 -DDEBUG -g
CFLAGS += -Wall -Wextra -Werror -Wno-unused-parameter

CFLAGS += -Wno-unused-function

SOURCE_DIR := c
BUILD_DIR := build

HEADERS := $(wildcard $(SOURCE_DIR)/*.h)
SOURCES := $(wildcard $(SOURCE_DIR)/*.c)
OBJECTS := $(addprefix $(BUILD_DIR)/$(NAME)/, $(notdir $(SOURCES:.c=.o)))

# Targets ---------------------------------------------------------------------

# Link the interpreter.
$(NAME): $(OBJECTS)
	@ printf "%8s %-40s %s\n" $(CC) $@ "$(CFLAGS)"
	@ mkdir -p build
	@ $(CC) $(CFLAGS) $^ -o $@

# Compile object files.
$(BUILD_DIR)/$(NAME)/%.o: $(SOURCE_DIR)/%.c $(HEADERS)
	@ printf "%8s %-40s %s\n" $(CC) $< "$(CFLAGS)"
	@ mkdir -p $(BUILD_DIR)/$(NAME)
	@ $(CC) -c $(C_LANG) $(CFLAGS) -o $@ $<

.PHONY: default