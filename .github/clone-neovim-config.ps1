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
