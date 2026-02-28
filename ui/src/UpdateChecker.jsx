import { useEffect, useState, useCallback } from "react";
import { API_BASE_URL } from "./api.js";

const CHECK_INTERVAL_MS = 60 * 60 * 1000; // check every hour

export default function UpdateChecker() {
  const [versionInfo, setVersionInfo] = useState(null);
  const [checking, setChecking] = useState(false);
  const [checkError, setCheckError] = useState("");
  const [dismissed, setDismissed] = useState(false);

  const [updateState, setUpdateState] = useState("idle"); // idle | loading | done | error
  const [updateMessage, setUpdateMessage] = useState("");

  const checkVersion = useCallback(async () => {
    setChecking(true);
    setCheckError("");
    try {
      const response = await fetch(`${API_BASE_URL}/settings/version_check`, {
        method: "GET",
      });
      const payload = await response.json();
      if (!response.ok) throw new Error(payload?.error || "Version check failed");
      setVersionInfo(payload);
      // Reset dismissal when a new update is detected
      setDismissed((prev) => (payload.update_available ? prev : false));
    } catch (err) {
      setCheckError(err?.message || "Failed to check for updates");
    } finally {
      setChecking(false);
    }
  }, []);

  useEffect(() => {
    checkVersion();
    const timer = setInterval(checkVersion, CHECK_INTERVAL_MS);
    return () => clearInterval(timer);
  }, [checkVersion]);

  const handleUpdate = async () => {
    setUpdateState("loading");
    setUpdateMessage("");
    try {
      const response = await fetch(`${API_BASE_URL}/settings/self_update`, {
        method: "POST",
      });
      const payload = await response.json();
      if (!response.ok) throw new Error(payload?.error || "Update failed");
      setUpdateState("done");
      setUpdateMessage(
        payload?.message || "Update applied. The server is restarting — please refresh in a few seconds."
      );
    } catch (err) {
      setUpdateState("error");
      setUpdateMessage(err?.message || "Update failed");
    }
  };

  // Format ISO date to a friendly string
  const formatDate = (iso) => {
    if (!iso) return "";
    try {
      return new Date(iso).toLocaleDateString(undefined, {
        year: "numeric",
        month: "short",
        day: "numeric",
      });
    } catch {
      return iso;
    }
  };

  const localVersion = versionInfo?.local_version ?? "…";
  const showBanner =
    !dismissed &&
    versionInfo?.update_available &&
    updateState !== "done";

  return (
    <div className="mt-4">
      {/* Version footer line — always visible */}
      <div className="d-flex align-items-center gap-2 text-muted small mb-2">
        <span>
          Server version: <strong>{localVersion}</strong>
        </span>
        {checking && <span className="text-secondary"> — checking for updates…</span>}
        {checkError && (
          <span className="text-danger"> — {checkError}</span>
        )}
        {!checking && !checkError && versionInfo && !versionInfo.update_available && (
          <span className="text-success"> — up to date</span>
        )}
        {!checking && !checkError && !versionInfo && (
          <button
            type="button"
            className="btn btn-link btn-sm p-0 text-muted text-decoration-none"
            onClick={checkVersion}
          >
            Check for updates
          </button>
        )}
      </div>

      {/* Update available banner */}
      {showBanner && (
        <div
          className="alert alert-warning d-flex flex-column flex-md-row align-items-start align-items-md-center justify-content-between gap-3 mb-0"
          role="alert"
        >
          <div>
            <div className="fw-semibold mb-1">
              Update available — v{versionInfo.latest_version}{" "}
              {versionInfo.published_at && (
                <span className="fw-normal text-muted small">
                  released {formatDate(versionInfo.published_at)}
                </span>
              )}
            </div>
            {versionInfo.release_notes && (
              <div
                className="text-muted small mb-2"
                style={{ whiteSpace: "pre-wrap", maxHeight: "4rem", overflow: "hidden" }}
              >
                {versionInfo.release_notes.slice(0, 300)}
                {versionInfo.release_notes.length > 300 ? "…" : ""}
              </div>
            )}
            {versionInfo.html_url && (
              <a
                href={versionInfo.html_url}
                target="_blank"
                rel="noopener noreferrer"
                className="small"
              >
                View release notes ↗
              </a>
            )}
          </div>

          <div className="d-flex align-items-center gap-2 flex-shrink-0">
            <button
              type="button"
              className="btn btn-warning btn-sm"
              onClick={handleUpdate}
              disabled={updateState === "loading"}
            >
              {updateState === "loading" ? (
                <>
                  <span
                    className="spinner-border spinner-border-sm me-1"
                    role="status"
                    aria-hidden="true"
                  />
                  Updating…
                </>
              ) : (
                "Update now"
              )}
            </button>
            <button
              type="button"
              className="btn btn-outline-secondary btn-sm"
              onClick={() => setDismissed(true)}
            >
              Dismiss
            </button>
          </div>
        </div>
      )}

      {/* Post-update feedback */}
      {updateState === "done" && (
        <div className="alert alert-success small mb-0" role="alert">
          {updateMessage}
        </div>
      )}
      {updateState === "error" && (
        <div className="alert alert-danger small mb-0" role="alert">
          {updateMessage}
        </div>
      )}
    </div>
  );
}
