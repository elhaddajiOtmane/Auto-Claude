# 🚀 Auto-Claude Build Instructions

This guide explains how to build Auto-Claude into standalone Windows installers that require no Node.js, Python, or command line knowledge.

## 📦 Ready-Made Releases

**Don't want to build? Get the ready-made installers:**

### [🔗 Download Latest Release](https://github.com/elhaddajiOtmane/Auto-Claude/releases)

- **Auto-Claude-X.X.X-win32-x64.exe** - Full Windows installer (148 MB)
- **Auto-Claude-X.X.X-win32-x64.zip** - Portable version (209 MB)

Both include everything needed to run - no technical setup required!

---

## 🛠️ Building from Source

### Prerequisites

- **Node.js 24+** (recommended) - [Download here](https://nodejs.org/)
- **Python 3.12** - [Download here](https://python.org/)
- **Windows 10/11** (for Windows builds)

### Quick Build (Automated)

1. **Clone the repository:**
   ```bash
   git clone https://github.com/elhaddajiOtmane/Auto-Claude.git
   cd Auto-Claude
   ```

2. **Run the automated build:**
   ```bash
   # Double-click this file in Windows Explorer
   build-installer.bat
   ```
   
   Or from command line:
   ```bash
   ./build-installer.bat
   ```

3. **Find your installers:**
   ```
   apps/frontend/dist/
   ├── Auto-Claude-2.7.2-win32-x64.exe  (Windows installer)
   ├── Auto-Claude-2.7.2-win32-x64.zip  (Portable version)
   └── INSTALLATION_INSTRUCTIONS.txt    (Setup guide)
   ```

### Manual Build Steps

If you prefer to run each step manually:

```bash
# 1. Install root dependencies
npm install

# 2. Install backend (Python) dependencies
npm run install:backend

# 3. Install frontend (Electron) dependencies
npm run install:frontend

# 4. Build the application
npm run build

# 5. Create Windows package
npm run package:win
```

### Available Build Commands

```bash
npm run package:win    # Windows installer (.exe + .zip)
npm run package:mac    # macOS application (.dmg + .zip)
npm run package:linux  # Linux packages (.AppImage + .deb)
npm run package        # Build for current platform
```

---

## 🤖 Automated Builds (GitHub Actions)

### Creating a Release

1. **Tag a version:**
   ```bash
   git tag v2.7.3
   git push origin v2.7.3
   ```

2. **Automatic build triggers:**
   - GitHub Actions automatically builds Windows installer
   - Creates a new release with downloadable files
   - No manual intervention needed!

### Manual Trigger

You can also trigger builds manually:

1. Go to [Actions tab](https://github.com/elhaddajiOtmane/Auto-Claude/actions)
2. Select "Build and Release Auto-Claude"
3. Click "Run workflow"
4. Enter version tag (e.g., `v2.7.3`)

---

## 📋 What Gets Built

### Windows Installer (.exe)
- **Size:** ~148 MB
- **Type:** NSIS installer
- **Includes:** Full installation with shortcuts
- **Target:** `apps/frontend/dist/Auto-Claude-X.X.X-win32-x64.exe`

### Portable Version (.zip)
- **Size:** ~209 MB  
- **Type:** Standalone archive
- **Includes:** Everything needed to run
- **Target:** `apps/frontend/dist/Auto-Claude-X.X.X-win32-x64.zip`

### Embedded Components
✅ **Complete Auto-Claude application (v2.7.2)**  
✅ **Python 3.12.8 runtime (embedded)**  
✅ **All Python dependencies:**
- claude-agent-sdk
- openai
- google-generativeai  
- neo4j
- numpy, pydantic, and 50+ more

✅ **Electron desktop interface**  
✅ **All backend services**  
✅ **No external dependencies required**

---

## 🚀 Distribution

### For End Users
- Download from [Releases page](https://github.com/elhaddajiOtmane/Auto-Claude/releases)
- Double-click the `.exe` to install
- Or extract the `.zip` for portable use
- **No technical knowledge required!**

### For Developers
- Clone this repository
- Run `build-installer.bat` 
- Distribute the generated files

---

## 🔧 Troubleshooting

### Node.js Version Issues
- The build requires Node.js 24+
- Download from [nodejs.org](https://nodejs.org/)
- Or use the build script - it warns but continues with older versions

### Build Fails
1. **Clean build:**
   ```bash
   rm -rf node_modules apps/frontend/node_modules apps/backend/.venv
   npm run install:all
   ```

2. **Python issues:**
   ```bash
   cd apps/backend
   rm -rf .venv
   cd ../..
   npm run install:backend
   ```

3. **Windows-specific:**
   - Ensure Windows SDK is installed
   - Run as Administrator if needed

### Large File Sizes
- The installers are large because they include:
  - Complete Python runtime (~50 MB)
  - Python packages (~110 MB)  
  - Electron framework (~100 MB)
  - Application code (~50 MB)
- This ensures zero external dependencies!

---

## 📞 Support

- **Issues:** [GitHub Issues](https://github.com/elhaddajiOtmane/Auto-Claude/issues)
- **Discussions:** [GitHub Discussions](https://github.com/elhaddajiOtmane/Auto-Claude/discussions)
- **Original Project:** [AndyMik90/Auto-Claude](https://github.com/AndyMik90/Auto-Claude)

---

**🎉 Ready to build standalone Auto-Claude installers that work on any Windows machine!**