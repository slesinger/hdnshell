import fs from "fs";
import path from "path";

// Generates docs/user_manual/search-index.json from the doc markdown files,
// so the browser can search the manual without fetching every page.
// One entry per heading section (h1-h4), matching the anchor IDs DocsPage.jsx
// generates at render time (see headingId() there) so search results and
// in-page anchors always agree.

function headingId(text) {
  return text
    .toLowerCase()
    .replace(/[^\w\s-]/g, "")
    .replace(/\s+/g, "-")
    .replace(/-+/g, "-")
    .trim();
}

// Strip markdown syntax down to plain, searchable text.
function mdToText(md) {
  return md
    .replace(/```[\s\S]*?```/g, (block) => block.replace(/```\w*\n?/g, "").replace(/```/g, ""))
    .replace(/!\[([^\]]*)\]\([^)]*\)/g, "$1")
    .replace(/\[([^\]]*)\]\([^)]*\)/g, "$1")
    .replace(/[`*_>#|]/g, "")
    .replace(/\s+/g, " ")
    .trim();
}

function splitIntoSections(markdown, pageTitle) {
  const lines = markdown.split("\n");
  const sections = [];
  let current = { heading: null, anchor: null, body: [] };

  for (const line of lines) {
    const match = /^(#{1,4})\s+(.*)$/.exec(line);
    if (match) {
      if (current.heading || current.body.length) sections.push(current);
      // Anchor/display text must derive from the rendered (stripped) heading,
      // not the raw markdown - DocsPage.jsx computes its DOM ids from
      // react-markdown's rendered children, e.g. a link's visible text, never
      // its href, so a heading like "## [Releases](https://...)" must anchor
      // on "releases", not on the URL's characters.
      const heading = mdToText(match[2].trim());
      current = { heading, anchor: headingId(heading), body: [] };
    } else {
      current.body.push(line);
    }
  }
  if (current.heading || current.body.length) sections.push(current);

  return sections
    .map((s) => ({
      heading: s.heading || pageTitle,
      anchor: s.heading ? s.anchor : null,
      text: mdToText(s.body.join("\n")),
    }))
    .filter((s) => s.text || s.heading);
}

export function generateSearchIndex(docsDir) {
  const manifestPath = path.join(docsDir, "docs-manifest.json");
  const manifest = JSON.parse(fs.readFileSync(manifestPath, "utf-8"));

  const seen = new Set();
  const entries = [];
  let id = 0;

  for (const page of manifest.pages || []) {
    if (seen.has(page.slug)) continue;
    seen.add(page.slug);

    const mdPath = path.join(docsDir, `${page.slug}.md`);
    if (!fs.existsSync(mdPath)) continue;
    const markdown = fs.readFileSync(mdPath, "utf-8");

    for (const section of splitIntoSections(markdown, page.title)) {
      entries.push({
        id: id++,
        slug: page.slug,
        pageTitle: page.title,
        heading: section.heading,
        anchor: section.anchor,
        text: section.text,
      });
    }
  }

  const outPath = path.join(docsDir, "search-index.json");
  fs.writeFileSync(outPath, JSON.stringify(entries));
  return outPath;
}
