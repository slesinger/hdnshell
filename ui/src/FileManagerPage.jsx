import { useEffect, useState, useRef } from "react";
import { API_BASE_URL } from "./api.js";

const TEXT_FILE_EXTENSIONS = new Set([".txt", ".cfg", ".c", ".h", ".bas", ".asm"]);
const DISK_IMAGE_EXTENSIONS = new Set([".d64", ".d71", ".d81"]);
const DEFAULT_OPEN_EXTENSIONS = new Set([".tap", ".sid", ".mod"]);

function getFileExtension(filename) {
  const lastDot = filename.lastIndexOf(".");
  return lastDot >= 0 ? filename.slice(lastDot).toLowerCase() : "";
}

// Simple toast notification helper
function showToast(message, type = "info") {
  const toastContainer = document.getElementById("toast-container");
  if (!toastContainer) return;

  const toast = document.createElement("div");
  toast.className = `alert alert-${type === "error" ? "danger" : type === "success" ? "success" : "info"} alert-dismissible fade show`;
  toast.innerHTML = `
    ${message}
    <button type="button" class="btn-close" data-bs-dismiss="alert"></button>
  `;
  toastContainer.appendChild(toast);

  setTimeout(() => {
    toast.remove();
  }, 5000);
}

function formatFileSize(bytes) {
  if (bytes === 0) return "0 B";
  const k = 1024;
  const sizes = ["B", "KB", "MB", "GB"];
  const i = Math.floor(Math.log(bytes) / Math.log(k));
  return (bytes / Math.pow(k, i)).toFixed(2) + " " + sizes[i];
}

