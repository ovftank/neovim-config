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
    Write-Host "Cai dat thanh cong! Khoi dong Neovim de tiep tuc."
} else {
    Write-Host "Loi khi clone repo. Vui long thu lai."
    exit 1
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

if (!(Get-Command wt -ErrorAction SilentlyContinue)) {
    Write-Host "Dang cai dat Windows Terminal..."
    scoop install windows-terminal
    scoop install extras/vcredist2022

    Write-Host "Dang them Windows Terminal vao context menu..."
    reg import "$env:USERPROFILE\scoop\apps\windows-terminal\current\install-context.reg"
}

if (!(Get-Command nvim -ErrorAction SilentlyContinue)) {
    Write-Host "Dang cai dat Neovim..."
    scoop install neovim
}

Write-Host "Dang cap nhat cai dat Windows Terminal..."
regedit /s $env:LOCALAPPDATA\nvim\.github\windows-terminal.reg
Copy-Item -Path "$env:LOCALAPPDATA\nvim\.github\setting.json" -Destination "$env:LOCALAPPDATA\Microsoft\Windows Terminal\settings.json"

Write-Host "Cai dat hoan tat!"
