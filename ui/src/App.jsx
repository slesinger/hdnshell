import { useEffect, useState } from "react";
import FindC64U from "./find_c64u.jsx";
import { API_BASE_URL } from "./api.js";
import StatusExtended from "./StatusExtended.jsx";
import UpdateChecker from "./UpdateChecker.jsx";
import DocsPage from "./DocsPage.jsx";
import ScreenPage from "./ScreenPage.jsx";

const NAV_ITEMS = [
  { id: "file-manager", label: "File Manager" },
  { id: "inspector", label: "Inspector" },
  { id: "screen", label: "Screen" },
  { id: "docs", label: "Docs" }
];

export default function App() {
  const [connected, setConnected] = useState(false);
  const [lastC64Ip, setLastC64Ip] = useState("");
  const [backendReachable, setBackendReachable] = useState(true);
  const [page, setPage] = useState("home");
  const [basicStatus, setBasicStatus] = useState(null);
  const [basicAvailable, setBasicAvailable] = useState(false);
  const [basicActionLoading, setBasicActionLoading] = useState(false);
  const [powerOffLoading, setPowerOffLoading] = useState(false);
  const [resetLoading, setResetLoading] = useState(false);
  const [rebootLoading, setRebootLoading] = useState(false);

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

  const fetchBasicStatus = async () => {
    try {
      const response = await fetch(`${API_BASE_URL}/c64/basic/enabled`, { method: "GET" });
      if (response.ok) {
        setBasicStatus(await response.json());
        setBasicAvailable(true);
      } else {
        setBasicAvailable(false);
        setBasicStatus(null);
      }
    } catch {
      setBasicAvailable(false);
      setBasicStatus(null);
    }
  };

  useEffect(() => {
    fetchBasicStatus();
  }, []);

  const handleBasicEnable = async () => {
    setBasicActionLoading(true);
    try {
      const response = await fetch(`${API_BASE_URL}/c64/basic/enable`, { method: "PUT" });
      const payload = await response.json();
      if (!response.ok) throw new Error(payload?.error || "Failed to enable Basic ROM");
      await fetchBasicStatus();
    } catch {
      // ignore
    } finally {
      setBasicActionLoading(false);
    }
  };

  const handleBasicDisable = async () => {
    setBasicActionLoading(true);
    try {
      const response = await fetch(`${API_BASE_URL}/c64/basic/disable`, { method: "PUT" });
      const payload = await response.json();
      if (!response.ok) throw new Error(payload?.error || "Failed to disable Basic ROM");
      await fetchBasicStatus();
    } catch {
      // ignore
    } finally {
      setBasicActionLoading(false);
    }
  };

  const handleReboot = async () => {
    setRebootLoading(true);
    try {
      await fetch(`${API_BASE_URL}/c64/reboot`, { method: "PUT" });
    } catch {
      // ignore
    } finally {
      setRebootLoading(false);
    }
  };

  const handleReset = async () => {
    setResetLoading(true);
    try {
      await fetch(`${API_BASE_URL}/c64/reset`, { method: "PUT" });
    } catch {
      // ignore
    } finally {
      setResetLoading(false);
    }
  };

  const handlePowerOff = async () => {
    setPowerOffLoading(true);
    try {
      await fetch(`${API_BASE_URL}/c64/power_off`, { method: "PUT" });
    } catch {
      // ignore
    } finally {
      setPowerOffLoading(false);
    }
  };

  const isHdnshActive = basicStatus?.current_rom === "hdnsh.bin";
  const enableButtonDisabled = !basicAvailable || basicActionLoading || isHdnshActive;
  const disableButtonDisabled = !basicAvailable || basicActionLoading || !isHdnshActive;
  const rebootButtonDisabled = !basicAvailable || rebootLoading;

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
      <nav className="navbar navbar-expand-lg navbar-dark bg-dark shadow-sm">
        <div className="container-fluid">
          <button
            type="button"
            className="navbar-brand fw-semibold btn btn-link p-0 text-decoration-none"
            onClick={() => setPage("home")}
          >
            HDN Cloud
          </button>
          <div className="collapse navbar-collapse show">
            <ul className="navbar-nav me-auto mb-2 mb-lg-0">
              {NAV_ITEMS.map((item) => (
                <li className="nav-item" key={item.id}>
                  <button
                    type="button"
                    className={`nav-link btn btn-link p-0 px-2 text-decoration-none${
                      page === item.id ? " active fw-semibold" : ""
                    }`}
                    style={{ color: page === item.id ? "#fff" : "rgba(255,255,255,0.75)" }}
                    onClick={() => setPage(item.id)}
                  >
                    {item.label}
                  </button>
                </li>
              ))}
            </ul>
            <div className="d-flex align-items-center gap-3 ms-auto">
              <button
                type="button"
                className="btn btn-sm btn-success"
                onClick={handleBasicEnable}
                disabled={enableButtonDisabled}
              >
                Enable
              </button>
              <button
                type="button"
                className="btn btn-sm btn-danger"
                onClick={handleBasicDisable}
                disabled={disableButtonDisabled}
              >
                Disable
              </button>
              <button
                type="button"
                className="btn btn-sm btn-info"
                onClick={handleReboot}
                disabled={rebootButtonDisabled}
              >
                {rebootLoading ? "…" : "Reboot"}
              </button>
              <button
                type="button"
                className="btn btn-sm btn-secondary"
                onClick={handleReset}
                disabled={resetLoading}
              >
                {resetLoading ? "…" : "Reset"}
              </button>
              <button
                type="button"
                className="btn btn-sm btn-warning"
                onClick={handlePowerOff}
                disabled={powerOffLoading}
              >
                {powerOffLoading ? "…" : "Power off"}
              </button>
              <button
                type="button"
                className={`status-pill status-button ${
                  statusLabel === "Connected" ? "connected" : statusLabel === "Disconnected" ? "disconnected" : "find"
                }`}
                title={statusTooltip}
                onClick={() => setPage("find")}
              >
                {statusLabel}
              </button>
            </div>
          </div>
        </div>
      </nav>

      <main className="container py-4">
        {!backendReachable ? (
          <div className="rounded-4 bg-white border shadow-sm p-4">
            <h1 className="h4 mb-3">Welcome to HDN Cloud</h1>
            <p className="text-danger mb-0">
              Cannot connect to backend at <strong>{API_BASE_URL}</strong>
            </p>
          </div>
        ) : page === "find" ? (
          <FindC64U lastC64Ip={lastC64Ip} />
        ) : page === "docs" ? (
          <DocsPage />
        ) : page === "screen" ? (
          <ScreenPage />
        ) : (
          <div className="rounded-4 bg-white border shadow-sm p-4">
            <h1 className="h4 mb-3">Welcome to HDN Cloud</h1>
            <p className="text-muted mb-4">
              This UI will talk to the backend API at <strong>{API_BASE_URL}</strong>. Provide
              the API details when ready and I will wire up the views.
            </p>
            <StatusExtended lastC64Ip={lastC64Ip} />
            <UpdateChecker />
          </div>
        )}
      </main>
    </div>
  );
}
