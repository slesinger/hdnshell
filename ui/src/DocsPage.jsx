import { useEffect, useMemo, useState } from "react";
import ReactMarkdown from "react-markdown";
import remarkGfm from "remark-gfm";
import MiniSearch from "minisearch";

// Page list is loaded from /docs/docs-manifest.json at runtime.
// To add a new doc page: add an entry there — no JSX changes needed.
// nav:false entries are reachable via links but not shown in the sidebar.
// level:2 entries are shown indented (sub-pages, e.g. apps under Cloud Apps).

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

// Build a short excerpt around the first matching term, so results give
// context instead of always showing the start of the section.
function buildSnippet(text, terms) {
  if (!text) return "";
  const lower = text.toLowerCase();
  let hitIndex = -1;
  for (const term of terms) {
    const i = lower.indexOf(term.toLowerCase());
    if (i >= 0 && (hitIndex === -1 || i < hitIndex)) hitIndex = i;
  }
  const radius = 90;
  const start = hitIndex >= 0 ? Math.max(0, hitIndex - radius) : 0;
  const end = Math.min(text.length, start + radius * 2);
  const prefix = start > 0 ? "…" : "";
  const suffix = end < text.length ? "…" : "";
  return prefix + text.slice(start, end).trim() + suffix;
}

export default function DocsPage({ initialSlug }) {
  const [activeSlug, setActiveSlug] = useState(initialSlug || "user_manual");
  const [content, setContent] = useState("");
  const [loading, setLoading] = useState(false);
  const [error, setError] = useState(null);
  const [allPages, setAllPages] = useState([]);
  const [chapters, setChapters] = useState([]);
  const [pendingAnchor, setPendingAnchor] = useState(null);
  const [searchQuery, setSearchQuery] = useState("");
  const [searchIndex, setSearchIndex] = useState(null);

  useEffect(() => {
    fetch("/docs/docs-manifest.json")
      .then((r) => r.json())
      .then((data) => {
        const pages = data.pages || [];
        setAllPages(pages);
        setChapters(pages.filter((p) => p.nav !== false));
      })
      .catch(() => {});
  }, []);

  // Load the pre-built search index once; it covers every doc page
  // (docs/user_manual/*.md), not just the ones fetched so far.
  useEffect(() => {
    fetch("/docs/search-index.json")
      .then((r) => r.json())
      .then((entries) => {
        const mini = new MiniSearch({
          fields: ["pageTitle", "heading", "text"],
          storeFields: ["slug", "pageTitle", "heading", "anchor", "text"],
          searchOptions: {
            prefix: true,
            fuzzy: 0.2,
            boost: { pageTitle: 2, heading: 1.5 },
          },
        });
        mini.addAll(entries);
        setSearchIndex(mini);
      })
      .catch(() => {});
  }, []);

  const searchResults = useMemo(() => {
    const query = searchQuery.trim();
    if (!query || !searchIndex) return [];
    const terms = query.split(/\s+/);
    return searchIndex
      .search(query)
      .slice(0, 30)
      .map((r) => ({
        slug: r.slug,
        pageTitle: r.pageTitle,
        heading: r.heading,
        anchor: r.anchor,
        snippet: buildSnippet(r.text, terms),
      }));
  }, [searchQuery, searchIndex]);

  function goToResult(result) {
    setActiveSlug(result.slug);
    setPendingAnchor(result.anchor);
    setSearchQuery("");
  }

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

  // Scroll to a heading once its content has rendered, for cross-page anchor links.
  useEffect(() => {
    if (!pendingAnchor || loading) return;
    const id = pendingAnchor;
    const raf = requestAnimationFrame(() => {
      document.getElementById(id)?.scrollIntoView();
      setPendingAnchor(null);
    });
    return () => cancelAnimationFrame(raf);
  }, [pendingAnchor, loading, content]);

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
          {chapters.map((ch) => {
            const isSub = ch.level === 2;
            return (
              <li className="nav-item" key={ch.slug}>
                <button
                  type="button"
                  onClick={() => setActiveSlug(ch.slug)}
                  className="nav-link text-start w-100 py-1"
                  style={{
                    background: "none",
                    border: "none",
                    cursor: "pointer",
                    fontSize: isSub ? "0.8rem" : "0.875rem",
                    borderRadius: 0,
                    paddingLeft: isSub ? "2rem" : "1rem",
                    paddingRight: "1rem",
                    color: activeSlug === ch.slug ? "#0d6efd" : "#212529",
                    fontWeight: activeSlug === ch.slug ? 600 : 400,
                    borderLeft: activeSlug === ch.slug ? "3px solid #0d6efd" : "3px solid transparent",
                  }}
                >
                  {ch.title}
                </button>
              </li>
            );
          })}
        </ul>
      </nav>

      {/* Content */}
      <div className="p-4 flex-grow-1" style={{ minWidth: 0, overflowY: "auto" }}>
        <div className="mb-4 docs-search-box">
          <span className="docs-search-icon">
            <svg width="18" height="18" viewBox="0 0 24 24" fill="none" stroke="currentColor" strokeWidth="2" strokeLinecap="round" strokeLinejoin="round">
              <circle cx="11" cy="11" r="7" />
              <line x1="21" y1="21" x2="16.65" y2="16.65" />
            </svg>
          </span>
          <input
            type="search"
            className="docs-search-input"
            placeholder="Search the manual…"
            value={searchQuery}
            onChange={(e) => setSearchQuery(e.target.value)}
          />
        </div>

        {searchQuery.trim() ? (
          <div className="docs-search-results">
            <p className="text-muted mb-3">
              {searchResults.length} result{searchResults.length === 1 ? "" : "s"} for “{searchQuery.trim()}”
            </p>
            {searchResults.map((r) => (
              <button
                key={`${r.slug}#${r.anchor || ""}`}
                type="button"
                onClick={() => goToResult(r)}
                className="d-block w-100 text-start border-0 border-bottom bg-transparent py-3"
                style={{ cursor: "pointer" }}
              >
                <div className="fw-semibold" style={{ color: "#0d6efd" }}>
                  {r.pageTitle}
                  {r.heading && r.heading !== r.pageTitle ? ` › ${r.heading}` : ""}
                </div>
                {r.snippet && (
                  <div className="text-body-secondary small mt-1">{r.snippet}</div>
                )}
              </button>
            ))}
            {searchResults.length === 0 && (
              <p className="text-muted">No matches found.</p>
            )}
          </div>
        ) : (
          <>
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
                  const hashIndex = href?.indexOf("#") ?? -1;
                  const path = hashIndex >= 0 ? href.slice(0, hashIndex) : href;
                  const anchor = hashIndex >= 0 ? href.slice(hashIndex + 1) : null;
                  if (path?.endsWith(".md") && !path.startsWith("http")) {
                    const slug = path.replace(/^.*\//, "").replace(/\.md$/, "");
                    const known = allPages.find((c) => c.slug === slug);
                    if (known) {
                      return (
                        <button
                          type="button"
                          onClick={() => {
                            setActiveSlug(slug);
                            setPendingAnchor(anchor);
                          }}
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
                // Render images with a max-width so they don't overflow.
                // Supports "|width" suffix in alt text, e.g. ![caption|50%](src)
                // or ![caption|320px](src), to scale individual images.
                img: ({ src, alt, ...props }) => {
                  let width;
                  let cleanAlt = alt;
                  if (typeof alt === "string") {
                    const m = alt.match(/^(.*)\|\s*(\d+(?:px|%)?)\s*$/);
                    if (m) {
                      cleanAlt = m[1].trim();
                      width = /^\d+$/.test(m[2]) ? `${m[2]}px` : m[2];
                    }
                  }
                  return (
                    <img
                      src={src}
                      alt={cleanAlt}
                      style={{ maxWidth: "100%", width, borderRadius: "6px" }}
                      {...props}
                    />
                  );
                },
              }}
            >
              {content}
            </ReactMarkdown>
          </div>
            )}
          </>
        )}
      </div>
    </div>
  );
}
