
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

# Run all tests in the tests/ directory
.PHONY: test
test: $(NAME)
	@ echo "Running tests..."
	@ start_time=$$(date +%s.%N); \
	for test in tests/*.clox; do \
		echo "Testing $$test..."; \
		if [ "$$test" = "tests/ch24-stack-trace.clox" ]; then \
			./$(NAME) $$test || echo "(Expected error in stack trace test)"; \
		else \
			./$(NAME) $$test || exit 1; \
		fi; \
	done; \
	end_time=$$(date +%s.%N); \
	elapsed=$$(echo "$$end_time - $$start_time" | bc); \
	echo "All tests passed!"; \
	printf "Total time: %.3f seconds\n" $$elapsed

.PHONY: default