import { useRef, useState, useCallback, useEffect } from "react";
import { API_BASE_URL } from "./api.js";

const TOTAL_MEM = 65536;
const MAP_W = 256;
const MAP_H = 256;
const CANVAS_W = MAP_W * 2;  // 512px — each byte = 2 pixels wide
const CANVAS_H = MAP_H * 2;  // 512px — each byte = 2 pixels tall (2×2 per byte)
const BYTES_PER_ROW = 16;
const DUMP_BLOCKS = 7; // 3 before + clicked + 3 after
const DUMP_WINDOW = DUMP_BLOCKS * 256; // 1792 bytes

// ── PETSCII → printable ASCII approximation ─────────────────────────────────
function petsciiToChar(b) {
  // Printable range 0x20-0x7E (space through tilde) — map directly
  if (b >= 0x20 && b <= 0x7e) return String.fromCharCode(b);
  // Uppercase letters in shifted PETSCII (0xC1-0xDA → A-Z)
  if (b >= 0xc1 && b <= 0xda) return String.fromCharCode(b - 0xc1 + 0x41);
  return ".";
}

// ── Search helpers ──────────────────────────────────────────────────────────
function parseHexPattern(text, allowWildcard) {
  const tokens = text.trim().split(/\s+/);
  if (tokens.length === 0 || (tokens.length === 1 && tokens[0] === "")) return null;
  const pattern = [];
  for (const t of tokens) {
    if (allowWildcard && t === "??") {
      pattern.push(null); // wildcard
    } else {
      const v = parseInt(t, 16);
      if (isNaN(v) || v < 0 || v > 255) return null;
      pattern.push(v);
    }
  }
  return pattern;
}

function textToPetscii(text) {
  // Simple ASCII → PETSCII: uppercase letters stay as-is, lowercase → uppercase PETSCII
  const bytes = [];
  for (let i = 0; i < text.length; i++) {
    let c = text.charCodeAt(i);
    if (c >= 0x61 && c <= 0x7a) c -= 0x20; // lowercase → uppercase
    bytes.push(c & 0xff);
  }
  return bytes;
}

function searchMemory(data, pattern) {
  if (!data || !pattern || pattern.length === 0) return [];
  const matches = [];
  const pLen = pattern.length;
  const limit = data.length - pLen + 1;
  for (let i = 0; i < limit; i++) {
    let found = true;
    for (let j = 0; j < pLen; j++) {
      if (pattern[j] !== null && data[i + j] !== pattern[j]) {
        found = false;
        break;
      }
    }
    if (found) matches.push(i);
  }
  return matches;
}

const LAZY_LOAD_BLOCKS = 3; // blocks to prepend/append on scroll
const LAZY_LOAD_BYTES = LAZY_LOAD_BLOCKS * 256;
const SCROLL_THRESHOLD = 50; // px from top/bottom to trigger lazy load

