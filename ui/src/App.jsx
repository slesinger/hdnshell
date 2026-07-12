import { useEffect, useRef, useState } from "react";
import FindC64U from "./find_c64u.jsx";
import { API_BASE_URL } from "./api.js";
import StatusExtended from "./StatusExtended.jsx";
import UpdateChecker from "./UpdateChecker.jsx";
import DocsPage from "./DocsPage.jsx";
import ScreenPage from "./ScreenPage.jsx";
import SettingsPage from "./SettingsPage.jsx";
import InspectorPage from "./InspectorPage.jsx";
import FileManagerPage from "./FileManagerPage.jsx";

const NAV_ITEMS = [
  { id: "file-manager", label: "File Manager" },
  { id: "inspector", label: "Memory Inspector" },
  { id: "screen", label: "Screen" },
  { id: "docs", label: "Docs" },
  { id: "settings", label: "Settings" },
  { id: "report", label: "Report Issue", href: "https://github.com/slesinger/hdnshell/issues" }
];

const VALID_PAGES = ["home", "find", "file-manager", "inspector", "screen", "docs", "settings"];

// Parse a location.hash like "#/docs/installation" into { page, slug }.
function parseHash(hash) {
  const raw = (hash || "").replace(/^#\/?/, "");
  if (!raw) return { page: "home", slug: null };
  const [p, ...rest] = raw.split("/");
  if (p === "docs" && rest.length) {
    return { page: "docs", slug: decodeURIComponent(rest.join("/")) };
  }
  if (VALID_PAGES.includes(p)) return { page: p, slug: null };
  return { page: "home", slug: null };
}

function hashFor(page, slug) {
  if (page === "docs" && slug) return `#/docs/${encodeURIComponent(slug)}`;
  return `#/${page}`;
}

export default function App() {
  const [connected, setConnected] = useState(false);
  const [lastC64Ip, setLastC64Ip] = useState("");
  const [backendReachable, setBackendReachable] = useState(true);
  const [page, setPage] = useState("home");
  const [docsSlug, setDocsSlug] = useState(null);
  const [feedback, setFeedback] = useState(null);
  const [machineMenuOpen, setMachineMenuOpen] = useState(false);
  const machineMenuRef = useRef(null);

  // Navigate to a page (and optional docs slug), updating the URL hash so
  // the browser back/forward buttons and bookmarks work.
  const navigate = (nextPage, slug = null) => {
    setPage(nextPage);
    setDocsSlug(slug);
    const nextHash = hashFor(nextPage, slug);
    if (window.location.hash !== nextHash) {
      window.location.hash = nextHash;
    }
  };

  const openDocs = (slug) => navigate("docs", slug);

  // Initialize page state from the URL hash on load, and keep it in sync
  // with browser back/forward navigation.
  useEffect(() => {
    if (!window.location.hash) {
      window.history.replaceState(null, "", "#/home");
    }
    const applyHash = () => {
      const { page: p, slug } = parseHash(window.location.hash);
      setPage(p);
      setDocsSlug(slug);
    };
    applyHash();
    window.addEventListener("hashchange", applyHash);
    return () => window.removeEventListener("hashchange", applyHash);
  }, []);

  const [cartActionLoading, setCartActionLoading] = useState(false);
  const [powerOffLoading, setPowerOffLoading] = useState(false);
  const [resetLoading, setResetLoading] = useState(false);
  const [rebootLoading, setRebootLoading] = useState(false);
  const [menuButtonLoading, setMenuButtonLoading] = useState(false);

  useEffect(() => {
    let cancelled = false;

    const checkConnection = async () => {
      try {
        const response = await fetch(`${API_BASE_URL}/c64/status`, {
          method: "GET"
        });
        if (!response.ok) {
          throw new Error("Status endpoint unavailable");
        }
        const payload = await response.json();

        if (!cancelled) {
          setBackendReachable(true);
          setConnected(Boolean(payload?.connected));
          setLastC64Ip(payload?.last_c64_ip ?? "");
        }
      } catch {
        if (!cancelled) {
          setConnected(false);
          setLastC64Ip("");
          setBackendReachable(false);
        }
      }
    };

    checkConnection();
      const timer = setInterval(checkConnection, 30000);

    // Listen for scan completion event
    window.addEventListener("refreshC64Status", checkConnection);

    return () => {
      cancelled = true;
      clearInterval(timer);
      window.removeEventListener("refreshC64Status", checkConnection);
    };
  }, []);

  // Close the Machine dropdown when clicking outside of it.
  useEffect(() => {
    if (!machineMenuOpen) return undefined;
    const onClickOutside = (event) => {
      if (machineMenuRef.current && !machineMenuRef.current.contains(event.target)) {
        setMachineMenuOpen(false);
      }
    };
    document.addEventListener("mousedown", onClickOutside);
    return () => document.removeEventListener("mousedown", onClickOutside);
  }, [machineMenuOpen]);

  // Auto-dismiss feedback messages after a while; user can also dismiss manually.
  useEffect(() => {
    if (!feedback) return undefined;
    const timer = setTimeout(() => setFeedback(null), 6000);
    return () => clearTimeout(timer);
  }, [feedback]);

  // Enable Shell = start the HDN Shell RR cartridge (run_crt). This resets the
  // machine with the cartridge active but does not persist in the Ultimate's
  // config, so Disable Shell simply resets back to stock BASIC.
  const handleCartRun = async () => {
    setCartActionLoading(true);
    try {
      const response = await fetch(`${API_BASE_URL}/c64/cart/run`, { method: "PUT" });
      const payload = await response.json().catch(() => ({}));
      if (!response.ok) throw new Error(payload?.error || "Failed to start cartridge");
      setFeedback({ type: "success", message: "Cartridge started." });
      window.dispatchEvent(new CustomEvent("refreshC64Status"));
    } catch (err) {
      setFeedback({ type: "danger", message: `Failed to enable shell: ${err.message}` });
    } finally {
      setCartActionLoading(false);
    }
  };

  const handleCartStop = async () => {
    setCartActionLoading(true);
    try {
      const response = await fetch(`${API_BASE_URL}/c64/cart/stop`, { method: "PUT" });
      const payload = await response.json().catch(() => ({}));
      if (!response.ok) throw new Error(payload?.error || "Failed to reset to BASIC");
      setFeedback({ type: "success", message: "Shell disabled." });
      window.dispatchEvent(new CustomEvent("refreshC64Status"));
    } catch (err) {
      setFeedback({ type: "danger", message: `Failed to disable shell: ${err.message}` });
    } finally {
      setCartActionLoading(false);
    }
  };

  const handleMenuButton = async () => {
    setMenuButtonLoading(true);
    try {
      const response = await fetch(`${API_BASE_URL}/c64/menu_button`, { method: "PUT" });
      if (!response.ok) {
        const payload = await response.json().catch(() => ({}));
        throw new Error(payload?.error || "Failed to open menu");
      }
      setFeedback({ type: "success", message: "Menu opened." });
    } catch (err) {
      setFeedback({ type: "danger", message: `Failed to open menu: ${err.message}` });
    } finally {
      setMenuButtonLoading(false);
      setMachineMenuOpen(false);
    }
  };

  const handleReboot = async () => {
    if (!window.confirm("Reboot the C64 Ultimate? This will interrupt anything currently running.")) return;
    setRebootLoading(true);
    try {
      const response = await fetch(`${API_BASE_URL}/c64/reboot`, { method: "PUT" });
      if (!response.ok) {
        const payload = await response.json().catch(() => ({}));
        throw new Error(payload?.error || "Failed to reboot");
      }
      setFeedback({ type: "success", message: "C64 Ultimate is rebooting…" });
    } catch (err) {
      setFeedback({ type: "danger", message: `Failed to reboot: ${err.message}` });
    } finally {
      setRebootLoading(false);
      setMachineMenuOpen(false);
    }
  };

  const handleReset = async () => {
    if (!window.confirm("Reset the C64? Any unsaved work will be lost.")) return;
    setResetLoading(true);
    try {
      const response = await fetch(`${API_BASE_URL}/c64/reset`, { method: "PUT" });
      if (!response.ok) {
        const payload = await response.json().catch(() => ({}));
        throw new Error(payload?.error || "Failed to reset");
      }
      setFeedback({ type: "success", message: "C64 reset." });
    } catch (err) {
      setFeedback({ type: "danger", message: `Failed to reset: ${err.message}` });
    } finally {
      setResetLoading(false);
      setMachineMenuOpen(false);
    }
  };

  const handlePowerOff = async () => {
    if (!window.confirm("Power off the C64 Ultimate?")) return;
    setPowerOffLoading(true);
    try {
      const response = await fetch(`${API_BASE_URL}/c64/power_off`, { method: "PUT" });
      if (!response.ok) {
        const payload = await response.json().catch(() => ({}));
        throw new Error(payload?.error || "Failed to power off");
      }
      setFeedback({ type: "success", message: "Powering off…" });
    } catch (err) {
      setFeedback({ type: "danger", message: `Failed to power off: ${err.message}` });
    } finally {
      setPowerOffLoading(false);
      setMachineMenuOpen(false);
    }
  };

  // run_crt is non-persistent so there is no cartridge-active state to query;
  // the cartridge controls are available whenever the C64U is connected.
  const enableButtonDisabled = !connected || cartActionLoading;
  const disableButtonDisabled = !connected || cartActionLoading;
  const machineMenuDisabled = !connected;

  const hasLastIp = lastC64Ip.trim().length > 0;
  let statusLabel = "Find your C64U";
  if (connected && hasLastIp) {
    statusLabel = "Connected";
  } else if (!connected && hasLastIp) {
    statusLabel = "Disconnected";
  }
  const statusTooltip = `Last known IP of your C64U is ${hasLastIp ? lastC64Ip : "not set yet"}`;

  return (
    <div className="min-vh-100 bg-light">
      <nav className="navbar navbar-expand-lg navbar-dark navbar-c64 shadow-sm">
        <div className="container-fluid">
          <button
            type="button"
            className="navbar-brand fw-semibold btn btn-link p-0 text-decoration-none brand-wordmark"
            onClick={() => navigate("home")}
          >
            HDN SERVER
          </button>
          <div className="collapse navbar-collapse show">
            <ul className="navbar-nav me-auto mb-2 mb-lg-0">
              {NAV_ITEMS.map((item) => (
                <li className="nav-item" key={item.id}>
                  {item.href ? (
                    <a
                      className={`nav-link btn btn-link p-0 px-2 text-decoration-none${
                        page === item.id ? " active fw-semibold" : ""
                      }`}
                      style={{ color: page === item.id ? "#fff" : "rgba(255,255,255,0.75)" }}
                      href={item.href}
                      target="_blank"
                      rel="noreferrer"
                    >
                      {item.label}
                    </a>
                  ) : (
                    <button
                      type="button"
                      className={`nav-link btn btn-link p-0 px-2 text-decoration-none${
                        page === item.id ? " active fw-semibold" : ""
                      }`}
                      style={{ color: page === item.id ? "#fff" : "rgba(255,255,255,0.75)" }}
                      onClick={() => navigate(item.id)}
                    >
                      {item.label}
                    </button>
                  )}
                </li>
              ))}
            </ul>
            <div className="d-flex align-items-center gap-2 ms-auto">
              <button
                type="button"
                className="btn btn-sm btn-success"
                onClick={handleCartRun}
                disabled={enableButtonDisabled}
              >
                Enable Shell
              </button>
              <button
                type="button"
                className="btn btn-sm btn-danger"
                onClick={handleCartStop}
                disabled={disableButtonDisabled}
              >
                Disable Shell
              </button>

              <div className="dropdown position-relative" ref={machineMenuRef}>
                <button
                  type="button"
                  className="btn btn-sm btn-outline-light dropdown-toggle"
                  onClick={() => setMachineMenuOpen((open) => !open)}
                  disabled={machineMenuDisabled}
                  aria-expanded={machineMenuOpen}
                >
                  Machine
                </button>
                {machineMenuOpen && (
                  <ul className="dropdown-menu dropdown-menu-end show" style={{ minWidth: "9rem" }}>
                    <li>
                      <button type="button" className="dropdown-item" onClick={handleMenuButton} disabled={menuButtonLoading}>
                        {menuButtonLoading ? "Opening…" : "Menu"}
                      </button>
                    </li>
                    <li>
                      <button type="button" className="dropdown-item" onClick={handleReset} disabled={resetLoading}>
                        {resetLoading ? "Resetting…" : "Reset"}
                      </button>
                    </li>
                    <li>
                      <button type="button" className="dropdown-item" onClick={handleReboot} disabled={rebootLoading}>
                        {rebootLoading ? "Rebooting…" : "Reboot"}
                      </button>
                    </li>
                    <li><hr className="dropdown-divider" /></li>
                    <li>
                      <button type="button" className="dropdown-item text-danger" onClick={handlePowerOff} disabled={powerOffLoading}>
                        {powerOffLoading ? "Powering off…" : "Power off"}
                      </button>
                    </li>
                  </ul>
                )}
              </div>

              <button
                type="button"
                className={`status-pill status-button ${
                  statusLabel === "Connected" ? "connected" : statusLabel === "Disconnected" ? "disconnected" : "find"
                }`}
                title={statusTooltip}
                onClick={() => navigate("find")}
              >
                {statusLabel}
              </button>
            </div>
          </div>
        </div>
      </nav>

      <main className="container py-4">
        {feedback && (
          <div
            className={`alert alert-${feedback.type} alert-dismissible fade show rounded-3`}
            role="alert"
          >
            {feedback.message}
            <button
              type="button"
              className="btn-close"
              aria-label="Close"
              onClick={() => setFeedback(null)}
            ></button>
          </div>
        )}

        {!backendReachable ? (
          <div className="rounded-4 bg-white border shadow-sm p-4">
            <h1 className="h4 mb-3">Welcome to HDN Server</h1>
            <p className="text-danger mb-0">
              Cannot connect to backend at <strong>{API_BASE_URL}</strong>
            </p>
          </div>
        ) : page === "find" ? (
          <FindC64U lastC64Ip={lastC64Ip} />
        ) : page === "file-manager" ? (
          <FileManagerPage lastC64Ip={lastC64Ip} />
        ) : page === "docs" ? (
          <DocsPage initialSlug={docsSlug} onSlugChange={(slug) => navigate("docs", slug)} />
        ) : page === "inspector" ? (
          <InspectorPage />
        ) : page === "screen" ? (
          <ScreenPage />
        ) : page === "settings" ? (
          <SettingsPage lastC64Ip={lastC64Ip} />
        ) : (
          <div className="rounded-4 bg-white border shadow-sm p-4">
            <h1 className="h4 mb-2">Welcome to HDN Server</h1>
            <p className="text-muted mb-4">
              This is the control panel for the HDN Server running on this computer,
              paired with your C64 Ultimate. Follow the setup steps below, then just
              type at the C64's <strong>READY.</strong> prompt — the shell answers
              commands like <code>ll</code>, <code>cd</code> and <code>status</code>
              directly, and forwards anything else to your AI assistant.
            </p>
            <StatusExtended lastC64Ip={lastC64Ip} />
            <UpdateChecker />
            <div className="row g-3 mt-2">
              <div className="col-12 col-lg-4">
                <button
                  type="button"
                  className="home-card border rounded-4 shadow-sm p-3 h-100 w-100 text-start bg-white"
                  onClick={() => openDocs("installation")}
                >
                  <h3 className="h6 mb-2">Getting Started</h3>
                  <p className="text-muted small mb-0">
                    Easy install guide to get HDN Shell running on your C64 Ultimate.
                  </p>
                </button>
              </div>
              <div className="col-12 col-lg-4">
                <button
                  type="button"
                  className="home-card border rounded-4 shadow-sm p-3 h-100 w-100 text-start bg-white"
                  onClick={() => openDocs("cloud-apps")}
                >
                  <h3 className="h6 mb-2">Server Apps</h3>
                  <p className="text-muted small mb-0">
                    Browse server-powered apps: web browser, RSS, Wikipedia, chat and more.
                  </p>
                </button>
              </div>
              <div className="col-12 col-lg-4">
                <button
                  type="button"
                  className="home-card border rounded-4 shadow-sm p-3 h-100 w-100 text-start bg-white"
                  onClick={() => openDocs("user_manual")}
                >
                  <h3 className="h6 mb-2">Docs</h3>
                  <p className="text-muted small mb-0">
                    Full user manual covering shell, filesystem, programming and more.
                  </p>
                </button>
              </div>
            </div>
          </div>
        )}
      </main>
    </div>
  );
}
