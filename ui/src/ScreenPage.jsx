import { useEffect, useRef, useState, useCallback } from "react";
import { API_BASE_URL } from "./api.js";

// ── Constants ────────────────────────────────────────────────────────────────
// U64 VIC stream output dimensions (PAL).
// Each UDP packet = 12-byte header + 768 bytes nibble-packed pixel data.
const VIC_WIDTH  = 384;
const VIC_HEIGHT = 272; // PAL; NTSC = 240

// ── C64 palette: 16 colors, index → [R, G, B] ────────────────────────────────
// Source: official grab.py from 1541ultimate repo
const C64_PALETTE_RGB = [
  [0x00, 0x00, 0x00], //  0 black
  [0xEF, 0xEF, 0xEF], //  1 white
  [0x8D, 0x2F, 0x34], //  2 red
  [0x6A, 0xD4, 0xCD], //  3 cyan
  [0x98, 0x35, 0xA4], //  4 purple
  [0x4C, 0xB4, 0x42], //  5 green
  [0x2C, 0x29, 0xB1], //  6 blue
  [0xEF, 0xEF, 0x5D], //  7 yellow
  [0x98, 0x4E, 0x20], //  8 orange
  [0x5B, 0x38, 0x00], //  9 brown
  [0xD1, 0x67, 0x6D], // 10 light red
  [0x4A, 0x4A, 0x4A], // 11 dark grey
  [0x7B, 0x7B, 0x7B], // 12 grey
  [0x9F, 0xEF, 0x93], // 13 light green
  [0x6D, 0x6A, 0xEF], // 14 light blue
  [0xB2, 0xB2, 0xB2], // 15 light grey
];

// Flat Uint32 lookup (browser canvas stores pixels as RGBA little-endian = ABGR in Uint32)
// We precompute all 16 entries as 32-bit values for fast fill.
const PALETTE_UINT32 = new Uint32Array(16);
for (let i = 0; i < 16; i++) {
  const [r, g, b] = C64_PALETTE_RGB[i];
  // ImageData pixels are RGBA byte order: [R, G, B, 0xFF]
  // In a Uint32 view on LE systems that's: 0xFFBBGGRR
  PALETTE_UINT32[i] = (0xFF << 24) | (b << 16) | (g << 8) | r;
}

// ── Packet parser ─────────────────────────────────────────────────────────────
// UDP packet layout (780 bytes total):
//  0: uint16 LE  sequence number
//  2: uint16 LE  frame number
//  4: uint16 LE  line number | (1 << 15) if last packet of frame
//  6: uint16 LE  pixels per line  (always 384)
//  8: uint8      lines per packet  (always 4)
//  9: uint8      bits per pixel    (always 4)
// 10: uint16 LE  encoding         (0 = raw)
// 12: 768 bytes  pixel data       4 rows × 192 bytes (384 nibbles/row)
//   each byte: low nibble = left pixel color index, high nibble = right pixel

const HEADER_SIZE = 12;

function parsePacket(buf, imgData) {
  if (buf.byteLength < HEADER_SIZE) return false;

  const dv = new DataView(buf);
  const lineFlags   = dv.getUint16(4, true);
  const startLine   = lineFlags & 0x7FFF;
  const isLastFrame = (lineFlags & 0x8000) !== 0;
  const width       = dv.getUint16(6, true);         // typically 384
  const linesPerPkt = dv.getUint8(8);                // typically 4
  const bpp         = dv.getUint8(9);                // typically 4

  if (bpp !== 4 || width === 0 || linesPerPkt === 0) return isLastFrame;

  const bytesPerLine = (width * bpp) / 8; // = 192
  const pixData      = new Uint8Array(buf, HEADER_SIZE);
  const imgUint32    = new Uint32Array(imgData.data.buffer);

  for (let l = 0; l < linesPerPkt; l++) {
    const scanline = startLine + l;
    if (scanline >= VIC_HEIGHT) break;

    const lineBase = scanline * width;          // pixel offset in canvas
    const byteBase = l * bytesPerLine;          // byte offset in payload

    for (let b = 0; b < bytesPerLine; b++) {
      const byte      = pixData[byteBase + b];
      const leftColor  = byte & 0x0F;           // low nibble  = pixel at 2b
      const rightColor = (byte >> 4) & 0x0F;    // high nibble = pixel at 2b+1
      imgUint32[lineBase + 2 * b]     = PALETTE_UINT32[leftColor];
      imgUint32[lineBase + 2 * b + 1] = PALETTE_UINT32[rightColor];
    }
  }

  return isLastFrame;
}

