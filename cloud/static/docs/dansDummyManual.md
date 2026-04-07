  1. Make sure dependencies are installed:

  cd cloud
  source ../venv/bin/activate
  pip install -r requirements.txt

  Playwright needs a browser installed too — if you haven't already:

  python -m playwright install chromium

  2. Start the server:
cd ..
  make build-ui
  make run-server

  python cloud.py

  This starts both the TCP server (port 6464 for the C64) and the Flask web server. 

  3. In your browser, switch to the address given by the server, e.g. http://192.168.178.100:8064
  This is control screen of your server from which you can control your C64.

  First, "Download & update" to get install the latest ROM  

  The wiki
  browser console will be available when you switch to it from the C64.

  3. On the C64 side:

  The C64 needs to be connected to the server (same network, server IP configured). Once
  connected to the shell:

  - Press C=+7 to switch to the Wikipedia browser
  - You'll see the welcome screen with:
    - F1 — Go to wikipedia.org (portal with language links)
    - F7 — Search Wikipedia (type query, UP/DOWN to change language)
    - F8 — Help

  4. Browsing:

  - UP/DOWN — scroll line by line
  - F3/F5 — page up/down
  - SPACE — cycle through links on screen
  - RETURN — follow highlighted link
  - LEFT ARROW — go back