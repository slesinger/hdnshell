Source of truth for manual pages is user_manual is the `docs/user_manual/` folder.
UI build copies those files into cloud/static/docs automatically.
This is configured in vite.config.js:57 via viteStaticCopy and output to static via vite.config.js:76.