// WebSocket URL derived from API_BASE_URL
function wsUrl(path) {
  return API_BASE_URL.replace(/^http/, "ws") + path;
}

// ── PETSCII keyboard mapping ───────────────────────────────────────────────────
// Maps a browser KeyboardEvent to a PETSCII byte value, or null if unmapped.
function keyToPetscii(e) {
  const key = e.key;

  // Special / control keys
  switch (key) {
    case "Enter":       return 0x0D; // Return
    case "Backspace":   return 0x14; // PETSCII DEL (backspace)
    case "Delete":      return 0x14;
    case "Escape":      return 0x03; // RUN/STOP
    case "ArrowUp":     return e.shiftKey ? 0x91 : 0x91; // cursor up
    case "ArrowDown":   return 0x11; // cursor down
    case "ArrowLeft":   return 0x9D; // cursor left
    case "ArrowRight":  return 0x1D; // cursor right
    case "Home":        return e.shiftKey ? 0x93 : 0x13; // CLR/HOME
    case "Insert":      return 0x94; // PETSCII insert
    case "F1":          return e.shiftKey ? 0x89 : 0x85;
    case "F2":          return e.shiftKey ? 0x89 : 0x89;
    case "F3":          return e.shiftKey ? 0x8A : 0x86;
    case "F4":          return e.shiftKey ? 0x8A : 0x8A;
    case "F5":          return e.shiftKey ? 0x8B : 0x87;
    case "F6":          return e.shiftKey ? 0x8B : 0x8B;
    case "F7":          return e.shiftKey ? 0x8C : 0x88;
    case "F8":          return e.shiftKey ? 0x8C : 0x8C;
  }

  // Printable characters (single char keys)
  if (key.length === 1) {
    const code = key.charCodeAt(0);
    if (code >= 0x20 && code <= 0x7E) {
      // PETSCII uppercase letters occupy the same range as ASCII (0x41-0x5A).
      // Browser sends lowercase when Shift is not pressed, so we need to
      // convert: lowercase a-z → uppercase A-Z.
      if (code >= 0x61 && code <= 0x7A) {
        return code - 0x20;
      }
      // Uppercase A-Z sent by browser when Shift is pressed.
      // In PETSCII that maps to the shifted-letter range (0xC1-0xDA),
      // but most C64 programs expect 0x41-0x5A for normal typing.
      if (code >= 0x41 && code <= 0x5A) {
        return code; // keep as-is; shell treats them as uppercase
      }
      return code;
    }
  }

  return null;
}

