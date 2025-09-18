@echo off
setlocal enabledelayedexpansion

net session >nul 2>&1
if %errorLevel% neq 0 (
    exit /b 1
)

where neovide >nul 2>&1
if %errorLevel% neq 0 (
    exit /b 1
)

for /f "tokens=*" %%i in ('where neovide') do (
    set "NEOVIDE_PATH=%%i"
)

set "NVIM_ICON_PATH="
where nvim >nul 2>&1
if %errorLevel% neq 0 (
    set "NVIM_ICON_PATH=!NEOVIDE_PATH!,0"
) else (
    for /f "tokens=*" %%i in ('where nvim') do (
        set "NVIM_ICON_PATH=%%i,0"
    )
)

reg add "HKEY_CLASSES_ROOT\*\shell\Neovide" /ve /d "Open with Neovim" /f >nul
reg add "HKEY_CLASSES_ROOT\*\shell\Neovide" /v "Icon" /d "!NVIM_ICON_PATH!" /f >nul
reg add "HKEY_CLASSES_ROOT\*\shell\Neovide\command" /ve /d "\"!NEOVIDE_PATH!\" \"%%1\"" /f >nul

reg add "HKEY_CLASSES_ROOT\Directory\shell\Neovide" /ve /d "Open with Neovim" /f >nul
reg add "HKEY_CLASSES_ROOT\Directory\shell\Neovide" /v "Icon" /d "!NVIM_ICON_PATH!" /f >nul
reg add "HKEY_CLASSES_ROOT\Directory\shell\Neovide\command" /ve /d "\"!NEOVIDE_PATH!\" \"%%1\"" /f >nul

reg add "HKEY_CLASSES_ROOT\Directory\Background\shell\Neovide" /ve /d "Open Neovim here" /f >nul
reg add "HKEY_CLASSES_ROOT\Directory\Background\shell\Neovide" /v "Icon" /d "!NVIM_ICON_PATH!" /f >nul
reg add "HKEY_CLASSES_ROOT\Directory\Background\shell\Neovide\command" /ve /d "\"!NEOVIDE_PATH!\" \"%%V\"" /f >nul
