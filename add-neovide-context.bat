@echo off
setlocal enabledelayedexpansion

echo ========================================
echo   Adding Neovide to Context Menu
echo ========================================
echo.

net session >nul 2>&1
if %errorLevel% neq 0 (
    echo ERROR: This script must be run as Administrator!
    echo Right-click on this file and select "Run as administrator"
    echo.
    pause
    exit /b 1
)

echo Searching for Neovide...
where neovide >nul 2>&1
if %errorLevel% neq 0 (
    echo ERROR: Neovide not found in PATH!
    echo Please make sure Neovide is installed and in PATH.
    echo You can install it with: scoop install neovide
    echo.
    pause
    exit /b 1
)

for /f "tokens=*" %%i in ('where neovide') do (
    set "NEOVIDE_PATH=%%i"
    echo ✓ Found Neovide at: %%i
)
echo.

echo Searching for Neovim icon...
set "NVIM_ICON_PATH="
where nvim >nul 2>&1
if %errorLevel% neq 0 (
    echo WARNING: Neovim not found in PATH!
    echo Using Neovide icon as fallback.
    set "NVIM_ICON_PATH=!NEOVIDE_PATH!,0"
) else (
    for /f "tokens=*" %%i in ('where nvim') do (
        echo ✓ Found Neovim at: %%i
        set "NVIM_ICON_PATH=%%i,0"
    )
)
echo.

echo Adding context menu for files...
reg add "HKEY_CLASSES_ROOT\*\shell\Neovide" /ve /d "Open with Neovim" /f >nul
reg add "HKEY_CLASSES_ROOT\*\shell\Neovide" /v "Icon" /d "!NVIM_ICON_PATH!" /f >nul
reg add "HKEY_CLASSES_ROOT\*\shell\Neovide\command" /ve /d "\"!NEOVIDE_PATH!\" \"%%1\"" /f >nul

if %errorLevel% equ 0 (
    echo ✓ File context menu added successfully
) else (
    echo ✗ Failed to add file context menu
)

echo Adding context menu for folders...
reg add "HKEY_CLASSES_ROOT\Directory\shell\Neovide" /ve /d "Open with Neovim" /f >nul
reg add "HKEY_CLASSES_ROOT\Directory\shell\Neovide" /v "Icon" /d "!NVIM_ICON_PATH!" /f >nul
reg add "HKEY_CLASSES_ROOT\Directory\shell\Neovide\command" /ve /d "\"!NEOVIDE_PATH!\" \"%%1\"" /f >nul

if %errorLevel% equ 0 (
    echo ✓ Folder context menu added successfully
) else (
    echo ✗ Failed to add folder context menu
)

echo Adding context menu for directory background...
reg add "HKEY_CLASSES_ROOT\Directory\Background\shell\Neovide" /ve /d "Open Neovim here" /f >nul
reg add "HKEY_CLASSES_ROOT\Directory\Background\shell\Neovide" /v "Icon" /d "!NVIM_ICON_PATH!" /f >nul
reg add "HKEY_CLASSES_ROOT\Directory\Background\shell\Neovide\command" /ve /d "\"!NEOVIDE_PATH!\" \"%%V\"" /f >nul

if %errorLevel% equ 0 (
    echo ✓ Directory background context menu added successfully
) else (
    echo ✗ Failed to add directory background context menu
)

echo.
echo ========================================
echo   Context Menu Setup Complete!
echo ========================================
echo.
echo Neovide path: !NEOVIDE_PATH!
echo Icon source: !NVIM_ICON_PATH!
echo.
pause
