Memory layout checks

Before changing fixed addresses, screen buffers, sprite memory, or DMA-visible data, identify the owning constants and any related headers or comments that define the layout.

Call out overlaps, alignment assumptions, banked memory expectations, and address-derived calculations explicitly. Prefer one verified memory-map change over several speculative edits.