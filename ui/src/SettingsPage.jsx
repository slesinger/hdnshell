import { useEffect, useState } from "react";
import { API_BASE_URL } from "./api.js";

const PROVIDERS = [
  { value: "", label: "— Not configured —" },
  { value: "openai_compatible", label: "OpenAI Compatible (incl. OpenRouter)" },
  { value: "anthropic", label: "Anthropic (Claude)" },
  { value: "gemini", label: "Gemini (Google AI Studio)" },
  { value: "gemini_vertexai", label: "Gemini (Vertex AI)" },
  { value: "azure_openai", label: "Azure OpenAI" },
];

/** Which fields each provider needs */
const PROVIDER_FIELDS = {
  openai_compatible: ["endpoint", "api_key", "model"],
  anthropic: ["api_key", "model"],
  gemini: ["api_key", "model"],
  gemini_vertexai: ["service_account_json", "project_id", "location", "model"],
  azure_openai: ["endpoint", "api_key", "model", "api_version"],
};

/** Placeholder hints per provider */
const MODEL_HINTS = {
  openai_compatible: "gpt-4o",
  anthropic: "claude-sonnet-4-20250514",
  gemini: "gemini-2.0-flash",
  gemini_vertexai: "gemini-2.0-flash",
  azure_openai: "my-gpt4-deployment",
};

const ENDPOINT_HINTS = {
  openai_compatible: "https://api.openai.com/v1  (or OpenRouter / local)",
  azure_openai: "https://my-resource.openai.azure.com",
};

function LlmSection({ title, prefix, secretPrefix, config, setConfig, onTest, testResult, testLoading, optional }) {
  const provider = config[`${prefix}_provider`] || "";
  const fields = provider ? PROVIDER_FIELDS[provider] || [] : [];

  const set = (key, value) => setConfig((prev) => ({ ...prev, [key]: value }));

  return (
    <div className="card mb-3">
      <div className="card-body">
        <h6 className="card-title mb-3">{title}{optional && <span className="text-muted fw-normal ms-2">(optional)</span>}</h6>

        <div className="mb-3">
          <label className="form-label">Provider</label>
          <select
            className="form-select"
            value={provider}
            onChange={(e) => set(`${prefix}_provider`, e.target.value)}
          >
            {PROVIDERS.map((p) => (
              <option key={p.value} value={p.value}>{p.label}</option>
            ))}
          </select>
        </div>

        {fields.includes("endpoint") && (
          <div className="mb-3">
            <label className="form-label">Endpoint URL</label>
            <input
              type="text"
              className="form-control"
              placeholder={ENDPOINT_HINTS[provider] || "https://..."}
              value={config[`${prefix}_endpoint`] || ""}
              onChange={(e) => set(`${prefix}_endpoint`, e.target.value)}
            />
          </div>
        )}

        {fields.includes("api_key") && (
          <div className="mb-3">
            <label className="form-label">API Key</label>
            <input
              type="password"
              className="form-control"
              placeholder="sk-..."
              value={config[`${secretPrefix}_API_KEY`] || ""}
              onChange={(e) => set(`${secretPrefix}_API_KEY`, e.target.value)}
            />
          </div>
        )}

        {fields.includes("model") && (
          <div className="mb-3">
            <label className="form-label">{provider === "azure_openai" ? "Deployment Name" : "Model"}</label>
            <input
              type="text"
              className="form-control"
              placeholder={MODEL_HINTS[provider] || "model-name"}
              value={config[`${prefix}_model`] || ""}
              onChange={(e) => set(`${prefix}_model`, e.target.value)}
            />
          </div>
        )}

        {fields.includes("api_version") && (
          <div className="mb-3">
            <label className="form-label">API Version</label>
            <input
              type="text"
              className="form-control"
              placeholder="2024-02-15-preview"
              value={config[`${secretPrefix}_API_VERSION`] || ""}
              onChange={(e) => set(`${secretPrefix}_API_VERSION`, e.target.value)}
            />
          </div>
        )}

        {fields.includes("project_id") && (
          <div className="mb-3">
            <label className="form-label">GCP Project ID <span className="text-muted fw-normal">(optional if service account JSON is set)</span></label>
            <input
              type="text"
              className="form-control"
              placeholder="my-gcp-project"
              value={config[`${secretPrefix}_PROJECT_ID`] || ""}
              onChange={(e) => set(`${secretPrefix}_PROJECT_ID`, e.target.value)}
            />
          </div>
        )}

        {fields.includes("location") && (
          <div className="mb-3">
            <label className="form-label">Location <span className="text-muted fw-normal">(optional if service account JSON is set)</span></label>
            <input
              type="text"
              className="form-control"
              placeholder="us-central1"
              value={config[`${secretPrefix}_LOCATION`] || ""}
              onChange={(e) => set(`${secretPrefix}_LOCATION`, e.target.value)}
            />
          </div>
        )}

        {fields.includes("service_account_json") && (
          <div className="mb-3">
            <label className="form-label">Service Account JSON Key Path</label>
            <input
              type="text"
              className="form-control"
              placeholder="/path/to/service-account.json"
              value={config[`${secretPrefix}_SERVICE_ACCOUNT_JSON`] || ""}
              onChange={(e) => set(`${secretPrefix}_SERVICE_ACCOUNT_JSON`, e.target.value)}
            />
            <div className="form-text">Path to the Google Cloud service account JSON key file. When set, GCP Project ID and Location are extracted automatically.</div>
          </div>
        )}

        {provider && (
          <div>
            <button
              className="btn btn-outline-secondary btn-sm"
              onClick={onTest}
              disabled={testLoading}
            >
              {testLoading ? "Testing..." : "Test LLM"}
            </button>
            {testResult && (
              <div className={`alert mt-2 mb-0 py-2 ${testResult.success ? "alert-success" : "alert-danger"}`}>
                {testResult.success
                  ? <>Response: <strong>{testResult.response}</strong></>
                  : <>Error: {testResult.error}</>
                }
              </div>
            )}
          </div>
        )}
      </div>
    </div>
  );
}

