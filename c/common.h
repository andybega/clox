#ifndef clox_common_h
#define clox_common_h

#include <stdbool.h>
#include <stddef.h>
#include <stdint.h>

#define DEBUG_PRINT_CODE
//#define DEBUG_TRACE_EXECUTION  // Enable this to see trace output

#define DEBUG_STRESS_GC // Enable this to stress test the garbage collector
#define DEBUG_LOG_GC    // Enable this to see garbage collector logs

#define UINT8_COUNT (UINT8_MAX + 1)

#endif