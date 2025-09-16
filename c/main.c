#include "common.h"
#include "chunk.h"
#include "debug.h"
#include "vm.h"

int main(int argc, const char* argv[]) {
    initVM();

    Chunk chunk;
    initChunk(&chunk);

    // Hand code a constant
    int constant = addConstant(&chunk, 1.2);
    writeChunk(&chunk, OP_CONSTANT, 123);
    writeChunk(&chunk, constant, 123);

    writeChunk(&chunk, OP_RETURN, 123);

    // Print the bytecode
    disassembleChunk(&chunk, "test chunk");

    // VM interprets the bytecode
    interpret(&chunk);

    freeVM();
    freeChunk(&chunk);
    return 0;
}