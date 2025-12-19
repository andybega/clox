# clox

A C-based bytecode virtual machine for Lox, following the excellent and beautifully crafted book [Crafting Interpreters](https://craftinginterpreters.com/) by Robert Nystrom.

## Usage

To enter a REPL:

```bash 
./clox
```

To run a Lox script:

```bash
./clox tests/ch17-expressions.clox
```

I left some debug flags on `common.h`, comment those to get less verbose output. 

## Compile

```bash
make

./clox
```

## Tests

I started collecting various tests from the chapters as I was working through them. To run all: 

```bash
make test
```