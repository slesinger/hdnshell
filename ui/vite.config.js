import { defineConfig } from "vite";
import react from "@vitejs/plugin-react";
import { viteStaticCopy } from "vite-plugin-static-copy";
import fs from "fs";
import path from "path";
import { fileURLToPath } from "url";

const __dirname = path.dirname(fileURLToPath(import.meta.url));

// Dev-only plugin: serve ../docs/user_manual/*.md at /docs/<file>.md
function devDocsPlugin() {
  return {
    name: "dev-docs",
    apply: "serve",
    configureServer(server) {
      server.middlewares.use((req, res, next) => {
        if (req.url?.startsWith("/docs/") && req.url.endsWith(".md")) {
          const filename = path.basename(req.url);
          const filePath = path.resolve(__dirname, "../docs/user_manual", filename);
          if (fs.existsSync(filePath)) {
            res.setHeader("Content-Type", "text/markdown; charset=utf-8");
            res.end(fs.readFileSync(filePath, "utf-8"));
            return;
          }
        }
        next();
      });
    },
  };
}

export default defineConfig({
  plugins: [
    react(),
    devDocsPlugin(),
    viteStaticCopy({
      targets: [
        {
          src: "../docs/user_manual/*.md",
          dest: "docs",
        },
      ],
    }),
  ],
  build: {
    outDir: "../cloud/static",
    emptyOutDir: true,
  },
  server: {
    port: 5173,
  },
});
