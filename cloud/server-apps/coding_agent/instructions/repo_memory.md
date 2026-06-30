Repo memory

Project-specific facts that improve reliability:
- Prefer the runtime Oscar tree at WORKSPACE_DIR/oscar, with cloud/oscar only as a development fallback.
- Symbol lookup, documentation lookup, and compile tools must resolve Oscar paths consistently to avoid false missing-symbol diagnostics.
- This project already guards against spr_set image/address mismatches; keep that validation behavior intact when adjusting the harness.
- The user drives the agent from a C64 console, so terse, truthful progress and outcome reporting matters more than verbose narration.