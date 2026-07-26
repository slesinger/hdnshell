# TODO

```
Ask me any questions before you proceed to ensure you understand the task well.
```

```
zatuhava to a musi se rucne vypnout c64u  + log
  ROOT CAUSE (2026-07-25): concurrent, unthrottled DMA screen-pushes to
  Ultimate64 port-64 socket service (3 threads: inbound keypress, agent
  worker per status-tick, 1s refresh Timer), 2 fresh TCP connections each,
  no lock -> overlapping connects wedge the Ultimate fw network stack
  (RST / "server: down" / C=+RESTORE + REST poweroff dead / needs physical
  power-cycle).
  STEP 1 DONE: serialize all port-64 access with a lock in
    cloud/sdk/network_helper.py (_send_lock). Testing over time.
  STEP 3 TODO (if Step 1 insufficient): cut connection churn -- reuse ONE
    persistent keep-alive socket to port 64, or send screen+color as a
    single connection per frame instead of two (needs verifying the
    Ultimate accepts multiple commands per connection).






------
QUEUE


Running a prg by typing a name of the prg file only works if the letters are lowercase. POUZIJ medlika jako ukazku





Ask me any questions to make sure you understand what is needed. Grill me.
Use subagents utilizing smaller models like Sonnet5 to avoid hitting model quota limit.
```

