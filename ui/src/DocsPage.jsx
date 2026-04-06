import { useEffect, useState } from "react";
import ReactMarkdown from "react-markdown";
import remarkGfm from "remark-gfm";

const CHAPTERS = [
  { slug: "user_manual",        title: "Overview" },
  { slug: "installation",       title: "Getting Started" },
  { slug: "using-the-shell",    title: "Using the Shell" },
  { slug: "help",               title: "Help" },
  { slug: "dos",                title: "Navigating Disk Drives and Directories" },
  { slug: "executing_programs", title: "Executing Programs" },
  { slug: "file-operations",    title: "File Operations" },
  { slug: "memory-operations",  title: "Memory Operations, Machine Language Monitor" },
  { slug: "pysic",              title: "PySIC Alternative to BASIC Programming" },
  { slug: "c-programming",      title: "Programming in C on the C64" },
  { slug: "api-sdk",            title: "Programming Server Apps" },
  { slug: "cloud-integration",  title: "Networking, Cloud Integration" },
  { slug: "file-manager",       title: "File Manager" },
  { slug: "server-file-editor", title: "Server-Side File Editor" },
  { slug: "ai-assistance",      title: "AI Assistance" },
  { slug: "csdb",               title: "CSDB.dk Commodore 64 Scene Database" },
];

// Sub-pages reachable via internal links but not shown in the sidebar nav.
const SUB_PAGES = [
  { slug: "file-manager",        title: "File Manager" },
  { slug: "server-file-editor", title: "File Editor" },
  { slug: "coding-agent",       title: "Coding Agent" },
  { slug: "web-browser",        title: "Web Browser" },
  { slug: "telegram-chat",      title: "Telegram Chat" },
  { slug: "rss-reader",         title: "RSS Reader" },
];

const ALL_PAGES = [...CHAPTERS, ...SUB_PAGES];

// Generate GitHub-compatible anchor IDs from heading children.
// Handles plain strings and inline elements (e.g. <code>).
function headingId(children) {
  const text = (Array.isArray(children) ? children : [children])
    .map((child) => {
      if (typeof child === "string") return child;
      if (child?.props?.children) return String(child.props.children);
      return "";
    })
    .join("");
  return text
    .toLowerCase()
    .replace(/[^\w\s-]/g, "")   // strip punctuation / special chars
    .replace(/\s+/g, "-")       // spaces → hyphens
    .replace(/-+/g, "-")        // collapse consecutive hyphens
    .trim();
}

export default function DocsPage() {
  const [activeSlug, setActiveSlug] = useState("user_manual");
  const [content, setContent] = useState("");
  const [loading, setLoading] = useState(false);
  const [error, setError] = useState(null);

  useEffect(() => {
    let cancelled = false;
    setLoading(true);
    setError(null);
    fetch(`/docs/${activeSlug}.md`)
      .then((r) => {
        if (!r.ok) throw new Error(`HTTP ${r.status}`);
        return r.text();
      })
      .then((text) => {
        if (!cancelled) {
          setContent(text);
          setLoading(false);
        }
      })
      .catch((err) => {
        if (!cancelled) {
          setError(err.message);
          setLoading(false);
        }
      });
    return () => { cancelled = true; };
  }, [activeSlug]);

  return (
    <div className="rounded-4 bg-white border shadow-sm" style={{ minHeight: "70vh", display: "flex" }}>
      {/* Sidebar */}
      <nav
        className="border-end py-3"
        style={{ width: "220px", flexShrink: 0, overflowY: "auto" }}
      >
        <p className="px-3 mb-2 text-uppercase fw-semibold" style={{ fontSize: "0.7rem", letterSpacing: "0.08em", color: "#888" }}>
          User Manual
        </p>
        <ul className="nav flex-column">
          {CHAPTERS.map((ch) => (
            <li className="nav-item" key={ch.slug}>
              <button
                type="button"
                onClick={() => setActiveSlug(ch.slug)}
                className="nav-link text-start w-100 px-3 py-1"
                style={{
                  background: "none",
                  border: "none",
                  cursor: "pointer",
                  fontSize: "0.875rem",
                  borderRadius: 0,
                  color: activeSlug === ch.slug ? "#0d6efd" : "#212529",
                  fontWeight: activeSlug === ch.slug ? 600 : 400,
                  borderLeft: activeSlug === ch.slug ? "3px solid #0d6efd" : "3px solid transparent",
                }}
              >
                {ch.title}
              </button>
            </li>
          ))}
        </ul>
      </nav>

      {/* Content */}
      <div className="p-4 flex-grow-1" style={{ minWidth: 0, overflowY: "auto" }}>
        {loading && (
          <div className="text-muted">Loading…</div>
        )}
        {error && (
          <div className="text-danger">Failed to load documentation: {error}</div>
        )}
        {!loading && !error && (
          <div className="docs-content">
            <ReactMarkdown
              remarkPlugins={[remarkGfm]}
              components={{
                h1: ({ children }) => <h1 id={headingId(children)}>{children}</h1>,
                h2: ({ children }) => <h2 id={headingId(children)}>{children}</h2>,
                h3: ({ children }) => <h3 id={headingId(children)}>{children}</h3>,
                h4: ({ children }) => <h4 id={headingId(children)}>{children}</h4>,
                // Handle links: inter-doc .md links navigate within the app;
                // external links open in a new tab; anchors are followed normally.
                a: ({ href, children, ...props }) => {
                  if (href?.endsWith(".md") && !href.startsWith("http")) {
                    const slug = href.replace(/^.*\//, "").replace(/\.md$/, "");
                    const known = ALL_PAGES.find((c) => c.slug === slug);
                    if (known) {
                      return (
                        <button
                          type="button"
                          onClick={() => setActiveSlug(slug)}
                          style={{
                            background: "none", border: "none", padding: 0,
                            color: "#0d6efd", cursor: "pointer", textDecoration: "underline",
                            font: "inherit",
                          }}
                        >
                          {children}
                        </button>
                      );
                    }
                    // .md link outside the manual (e.g. ../README.md) — render as external anchor
                    return (
                      <a href={href} target="_blank" rel="noopener noreferrer" {...props}>
                        {children}
                      </a>
                    );
                  }
                  const isExternal = href?.startsWith("http");
                  return (
                    <a
                      href={href}
                      {...(isExternal ? { target: "_blank", rel: "noreferrer" } : {})}
                      {...props}
                    >
                      {children}
                    </a>
                  );
                },
                // Render images with a max-width so they don't overflow
                img: ({ src, alt, ...props }) => (
                  <img src={src} alt={alt} style={{ maxWidth: "100%", borderRadius: "6px" }} {...props} />
                ),
              }}
            >
              {content}
            </ReactMarkdown>
          </div>
        )}
      </div>
    </div>
  );
}
