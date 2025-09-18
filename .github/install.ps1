$nvimPath = "$env:USERPROFILE\AppData\Local\nvim"
$nvimDataPath = "$env:USERPROFILE\AppData\Local\nvim-data"

@($nvimPath, $nvimDataPath) | ForEach-Object {
    if (Test-Path $_) {
        Write-Host "removing $_..." -ForegroundColor Yellow
        Remove-Item $_ -Recurse -Force -ErrorAction SilentlyContinue
    }
}

Write-Host "cloning neovim config..." -ForegroundColor Green
try {
    git clone --depth=1 --filter=blob:none https://github.com/ovftank/neovim-config.git $nvimPath
} catch {
    Write-Error "failed to clone neovim config: $_"
    exit 1
}

$batFilePath = "$nvimPath\.github\add-neovide-context.bat"
if (Test-Path $batFilePath) {
    Write-Host "setting up neovide context..." -ForegroundColor Cyan
    try {
        Start-Process -FilePath $batFilePath -Verb RunAs -Wait -ErrorAction Stop
    } catch {
        Write-Warning "failed to setup neovide context: $_"
    }
}

Write-Host "installation completed!" -ForegroundColor Green
