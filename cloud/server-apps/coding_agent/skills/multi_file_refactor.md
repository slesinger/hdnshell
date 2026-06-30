Multi-file refactor workflow

Start by identifying the owning .c file and the headers that declare the affected API or shared data. Check include relationships before editing.

When changing function signatures, structs, constants, or shared globals, update every declaration and call site in one pass. Compile immediately after the first coordinated edit set.