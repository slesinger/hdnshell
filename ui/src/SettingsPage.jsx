import { useEffect, useState } from "react";
import { API_BASE_URL } from "./api.js";

const TIMEZONES = [
  // UTC
  { value: "UTC",                       label: "UTC" },
  // Europe
  { value: "Europe/London",             label: "Europe/London (GMT/BST)" },
  { value: "Europe/Dublin",             label: "Europe/Dublin" },
  { value: "Europe/Lisbon",             label: "Europe/Lisbon" },
  { value: "Europe/Paris",              label: "Europe/Paris (CET/CEST)" },
  { value: "Europe/Berlin",             label: "Europe/Berlin" },
  { value: "Europe/Amsterdam",          label: "Europe/Amsterdam" },
  { value: "Europe/Brussels",           label: "Europe/Brussels" },
  { value: "Europe/Rome",               label: "Europe/Rome" },
  { value: "Europe/Madrid",             label: "Europe/Madrid" },
  { value: "Europe/Zurich",             label: "Europe/Zurich" },
  { value: "Europe/Vienna",             label: "Europe/Vienna" },
  { value: "Europe/Prague",             label: "Europe/Prague" },
  { value: "Europe/Warsaw",             label: "Europe/Warsaw" },
  { value: "Europe/Budapest",           label: "Europe/Budapest" },
  { value: "Europe/Bratislava",         label: "Europe/Bratislava" },
  { value: "Europe/Stockholm",          label: "Europe/Stockholm" },
  { value: "Europe/Oslo",               label: "Europe/Oslo" },
  { value: "Europe/Copenhagen",         label: "Europe/Copenhagen" },
  { value: "Europe/Helsinki",           label: "Europe/Helsinki (EET/EEST)" },
  { value: "Europe/Tallinn",            label: "Europe/Tallinn" },
  { value: "Europe/Riga",               label: "Europe/Riga" },
  { value: "Europe/Vilnius",            label: "Europe/Vilnius" },
  { value: "Europe/Athens",             label: "Europe/Athens" },
  { value: "Europe/Bucharest",          label: "Europe/Bucharest" },
  { value: "Europe/Sofia",              label: "Europe/Sofia" },
  { value: "Europe/Kiev",               label: "Europe/Kiev" },
  { value: "Europe/Minsk",              label: "Europe/Minsk" },
  { value: "Europe/Moscow",             label: "Europe/Moscow" },
  { value: "Europe/Istanbul",           label: "Europe/Istanbul" },
  // Americas
  { value: "America/New_York",          label: "America/New_York (ET)" },
  { value: "America/Chicago",           label: "America/Chicago (CT)" },
  { value: "America/Denver",            label: "America/Denver (MT)" },
  { value: "America/Phoenix",           label: "America/Phoenix (MST, no DST)" },
  { value: "America/Los_Angeles",       label: "America/Los_Angeles (PT)" },
  { value: "America/Anchorage",         label: "America/Anchorage (AKT)" },
  { value: "Pacific/Honolulu",          label: "Pacific/Honolulu (HST)" },
  { value: "America/Toronto",           label: "America/Toronto" },
  { value: "America/Vancouver",         label: "America/Vancouver" },
  { value: "America/Mexico_City",       label: "America/Mexico_City" },
  { value: "America/Bogota",            label: "America/Bogota" },
  { value: "America/Lima",              label: "America/Lima" },
  { value: "America/Santiago",          label: "America/Santiago" },
  { value: "America/Sao_Paulo",         label: "America/Sao_Paulo" },
  { value: "America/Argentina/Buenos_Aires", label: "America/Argentina/Buenos_Aires" },
  { value: "America/Caracas",           label: "America/Caracas" },
  // Africa
  { value: "Africa/Abidjan",            label: "Africa/Abidjan (GMT)" },
  { value: "Africa/Lagos",              label: "Africa/Lagos (WAT)" },
  { value: "Africa/Cairo",              label: "Africa/Cairo (EET)" },
  { value: "Africa/Nairobi",            label: "Africa/Nairobi (EAT)" },
  { value: "Africa/Johannesburg",       label: "Africa/Johannesburg (SAST)" },
  // Asia
  { value: "Asia/Dubai",                label: "Asia/Dubai (GST +4)" },
  { value: "Asia/Karachi",              label: "Asia/Karachi (PKT +5)" },
  { value: "Asia/Kolkata",              label: "Asia/Kolkata (IST +5:30)" },
  { value: "Asia/Dhaka",                label: "Asia/Dhaka (BST +6)" },
  { value: "Asia/Rangoon",              label: "Asia/Rangoon (MMT +6:30)" },
  { value: "Asia/Bangkok",              label: "Asia/Bangkok (ICT +7)" },
  { value: "Asia/Singapore",            label: "Asia/Singapore (SGT +8)" },
  { value: "Asia/Hong_Kong",            label: "Asia/Hong_Kong (HKT +8)" },
  { value: "Asia/Shanghai",             label: "Asia/Shanghai (CST +8)" },
  { value: "Asia/Tokyo",                label: "Asia/Tokyo (JST +9)" },
  { value: "Asia/Seoul",                label: "Asia/Seoul (KST +9)" },
  { value: "Asia/Vladivostok",          label: "Asia/Vladivostok (+10)" },
  { value: "Asia/Taipei",               label: "Asia/Taipei" },
  { value: "Asia/Yekaterinburg",        label: "Asia/Yekaterinburg (+5)" },
  { value: "Asia/Novosibirsk",          label: "Asia/Novosibirsk (+7)" },
  { value: "Asia/Krasnoyarsk",          label: "Asia/Krasnoyarsk (+7)" },
  // Pacific / Australia
  { value: "Australia/Perth",           label: "Australia/Perth (AWST +8)" },
  { value: "Australia/Darwin",          label: "Australia/Darwin (+9:30)" },
  { value: "Australia/Adelaide",        label: "Australia/Adelaide (ACST +9:30)" },
  { value: "Australia/Brisbane",        label: "Australia/Brisbane (AEST +10)" },
  { value: "Australia/Sydney",          label: "Australia/Sydney (AEST/AEDT)" },
  { value: "Australia/Melbourne",       label: "Australia/Melbourne" },
  { value: "Pacific/Auckland",          label: "Pacific/Auckland (NZST)" },
  { value: "Pacific/Fiji",              label: "Pacific/Fiji" },
];

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

