Set-ExecutionPolicy -ExecutionPolicy RemoteSigned -Scope CurrentUser -Force

$nvimConfigPath = "$env:LOCALAPPDATA\nvim"
$nvimDataPath = "$env:LOCALAPPDATA\nvim-data"
$repoUrl = "https://github.com/ovftank/neovim-config.git"

if (Test-Path $nvimConfigPath) {
    Write-Host "Dang xoa cau hinh Neovim cu..."
    Remove-Item -Path $nvimConfigPath -Recurse -Force
}

if (Test-Path $nvimDataPath) {
    Write-Host "Dang xoa du lieu Neovim cu..."
    Remove-Item -Path $nvimDataPath -Recurse -Force
}

Write-Host "Dang clone cau hinh Neovim moi..."
git clone $repoUrl $nvimConfigPath

if ($?) {
    Write-Host "Clone cau hinh thanh cong!"
} else {
    Write-Host "Loi khi clone repo. Vui long thu lai."
    exit 1
}

Write-Host "Dang clone lazy.nvim plugin manager..."
$lazyPath = "$nvimDataPath\lazy\lazy.nvim"
if (Test-Path $lazyPath) {
    Write-Host "Dang xoa lazy.nvim cu..."
    Remove-Item -Path $lazyPath -Recurse -Force
}

New-Item -ItemType Directory -Path "$nvimDataPath\lazy" -Force | Out-Null
git clone --filter=blob:none --branch=stable https://github.com/folke/lazy.nvim.git $lazyPath

if ($?) {
    Write-Host "Clone lazy.nvim thanh cong!"
} else {
    Write-Host "Loi khi clone lazy.nvim. Plugin manager se tu dong tai khi khoi dong Neovim."
}

if (!(Get-Command scoop -ErrorAction SilentlyContinue)) {
    Write-Host "Dang cai dat Scoop..."
    try {
        Invoke-Expression "& {$(Invoke-RestMethod get.scoop.sh)} -RunAsAdmin"
        Start-Sleep -Seconds 5
        $env:Path = [System.Environment]::GetEnvironmentVariable("Path","Machine") + ";" + [System.Environment]::GetEnvironmentVariable("Path","User")
    } catch {
        Write-Host "Loi khi cai dat Scoop: $_"
        exit 1
    }
}

Write-Host "Dang them Scoop buckets..."
scoop bucket add extras
scoop bucket add nerd-fonts

Write-Host "Dang cai dat JetBrains Mono Nerd Font..."
scoop install nerd-fonts/JetBrainsMono-NF-Mono
if (!(Get-Command nvim -ErrorAction SilentlyContinue)) {
    Write-Host "Dang cai dat Neovim..."
    scoop install neovim
}
if (!(Get-Command wt -ErrorAction SilentlyContinue)) {
    Write-Host "Dang cai dat Neovide..."
    scoop install neovide
}


Write-Host "Dang them Neovide vao context menu..."
$batFilePath = Join-Path $nvimConfigPath "add-neovide-context.bat"
if (Test-Path $batFilePath) {
    try {
        Start-Process -FilePath $batFilePath -Verb RunAs -Wait
        Write-Host "Da them Neovide vao context menu thanh cong!"
    } catch {
        Write-Host "Khong the chay file bat. Vui long chay thu cong voi quyen Administrator: $batFilePath"
    }
} else {
    Write-Host "Khong tim thay file add-neovide-context.bat"
}

Write-Host "Cai dat hoan tat! Khoi dong Neovim de tiep tuc."
