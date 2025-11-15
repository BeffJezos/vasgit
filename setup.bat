@echo off
REM Vasgit Setup Launcher for Windows
REM Automatically detects and uses PowerShell or Git Bash

echo.
echo ================================================
echo   VASGIT Setup - Windows Auto-Launcher
echo ================================================
echo.

REM Check if PowerShell 7+ (pwsh) is available
where pwsh >nul 2>&1
if %errorlevel% == 0 (
    echo [OK] PowerShell 7+ detected
    echo [INFO] Starting PowerShell setup script...
    echo.
    pwsh -ExecutionPolicy Bypass -File "%~dp0.vasgit\scripts\setup.ps1"
    goto :end
)

REM Check if Windows PowerShell is available
where powershell >nul 2>&1
if %errorlevel% == 0 (
    echo [OK] Windows PowerShell detected
    echo [INFO] Starting PowerShell setup script...
    echo.
    powershell -ExecutionPolicy Bypass -File "%~dp0.vasgit\scripts\setup.ps1"
    goto :end
)

REM Check if Git Bash is available
where bash >nul 2>&1
if %errorlevel% == 0 (
    echo [OK] Git Bash detected
    echo [INFO] Starting Bash setup script...
    echo.
    bash "%~dp0.vasgit\scripts\setup.sh"
    goto :end
)

REM No suitable environment found
echo [ERROR] Neither PowerShell nor Git Bash found!
echo.
echo Please install one of the following:
echo   - Git for Windows (includes Git Bash): https://git-scm.com/download/win
echo   - PowerShell 7+: https://aka.ms/powershell
echo.

:end
pause

