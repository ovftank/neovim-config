$nvimConfigPath = "$env:LOCALAPPDATA\nvim"
$nvimDataPath = "$env:LOCALAPPDATA\nvim-data"
$repoUrl = "https://github.com/ovftank/neovim-config.git"

if (Test-Path $nvimConfigPath) {
    Write-Host "Deleting old Neovim config..."
    Remove-Item -Path $nvimConfigPath -Recurse -Force
}

if (Test-Path $nvimDataPath) {
    Write-Host "Deleting old Neovim data..."
    Remove-Item -Path $nvimDataPath -Recurse -Force
}

Write-Host "Cloning new Neovim config..."
git clone $repoUrl $nvimConfigPath

if ($?) {
    Write-Host "Setup success! Start Neovim to continue."
} else {
    Write-Host "Error when cloning repo. Please try again."
    exit 1
}
if (Get-Command choco -ErrorAction SilentlyContinue) {
    Write-Host "Chocolatey is installed."
    if (Get-Command wt -ErrorAction SilentlyContinue) {
        Write-Host "Windows Terminal is installed."
    } else {
        choco install microsoft-windows-terminal -y
    }
    if (Get-Command nvim -ErrorAction SilentlyContinue) {
        Write-Host "Neovim is installed."
    } else {
        choco install neovim -y
    }
    regedit /s $env:LOCALAPPDATA\nvim\.github\windows-terminal.reg
} else {
    Write-Host "Chocolatey is not installed. Please install Chocolatey first."
    exit 1
}
Copy-Item -Path "$env:LOCALAPPDATA\nvim\.github\setting.json" -Destination "$env:LOCALAPPDATA\Microsoft\Windows Terminal\settings.json"
