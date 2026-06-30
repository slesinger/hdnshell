Build debug loop

Use the first compile failure as the anchor. Fix the earliest relevant error, rebuild, and avoid speculative cleanups outside that slice.

If the build passes but runtime behavior is still wrong, inspect the controlling code path, compare assumptions against the actual C64 or Ultimate behavior, and make the next smallest change.