// ── Component ─────────────────────────────────────────────────────────────────
export default function ScreenPage() {
  // Video
  const canvasRef = useRef(null);
  const videoWsRef = useRef(null);
  // Off-screen ImageData used to accumulate lines before blitting to canvas
  const imgDataRef = useRef(null);
  const [videoState, setVideoState] = useState("idle"); // idle | connecting | streaming | error
  const [videoBytes, setVideoBytes] = useState(0);
  const [videoFps, setVideoFps] = useState(0);
  const [dbgPackets, setDbgPackets] = useState(0); // diagnostic: packets received

  // Audio
  const audioWsRef = useRef(null);
  const audioCtxRef = useRef(null);       // Web Audio API context
  const nextPlayTimeRef = useRef(0);      // scheduled playback cursor (seconds)
  const [audioState, setAudioState] = useState("idle");
  const [audioBytes, setAudioBytes] = useState(0);
  const [audioPkts, setAudioPkts] = useState(0);

  // Keyboard
  const kbAreaRef = useRef(null);
  const [kbActive, setKbActive] = useState(false);
  const [lastKey, setLastKey] = useState("");
  const [kbSending, setKbSending] = useState(false);

  // FPS tracking
  const frameCountRef = useRef(0);
  const fpsTimerRef = useRef(null);
  const pktCountRef  = useRef(0);

  // Ensure ImageData is allocated once (or re-allocated if dims change)
  const getImgData = useCallback(() => {
    if (!imgDataRef.current) {
      imgDataRef.current = new ImageData(VIC_WIDTH, VIC_HEIGHT);
    }
    return imgDataRef.current;
  }, []);

  // ── Video stream ─────────────────────────────────────────────────────────
  const startVideo = useCallback(async () => {
    if (videoWsRef.current) return;
    setVideoState("connecting");
    imgDataRef.current = null; // reset off-screen buffer

    try {
      // Ask backend to tell U64 to start streaming to us
      const resp = await fetch(`${API_BASE_URL}/streams/video/start`, {
        method: "PUT",
      });
      if (!resp.ok) {
        const body = await resp.json().catch(() => ({}));
        throw new Error(body.error || `HTTP ${resp.status}`);
      }
    } catch (err) {
      setVideoState("error");
      setVideoState(`error: ${err.message}`);
      return;
    }

    // Open WebSocket to receive video packets
    const ws = new WebSocket(wsUrl("/ws/video"));
    ws.binaryType = "arraybuffer";
    videoWsRef.current = ws;

    fpsTimerRef.current = setInterval(() => {
      setVideoFps(frameCountRef.current);
      frameCountRef.current = 0;
    }, 1000);

    ws.onopen = () => setVideoState("streaming");
    ws.onmessage = (e) => {
      const buf = e.data instanceof ArrayBuffer ? e.data : e.data.arrayBuffer
        ? e.data.arrayBuffer() // Blob — unlikely since binaryType=arraybuffer
        : null;
      if (!buf || buf.byteLength === 0) return;

      setVideoBytes((v) => v + buf.byteLength);
      pktCountRef.current++;
      if (pktCountRef.current % 50 === 0) setDbgPackets(pktCountRef.current);

      // Decode the nibble-packed 12-byte-header packet into the offscreen ImageData
      const imgData = getImgData();
      const isLast = parsePacket(buf, imgData);

      // Blit to canvas on the last packet of each frame (bit 15 of line field)
      if (isLast && canvasRef.current) {
        const ctx = canvasRef.current.getContext("2d");
        ctx.putImageData(imgData, 0, 0);
        frameCountRef.current++;
      }
    };
    ws.onerror = () => setVideoState("error");
    ws.onclose = () => {
      setVideoState("idle");
      clearInterval(fpsTimerRef.current);
      setVideoFps(0);
      videoWsRef.current = null;
    };
  }, [getImgData]);

  const stopVideo = useCallback(async () => {
    if (videoWsRef.current) {
      videoWsRef.current.close();
      videoWsRef.current = null;
    }
    setVideoState("idle");
    clearInterval(fpsTimerRef.current);
    try {
      await fetch(`${API_BASE_URL}/streams/video/stop`, { method: "PUT" });
    } catch { /* ignore */ }
  }, []);

  // ── Audio stream ──────────────────────────────────────────────────────────
  const startAudio = useCallback(async () => {
    if (audioWsRef.current) return;
    setAudioState("connecting");

    try {
      const resp = await fetch(`${API_BASE_URL}/streams/audio/start`, {
        method: "PUT",
      });
      if (!resp.ok) {
        const body = await resp.json().catch(() => ({}));
        throw new Error(body.error || `HTTP ${resp.status}`);
      }
    } catch (err) {
      setAudioState(`error: ${err.message}`);
      return;
    }

    // Create AudioContext on user gesture (button click) so Chrome allows it.
    // U64 audio: 2-byte seq header + 192 stereo Int16 LE pairs @ ~47983 Hz (PAL)
    const AUDIO_SAMPLE_RATE = 47983;
    const AUDIO_FRAMES      = 192;
    const AUDIO_LATENCY_S   = 0.08; // initial jitter buffer (80 ms)
    try {
      const ctx = new AudioContext({ sampleRate: AUDIO_SAMPLE_RATE });
      if (ctx.state === "suspended") await ctx.resume();
      audioCtxRef.current = ctx;
      nextPlayTimeRef.current = 0;
    } catch (err) {
      setAudioState(`error: AudioContext – ${err.message}`);
      return;
    }

    const ws = new WebSocket(wsUrl("/ws/audio"));
    ws.binaryType = "arraybuffer";
    audioWsRef.current = ws;

    ws.onopen = () => setAudioState("streaming");
    ws.onmessage = (e) => {
      const buf = e.data;
      if (!(buf instanceof ArrayBuffer) || buf.byteLength < 4) return;
      setAudioBytes((v) => v + buf.byteLength);
      setAudioPkts((v) => v + 1);

      const ctx = audioCtxRef.current;
      if (!ctx || ctx.state === "closed") return;

      // Parse: skip 2-byte sequence number, then 192 × (Int16L, Int16R)
      const view = new DataView(buf, 2);
      const audioBuffer = ctx.createBuffer(2, AUDIO_FRAMES, AUDIO_SAMPLE_RATE);
      const left  = audioBuffer.getChannelData(0);
      const right = audioBuffer.getChannelData(1);
      for (let i = 0; i < AUDIO_FRAMES; i++) {
        left[i]  = view.getInt16(i * 4,     true) / 32768.0;
        right[i] = view.getInt16(i * 4 + 2, true) / 32768.0;
      }

      const src = ctx.createBufferSource();
      src.buffer = audioBuffer;
      src.connect(ctx.destination);

      // Schedule playback in a queue; if we're behind, jump forward
      const now = ctx.currentTime;
      if (nextPlayTimeRef.current < now) {
        nextPlayTimeRef.current = now + AUDIO_LATENCY_S;
      }
      src.start(nextPlayTimeRef.current);
      nextPlayTimeRef.current += AUDIO_FRAMES / AUDIO_SAMPLE_RATE;
    };
    ws.onerror = () => setAudioState("error");
    ws.onclose = () => {
      setAudioState("idle");
      audioWsRef.current = null;
    };
  }, []);

  const stopAudio = useCallback(async () => {
    if (audioWsRef.current) {
      audioWsRef.current.close();
      audioWsRef.current = null;
    }
    if (audioCtxRef.current) {
      audioCtxRef.current.close().catch(() => {});
      audioCtxRef.current = null;
    }
    setAudioState("idle");
    setAudioPkts(0);
    setAudioBytes(0);
    try {
      await fetch(`${API_BASE_URL}/streams/audio/stop`, { method: "PUT" });
    } catch { /* ignore */ }
  }, []);

  // ── Keyboard ──────────────────────────────────────────────────────────────
  const sendKey = useCallback(async (petsciiCode) => {
    if (kbSending) return;
    setKbSending(true);
    try {
      await fetch(`${API_BASE_URL}/c64/keyboard`, {
        method: "POST",
        headers: { "Content-Type": "application/json" },
        body: JSON.stringify({ bytes: [petsciiCode] }),
      });
    } catch { /* ignore */ } finally {
      setKbSending(false);
    }
  }, [kbSending]);

  const handleKeyDown = useCallback(
    (e) => {
      if (!kbActive) return;
      // Prevent browser shortcuts while keyboard active
      e.preventDefault();
      const code = keyToPetscii(e);
      if (code !== null) {
        setLastKey(`${e.key} → 0x${code.toString(16).padStart(2, "0")}`);
        sendKey(code);
      } else {
        setLastKey(`${e.key} (unmapped)`);
      }
    },
    [kbActive, sendKey]
  );

  // Global keydown listener when keyboard area active
  useEffect(() => {
    if (kbActive) {
      window.addEventListener("keydown", handleKeyDown);
    } else {
      window.removeEventListener("keydown", handleKeyDown);
    }
    return () => window.removeEventListener("keydown", handleKeyDown);
  }, [kbActive, handleKeyDown]);

  // Cleanup on unmount
  useEffect(() => {
    return () => {
      if (videoWsRef.current) videoWsRef.current.close();
      if (audioWsRef.current) audioWsRef.current.close();
      clearInterval(fpsTimerRef.current);
    };
  }, []);

  // ── Helpers ───────────────────────────────────────────────────────────────
  function fmtBytes(n) {
    if (n < 1024) return `${n} B`;
    if (n < 1048576) return `${(n / 1024).toFixed(1)} KB`;
    return `${(n / 1048576).toFixed(2)} MB`;
  }

  function stateColor(state) {
    if (state === "streaming") return "#198754";
    if (state === "connecting") return "#b58105";
    if (typeof state === "string" && state.startsWith("error")) return "#dc3545";
    return "#6c757d";
  }

  const videoStreaming = videoState === "streaming";
  const audioStreaming = audioState === "streaming";

  // ── Render ────────────────────────────────────────────────────────────────
  return (
    <div className="rounded-4 bg-white border shadow-sm p-4">
      <h2 className="h5 mb-4 fw-semibold">C64 Remote Screen</h2>

      <div className="row g-4">
        {/* ── Video panel ───────────────────────────────────────────────── */}
        <div className="col-lg-8">
          <div
            className="rounded-3 border d-flex align-items-center justify-content-center"
            style={{
              background: "#1a1a1a",
              aspectRatio: "4/3",
              position: "relative",
            }}
          >
            <canvas
              ref={canvasRef}
              width={VIC_WIDTH}
              height={VIC_HEIGHT}
              style={{
                imageRendering: "pixelated",
                width: "100%",
                height: "100%",
                display: videoStreaming ? "block" : "none",
              }}
            />
            {!videoStreaming && (
              <div className="text-center" style={{ color: "#666" }}>
                <div style={{ fontSize: "3rem" }}>📺</div>
                <div className="mt-2" style={{ fontSize: "0.875rem" }}>
                  {videoState === "connecting"
                    ? "Connecting…"
                    : typeof videoState === "string" && videoState.startsWith("error")
                    ? videoState
                    : "Stream not active"}
                </div>
              </div>
            )}
          </div>

          {/* Video stats */}
          <div className="d-flex gap-3 mt-2 flex-wrap" style={{ fontSize: "0.8rem", color: "#888" }}>
            <span>
              Status:{" "}
              <strong style={{ color: stateColor(videoState) }}>
                {videoStreaming ? "Streaming" : videoState}
              </strong>
            </span>
            {videoStreaming && (
              <>
                <span>RX: {fmtBytes(videoBytes)}</span>
                <span>FPS: {videoFps}</span>
                <span>Pkts: {dbgPackets}</span>
                <span>{VIC_WIDTH}×{VIC_HEIGHT} / 4‑bit nibble</span>
              </>
            )}
          </div>
        </div>

        {/* ── Controls panel ────────────────────────────────────────────── */}
        <div className="col-lg-4 d-flex flex-column gap-3">
          {/* Video controls */}
          <div className="rounded-3 border p-3">
            <h6 className="mb-3 fw-semibold">
              <span className="me-2">🎬</span>Video Stream
            </h6>
            <div className="d-flex gap-2">
              <button
                className="btn btn-sm btn-success flex-grow-1"
                onClick={startVideo}
                disabled={videoState === "streaming" || videoState === "connecting"}
              >
                Start
              </button>
              <button
                className="btn btn-sm btn-danger flex-grow-1"
                onClick={stopVideo}
                disabled={videoState === "idle"}
              >
                Stop
              </button>
            </div>
            <div className="mt-2" style={{ fontSize: "0.75rem", color: "#888" }}>
              UDP port 11000 → WebSocket → canvas
            </div>
          </div>

          {/* Audio controls */}
          <div className="rounded-3 border p-3">
            <h6 className="mb-3 fw-semibold">
              <span className="me-2">🔊</span>Audio Stream
            </h6>
            <div className="d-flex gap-2">
              <button
                className="btn btn-sm btn-success flex-grow-1"
                onClick={startAudio}
                disabled={audioState === "streaming" || audioState === "connecting"}
              >
                Start
              </button>
              <button
                className="btn btn-sm btn-danger flex-grow-1"
                onClick={stopAudio}
                disabled={audioState === "idle"}
              >
                Stop
              </button>
            </div>
            <div className="mt-2" style={{ fontSize: "0.75rem", color: "#888" }}>
              Status:{" "}
              <span style={{ color: stateColor(audioState) }}>
                {audioStreaming
                  ? `Streaming \u2014 RX ${fmtBytes(audioBytes)} / ${audioPkts} pkts \u2014 stereo 16-bit PCM @ 47983 Hz`
                  : audioState}
              </span>
            </div>
          </div>

          {/* Keyboard section */}
          <div className="rounded-3 border p-3 flex-grow-1">
            <h6 className="mb-2 fw-semibold">
              <span className="me-2">⌨️</span>Keyboard
            </h6>
            <p style={{ fontSize: "0.8rem", color: "#666", marginBottom: "0.5rem" }}>
              Click the area below then type to send keys to C64.
            </p>

            {/* Clickable capture zone */}
            <div
              ref={kbAreaRef}
              tabIndex={0}
              onClick={() => setKbActive(true)}
              onBlur={() => setKbActive(false)}
              className="rounded-3 d-flex align-items-center justify-content-center"
              style={{
                minHeight: "80px",
                cursor: "pointer",
                userSelect: "none",
                outline: "none",
                border: kbActive
                  ? "2px solid #0d6efd"
                  : "2px dashed #ccc",
                background: kbActive ? "rgba(13,110,253,0.06)" : "#f8f9fa",
                transition: "all 0.15s",
                fontSize: "0.875rem",
                color: kbActive ? "#0d6efd" : "#888",
              }}
            >
              {kbActive ? (
                <div className="text-center">
                  <div>⌨ Capturing keys…</div>
                  {lastKey && (
                    <div
                      className="mt-1"
                      style={{
                        fontSize: "0.75rem",
                        fontFamily: "monospace",
                        color: "#495057",
                      }}
                    >
                      {lastKey}
                    </div>
                  )}
                </div>
              ) : (
                <span>Click to activate keyboard</span>
              )}
            </div>

            {/* Key reference */}
            <details className="mt-2">
              <summary
                style={{
                  fontSize: "0.75rem",
                  color: "#888",
                  cursor: "pointer",
                }}
              >
                Key mapping reference
              </summary>
              <div
                style={{
                  fontSize: "0.7rem",
                  color: "#666",
                  fontFamily: "monospace",
                  marginTop: "0.4rem",
                }}
              >
                <div>Enter → RETURN (0x0D)</div>
                <div>Backspace → DEL (0x14)</div>
                <div>↑↓←→ → Cursor keys</div>
                <div>Home → HOME (0x13)</div>
                <div>Esc → RUN/STOP (0x03)</div>
                <div>F1-F8 → Function keys</div>
              </div>
            </details>
          </div>
        </div>
      </div>

      {/* Stream format info */}
      <div
        className="mt-3 rounded-3 px-3 py-2"
        style={{
          background: "#e8f5e9",
          border: "1px solid #a5d6a7",
          fontSize: "0.8rem",
          color: "#1b5e20",
        }}
      >
        <strong>Format:</strong> U64 VIC stream — UDP 780-byte packets: 12-byte header +
        768 bytes of 4‑bit nibble-packed C64 color indices (16-color palette). 4 lines per
        packet × 384 pixels wide. Last-packet-of-frame flag = bit 15 of the line field.
        PAL: 272 lines / 68 packets per frame. Palette and decoder are in{" "}
        <code>ScreenPage.jsx::parsePacket()</code>.
      </div>
    </div>
  );
}
