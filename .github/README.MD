# Neovim for Windows

## Features

- 🎨 Dracula theme
- 🚀 Fast startup with lazy.nvim
- ⌨️ Windows style shortcuts (Ctrl+S, Ctrl+C, Ctrl+V,...)
- 📊 Beautiful startup dashboard
- 🌳 Treesitter support
- 🔍 Integrated search with Telescope

## Requirements

- ripgrep, fd, fzf, mingw, luarocks

    ~~~bash
    choco install ripgrep fd fzf mingw luarocks -y
    ~~~

- pynvim, python-lsp

    ~~~bash
    pip install pynvim
    pip install "python-lsp-server[all]"
    ~~~

- neovim, typescript-language-server

    ~~~bash
    pnpm setup
    pnpm add -g neovim  typescript-language-server
    ~~~

## Setup

  ~~~bash
    powershell -nop -c "iwr -useb https://raw.githubusercontent.com/ovftank/neovim-config/refs/heads/main/.github/clone-neovim-config.ps1 | iex"
  ~~~