function FileManagerPage({ lastC64Ip }) {
  // State
  const [c64Ip, setC64Ip] = useState(lastC64Ip || "");
  const [currentPath, setCurrentPath] = useState("/Flash/roms");
  const [entries, setEntries] = useState([]);
  const [loading, setLoading] = useState(false);
  const [selectedFile, setSelectedFile] = useState(null);
  const [uploadProgress, setUploadProgress] = useState("");
  const [csdbUrl, setCsdbUrl] = useState("");
  const [csdbImporting, setCsdbImporting] = useState(false);
  const [virtualDiskImage, setVirtualDiskImage] = useState(null);
  const [editingFile, setEditingFile] = useState(null);
  const [editContent, setEditContent] = useState("");
  const [showEditor, setShowEditor] = useState(false);
  const dragOverRef = useRef(false);

  // Load initial directory
  useEffect(() => {
    if (c64Ip && currentPath) {
      loadDirectory();
    }
  }, [c64Ip, currentPath, virtualDiskImage]);

  // Load directory from C64
  const loadDirectory = async () => {
    if (!c64Ip) {
      showToast("C64 IP not set. Use Find C64U first.", "error");
      return;
    }

    setLoading(true);
    try {
      const url = virtualDiskImage
        ? `${API_BASE_URL}/files/list?c64_ip=${encodeURIComponent(c64Ip)}&disk_image=${encodeURIComponent(virtualDiskImage)}`
        : `${API_BASE_URL}/files/list?c64_ip=${encodeURIComponent(c64Ip)}&path=${encodeURIComponent(currentPath)}`;
      const resp = await fetch(url);
      const data = await resp.json();

      if (!resp.ok) {
        showToast(`Error: ${data.error}`, "error");
        return;
      }

      setEntries(data.data.entries || []);
    } catch (err) {
      showToast(`Failed to load directory: ${err.message}`, "error");
    } finally {
      setLoading(false);
    }
  };

  // Navigate to directory
  const navigateToDir = (dirname) => {
    if (dirname === "..") {
      if (virtualDiskImage) {
        setVirtualDiskImage(null);
        setSelectedFile(null);
        return;
      }
      const parent = currentPath.substring(0, currentPath.lastIndexOf("/"));
      setCurrentPath(parent || "/");
    } else {
      if (virtualDiskImage) {
        return;
      }
      setCurrentPath(currentPath === "/" ? "/" + dirname : currentPath + "/" + dirname);
    }
    setSelectedFile(null);
  };

  // Handle breadcrumb click
  const handleBreadcrumbClick = (path) => {
    if (path === currentPath) {
      return;
    }

    setVirtualDiskImage(null);
    setCurrentPath(path);
    setSelectedFile(null);
  };

  const getFilePath = (filename) => (currentPath === "/" ? `/${filename}` : `${currentPath}/${filename}`);

  const isRomDirectory = currentPath.toLowerCase() === "/flash/roms" || currentPath.toLowerCase().startsWith("/flash/roms/");

  const handleOpenDiskImage = (filename) => {
    const imagePath = getFilePath(filename);
    setVirtualDiskImage(imagePath);
    setSelectedFile(null);
  };

  // Upload files
  const handleUpload = async (files) => {
    if (!c64Ip) {
      showToast("C64 IP not set", "error");
      return;
    }

    setUploadProgress("Uploading...");
    const formData = new FormData();
    for (const file of files) {
      formData.append("files", file);
    }

    try {
      const url = `${API_BASE_URL}/files/upload?c64_ip=${encodeURIComponent(c64Ip)}&dest_path=${encodeURIComponent(currentPath)}`;
      const resp = await fetch(url, {
        method: "POST",
        body: formData
      });
      const data = await resp.json();

      if (!resp.ok) {
        showToast(`Upload failed: ${data.error}`, "error");
      } else {
        showToast(`Uploaded ${data.data.uploaded.length} file(s)`, "success");
        loadDirectory();
      }
    } catch (err) {
      showToast(`Upload error: ${err.message}`, "error");
    } finally {
      setUploadProgress("");
    }
  };

  // Drag and drop handlers
  const handleDragOver = (e) => {
    e.preventDefault();
    dragOverRef.current = true;
  };

  const handleDragLeave = (e) => {
    e.preventDefault();
    dragOverRef.current = false;
  };

  const handleDrop = (e) => {
    e.preventDefault();
    dragOverRef.current = false;
    const files = Array.from(e.dataTransfer.files);
    if (files.length > 0) {
      handleUpload(files);
    }
  };

  // Click to upload
  const handleClickUpload = (e) => {
    const files = Array.from(e.target.files);
    if (files.length > 0) {
      handleUpload(files);
    }
  };

  // CSDB import
  const handleCsdbImport = async () => {
    if (!csdbUrl.trim()) {
      showToast("Please enter a CSDB URL", "error");
      return;
    }

    if (!c64Ip) {
      showToast("C64 IP not set", "error");
      return;
    }

    setCsdbImporting(true);
    try {
      const resp = await fetch(`${API_BASE_URL}/files/csdb-import`, {
        method: "POST",
        headers: { "Content-Type": "application/json" },
        body: JSON.stringify({
          csdb_url: csdbUrl,
          c64_ip: c64Ip,
          dest_path: currentPath
        })
      });
      const data = await resp.json();

      if (!resp.ok) {
        showToast(`CSDB import failed: ${data.error}`, "error");
      } else {
        showToast(`Imported ${data.data.files.length} file(s)`, "success");
        setCsdbUrl("");
        loadDirectory();
      }
    } catch (err) {
      showToast(`Import error: ${err.message}`, "error");
    } finally {
      setCsdbImporting(false);
    }
  };

  // Download file
  const handleDownload = async (filename) => {
    if (!c64Ip) {
      showToast("C64 IP not set", "error");
      return;
    }

    try {
      const filePath = currentPath === "/" ? "/" + filename : currentPath + "/" + filename;
      const url = `${API_BASE_URL}/files/download?c64_ip=${encodeURIComponent(c64Ip)}&path=${encodeURIComponent(filePath)}`;
      const resp = await fetch(url);
      if (!resp.ok) {
        showToast("Download failed", "error");
        return;
      }
      const blob = await resp.blob();
      const link = document.createElement("a");
      link.href = URL.createObjectURL(blob);
      link.download = filename;
      link.click();
      URL.revokeObjectURL(link.href);
    } catch (err) {
      showToast(`Download error: ${err.message}`, "error");
    }
  };

  // Edit text file
  const handleEditFile = async (filename) => {
    if (!c64Ip) {
      showToast("C64 IP not set", "error");
      return;
    }

    try {
      const filePath = currentPath === "/" ? "/" + filename : currentPath + "/" + filename;
      const url = `${API_BASE_URL}/files/read?c64_ip=${encodeURIComponent(c64Ip)}&path=${encodeURIComponent(filePath)}`;
      const resp = await fetch(url);
      const data = await resp.json();

      if (!resp.ok) {
        showToast(`Cannot read file: ${data.error}`, "error");
        return;
      }

      setEditingFile(filePath);
      setEditContent(data.data.content);
      setShowEditor(true);
    } catch (err) {
      showToast(`Read error: ${err.message}`, "error");
    }
  };

  // Save text file
  const handleSaveFile = async () => {
    if (!c64Ip || !editingFile) {
      showToast("Cannot save file", "error");
      return;
    }

    try {
      const resp = await fetch(`${API_BASE_URL}/files/save`, {
        method: "PUT",
        headers: { "Content-Type": "application/json" },
        body: JSON.stringify({
          c64_ip: c64Ip,
          path: editingFile,
          content: editContent
        })
      });
      const data = await resp.json();

      if (!resp.ok) {
        showToast(`Save failed: ${data.error}`, "error");
      } else {
        showToast("File saved", "success");
        setShowEditor(false);
        setEditingFile(null);
        setEditContent("");
      }
    } catch (err) {
      showToast(`Save error: ${err.message}`, "error");
    }
  };

  // Delete file
  const handleDeleteFile = async (filename) => {
    if (!confirm(`Delete ${filename}?`)) return;

    if (!c64Ip) {
      showToast("C64 IP not set", "error");
      return;
    }

    try {
      const filePath = currentPath === "/" ? "/" + filename : currentPath + "/" + filename;
      const url = `${API_BASE_URL}/files/delete?c64_ip=${encodeURIComponent(c64Ip)}&path=${encodeURIComponent(filePath)}`;
      const resp = await fetch(url, { method: "DELETE" });
      const data = await resp.json();

      if (!resp.ok) {
        showToast(`Delete failed: ${data.error}`, "error");
      } else {
        showToast("File deleted", "success");
        loadDirectory();
      }
    } catch (err) {
      showToast(`Delete error: ${err.message}`, "error");
    }
  };

  // Run file
  const handleRunFile = async (filename, action = "default") => {
    if (!c64Ip) {
      showToast("C64 IP not set", "error");
      return;
    }

    try {
      const filePath = getFilePath(filename);
      const resp = await fetch(`${API_BASE_URL}/files/run`, {
        method: "POST",
        headers: { "Content-Type": "application/json" },
        body: JSON.stringify({
          c64_ip: c64Ip,
          path: filePath,
          action
        })
      });
      const data = await resp.json();

      if (!resp.ok) {
        showToast(`Run failed: ${data.error}`, "error");
      } else {
        showToast(data.message || "Program running", "success");
      }
    } catch (err) {
      showToast(`Run error: ${err.message}`, "error");
    }
  };

  const handleRunVirtualPrg = async (diskName, action = "load_and_run") => {
    if (!c64Ip || !virtualDiskImage) {
      showToast("C64 IP or disk image is missing", "error");
      return;
    }

    try {
      const resp = await fetch(`${API_BASE_URL}/files/run`, {
        method: "POST",
        headers: { "Content-Type": "application/json" },
        body: JSON.stringify({
          c64_ip: c64Ip,
          image_path: virtualDiskImage,
          image_entry: diskName,
          action
        })
      });
      const data = await resp.json();

      if (!resp.ok) {
        showToast(`Run failed: ${data.error}`, "error");
      } else {
        showToast(data.message || "Program running", "success");
      }
    } catch (err) {
      showToast(`Run error: ${err.message}`, "error");
    }
  };

  // Breadcrumbs component
  const pathParts = currentPath.split("/").filter((part) => part);
  const breadcrumbs = [{ label: "/", path: "/" }, ...pathParts.map((part, index) => ({
    label: part,
    path: `/${pathParts.slice(0, index + 1).join("/")}`
  }))];
  if (virtualDiskImage) {
    breadcrumbs.push({ label: PathLabel(virtualDiskImage), path: virtualDiskImage, virtual: true });
  }

  function PathLabel(path) {
    const parts = path.split("/").filter(Boolean);
    return parts.length > 0 ? parts[parts.length - 1] : path;
  }

  return (
    <div className="container-fluid mt-3">
      <div id="toast-container" style={{ position: "fixed", top: "20px", right: "20px", zIndex: 9999 }}></div>

      <h2>File Manager</h2>

      {/* C64 IP Bar */}
      <div className="alert alert-info d-flex align-items-center justify-content-between mb-3">
        <span>C64 IP: <strong>{c64Ip || "Not connected"}</strong></span>
        <div>
          {c64Ip && (
            <button className="btn btn-sm btn-secondary" onClick={loadDirectory} disabled={loading}>
              {loading ? "Loading..." : "Refresh"}
            </button>
          )}
        </div>
      </div>

      {/* Navigation & Actions Bar */}
      <div className="d-flex gap-2 mb-3 flex-wrap">
        <div className="input-group flex-grow-1" style={{ maxWidth: "600px" }}>
          <input
            type="text"
            className="form-control"
            placeholder="CSDB URL (e.g., https://csdb.dk/release/download.php?id=305029)"
            value={csdbUrl}
            onChange={(e) => setCsdbUrl(e.target.value)}
            disabled={csdbImporting}
          />
          <button
            className="btn btn-outline-secondary"
            onClick={handleCsdbImport}
            disabled={csdbImporting || !c64Ip}
          >
            {csdbImporting ? "Importing..." : "Import from CSDB"}
          </button>
        </div>
        <label className="btn btn-outline-primary mb-0" style={{ cursor: "pointer" }}>
          <input
            type="file"
            multiple
            onChange={handleClickUpload}
            style={{ display: "none" }}
            disabled={!c64Ip}
          />
          📁 Upload Files
        </label>
      </div>

      {/* Breadcrumbs */}
      <nav className="mb-3">
        <ol className="breadcrumb mb-0">
          {breadcrumbs.map((crumb, idx) => (
            <li key={crumb.path} className={`breadcrumb-item ${idx === breadcrumbs.length - 1 ? "active" : ""}`}>
              {idx === breadcrumbs.length - 1 ? (
                crumb.label
              ) : (
                <button
                  type="button"
                  className="btn btn-link p-0 text-decoration-none align-baseline"
                  onClick={() => {
                    if (crumb.virtual) {
                      setVirtualDiskImage(crumb.path);
                      return;
                    }
                    handleBreadcrumbClick(crumb.path);
                  }}
                >
                  {crumb.label}
                </button>
              )}
            </li>
          ))}
        </ol>
      </nav>

      {/* Drag and drop zone */}
      {c64Ip && (
        <div
          className={`border-2 border-dashed p-4 mb-3 text-center ${dragOverRef.current ? "bg-light" : ""}`}
          style={{
            borderColor: "#ccc",
            borderRadius: "4px",
            cursor: "grab",
            backgroundColor: dragOverRef.current ? "#f0f0f0" : "transparent"
          }}
          onDragOver={handleDragOver}
          onDragLeave={handleDragLeave}
          onDrop={handleDrop}
        >
          <p className="mb-0 text-muted">📂 Drag and drop files here to upload</p>
        </div>
      )}

      {uploadProgress && (
        <div className="alert alert-info mb-3">{uploadProgress}</div>
      )}

      {/* File Browser Table */}
      <div className="table-responsive">
        <table className="table table-hover table-sm">
          <thead className="table-light">
            <tr>
              <th style={{ width: "40%" }}>Name</th>
              <th style={{ width: "15%" }}>Type</th>
              <th style={{ width: "15%" }}>Size</th>
              <th style={{ width: "30%" }}>Actions</th>
            </tr>
          </thead>
          <tbody>
            {(currentPath !== "/" || virtualDiskImage) && (
              <tr
                onClick={() => navigateToDir("..")}
                style={{ cursor: "pointer", backgroundColor: "#f9f9f9" }}
              >
                <td>📁 ..</td>
                <td>dir</td>
                <td>—</td>
                <td></td>
              </tr>
            )}
            {entries.map((entry, idx) => {
              const isDir = entry.type === "dir";
              const isSelected = selectedFile === entry.name;
              const ext = getFileExtension(entry.name);
              const isDiskImage = DISK_IMAGE_EXTENSIONS.has(ext);
              const isVirtualEntry = entry.source === "disk_image";
              const icon = isDir || isDiskImage ? "📁" : "📄";
              const canEdit = TEXT_FILE_EXTENSIONS.has(ext);

              return (
                <tr
                  key={idx}
                  onClick={() => setSelectedFile(entry.name)}
                  style={{
                    cursor: isDir || isDiskImage ? "pointer" : "default",
                    backgroundColor: isSelected ? "#e3f2fd" : "transparent"
                  }}
                >
                  <td
                    onClick={
                      isDir
                        ? () => navigateToDir(entry.name)
                        : isDiskImage && !virtualDiskImage
                          ? () => handleOpenDiskImage(entry.name)
                          : null
                    }
                    style={{ cursor: isDir || (isDiskImage && !virtualDiskImage) ? "pointer" : "default", fontWeight: isDir || isDiskImage ? "bold" : "normal" }}
                  >
                    {icon} {entry.name}
                  </td>
                  <td>{entry.type}</td>
                  <td>{entry.size > 0 ? formatFileSize(entry.size) : "—"}</td>
                  <td>
                    <div className="d-flex gap-1 flex-wrap" role="group">
                      {!isDir && canEdit && (
                        <button
                          className="btn btn-outline-secondary btn-sm"
                          onClick={(e) => {
                            e.stopPropagation();
                            handleEditFile(entry.name);
                          }}
                          title="Edit"
                        >
                          ✏️
                        </button>
                      )}
                      {!isDir && ext === ".prg" && (
                        <button
                          className="btn btn-outline-success btn-sm"
                          onClick={(e) => {
                            e.stopPropagation();
                            if (isVirtualEntry) {
                              handleRunVirtualPrg(entry.disk_name || entry.name, "load_and_run");
                            } else {
                              handleRunFile(entry.name, "load_and_run");
                            }
                          }}
                          title="Load and run PRG"
                        >
                          Run
                        </button>
                      )}
                      {!isDir && ext === ".prg" && (
                        <button
                          className="btn btn-outline-primary btn-sm"
                          onClick={(e) => {
                            e.stopPropagation();
                            if (isVirtualEntry) {
                              handleRunVirtualPrg(entry.disk_name || entry.name, "dma_load");
                            } else {
                              handleRunFile(entry.name, "dma_load");
                            }
                          }}
                          title="Load PRG into memory via DMA"
                        >
                          DMA
                        </button>
                      )}
                      {!isDir && isDiskImage && !virtualDiskImage && (
                        <button
                          className="btn btn-outline-success btn-sm"
                          onClick={(e) => {
                            e.stopPropagation();
                            handleRunFile(entry.name, "mount");
                          }}
                          title="Mount disk image on drive 8"
                        >
                          Mount #8
                        </button>
                      )}
                      {!isDir && isDiskImage && !virtualDiskImage && (
                        <button
                          className="btn btn-outline-success btn-sm"
                          onClick={(e) => {
                            e.stopPropagation();
                            handleRunFile(entry.name, "load_star");
                          }}
                          title="Mount image and execute LOAD *"
                        >
                          LOAD *
                        </button>
                      )}
                      {!isDir && ext === ".crt" && (
                        <button
                          className="btn btn-outline-success btn-sm"
                          onClick={(e) => {
                            e.stopPropagation();
                            handleRunFile(entry.name, "attach_cartridge");
                          }}
                          title="Attach cartridge"
                        >
                          Attach Cart
                        </button>
                      )}
                      {!isDir && ext === ".bin" && isRomDirectory && (
                        <button
                          className="btn btn-outline-warning btn-sm"
                          onClick={(e) => {
                            e.stopPropagation();
                            handleRunFile(entry.name, "load_basic_rom");
                          }}
                          title="Set as BASIC ROM"
                        >
                          BASIC ROM
                        </button>
                      )}
                      {!isDir && DEFAULT_OPEN_EXTENSIONS.has(ext) && (
                        <button
                          className="btn btn-outline-success btn-sm"
                          onClick={(e) => {
                            e.stopPropagation();
                            handleRunFile(entry.name, "default");
                          }}
                          title="Open with device default handler"
                        >
                          Open
                        </button>
                      )}
                      {!isDir && !isVirtualEntry && (
                        <button
                          className="btn btn-outline-info btn-sm"
                          onClick={(e) => {
                            e.stopPropagation();
                            handleDownload(entry.name);
                          }}
                          title="Download"
                        >
                          ⬇️
                        </button>
                      )}
                      {!isDir && !isVirtualEntry && (
                        <button
                          className="btn btn-outline-danger btn-sm"
                          onClick={(e) => {
                            e.stopPropagation();
                            handleDeleteFile(entry.name);
                          }}
                          title="Delete"
                        >
                          🗑️
                        </button>
                      )}
                    </div>
                  </td>
                </tr>
              );
            })}
          </tbody>
        </table>
      </div>

      {entries.length === 0 && !loading && (
        <div className="alert alert-info">No files found in this directory</div>
      )}

      {/* Text Editor Modal */}
      {showEditor && (
        <div
          className="modal d-block"
          style={{ backgroundColor: "rgba(0,0,0,0.5)" }}
          onClick={() => setShowEditor(false)}
        >
          <div className="modal-dialog modal-lg" onClick={(e) => e.stopPropagation()}>
            <div className="modal-content">
              <div className="modal-header">
                <h5 className="modal-title">Edit: {editingFile}</h5>
                <button
                  type="button"
                  className="btn-close"
                  onClick={() => setShowEditor(false)}
                ></button>
              </div>
              <div className="modal-body">
                <textarea
                  className="form-control"
                  style={{ height: "400px", fontFamily: "monospace" }}
                  value={editContent}
                  onChange={(e) => setEditContent(e.target.value)}
                ></textarea>
              </div>
              <div className="modal-footer">
                <button
                  type="button"
                  className="btn btn-secondary"
                  onClick={() => setShowEditor(false)}
                >
                  Cancel
                </button>
                <button
                  type="button"
                  className="btn btn-primary"
                  onClick={handleSaveFile}
                >
                  Save
                </button>
              </div>
            </div>
          </div>
        </div>
      )}
    </div>
  );
}

export default FileManagerPage;
