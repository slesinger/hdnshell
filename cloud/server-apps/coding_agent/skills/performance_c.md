High-performance Oscar64 C

Use this skill when the task is about speed: raster-time effects, per-frame updates, tight loops, or "make it faster." Oscar64 compiles C to native 6502; the same C idioms that are cheap on modern CPUs are often expensive here. Verify any pragma or keyword with the Oscar64 doc/symbol tools before relying on it.

Data types (cheapest first):
- `char` (8-bit, unsigned by default) is the fastest arithmetic type. Prefer it for counters, coordinates that fit in 0..255, and loop indices.
- `int`/`unsigned int` are 16-bit and cost roughly double. `long` (32-bit) and especially `float` are very slow — avoid `float` in per-frame code; use fixed-point (e.g. 8.8) built from `int`.
- Multiply/divide by non-powers-of-two invoke a software routine. Replace with shifts (`<<`, `>>`) or small lookup tables where possible.

Loops:
- Count down to zero: `for (char i = n; i != 0; i--)` lets the compiler test the zero flag for free instead of an explicit compare.
- Hoist invariant expressions and pointer bases out of the loop body.
- `#pragma unroll(full)` or `#pragma unroll(n)` applies to the *next* loop only — use it for scroll/copy inner loops where memory allows.

Placement and storage qualifiers (all verified in the Oscar64 docs):
- `__zeropage` places a variable in zero page for the fastest access; reserve it for the hottest pointers/counters — zero page is scarce.
- `__native` forces a function to compile to native code instead of the compact byte-code interpreter; apply it to hot functions and ISRs. Byte-code is smaller but slower.
- `__striped` stores an array of structs as a structure-of-arrays, making indexed field access much faster.
- `__noinline` / `inline` / `__forceinline` control inlining explicitly.
- `#pragma code(...)`, `#pragma data(...)`, `#pragma bss(...)` place code/data in specific regions — used to keep hot code out of banked or contended memory.

Optimizer control (function-level, affects functions after it):
- `#pragma optimize(push)` … `#pragma optimize(pop)` to scope settings.
- Options include `speed`, `size`, `maxinline`, `autoinline`, `constparams`, and levels `0`,`1`,`2`,`3`. Use `#pragma optimize(push) #pragma optimize(speed, maxinline, 3)` around a hot region, then `pop`.

Method:
1. Identify the actual hot path (per-frame / per-raster work), don't optimize cold setup code.
2. Reduce type width and eliminate multiply/divide first — usually the biggest win.
3. Then apply placement/inlining/optimizer pragmas to the confirmed hot functions.
4. Compile and, when the request needs it, run on target and observe. State what improved and what is still unverified. Do not claim a speedup you did not measure.
