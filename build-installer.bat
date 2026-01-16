@echo off
echo ============================================
echo Auto-Claude Standalone Installer Builder
echo ============================================
echo.

:: Set script directory as working directory
cd /d "%~dp0"

:: Check if Node.js is installed and get version
node --version >nul 2>&1
if errorlevel 1 (
    echo ERROR: Node.js is not installed or not in PATH
    echo Please install Node.js from https://nodejs.org/
    pause
    exit /b 1
)

:: Get Node.js version
for /f "tokens=*" %%i in ('node --version') do set NODE_VERSION=%%i
echo Current Node.js version: %NODE_VERSION%

:: Extract major version number (remove 'v' and get number before first dot)
set NODE_MAJOR=%NODE_VERSION:~1,2%
if %NODE_MAJOR% LSS 24 (
    echo.
    echo WARNING: Node.js version %NODE_VERSION% is older than required (24.0.0+)
    echo The build might still work but may have compatibility issues.
    echo Recommend updating to Node.js 24+ from https://nodejs.org/
    echo.
    echo Press any key to continue anyway, or Ctrl+C to cancel...
    pause >nul
)

echo.
echo Step 1: Installing root dependencies...
call npm install
if errorlevel 1 (
    echo ERROR: Failed to install root dependencies
    pause
    exit /b 1
)

echo.
echo Step 2: Installing backend dependencies...
call npm run install:backend
if errorlevel 1 (
    echo ERROR: Failed to install backend dependencies
    pause
    exit /b 1
)

echo.
echo Step 3: Installing frontend dependencies...
call npm run install:frontend  
if errorlevel 1 (
    echo ERROR: Failed to install frontend dependencies
    pause
    exit /b 1
)

echo.
echo Step 4: Building the application...
call npm run build
if errorlevel 1 (
    echo ERROR: Failed to build application
    pause
    exit /b 1
)

echo.
echo Step 5: Creating Windows package (this may take several minutes)...
call npm run package:win
if errorlevel 1 (
    echo ERROR: Failed to create Windows package
    pause
    exit /b 1
)

echo.
echo ============================================
echo SUCCESS! Standalone installer created!
echo ============================================
echo.
echo The installer has been created in the 'apps\frontend\dist' folder:
echo - Auto-Claude-2.7.2-win-x64.exe (NSIS installer)
echo - Auto-Claude-2.7.2-win-x64.zip (Portable version)
echo.
echo You can now:
echo 1. Double-click the .exe file to install Auto-Claude
echo 2. Or extract the .zip file to run it portably
echo.
echo The installed application will work without Node.js or command line!
echo.
pause