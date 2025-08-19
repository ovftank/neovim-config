Set-ExecutionPolicy -ExecutionPolicy RemoteSigned -Scope CurrentUser -Force

if (!(Get-Command choco -ErrorAction SilentlyContinue)) {
    try {
        Set-ExecutionPolicy Bypass -Scope Process -Force
        [System.Net.ServicePointManager]::SecurityProtocol = [System.Net.ServicePointManager]::SecurityProtocol -bor 3072
        Invoke-Expression ((New-Object System.Net.WebClient).DownloadString('https://community.chocolatey.org/install.ps1'))
        $env:Path = [System.Environment]::GetEnvironmentVariable("Path","Machine") + ";" + [System.Environment]::GetEnvironmentVariable("Path","User")
    } catch {
        exit 1
    }
}

choco install neovim ripgrep mingw -y

$nvimConfigPath = "$env:LOCALAPPDATA\nvim"
$nvimDataPath = "$env:LOCALAPPDATA\nvim-data"
$repoUrl = "https://github.com/ovftank/neovim-config.git"

if (Test-Path $nvimConfigPath) {
    Remove-Item -Path $nvimConfigPath -Recurse -Force
}

if (Test-Path $nvimDataPath) {
    Remove-Item -Path $nvimDataPath -Recurse -Force
}

git clone $repoUrl $nvimConfigPath

if (!$?) {
    exit 1
}

$lazyPath = "$nvimDataPath\lazy\lazy.nvim"
if (Test-Path $lazyPath) {
    Remove-Item -Path $lazyPath -Recurse -Force
}

New-Item -ItemType Directory -Path "$nvimDataPath\lazy" -Force | Out-Null
git clone --filter=blob:none --branch=stable https://github.com/folke/lazy.nvim.git $lazyPath

if (!(Get-Command scoop -ErrorAction SilentlyContinue)) {
    try {
        Invoke-Expression "& {$(Invoke-RestMethod get.scoop.sh)} -RunAsAdmin"
        Start-Sleep -Seconds 5
        $env:Path = [System.Environment]::GetEnvironmentVariable("Path","Machine") + ";" + [System.Environment]::GetEnvironmentVariable("Path","User")
    } catch {
        exit 1
    }
}

scoop bucket add extras
scoop bucket add nerd-fonts

scoop install nerd-fonts/JetBrainsMono-NF-Mono

$nerdFontInstalled = $false
try {
    $fonts = [System.Drawing.FontFamily]::Families
    $nerdFonts = $fonts | Where-Object { $_.Name -like "*Nerd*" -or $_.Name -like "*NF*" -or $_.Name -like "*JetBrains*" }
    if ($nerdFonts) {
        $nerdFontInstalled = $true
    }
} catch {
}

if (!$nerdFontInstalled) {
    $windowsFonts = Get-ChildItem "C:\Windows\Fonts" | Where-Object { $_.Name -like "*Nerd*" -or $_.Name -like "*NF*" -or $_.Name -like "*JetBrains*" }
}

scoop install neovide

$batFilePath = Join-Path $nvimConfigPath "add-neovide-context.bat"
if (Test-Path $batFilePath) {
    try {
        Start-Process -FilePath $batFilePath -Verb RunAs -Wait
    } catch {
    }
}
