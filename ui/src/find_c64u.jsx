import { useState } from "react";
import { API_BASE_URL } from "./api.js";

export default function FindC64U({ lastC64Ip }) {
  const [scanning, setScanning] = useState(false);
  const [scanResult, setScanResult] = useState(null);

  const handleScan = async () => {
    setScanning(true);
    setScanResult(null);
    try {
      const resp = await fetch(`${API_BASE_URL}/settings/find_c64u`, {
        method: "POST"
      });
      const data = await resp.json();
      setScanResult(data.found_ips);
    } catch {
      setScanResult([]);
    }
    setScanning(false);
    // After scan, UI should trigger /c64/status refresh (parent should handle)
    window.dispatchEvent(new CustomEvent("refreshC64Status"));
  };

  return (
    <div className="rounded-4 bg-white border shadow-sm p-4">
      <h1 className="h4 mb-3">Find IP address of your C64 Ultimate</h1>
      <p className="text-muted">
        Use this page to discover your C64 Ultimate on the network. Last known IP:{" "}
        <strong>{lastC64Ip.trim() ? lastC64Ip : "not set yet"}</strong>.
      </p>
      <p className="mb-1">To be able to find the C64U you need to have:</p>
      <ul className="mb-3">
        <li>The C64U device powered on</li>
        <li>
          <span
            title="Press C= and RESTORE to enter C64U menu, then select WIRED NETWORK SETUP. Ensure that Active IP address is populated."
            style={{ borderBottom: "1px dotted #666", cursor: "help" }}
          >
            Network ethernet cable plugged in and attached to your local network
          </span>
        </li>
        <li className="list-unstyled ms-2 text-muted fst-italic">or</li>
        <li>
          <span
            title="Press C= and RESTORE to enter C64U menu, then select WI-FI NETWORK SETUP. Ensure that Status shows Link Up and there is Active IP address populated."
            style={{ borderBottom: "1px dotted #666", cursor: "help" }}
          >
            Setup WiFi
          </span>
        </li>
      </ul>
      <div className="mb-3">
        <button
          className="btn btn-primary"
          disabled={scanning}
          onClick={handleScan}
        >
          {scanning ? "Scanning..." : "Scan Network for C64U"}
        </button>
      </div>
      {scanning && (
        <div className="alert alert-info mb-0">
          Scanning network for C64U. Please wait up to 25 seconds...
        </div>
      )}
      {scanResult !== null && (
        <div className="alert alert-success mt-3">
          {Array.isArray(scanResult)
            ? (scanResult.length > 0
                ? `Found C64U IPs: ${scanResult.join(", ")}`
                : "No C64U found on the network.")
            : (scanResult
                ? `Found C64U IP: ${scanResult}`
                : "No C64U found on the network.")}
        </div>
      )}
    </div>
  );
}
