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
  NOTE: Step 2 (throttle/coalesce pushes) rejected -- pushes must stay
    interactive (SSH-like), one reaction per push.


code agent:
use 2 space instead of 4 for formatting.
recursion limit is set to 20. It can be limiting if the coding is in a good progress but it is more than enough if the agent is stuck in a loop. Can you detect it?


HDN arming should also switch the font to lower case


verze crt

------
QUEUE

Version 1.0.0 UPLOADED on GIHUB
The UI also allows to easily enable/dasable the ROM/cartridge. The UI button Download&Update must work with the crt and cfg in the cart filder. Adjust the procedure.
Server UI has Enable and Disable buttons who need to influence if HDN shell cartridge is inserted or is empty slot. Previously these buttons worked but instead of manipulating cartridge slot, it was manipulating BASIC ROM.
Ask me any questions before you proceed to ensure you understand the task well.



Ask me any questions to make sure you understand what is needed. Grill me.
Use subagents utilizing smaller models like Sonnet5 to avoid hitting model quota limit.
```

