import { useEffect, useState } from "react";
import { API_BASE_URL } from "./api.js";
import FindC64U from "./find_c64u.jsx";

const EMPTY_STATUS = {
  ultimate_dma_service_enabled: false,
  ftp_file_service_enabled: false,
  "hdnsh.bin_present": false,
  "hdnsh.cfg_present": false
};

export default function StatusExtended({ lastC64Ip }) {
  const [status, setStatus] = useState(EMPTY_STATUS);
  const [loading, setLoading] = useState(true);
  const [error, setError] = useState("");
  const [ensureRomLoading, setEnsureRomLoading] = useState(false);
  const [ensureRomMessage, setEnsureRomMessage] = useState("");

  useEffect(() => {
    let cancelled = false;

    const loadStatus = async () => {
      setLoading(true);
      setError("");
      try {
        const response = await fetch(`${API_BASE_URL}/c64/status_extended`, {
          method: "GET"
        });
        if (!response.ok) {
          throw new Error("Failed to fetch status");
        }
        const payload = await response.json();
        if (!cancelled) {
          setStatus({
            ultimate_dma_service_enabled: Boolean(payload?.ultimate_dma_service_enabled),
            ftp_file_service_enabled: Boolean(payload?.ftp_file_service_enabled),
            "hdnsh.bin_present": Boolean(payload?.["hdnsh.bin_present"]),
            "hdnsh.cfg_present": Boolean(payload?.["hdnsh.cfg_present"])
          });
        }
      } catch (err) {
        if (!cancelled) {
          setError(err?.message || "Failed to load status");
        }
      } finally {
        if (!cancelled) {
          setLoading(false);
        }
      }
    };

    loadStatus();

    return () => {
      cancelled = true;
    };
  }, []);

  const handleEnsureRom = async () => {
    setEnsureRomLoading(true);
    setEnsureRomMessage("");
    try {
      const response = await fetch(`${API_BASE_URL}/settings/ensure_rom`, {
        method: "GET"
      });
      const payload = await response.json();
      if (!response.ok) {
        throw new Error(payload?.error || "Failed to ensure ROM");
      }
      setEnsureRomMessage(payload?.message || "ROM uploaded.");
      // After ensuring ROM, reload status
      const statusResponse = await fetch(`${API_BASE_URL}/c64/status_extended`, {
        method: "GET"
      });
      if (statusResponse.ok) {
        const statusPayload = await statusResponse.json();
        setStatus({
          ultimate_dma_service_enabled: Boolean(statusPayload?.ultimate_dma_service_enabled),
          ftp_file_service_enabled: Boolean(statusPayload?.ftp_file_service_enabled),
          "hdnsh.bin_present": Boolean(statusPayload?.["hdnsh.bin_present"]),
          "hdnsh.cfg_present": Boolean(statusPayload?.["hdnsh.cfg_present"])
        });
      }
    } catch (err) {
      setEnsureRomMessage(err?.message || "Failed to ensure ROM");
    } finally {
      setEnsureRomLoading(false);
    }
  };

  const hasIp = lastC64Ip?.trim().length > 0;
  const needsNetworkServices =
    !status.ftp_file_service_enabled || !status.ultimate_dma_service_enabled;
  const needsRom = !status["hdnsh.bin_present"];

  return (
    <section className="status-extended">
      <div className="d-flex flex-column flex-md-row align-items-start justify-content-between gap-3 mb-3">
        <div>
          <h2 className="h5 mb-1">C64 Ultimate Setup Status</h2>
          <p className="text-muted mb-0">
            Current status checks for your C64 Ultimate services and ROM setup.
          </p>
        </div>
      </div>

      {loading ? (
        <div className="text-muted">Loading status...</div>
      ) : error ? (
        <div className="text-danger">{error}</div>
      ) : (
        <div className="row g-3">
          <div className="col-12 col-lg-4">
            <div className="border rounded-4 p-3 h-100">
              <h3 className="h6">Step 1 &mdash; C64U IP address</h3>
              <ul className="list-unstyled mb-0">
                <li className="d-flex align-items-center gap-2">
                  <span className={`status-dot ${hasIp ? "ok" : "danger"}`} />
                  <span>
                    {hasIp ? lastC64Ip : "Not detected yet"}
                  </span>
                </li>
              </ul>
            </div>
          </div>
          <div className="col-12 col-lg-4">
            <div className="border rounded-4 p-3 h-100">
              <h3 className="h6">Step 2 &mdash; Network services</h3>
              <ul className="list-unstyled mb-0">
                <li className="d-flex align-items-center gap-2 mb-2">
                  <span
                    className={`status-dot ${
                      status.ftp_file_service_enabled ? "ok" : "danger"
                    }`}
                  />
                  <span>FTP file service</span>
                </li>
                <li className="d-flex align-items-center gap-2">
                  <span
                    className={`status-dot ${
                      status.ultimate_dma_service_enabled ? "ok" : "danger"
                    }`}
                  />
                  <span>Ultimate DMA service</span>
                </li>
              </ul>
            </div>
          </div>
          <div className="col-12 col-lg-4">
            <div className="border rounded-4 p-3 h-100">
              <h3 className="h6">Step 3 &mdash; ROM files</h3>
              <ul className="list-unstyled mb-0">
                <li className="d-flex align-items-center gap-2 mb-2">
                  <span
                    className={`status-dot ${
                      status["hdnsh.bin_present"] ? "ok" : "danger"
                    }`}
                  />
                  <span>hdnsh.bin</span>
                </li>
                <li className="d-flex align-items-center gap-2">
                  <span
                    className={`status-dot ${
                      status["hdnsh.cfg_present"] ? "ok" : "danger"
                    }`}
                  />
                  <span>hdnsh.cfg</span>
                </li>
              </ul>
            </div>
          </div>
        </div>
      )}

      {!hasIp ? (
        <div className="mt-4">
          <FindC64U lastC64Ip={lastC64Ip ?? ""} />
        </div>
      ) : needsNetworkServices ? (
        <div className="border rounded-4 p-3 h-100">
          <p className="mb-3">
            Both FTP and DMA service need to be enabled. Power on your C64
            Ultimate and enter the menu by pressing C= and RESTORE keys together.
            Then, navigate to <strong>NETWORK SERVICES &amp; TIMEZONE</strong> and
            enable at least the following services:
            <ul>
              <li>Ultimate DMA Service</li>
              <li>FTP File Service</li>
            </ul>
            Don't forget to save the settings and reboot your C64 Ultimate after that.
          </p>
          <img
            src="/images/setup_network.png"
            alt="C64 Ultimate network services"
            className="img-fluid rounded-3 border"
          />
        </div>
      ) : null}

      {hasIp && needsRom && !needsNetworkServices ? (
          <div className="alert alert-warning mt-4">
          <p className="mb-3">
            HDN Shell ROM needs to be uploaded in <strong>/Flash/roms</strong>&nbsp;
            directory. You can put the file there or let me do it for you.
          </p>
          <button
            type="button"
            className="btn btn-primary"
            onClick={handleEnsureRom}
            disabled={ensureRomLoading}
          >
            {ensureRomLoading
              ? "Downloading and uploading..."
              : "Download latest ROM and put it in my C64 Ultimate"}
          </button>
          {ensureRomMessage ? (
            <div className="mt-3 small">{ensureRomMessage}</div>
          ) : null}
        </div>
      ) : null}
    </section>
  );
}
