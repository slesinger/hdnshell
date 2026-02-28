import { useEffect, useState } from "react";
import FindC64U from "./find_c64u.jsx";
import { API_BASE_URL } from "./api.js";
import StatusExtended from "./StatusExtended.jsx";

const NAV_ITEMS = [
  { id: "file-manager", label: "File Manager" },
  { id: "inspector", label: "Inspector" }
];

const EMPTY_EXTENDED = {
  ftp_file_service_enabled: false,
  ultimate_dma_service_enabled: false,
  "hdnsh.bin_present": false,
  "hdnsh.cfg_present": false
};

export default function App() {
  const [connected, setConnected] = useState(false);
  const [lastC64Ip, setLastC64Ip] = useState("");
  const [backendReachable, setBackendReachable] = useState(true);
  const [page, setPage] = useState("home");
  const [extendedStatus, setExtendedStatus] = useState(EMPTY_EXTENDED);

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

        try {
          const extResponse = await fetch(`${API_BASE_URL}/c64/status_extended`, { method: "GET" });
          if (extResponse.ok) {
            const extPayload = await extResponse.json();
            if (!cancelled) {
              setExtendedStatus({
                ftp_file_service_enabled: Boolean(extPayload?.ftp_file_service_enabled),
                ultimate_dma_service_enabled: Boolean(extPayload?.ultimate_dma_service_enabled),
                "hdnsh.bin_present": Boolean(extPayload?.["hdnsh.bin_present"]),
                "hdnsh.cfg_present": Boolean(extPayload?.["hdnsh.cfg_present"])
              });
            }
          }
        } catch {
          // extended status failure is non-critical
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
    const refreshListener = () => checkConnection();
    window.addEventListener("refreshC64Status", refreshListener);

    return () => {
      cancelled = true;
      clearInterval(timer);
      window.removeEventListener("refreshC64Status", refreshListener);
    };
  }, []);

  const shellButtonsEnabled =
    extendedStatus.ftp_file_service_enabled &&
    extendedStatus.ultimate_dma_service_enabled &&
    extendedStatus["hdnsh.bin_present"] &&
    extendedStatus["hdnsh.cfg_present"];

  const handleShellEnable = async () => {
    try {
      await fetch(`${API_BASE_URL}/c64/basic/enable`, { method: "PUT" });
    } catch {
      // ignore
    }
  };

  const handleShellDisable = async () => {
    try {
      await fetch(`${API_BASE_URL}/c64/basic/disable`, { method: "PUT" });
    } catch {
      // ignore
    }
  };

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
                  <span className="nav-link">{item.label}</span>
                </li>
              ))}
            </ul>
            <div className="d-flex align-items-center gap-3 ms-auto">
              <div className="d-flex align-items-center gap-2">
                <span className="text-white-50 small text-nowrap">Hondani Shell:</span>
                <button
                  type="button"
                  className="btn btn-sm"
                  style={{
                    backgroundColor: shellButtonsEnabled ? "#c0392b" : undefined,
                    borderColor: shellButtonsEnabled ? "#c0392b" : undefined,
                    color: shellButtonsEnabled ? "#fff" : undefined
                  }}
                  disabled={!shellButtonsEnabled}
                  onClick={handleShellDisable}
                >
                  DISABLE
                </button>
                <button
                  type="button"
                  className="btn btn-sm"
                  style={{
                    backgroundColor: shellButtonsEnabled ? "#27ae60" : undefined,
                    borderColor: shellButtonsEnabled ? "#27ae60" : undefined,
                    color: shellButtonsEnabled ? "#fff" : undefined
                  }}
                  disabled={!shellButtonsEnabled}
                  onClick={handleShellEnable}
                >
                  ENABLE
                </button>
              </div>
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
        ) : (
          <div className="rounded-4 bg-white border shadow-sm p-4">
            <h1 className="h4 mb-3">Welcome to HDN Cloud</h1>
            <p className="text-muted mb-4">
              This UI will talk to the backend API at <strong>{API_BASE_URL}</strong>. Provide
              the API details when ready and I will wire up the views.
            </p>
            <StatusExtended lastC64Ip={lastC64Ip} />
          </div>
        )}
      </main>
    </div>
  );
}
