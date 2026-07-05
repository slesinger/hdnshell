# PySIC, Python Expressions from the C64 Prompt

PySIC gives you the option to execute Python expressions on the HDN Server, straight from the C64 command line. It is not a replacement for BASIC — BASIC is right there at the same prompt — it is a complement: instant access to modern math, conversions, and (in the future) functions that work with the C64 memory, disk, and other resources, without writing a program.

`:` prefix indicates that the following text will be sent to the Python Eval Handler on the server, executed, and the result (or printed output) returned and displayed on the C64 command line.

For security reasons, only a limited set of Python built-in functions and math operations are allowed. You can get an idea of what is possible by looking at the [source code](https://github.com/slesinger/hdnshell/blob/master/cloud/handlers/python_eval_handler.py).

![Simple PySIC Example](../assets/pysic-screenshot.png)

## Commands

### Basic Math
- `+`, `-`, `*`, `/`, `//`, `%`, `**`
- `abs()`, `min()`, `max()`, `sum()`
- `divmod()`, `pow()`, `round()`

### Conversions
- `hex()` - Decimal to hex
- `bin()` - Decimal to binary
- `oct()` - Decimal to octal
- `int()`, `float()`, `str()`
- `chr()`, `ord()` - Character conversions

### Number Conversion

`:0x2000` -> `8192 ($2000)`

`:hex(49152)` -> `0xc000`

`:bin(0xea)` -> `0b11101010`

### Math Functions
- `sqrt()`, `pi`, `e`
- `sin()`, `cos()`, `tan()`
- `log()`, `log10()`, `exp()`
- `floor()`, `ceil()`