// ── Component ───────────────────────────────────────────────────────────────
export default function InspectorPage() {
  const canvasRef = useRef(null);
  const dumpRef = useRef(null);

  const [memoryData, setMemoryData] = useState(null); // Uint8Array(65536)
  const [loading, setLoading] = useState(false);
  const [error, setError] = useState(null);

  // Web Remote Control Service availability
  const [webRemoteAvailable, setWebRemoteAvailable] = useState(null); // null = unknown, true/false

  // Dump window state
  const [dumpStart, setDumpStart] = useState(0);
  const [dumpEnd, setDumpEnd] = useState(0);
  const [selectedBlock, setSelectedBlock] = useState(-1); // block-aligned address of clicked block

  // Find state
  const [findText, setFindText] = useState("");
  const [findMode, setFindMode] = useState("hex"); // "hex" | "text"
  const [advanced, setAdvanced] = useState(false);
  const [matches, setMatches] = useState([]); // array of addresses
  const [matchIdx, setMatchIdx] = useState(-1);
  const [findPatternLen, setFindPatternLen] = useState(0);

  // ── Check Web Remote Control Service on mount ───────────────────────────
  useEffect(() => {
    let cancelled = false;
    (async () => {
      try {
        const resp = await fetch(`${API_BASE_URL}/c64/status_extended`);
        if (resp.ok) {
          const payload = await resp.json();
          if (!cancelled) setWebRemoteAvailable(Boolean(payload?.web_remote_control_enabled));
        }
      } catch {
        // leave as null (unknown)
      }
    })();
    return () => { cancelled = true; };
  }, []);

  // ── Read full 64K ───────────────────────────────────────────────────────
  const readMemory = useCallback(async () => {
    setLoading(true);
    setError(null);
    try {
      const resp = await fetch(
        `${API_BASE_URL}/c64/readmem?address=0000&length=65536`
      );
      if (!resp.ok) {
        const body = await resp.text();
        throw new Error(body || `HTTP ${resp.status}`);
      }
      const buf = await resp.arrayBuffer();
      setMemoryData(new Uint8Array(buf));
      setMatches([]);
      setMatchIdx(-1);
    } catch (e) {
      setError(e.message);
    } finally {
      setLoading(false);
    }
  }, []);

  // ── Draw memory map on canvas ─────────────────────────────────────────
  const drawCanvas = useCallback(() => {
    const canvas = canvasRef.current;
    if (!canvas || !memoryData) return;
    const ctx = canvas.getContext("2d");
    const img = ctx.createImageData(CANVAS_W, CANVAS_H);
    const d = img.data;

    for (let i = 0; i < TOTAL_MEM; i++) {
      const v = memoryData[i];
      const lx = i % MAP_W;
      const ly = Math.floor(i / MAP_W);
      const px = lx * 2; // canvas x (2 pixels wide)
      const py = ly * 2; // canvas y (2 pixels tall)
      // top-left
      const off0 = (py * CANVAS_W + px) * 4;
      d[off0] = v; d[off0 + 1] = v; d[off0 + 2] = v; d[off0 + 3] = 255;
      // top-right
      const off1 = (py * CANVAS_W + px + 1) * 4;
      d[off1] = v; d[off1 + 1] = v; d[off1 + 2] = v; d[off1 + 3] = 255;
      // bottom-left
      const off2 = ((py + 1) * CANVAS_W + px) * 4;
      d[off2] = v; d[off2 + 1] = v; d[off2 + 2] = v; d[off2 + 3] = 255;
      // bottom-right
      const off3 = ((py + 1) * CANVAS_W + px + 1) * 4;
      d[off3] = v; d[off3 + 1] = v; d[off3 + 2] = v; d[off3 + 3] = 255;
    }

    // Highlight selected block (blue tint)
    if (selectedBlock >= 0) {
      for (let i = selectedBlock; i < selectedBlock + 256 && i < TOTAL_MEM; i++) {
        const lx = i % MAP_W;
        const ly = Math.floor(i / MAP_W);
        const px = lx * 2;
        const py = ly * 2;
        const off0 = (py * CANVAS_W + px) * 4;
        d[off0] = Math.min(255, d[off0] + 40); d[off0 + 1] = Math.min(255, d[off0 + 1] + 40); d[off0 + 2] = 255;
        const off1 = (py * CANVAS_W + px + 1) * 4;
        d[off1] = Math.min(255, d[off1] + 40); d[off1 + 1] = Math.min(255, d[off1 + 1] + 40); d[off1 + 2] = 255;
        const off2 = ((py + 1) * CANVAS_W + px) * 4;
        d[off2] = Math.min(255, d[off2] + 40); d[off2 + 1] = Math.min(255, d[off2 + 1] + 40); d[off2 + 2] = 255;
        const off3 = ((py + 1) * CANVAS_W + px + 1) * 4;
        d[off3] = Math.min(255, d[off3] + 40); d[off3 + 1] = Math.min(255, d[off3 + 1] + 40); d[off3 + 2] = 255;
      }
    }

    // Highlight search matches (red tint)
    for (const addr of matches) {
      for (let j = 0; j < findPatternLen && (addr + j) < TOTAL_MEM; j++) {
        const idx = addr + j;
        const lx = idx % MAP_W;
        const ly = Math.floor(idx / MAP_W);
        const px = lx * 2;
        const py = ly * 2;
        const off0 = (py * CANVAS_W + px) * 4;
        d[off0] = 255; d[off0 + 1] = 60; d[off0 + 2] = 60;
        const off1 = (py * CANVAS_W + px + 1) * 4;
        d[off1] = 255; d[off1 + 1] = 60; d[off1 + 2] = 60;
        const off2 = ((py + 1) * CANVAS_W + px) * 4;
        d[off2] = 255; d[off2 + 1] = 60; d[off2 + 2] = 60;
        const off3 = ((py + 1) * CANVAS_W + px + 1) * 4;
        d[off3] = 255; d[off3 + 1] = 60; d[off3 + 2] = 60;
      }
    }

    ctx.putImageData(img, 0, 0);
  }, [memoryData, selectedBlock, matches, findPatternLen]);

  useEffect(() => { drawCanvas(); }, [drawCanvas]);

  // ── Canvas click → select block → update dump ─────────────────────────
  const handleCanvasClick = useCallback((e) => {
    if (!memoryData) return;
    const rect = canvasRef.current.getBoundingClientRect();
    const x = Math.floor((e.clientX - rect.left) / 2);
    const y = Math.floor(e.clientY - rect.top);
    const row = Math.floor(y / 2);
    const addr = row * MAP_W + x;
    const blockStart = addr & 0xff00;
    setSelectedBlock(blockStart);
    const start = Math.max(0, blockStart - 3 * 256);
    const end = Math.min(TOTAL_MEM, blockStart + 4 * 256);
    setDumpStart(start);
    setDumpEnd(end);
  }, [memoryData]);

  // ── Find ──────────────────────────────────────────────────────────────
  const doFind = useCallback(() => {
    if (!memoryData || !findText.trim()) return;
    let pattern;
    if (findMode === "hex") {
      pattern = parseHexPattern(findText, advanced);
    } else {
      pattern = textToPetscii(findText);
    }
    if (!pattern || pattern.length === 0) {
      setMatches([]);
      setMatchIdx(-1);
      setFindPatternLen(0);
      return;
    }
    setFindPatternLen(pattern.length);
    const found = searchMemory(memoryData, pattern);
    setMatches(found);
    if (found.length > 0) {
      setMatchIdx(0);
      navigateToMatch(found[0]);
    } else {
      setMatchIdx(-1);
    }
  }, [memoryData, findText, findMode, advanced]);

  const navigateToMatch = useCallback((addr) => {
    const blockStart = addr & 0xff00;
    setSelectedBlock(blockStart);
    const start = Math.max(0, blockStart - 3 * 256);
    const end = Math.min(TOTAL_MEM, blockStart + 4 * 256);
    setDumpStart(start);
    setDumpEnd(end);
  }, []);

  const goPrevMatch = useCallback(() => {
    if (matches.length === 0) return;
    const idx = matchIdx <= 0 ? matches.length - 1 : matchIdx - 1;
    setMatchIdx(idx);
    navigateToMatch(matches[idx]);
  }, [matches, matchIdx, navigateToMatch]);

  const goNextMatch = useCallback(() => {
    if (matches.length === 0) return;
    const idx = matchIdx >= matches.length - 1 ? 0 : matchIdx + 1;
    setMatchIdx(idx);
    navigateToMatch(matches[idx]);
  }, [matches, matchIdx, navigateToMatch]);

  const handleFindKeyDown = useCallback((e) => {
    if (e.key === "Enter") {
      e.preventDefault();
      doFind();
    }
  }, [doFind]);

  // ── Lazy-load scroll handler (prepend/append dump rows) ───────────────
  const handleDumpScroll = useCallback(() => {
    const el = dumpRef.current;
    if (!el || !memoryData) return;

    // Scroll down — append
    if (el.scrollHeight - el.scrollTop - el.clientHeight < SCROLL_THRESHOLD) {
      setDumpEnd((prev) => {
        const next = Math.min(TOTAL_MEM, prev + LAZY_LOAD_BYTES);
        return next !== prev ? next : prev;
      });
    }

    // Scroll up — prepend (keep visual position stable)
    if (el.scrollTop < SCROLL_THRESHOLD) {
      setDumpStart((prev) => {
        const next = Math.max(0, prev - LAZY_LOAD_BYTES);
        if (next === prev) return prev;
        // After React re-renders the prepended rows, adjust scrollTop
        const addedBytes = prev - next;
        const addedRows = addedBytes / BYTES_PER_ROW;
        requestAnimationFrame(() => {
          if (dumpRef.current) {
            const rowHeight = dumpRef.current.scrollHeight / ((dumpEnd - next) / BYTES_PER_ROW);
            dumpRef.current.scrollTop += addedRows * rowHeight;
          }
        });
        return next;
      });
    }
  }, [memoryData, dumpEnd]);

  // ── Build hex dump rows ───────────────────────────────────────────────
  const dumpRows = [];
  if (memoryData && dumpEnd > dumpStart) {
    for (let addr = dumpStart; addr < dumpEnd; addr += BYTES_PER_ROW) {
      const rowBytes = [];
      for (let j = 0; j < BYTES_PER_ROW; j++) {
        const a = addr + j;
        rowBytes.push(a < TOTAL_MEM ? memoryData[a] : 0);
      }
      dumpRows.push({ addr, bytes: rowBytes });
    }
  }

  // Determine which bytes are part of the current match for highlighting
  const currentMatchStart = matchIdx >= 0 ? matches[matchIdx] : -1;
  const currentMatchEnd = currentMatchStart >= 0 ? currentMatchStart + findPatternLen : -1;

  return (
    <div className="rounded-4 bg-white border shadow-sm p-4">
      <div className="d-flex align-items-center justify-content-between mb-3">
        <h1 className="h4 mb-0">Inspector</h1>
        <button
          className="btn btn-primary btn-sm"
          onClick={readMemory}
          disabled={loading || webRemoteAvailable === false}
        >
          {loading ? "Reading…" : "Read Memory"}
        </button>
      </div>

      {webRemoteAvailable === false && (
        <div className="alert alert-warning py-2 mb-3">
          Web Remote Control Service must be enabled on your C64 Ultimate to use the memory inspector.
          Enable it in <strong>NETWORK SERVICES &amp; TIMEZONE</strong> menu.
        </div>
      )}

      {error && <div className="alert alert-danger py-2">{error}</div>}

      {/* ── Find toolbar ─────────────────────────────────────────────── */}
      {memoryData && (
        <div className="inspector-find-bar mb-3">
          <div className="d-flex align-items-center gap-2 flex-wrap">
            <select
              className="form-select form-select-sm"
              style={{ width: "auto" }}
              value={findMode}
              onChange={(e) => setFindMode(e.target.value)}
            >
              <option value="hex">Hex</option>
              <option value="text">Text</option>
            </select>
            <input
              type="text"
              className="form-control form-control-sm"
              style={{ width: 260 }}
              placeholder={findMode === "hex" ? (advanced ? "A9 ?? 8D 20 D0" : "A9 00 8D 20 D0") : "HELLO"}
              value={findText}
              onChange={(e) => setFindText(e.target.value)}
              onKeyDown={handleFindKeyDown}
            />
            <button className="btn btn-sm btn-outline-primary" onClick={doFind}>
              Find
            </button>
            <button
              className={`btn btn-sm ${advanced ? "btn-secondary" : "btn-outline-secondary"}`}
              onClick={() => setAdvanced((a) => !a)}
              title="Toggle advanced mode (supports ?? wildcards in hex)"
            >
              Advanced
            </button>
            {matches.length > 0 && (
              <>
                <button className="btn btn-sm btn-outline-secondary" onClick={goPrevMatch}>
                  Prev
                </button>
                <button className="btn btn-sm btn-outline-secondary" onClick={goNextMatch}>
                  Next
                </button>
                <span className="text-muted small">
                  {matchIdx + 1} / {matches.length}
                </span>
              </>
            )}
            {matches.length === 0 && findText.trim() && findPatternLen > 0 && (
              <span className="text-muted small">No matches</span>
            )}
          </div>
          {advanced && findMode === "hex" && (
            <div className="text-muted small mt-1">
              Use <code>??</code> as wildcard for any byte value
            </div>
          )}
        </div>
      )}

      {/* ── Memory map + hex dump ────────────────────────────────────── */}
      {memoryData && (
        <div className="d-flex gap-3 flex-wrap align-items-start">
          {/* Memory map canvas */}
          <div>
            <div className="text-muted small mb-1">
              Memory Map (256 x 256 = 64K) — click to inspect
            </div>
            <canvas
              ref={canvasRef}
              width={CANVAS_W}
              height={CANVAS_H}
              className="inspector-canvas"
              onClick={handleCanvasClick}
            />
            {selectedBlock >= 0 && (
              <div className="text-muted small mt-1">
                Selected: ${selectedBlock.toString(16).toUpperCase().padStart(4, "0")}
              </div>
            )}
          </div>

          {/* Hex dump */}
          {dumpEnd > dumpStart && (
            <div className="flex-grow-1" style={{ minWidth: 0 }}>
              <div className="text-muted small mb-1">
                Hex Dump: ${dumpStart.toString(16).toUpperCase().padStart(4, "0")} –
                ${(dumpEnd - 1).toString(16).toUpperCase().padStart(4, "0")}
              </div>
              <div className="hex-dump" ref={dumpRef} onScroll={handleDumpScroll}>
                {dumpRows.map((row) => {
                  const isSelectedRow =
                    selectedBlock >= 0 &&
                    row.addr >= selectedBlock &&
                    row.addr < selectedBlock + 256;
                  return (
                    <div
                      key={row.addr}
                      className={`hex-row${isSelectedRow ? " hex-highlight" : ""}`}
                    >
                      <span className="hex-address">
                        ${row.addr.toString(16).toUpperCase().padStart(4, "0")}
                      </span>
                      <span className="hex-bytes">
                        {row.bytes.map((b, i) => {
                          const byteAddr = row.addr + i;
                          const isMatch =
                            currentMatchStart >= 0 &&
                            byteAddr >= currentMatchStart &&
                            byteAddr < currentMatchEnd;
                          return (
                            <span
                              key={i}
                              className={isMatch ? "hex-match" : undefined}
                            >
                              {b.toString(16).toUpperCase().padStart(2, "0")}
                            </span>
                          );
                        })}
                      </span>
                      <span className="hex-ascii">
                        {row.bytes.map((b, i) => {
                          const byteAddr = row.addr + i;
                          const isMatch =
                            currentMatchStart >= 0 &&
                            byteAddr >= currentMatchStart &&
                            byteAddr < currentMatchEnd;
                          return (
                            <span
                              key={i}
                              className={isMatch ? "hex-match" : undefined}
                            >
                              {petsciiToChar(b)}
                            </span>
                          );
                        })}
                      </span>
                    </div>
                  );
                })}
              </div>
            </div>
          )}
        </div>
      )}

      {!memoryData && !loading && (
        <p className="text-muted">Click "Read Memory" to load C64 memory.</p>
      )}
    </div>
  );
}
