# PySIC, the Python Scripting Alternative to BASIC

Because BASIC was stripped from the ROM, a Python scripting is made available for limited scripting as an alternative. It is physically executed in the server compute. The idea is to offer functions to python that will be able to work with the C64 memory, disk, and other resources, so that it can be used for more complex tasks than just a calculator.

`?` prefix indicates that the following text will be sent to the Python Eval Handler on the server, executed and standard output results returned and displayed on the C64 command line.

For security reasons, only a limited set of Python built-in functions and math operations are allowed. You can get an idea of what is possible by looking at the [source code](https://github.com/slesinger/hdnshell/blob/e8c4e2c86f7bac1b2294743ca37c2340c6d80930/cloud/python_eval_handler.py#L14).

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

`?0x2000` -> `8192 ($2000)`

`?hex(49152)` -> `0xc000`

`?bin(0xea)` -> `0b11101010`

### Math Functions
- `sqrt()`, `pi`, `e`
- `sin()`, `cos()`, `tan()`
- `log()`, `log10()`, `exp()`
- `floor()`, `ceil()`
