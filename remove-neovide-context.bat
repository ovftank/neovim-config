@echo off
setlocal enabledelayedexpansion

echo ========================================
echo   Removing Neovim from Context Menu
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

echo Removing context menu for files...
reg delete "HKEY_CLASSES_ROOT\*\shell\Neovide" /f >nul 2>&1
if %errorLevel% equ 0 (
    echo ✓ File context menu removed successfully
) else (
    echo ✓ File context menu was not present
)

echo Removing context menu for folders...
reg delete "HKEY_CLASSES_ROOT\Directory\shell\Neovide" /f >nul 2>&1
if %errorLevel% equ 0 (
    echo ✓ Folder context menu removed successfully
) else (
    echo ✓ Folder context menu was not present
)

echo Removing context menu for directory background...
reg delete "HKEY_CLASSES_ROOT\Directory\Background\shell\Neovide" /f >nul 2>&1
if %errorLevel% equ 0 (
    echo ✓ Directory background context menu removed successfully
) else (
    echo ✓ Directory background context menu was not present
)

echo.
echo ========================================
echo   Context Menu Removal Complete!
echo ========================================
echo.
echo Neovim has been removed from all context menus.
echo.
pause
