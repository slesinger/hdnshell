# C64 Cloud Server - Quick Reference

## Command Syntax

| Command | Description | Example |
|---------|-------------|---------|
| `I: <question>` | Ask AI assistant | `I: what is peek and poke?` |
| `help [topic]` | Get help | `help`, `help chat` |
| `? <expression>` | Evaluate Python | `? 2 + 2`, `? hex(49152)` |
| `c: <query>` | Query CSDB | `c: release 1234` |

## Python Eval Functions

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

### Math Functions
- `sqrt()`, `pi`, `e`
- `sin()`, `cos()`, `tan()`
- `log()`, `log10()`, `exp()`
- `floor()`, `ceil()`

## Help Topics

- `help` - General help
- `help chat` - Chat/AI help
- `help python` - Python eval help
- `help csdb` - CSDB query help
- `help commands` - Command list

## Common C64 Conversions

```
? hex(49152)   # Screen memory: $C000
? hex(53280)   # Border color: $D020
? hex(53281)   # Background: $D021
? hex(54272)   # SID: $D400
? hex(65535)   # Max address: $FFFF
```

## CSDB Queries

Currently supports ID-based queries:

```
c: release 12345  # Get release by ID
c: group 678      # Get group by ID
c: scener 999     # Get scener by ID
c: event 42       # Get event by ID
```

Find IDs by browsing https://csdb.dk

## Setup for Full Features

### Required (core functionality)
```bash
pip install requests pydantic pytest
```

### Optional (LLM chat features)
```bash
pip install langchain langchain-openai langchain-community
export OPENAI_API_KEY="your-key-here"
```

### Optional (web search in chat)
```bash
export SERPAPI_API_KEY="your-key-here"
export GOOGLE_CSE_ID="your-cse-id"
```

### Optional (documentation access)
```bash
export CONTEXT7_API_KEY="your-key-here"
```

## Testing

```bash
# Run all tests
pytest -v

# Run example demo
python example_dispatcher.py

# Test with client simulator
python test_client.py
```

## Server Startup

```bash
# Default (port 6464)
python cloud.py

# Custom port
python cloud.py --port 8080

# Debug mode
python cloud.py --debug
```

## File Structure

```
cloud/
├── cloud.py                    # Main server
├── base_handler.py             # Handler base class
├── chat_handler.py             # AI chat (I:)
├── help_handler.py             # Help system
├── python_eval_handler.py      # Python eval (?)
├── csdb_handler.py             # CSDB queries (c:)
├── test_cloud.py               # Core tests
├── test_handlers.py            # Handler tests
├── test_client.py              # Test client
├── example_dispatcher.py       # Demo script
└── README_CLOUD.md             # Full documentation
```

## Security Notes

- Python eval is sandboxed (no file/network access)
- No module imports allowed in eval
- All handlers run in same process
- API keys stored in environment variables (not in code)

## Troubleshooting

### "Chat service unavailable"
- Install LangChain: `pip install langchain langchain-openai`
- Set API key: `export OPENAI_API_KEY="your-key"`

### "CSDB network error"
- Check internet connection
- Verify csdb.dk is accessible
- Try again later (rate limiting)

### Python eval errors
- Check syntax: `? 2+2` not `?2 +2`
- Use allowed functions only
- See `help python` for function list
