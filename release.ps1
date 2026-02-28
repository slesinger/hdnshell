# Paths and Variables
$UI_DIR = "ui"
$UI_DIST = "$UI_DIR/dist"
$CLOUD_DIR = "cloud"
$CLOUD_STATIC_DIR = "$CLOUD_DIR/static"
$RELEASE_DIR = "release"

# Resolve version from latest git tag (strip leading 'v'); fall back to "0.0.0"
$VERSION = (git describe --tags --abbrev=0 2>$null) -replace '^[vV]', ''
if (-not $VERSION) { $VERSION = "0.0.0" }
Write-Host "--- Release version: $VERSION ---" -ForegroundColor Cyan

# 1. Clean Release
Write-Host "--- Cleaning Release ---" -ForegroundColor Cyan
if (Test-Path $RELEASE_DIR) {
    Remove-Item -Path "$RELEASE_DIR/hdnsh-cloud", 
                      "$RELEASE_DIR/hdnsh-cloud.exe", 
                      "$RELEASE_DIR/hdnsh-cloud-mac", 
                      "$RELEASE_DIR/hdnsh-server-win.exe", 
                      "$RELEASE_DIR/hdnsh-server-linux", 
                      "$RELEASE_DIR/hdnsh-server-mac" -ErrorAction SilentlyContinue
}

# 2. UI Build
Write-Host "--- Building UI ---" -ForegroundColor Cyan
Push-Location $UI_DIR
npm install
npm run build
Pop-Location

# 3. UI Copy
Write-Host "--- Copying UI Assets ---" -ForegroundColor Cyan
if (Test-Path $CLOUD_STATIC_DIR) { Remove-Item -Recurse -Force $CLOUD_STATIC_DIR }
Copy-Item -Path $UI_DIST -Destination $CLOUD_STATIC_DIR -Recurse

# 4. Backend Package - Windows
Write-Host "--- Packaging Windows Backend ---" -ForegroundColor Cyan
Push-Location $CLOUD_DIR
# Stamp version into version.py
Set-Content "version.py" "__version__ = `"$VERSION`""
# Cleanup old build artifacts
Remove-Item -Recurse -Force build, dist, *.spec -ErrorAction SilentlyContinue
pyinstaller --clean --onefile --name hdnsh-server-win --add-data "static;static" cloud.py
Pop-Location

# Ensure Release Dir exists
if (!(Test-Path $RELEASE_DIR)) { New-Item -ItemType Directory $RELEASE_DIR }

# Copy result to release folder
Copy-Item -Path "$CLOUD_DIR/dist/hdnsh-server-win.exe" -Destination "$RELEASE_DIR/" -Force

Write-Host "--- Release Build Complete! ---" -ForegroundColor Green