export default function SettingsPage({ lastC64Ip }) {
  const [config, setConfig] = useState({});
  const [loading, setLoading] = useState(true);
  const [saving, setSaving] = useState(false);
  const [saved, setSaved] = useState(false);
  const [scanning, setScanning] = useState(false);
  const [scanResult, setScanResult] = useState(null);
  const [testResults, setTestResults] = useState({});
  const [testLoading, setTestLoading] = useState({});

  // Load config on mount
  useEffect(() => {
    (async () => {
      try {
        const resp = await fetch(`${API_BASE_URL}/settings/config`);
        if (resp.ok) {
          setConfig(await resp.json());
        }
      } catch { /* ignore */ }
      setLoading(false);
    })();
  }, []);

  const handleSave = async () => {
    setSaving(true);
    setSaved(false);
    try {
      const resp = await fetch(`${API_BASE_URL}/settings/config`, {
        method: "PUT",
        headers: { "Content-Type": "application/json" },
        body: JSON.stringify(config),
      });
      if (resp.ok) {
        setSaved(true);
        setTimeout(() => setSaved(false), 3000);
      }
    } catch { /* ignore */ }
    setSaving(false);
  };

  const handleScan = async () => {
    setScanning(true);
    setScanResult(null);
    try {
      const resp = await fetch(`${API_BASE_URL}/settings/find_c64u`, { method: "POST" });
      const data = await resp.json();
      setScanResult(data.found_ips);
      if (data.found_ips && data.found_ips.length > 0) {
        setConfig((prev) => ({ ...prev, last_c64_ip: data.found_ips[0] || prev.last_c64_ip }));
      }
    } catch {
      setScanResult([]);
    }
    setScanning(false);
    window.dispatchEvent(new CustomEvent("refreshC64Status"));
  };

  const handleSaveIp = async () => {
    try {
      await fetch(`${API_BASE_URL}/settings/c64_ip`, {
        method: "PUT",
        headers: { "Content-Type": "application/json" },
        body: JSON.stringify({ ip: config.last_c64_ip || "" }),
      });
      window.dispatchEvent(new CustomEvent("refreshC64Status"));
    } catch { /* ignore */ }
  };

  const handleTestLlm = async (role) => {
    setTestLoading((prev) => ({ ...prev, [role]: true }));
    setTestResults((prev) => ({ ...prev, [role]: null }));
    try {
      // First save current config so the test uses latest values
      await fetch(`${API_BASE_URL}/settings/config`, {
        method: "PUT",
        headers: { "Content-Type": "application/json" },
        body: JSON.stringify(config),
      });
      const resp = await fetch(`${API_BASE_URL}/settings/test_llm`, {
        method: "POST",
        headers: { "Content-Type": "application/json" },
        body: JSON.stringify({ role }),
      });
      const result = await resp.json();
      setTestResults((prev) => ({ ...prev, [role]: result }));
    } catch (e) {
      setTestResults((prev) => ({ ...prev, [role]: { success: false, error: String(e) } }));
    }
    setTestLoading((prev) => ({ ...prev, [role]: false }));
  };

  const sameAsChat = (config.code_llm_same_as_chat || "false").toLowerCase() === "true";

  if (loading) {
    return (
      <div className="rounded-4 bg-white border shadow-sm p-4">
        <p className="text-muted mb-0">Loading settings...</p>
      </div>
    );
  }

  return (
    <div className="rounded-4 bg-white border shadow-sm p-4">
      <h1 className="h4 mb-4">Settings</h1>

      {/* ── C64 IP Address ─────────────────────────────── */}
      <div className="card mb-3">
        <div className="card-body">
          <h6 className="card-title mb-3">C64 Ultimate IP Address</h6>
          <div className="row g-2 align-items-end">
            <div className="col">
              <label className="form-label">IP Address</label>
              <input
                type="text"
                className="form-control"
                placeholder="192.168.1.65"
                value={config.last_c64_ip || ""}
                onChange={(e) => setConfig((prev) => ({ ...prev, last_c64_ip: e.target.value }))}
              />
            </div>
            <div className="col-auto">
              <button className="btn btn-primary" onClick={handleSaveIp}>Save IP</button>
            </div>
            <div className="col-auto">
              <button className="btn btn-outline-secondary" onClick={handleScan} disabled={scanning}>
                {scanning ? "Scanning..." : "Scan Network"}
              </button>
            </div>
          </div>
          {scanning && (
            <div className="alert alert-info mt-2 mb-0 py-2">
              Scanning network for C64U. Please wait up to 25 seconds...
            </div>
          )}
          {scanResult !== null && !scanning && (
            <div className="alert alert-success mt-2 mb-0 py-2">
              {scanResult.length > 0
                ? `Found: ${scanResult.join(", ")}`
                : "No C64U found on the network."}
            </div>
          )}
        </div>
      </div>

      {/* ── User Name ──────────────────────────────────── */}
      <div className="card mb-3">
        <div className="card-body">
          <h6 className="card-title mb-3">How should I call you?</h6>
          <input
            type="text"
            className="form-control"
            placeholder="Your name (used by AI to personalize responses)"
            value={config.user_name || ""}
            onChange={(e) => setConfig((prev) => ({ ...prev, user_name: e.target.value }))}
          />
        </div>
      </div>

      {/* ── Chat LLM ──────────────────────────────────── */}
      <LlmSection
        title="Chat LLM"
        prefix="chat_llm"
        secretPrefix="CHAT_LLM"
        config={config}
        setConfig={setConfig}
        onTest={() => handleTestLlm("chat")}
        testResult={testResults.chat}
        testLoading={testLoading.chat}
      />

      {/* ── Code Assistant LLM ─────────────────────────── */}
      <div className="card mb-3">
        <div className="card-body">
          <div className="form-check mb-3">
            <input
              className="form-check-input"
              type="checkbox"
              id="sameAsChat"
              checked={sameAsChat}
              onChange={(e) =>
                setConfig((prev) => ({
                  ...prev,
                  code_llm_same_as_chat: e.target.checked ? "true" : "false",
                }))
              }
            />
            <label className="form-check-label" htmlFor="sameAsChat">
              Use same LLM as Chat for coding assistant
            </label>
          </div>
          {!sameAsChat && (
            <LlmSection
              title="Code Assistant LLM"
              prefix="code_llm"
              secretPrefix="CODE_LLM"
              config={config}
              setConfig={setConfig}
              onTest={() => handleTestLlm("code")}
              testResult={testResults.code}
              testLoading={testLoading.code}
            />
          )}
          {sameAsChat && (
            <p className="text-muted mb-0">Code assistant will use the Chat LLM configuration above.</p>
          )}
        </div>
      </div>

      {/* ── Backup LLM ─────────────────────────────────── */}
      <LlmSection
        title="Backup LLM"
        prefix="backup_llm"
        secretPrefix="BACKUP_LLM"
        config={config}
        setConfig={setConfig}
        onTest={() => handleTestLlm("backup")}
        testResult={testResults.backup}
        testLoading={testLoading.backup}
        optional
      />

      {/* ── LangSmith ─────────────────────────────────── */}
      <div className="card mb-3">
        <div className="card-body">
          <h6 className="card-title mb-3">LangSmith</h6>
          <div className="form-check mb-3">
            <input
              className="form-check-input"
              type="checkbox"
              id="langsmithEnabled"
              checked={(config.LANGSMITH_TRACING || "false").toLowerCase() === "true"}
              onChange={(e) =>
                setConfig((prev) => ({
                  ...prev,
                  LANGSMITH_TRACING: e.target.checked ? "true" : "false",
                }))
              }
            />
            <label className="form-check-label" htmlFor="langsmithEnabled">
              Enable LangSmith tracing
            </label>
          </div>
          <div className="mb-3">
            <label className="form-label">Endpoint</label>
            <input
              type="text"
              className="form-control"
              placeholder="https://api.smith.langchain.com"
              value={config.LANGSMITH_ENDPOINT || ""}
              onChange={(e) => setConfig((prev) => ({ ...prev, LANGSMITH_ENDPOINT: e.target.value }))}
            />
          </div>
          <div className="mb-3">
            <label className="form-label">API Key</label>
            <input
              type="password"
              className="form-control"
              placeholder="lsv2_pt_..."
              value={config.LANGSMITH_API_KEY || ""}
              onChange={(e) => setConfig((prev) => ({ ...prev, LANGSMITH_API_KEY: e.target.value }))}
            />
          </div>
          <div className="mb-3">
            <label className="form-label">Project</label>
            <input
              type="text"
              className="form-control"
              placeholder="my-project"
              value={config.LANGSMITH_PROJECT || ""}
              onChange={(e) => setConfig((prev) => ({ ...prev, LANGSMITH_PROJECT: e.target.value }))}
            />
          </div>
        </div>
      </div>

      {/* ── SerpAPI ────────────────────────────────────── */}
      <div className="card mb-3">
        <div className="card-body">
          <h6 className="card-title mb-3">SerpAPI <span className="text-muted fw-normal">(Web Search)</span></h6>
          <div className="mb-0">
            <label className="form-label">API Key</label>
            <input
              type="password"
              className="form-control"
              placeholder="SerpAPI key"
              value={config.SERPAPI_API_KEY || ""}
              onChange={(e) => setConfig((prev) => ({ ...prev, SERPAPI_API_KEY: e.target.value }))}
            />
          </div>
        </div>
      </div>

      {/* ── Context7 ───────────────────────────────────── */}
      <div className="card mb-3">
        <div className="card-body">
          <h6 className="card-title mb-3">Context7 <span className="text-muted fw-normal">(C64 Reference Docs)</span></h6>
          <div className="mb-0">
            <label className="form-label">API Key</label>
            <input
              type="password"
              className="form-control"
              placeholder="ctx7sk-..."
              value={config.CONTEXT7_API_KEY || ""}
              onChange={(e) => setConfig((prev) => ({ ...prev, CONTEXT7_API_KEY: e.target.value }))}
            />
          </div>
        </div>
      </div>

      {/* ── CSDB.dk ────────────────────────────────────── */}
      <div className="card mb-3">
        <div className="card-body">
          <h6 className="card-title mb-3">CSDB.dk</h6>
          <div className="mb-3">
            <label className="form-label">User</label>
            <input
              type="text"
              className="form-control"
              placeholder="user@example.com"
              value={config.CSDB_USER || ""}
              onChange={(e) => setConfig((prev) => ({ ...prev, CSDB_USER: e.target.value }))}
            />
          </div>
          <div className="mb-0">
            <label className="form-label">Password</label>
            <input
              type="password"
              className="form-control"
              placeholder="Password"
              value={config.CSDB_PASSWORD || ""}
              onChange={(e) => setConfig((prev) => ({ ...prev, CSDB_PASSWORD: e.target.value }))}
            />
          </div>
        </div>
      </div>

      {/* ── Save button ────────────────────────────────── */}
      <div className="d-flex align-items-center gap-3 mt-4">
        <button className="btn btn-primary" onClick={handleSave} disabled={saving}>
          {saving ? "Saving..." : "Save All Settings"}
        </button>
        {saved && <span className="text-success fw-semibold">Settings saved!</span>}
      </div>
    </div>
  );
}
