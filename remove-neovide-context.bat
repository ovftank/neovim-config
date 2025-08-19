@echo off
setlocal enabledelayedexpansion

net session >nul 2>&1
if %errorLevel% neq 0 (
    exit /b 1
)

reg delete "HKEY_CLASSES_ROOT\*\shell\Neovide" /f >nul 2>&1

reg delete "HKEY_CLASSES_ROOT\Directory\shell\Neovide" /f >nul 2>&1

reg delete "HKEY_CLASSES_ROOT\Directory\Background\shell\Neovide" /f >nul 2>&1
