Remove-Item "$env:USERPROFILE\AppData\Local\nvim" -Recurse -Force -ErrorAction SilentlyContinue
Remove-Item "$env:USERPROFILE\AppData\Local\nvim-data" -Recurse -Force -ErrorAction SilentlyContinue


git clone https://github.com/LazyVim/starter "$env:USERPROFILE\AppData\Local\nvim"

Remove-Item "$env:USERPROFILE\AppData\Local\nvim\.git" -Recurse -Force