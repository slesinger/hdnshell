# HDN Cloud

Use Ulitimate Network target to make requests to HDN Cloud for command execution.
Data can be received synchronously or via a REST callback which can utilize DMA to write data directly to C64 memory.

Request protocol
- authentication token
- session id
- application id
- command
- data

Data saving binary protocol

Have a query tool to use/test the HDN Cloud API from PC

Host on GCP Cloud Run

Expose Ultimate via ngrok, Cloudflare Tunnel, Localtunnel, or Tailscale

Use nano LLMs

Google Maps app

For thin client C64 apps, use mText/SidekickMenu or similar plain text rich text format

## Application Types

#### Example: Database
Type: Thin client
Inputs: keystrokes
Output: Full screen updates

#### Example: Image search
Type: Realtime downloadable thick client
Input: search query, get image by id
Output: Data DMAed to C64 memory, display image


## Running the Cloud Server

To run the C64 Cloud server with a web status API:


1. Install all dependencies:

	```sh
	pip install -r requirements.txt
	```

2. Start the server:

	```sh
	python cloud.py
	```

This will start both the C64 TCP server and a web server on port 8585. You can check status at http://localhost:8585/status and see the number of connected C64 clients at http://localhost:8585/clients.

---

### CLI integrated

Sends commands to HDN Cloud for execution, receives text output that gets dispatched. It can handle standard output as well as cursor jumping.

#### Example: CSDB.dk integration
Type: Integrated CLI app
Input: CLI input line
Output: Text screen data as sync response or DMAed to C64 memory
