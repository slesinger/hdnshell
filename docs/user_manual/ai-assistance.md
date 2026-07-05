# AI Assistance

You can chat with a C64-aware AI assistant anytime, right at the `READY.` prompt — no need to run an AI program or anything. With HDN Shell RR, **any line you type that isn't a shell command or valid BASIC is forwarded to the assistant automatically**; you can also address it explicitly with the `i:` prefix. You need to have the HDN Server running and your C64U connected to it. Also, you need to have an LLM API key configured in the web UI `Settings` in the `Chatting LLM` section.

You can ask anything about the HDN Shell, how to do things, or even general questions about C64. The AI will try to answer based on the user manual and its general knowledge.

## What the Assistant Can Do

Beyond answering questions, the assistant has tools to work with your real machine and the server:

- **Search this manual** and C64 reference documentation (hardware registers, memory map, KERNAL).
- **Search the web** (requires a web-search API key in Settings).
- **Read your screen** — see below.
- **Type on your keyboard** — it can send keystrokes to your C64U and do things for you.
- **Read, analyze, and modify C64 memory** over the network, including finding sprites or SID data in a memory range.
- **Control the machine** — reset it or enter the Ultimate menu.
- **Work with files in the server workspace**, compile Oscar64 C projects, and run the resulting `.prg` directly on your C64.
- **Remember things** — it keeps its own notes (instructions, preferences, current state) in the server workspace between sessions.

## Syntax

`i:<utterance>` to send your thoughts to the AI and it will respond like

 `<response>`

With HDN Shell RR the prefix is optional at the `READY.` prompt — any unrecognized line reaches the assistant.

## Example

### Asking a general question:

```
i:how much is 96-32?
96 - 32 = 64
```

### Using AI Web Search

![AI Web Search](../assets/ai-websearch.png)


### Screen Reading

The AI can use a tool to see the content of your screen and help you with it. For example, if there is an error on the screen, you can just ask `How do I fix the error`. To make this work, the `Web Remote Control` service needs to be enabled on the C64U.

The following screenshot is using a memory listing at $0800 just as an example of content that AI can read from the screen and work with. You can ask AI to explain what is on the screen, or how to fix an error, or even ask it to modify the content for you and send the modified content back to your C64U.

![AI Screen](../assets/ai-screen.png)

### Keyboard typing

You can ask AI to do things for you. For example, if you ask `How do I list files on disk?`, it can send the command `LL` for you.

![AI Screen](../assets/ai-typekeys.png)