const THINKING_EFFORT_OPTIONS = [
  { value: "", label: "Auto / provider default" },
  { value: "low", label: "Low" },
  { value: "medium", label: "Medium" },
  { value: "high", label: "High" },
];

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

        {provider && (
          <>
            <div className="mb-3">
              <label className="form-label">Temperature</label>
              <input
                type="number"
                min="0"
                max="2"
                step="0.1"
                className="form-control"
                placeholder={prefix === "code_llm" ? "0.2" : "0.7"}
                value={config[`${prefix}_temperature`] || ""}
                onChange={(e) => set(`${prefix}_temperature`, e.target.value)}
              />
              <div className="form-text">Controls randomness. Some models (for example GPT-5 family) may only support provider default temperature.</div>
            </div>

            <div className="mb-3">
              <label className="form-label">Thinking Effort</label>
              <select
                className="form-select"
                value={config[`${prefix}_reasoning_effort`] || ""}
                onChange={(e) => set(`${prefix}_reasoning_effort`, e.target.value)}
              >
                {THINKING_EFFORT_OPTIONS.map((opt) => (
                  <option key={opt.value} value={opt.value}>{opt.label}</option>
                ))}
              </select>
              <div className="form-text">For reasoning-capable models. Increase for tougher tasks, lower for speed and lower cost.</div>
            </div>
          </>
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
  const [detectingIp, setDetectingIp] = useState(false);
  const [activeTab, setActiveTab] = useState("connection");

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

  const TABS = [
    { id: "connection", label: "Connection" },
    { id: "ai", label: "AI Models" },
    { id: "messaging", label: "Messaging" },
    { id: "services", label: "Apps & Services" },
  ];

  return (
    <div className="rounded-4 bg-white border shadow-sm p-4">
      <h1 className="h4 mb-4">Settings</h1>

      {/* ── Tab navigation ─────────────────────────────── */}
      <ul className="nav nav-tabs mb-4">
        {TABS.map((tab) => (
          <li className="nav-item" key={tab.id}>
            <button
              type="button"
              className={`nav-link ${activeTab === tab.id ? "active" : ""}`}
              onClick={() => setActiveTab(tab.id)}
            >
              {tab.label}
            </button>
          </li>
        ))}
      </ul>

      {/* ══ Connection tab ══════════════════════════════ */}
      {activeTab === "connection" && (
      <div>
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

      {/* ── Server IP Address ──────────────────────────── */}
      <div className="card mb-3">
        <div className="card-body">
          <h6 className="card-title mb-3">Server IP Address</h6>
          <div className="row g-2 align-items-end">
            <div className="col">
              <label className="form-label">IP Address</label>
              <input
                type="text"
                className="form-control"
                placeholder="Auto-detected if left empty"
                value={config.server_ip || ""}
                onChange={(e) => setConfig((prev) => ({ ...prev, server_ip: e.target.value }))}
              />
              <div className="form-text">Embedded into ROM for C64-to-server communication. Auto-detected when empty.</div>
            </div>
            <div className="col-auto">
              <button
                className="btn btn-outline-secondary"
                disabled={detectingIp}
                onClick={async () => {
                  setDetectingIp(true);
                  try {
                    const resp = await fetch(`${API_BASE_URL}/settings/server_ip_detect`);
                    const data = await resp.json();
                    if (data.ip) {
                      setConfig((prev) => ({ ...prev, server_ip: data.ip }));
                    }
                  } catch { /* ignore */ }
                  setDetectingIp(false);
                }}
              >
                {detectingIp ? "Detecting..." : "Auto-detect"}
              </button>
            </div>
          </div>
        </div>
      </div>

      </div>
      )}

      {/* ══ AI Models tab ═══════════════════════════════ */}
      {activeTab === "ai" && (
      <div>
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

      </div>
      )}

      {/* ══ Apps & Services tab ═════════════════════════ */}
      {activeTab === "services" && (
      <div>
      {/* ── Web Browser Home Page ───────────────────────── */}
      <div className="card mb-3">
        <div className="card-body">
          <h6 className="card-title mb-3">Web Browser Home Page</h6>
          <input
            type="text"
            className="form-control"
            placeholder="https://example.com"
            value={config.home_page_url || ""}
            onChange={(e) => setConfig((prev) => ({ ...prev, home_page_url: e.target.value }))}
          />
          <div className="form-text">When set, new tabs and the browser will open this URL automatically.</div>
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

      {/* ── Clipboard ──────────────────────────────────── */}
      <div className="card mb-3">
        <div className="card-body">
          <h6 className="card-title mb-3">Clipboard <span className="text-muted fw-normal">(shared host &harr; C64)</span></h6>
          <div className="form-check form-switch mb-3">
            <input
              className="form-check-input"
              type="checkbox"
              role="switch"
              id="clipboardHostSync"
              checked={(config.clipboard_host_sync || "true").toLowerCase() === "true"}
              onChange={(e) =>
                setConfig((prev) => ({
                  ...prev,
                  clipboard_host_sync: e.target.checked ? "true" : "false",
                }))
              }
            />
            <label className="form-check-label" htmlFor="clipboardHostSync">
              Sync with the host desktop clipboard
            </label>
            <div className="form-text">
              Mirrors your computer's clipboard to the C64 and back, both ways.
              A C64 copy reaches the desktop instantly; the desktop clipboard is
              read only when you paste on the C64 &mdash; nothing runs on a timer.
              Turn off to keep the C64/app clipboard fully separate from the
              desktop. Fails gracefully on headless hosts with no clipboard
              backend.
            </div>
          </div>
          <div className="form-check form-switch mb-3">
            <input
              className="form-check-input"
              type="checkbox"
              role="switch"
              id="clipboardBackgroundPoll"
              checked={(config.clipboard_background_poll || "false").toLowerCase() === "true"}
              onChange={(e) =>
                setConfig((prev) => ({
                  ...prev,
                  clipboard_background_poll: e.target.checked ? "true" : "false",
                }))
              }
            />
            <label className="form-check-label" htmlFor="clipboardBackgroundPoll">
              Poll the desktop clipboard in the background
            </label>
            <div className="form-text">
              Leave off (default). When on, the desktop clipboard is re-read on a
              timer instead of on demand. Only enable this if desktop&rarr;C64
              sync feels stale on your setup &mdash; on GNOME/Wayland it makes the
              dock icon and taskbar flash each interval.
            </div>
          </div>
          <div className="row">
            <div className="col-md-6 mb-3 mb-md-0">
              <label className="form-label">Max clipboard size (bytes)</label>
              <input
                type="number"
                min="1"
                className="form-control"
                placeholder="65536"
                value={config.clipboard_max_bytes || ""}
                onChange={(e) => setConfig((prev) => ({ ...prev, clipboard_max_bytes: e.target.value }))}
              />
              <div className="form-text">Larger copies are truncated. Default 65536 (64 KiB).</div>
            </div>
            <div className="col-md-6 mb-0">
              <label className="form-label">Host poll interval (ms)</label>
              <input
                type="number"
                min="50"
                className="form-control"
                placeholder="500"
                disabled={(config.clipboard_background_poll || "false").toLowerCase() !== "true"}
                value={config.clipboard_poll_interval_ms || ""}
                onChange={(e) => setConfig((prev) => ({ ...prev, clipboard_poll_interval_ms: e.target.value }))}
              />
              <div className="form-text">
                Only used when background polling (above) is on. With the default
                on-demand sync the desktop clipboard is read only when you paste.
              </div>
            </div>
          </div>
        </div>
      </div>

      </div>
      )}

      {/* ══ Messaging tab ═══════════════════════════════ */}
      {activeTab === "messaging" && (
      <div>
      {/* ── Telegram ───────────────────────────────────── */}
      <div className="card mb-3">
        <div className="card-body">
          <h6 className="card-title mb-3">Telegram</h6>
          <div className="mb-3">
            <label className="form-label">Phone Number</label>
            <input
              type="text"
              className="form-control"
              placeholder="+1234567890"
              value={config.TELEGRAM_PHONE || ""}
              onChange={(e) => setConfig((prev) => ({ ...prev, TELEGRAM_PHONE: e.target.value }))}
            />
          </div>
          <div className="mb-3">
            <label className="form-label">API ID <span className="text-muted fw-normal">(from my.telegram.org)</span></label>
            <input
              type="password"
              className="form-control"
              placeholder="12345678"
              value={config.TELEGRAM_API_ID || ""}
              onChange={(e) => setConfig((prev) => ({ ...prev, TELEGRAM_API_ID: e.target.value }))}
            />
          </div>
          <div className="mb-3">
            <label className="form-label">API Hash <span className="text-muted fw-normal">(from my.telegram.org)</span></label>
            <input
              type="password"
              className="form-control"
              placeholder="0123456789abcdef0123456789abcdef"
              value={config.TELEGRAM_API_HASH || ""}
              onChange={(e) => setConfig((prev) => ({ ...prev, TELEGRAM_API_HASH: e.target.value }))}
            />
          </div>
          <div className="mb-0">
            <label className="form-label">Timezone</label>
            <select
              className="form-select"
              value={config.TIMEZONE || "UTC"}
              onChange={(e) => setConfig((prev) => ({ ...prev, TIMEZONE: e.target.value }))}
            >
              {TIMEZONES.map((tz) => (
                <option key={tz.value} value={tz.value}>{tz.label}</option>
              ))}
            </select>
          </div>
        </div>
      </div>

      {/* ── WhatsApp ───────────────────────────────────── */}
      <div className="card mb-3">
        <div className="card-body">
          <h6 className="card-title mb-3">WhatsApp</h6>
          <p className="text-muted small mb-3">
            WhatsApp needs no API credentials. Enter your phone number below, then
            open the WhatsApp console on the C64 (Launcher &rarr; WhatsApp, or
            <code> C=+CTRL+9</code>). It shows an 8-character pairing code you type
            into WhatsApp on your phone under <em>Settings &rarr; Linked Devices &rarr;
            Link a device &rarr; Link with phone number</em>.
          </p>
          <p className="text-warning small mb-3">
            Note: this uses an unofficial multi-device client. WhatsApp may flag or
            ban accounts using unofficial clients — consider using a spare number.
          </p>
          <div className="mb-0">
            <label className="form-label">Phone Number</label>
            <input
              type="text"
              className="form-control"
              placeholder="+1234567890"
              value={config.WHATSAPP_PHONE || ""}
              onChange={(e) => setConfig((prev) => ({ ...prev, WHATSAPP_PHONE: e.target.value }))}
            />
          </div>
        </div>
      </div>

      {/* ── Email (IMAP/SMTP) ──────────────────────────── */}
      <div className="card mb-3">
        <div className="card-body">
          <h6 className="card-title mb-3">Email <span className="text-muted fw-normal">(Mail console, C=+CTRL+8)</span></h6>
          <div className="row">
            <div className="col-md-8 mb-3">
              <label className="form-label">IMAP Host</label>
              <input
                type="text"
                className="form-control"
                placeholder="imap.example.com"
                value={config.MAIL_IMAP_HOST || ""}
                onChange={(e) => setConfig((prev) => ({ ...prev, MAIL_IMAP_HOST: e.target.value }))}
              />
            </div>
            <div className="col-md-4 mb-3">
              <label className="form-label">IMAP Port</label>
              <input
                type="text"
                className="form-control"
                placeholder="993"
                value={config.MAIL_IMAP_PORT || ""}
                onChange={(e) => setConfig((prev) => ({ ...prev, MAIL_IMAP_PORT: e.target.value }))}
              />
            </div>
          </div>
          <div className="row">
            <div className="col-md-8 mb-3">
              <label className="form-label">SMTP Host</label>
              <input
                type="text"
                className="form-control"
                placeholder="smtp.example.com"
                value={config.MAIL_SMTP_HOST || ""}
                onChange={(e) => setConfig((prev) => ({ ...prev, MAIL_SMTP_HOST: e.target.value }))}
              />
            </div>
            <div className="col-md-4 mb-3">
              <label className="form-label">SMTP Port</label>
              <input
                type="text"
                className="form-control"
                placeholder="587"
                value={config.MAIL_SMTP_PORT || ""}
                onChange={(e) => setConfig((prev) => ({ ...prev, MAIL_SMTP_PORT: e.target.value }))}
              />
            </div>
          </div>
          <div className="mb-3">
            <label className="form-label">Username <span className="text-muted fw-normal">(usually your email address)</span></label>
            <input
              type="text"
              className="form-control"
              placeholder="you@example.com"
              value={config.MAIL_USER || ""}
              onChange={(e) => setConfig((prev) => ({ ...prev, MAIL_USER: e.target.value }))}
            />
          </div>
          <div className="mb-3">
            <label className="form-label">Password <span className="text-muted fw-normal">(use an app-password for Gmail/Fastmail)</span></label>
            <input
              type="password"
              className="form-control"
              placeholder="••••••••"
              value={config.MAIL_PASS || ""}
              onChange={(e) => setConfig((prev) => ({ ...prev, MAIL_PASS: e.target.value }))}
            />
          </div>
          <div className="row">
            <div className="col-md-8 mb-0">
              <label className="form-label">From Name <span className="text-muted fw-normal">(display name on sent mail)</span></label>
              <input
                type="text"
                className="form-control"
                placeholder="Jane Doe"
                value={config.MAIL_FROM_NAME || ""}
                onChange={(e) => setConfig((prev) => ({ ...prev, MAIL_FROM_NAME: e.target.value }))}
              />
            </div>
            <div className="col-md-4 mb-0">
              <label className="form-label">Security</label>
              <select
                className="form-select"
                value={config.MAIL_TLS || "ssl"}
                onChange={(e) => setConfig((prev) => ({ ...prev, MAIL_TLS: e.target.value }))}
              >
                <option value="ssl">SSL/TLS</option>
                <option value="starttls">STARTTLS</option>
              </select>
            </div>
          </div>
        </div>
      </div>

      </div>
      )}

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
