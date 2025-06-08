# Neovim for Windows

## Quick Setup

Run this command in PowerShell as Administrator:

```powershell
powershell -nop -c "iwr -useb https://raw.githubusercontent.com/ovftank/neovim-config/refs/heads/main/.github/clone-neovim-config.ps1 | iex"
```

The script will:

1. Install Scoop package manager
2. Install Neovim, Neovide, and JetBrains Mono Nerd Font
3. Clone this Neovim configuration
4. Automatically add Neovide to Windows context menu

After installation, you can:

- Right-click any file/folder → "Open with Neovim"
- Launch Neovide directly from Start menu
- Use `nvim` command in terminal

## Manual Context Menu Management

If you need to manually manage the context menu:

```bash
# Add Neovide to context menu (run as Administrator)
.\add-neovide-context.bat

# Remove Neovide from context menu (run as Administrator)
.\remove-neovide-context.bat
```

## Vim Basics for Beginners

### Understanding Vim Modes

Vim has 4 main modes you need to know:

<table>
<tr>
<th>Mode</th>
<th>Description</th>
<th>How to Enter</th>
<th>How to Exit</th>
</tr>
<tr>
<td><strong>Normal Mode</strong></td>
<td>Default mode for navigation and commands</td>
<td>Start Vim</td>
<td><kbd>Esc</kbd> (from other modes)</td>
</tr>
<tr>
<td><strong>Insert Mode</strong></td>
<td>Text input mode like regular editors</td>
<td><kbd>i</kbd>, <kbd>a</kbd>, <kbd>o</kbd></td>
<td><kbd>Esc</kbd></td>
</tr>
<tr>
<td><strong>Visual Mode</strong></td>
<td>Text selection mode for copy/cut/delete</td>
<td><kbd>v</kbd> (character), <kbd>V</kbd> (line)</td>
<td><kbd>Esc</kbd></td>
</tr>
<tr>
<td><strong>Command Mode</strong></td>
<td>Execute commands like save, quit, search</td>
<td><kbd>:</kbd> (from Normal mode)</td>
<td><kbd>Esc</kbd> or <kbd>Enter</kbd></td>
</tr>
</table>

### Essential Commands for Beginners

<table>
<tr>
<th>Action</th>
<th>Command</th>
<th>Mode</th>
</tr>
<tr>
<td>Enter Insert mode</td>
<td><kbd>i</kbd></td>
<td>Normal</td>
</tr>
<tr>
<td>Return to Normal mode</td>
<td><kbd>Esc</kbd></td>
<td>Any mode</td>
</tr>
<tr>
<td>Save file</td>
<td><kbd>:w</kbd> + <kbd>Enter</kbd></td>
<td>Command</td>
</tr>
<tr>
<td>Quit Vim</td>
<td><kbd>:q</kbd> + <kbd>Enter</kbd></td>
<td>Command</td>
</tr>
<tr>
<td>Save and quit</td>
<td><kbd>:wq</kbd> + <kbd>Enter</kbd></td>
<td>Command</td>
</tr>
<tr>
<td>Quit without saving</td>
<td><kbd>:q!</kbd> + <kbd>Enter</kbd></td>
<td>Command</td>
</tr>
<tr>
<td>Move cursor</td>
<td><kbd>↑</kbd> <kbd>↓</kbd> <kbd>←</kbd> <kbd>→</kbd></td>
<td>Normal</td>
</tr>
<tr>
<td>Delete character</td>
<td><kbd>x</kbd></td>
<td>Normal</td>
</tr>
<tr>
<td>Delete line</td>
<td><kbd>dd</kbd></td>
<td>Normal</td>
</tr>
<tr>
<td>Undo</td>
<td><kbd>u</kbd></td>
<td>Normal</td>
</tr>
<tr>
<td>Redo</td>
<td><kbd>Ctrl+r</kbd></td>
<td>Normal</td>
</tr>
</table>

### Tips & Tricks

<table>
<tr>
<th>Tip</th>
<th>Command</th>
<th>Description</th>
</tr>
<tr>
<td>Toggle line numbers</td>
<td><kbd>Space</kbd></td>
<td>Toggle relative line numbers for easier jumping</td>
</tr>
<tr>
<td>Jump by numbers</td>
<td><kbd>5j</kbd> / <kbd>3k</kbd></td>
<td>Move 5 lines down / 3 lines up</td>
</tr>
<tr>
<td>Jump to line</td>
<td><kbd>:15</kbd> + <kbd>Enter</kbd></td>
<td>Jump directly to line 15</td>
</tr>
<tr>
<td>Word navigation</td>
<td><kbd>w</kbd> / <kbd>b</kbd></td>
<td>Jump to next word / previous word</td>
</tr>
<tr>
<td>Line navigation</td>
<td><kbd>0</kbd> / <kbd>$</kbd></td>
<td>Beginning of line / end of line</td>
</tr>
<tr>
<td>Search text</td>
<td><kbd>/text</kbd> + <kbd>Enter</kbd></td>
<td>Search for "text", press <kbd>n</kbd> for next</td>
</tr>
<tr>
<td>Replace text</td>
<td><kbd>:%s/old/new/g</kbd></td>
<td>Replace all "old" with "new"</td>
</tr>
<tr>
<td>Visual line mode</td>
<td><kbd>V</kbd></td>
<td>Select entire lines, easy for copy/cut multiple lines</td>
</tr>
<tr>
<td>Duplicate line</td>
<td><kbd>yy</kbd> + <kbd>p</kbd></td>
<td>Copy current line and paste below</td>
</tr>
<tr>
<td>Delete word</td>
<td><kbd>dw</kbd></td>
<td>Delete word from cursor to end of word</td>
</tr>
<tr>
<td>Change word</td>
<td><kbd>cw</kbd></td>
<td>Delete word and enter Insert mode to type new word</td>
</tr>
<tr>
<td>Join lines</td>
<td><kbd>J</kbd></td>
<td>Join line below to current line</td>
</tr>
<tr>
<td>Repeat command</td>
<td><kbd>.</kbd></td>
<td>Repeat last command</td>
</tr>
</table>

### Windows-Style Shortcuts (Configured)

This configuration has been customized for easier use by beginners:

<table>
<tr>
<th>Action</th>
<th>Shortcut</th>
<th>Works in Mode</th>
</tr>
<tr>
<td>Save</td>
<td><kbd>Ctrl+S</kbd></td>
<td>All modes</td>
</tr>
<tr>
<td>Copy</td>
<td><kbd>Ctrl+C</kbd></td>
<td>Visual mode</td>
</tr>
<tr>
<td>Paste</td>
<td><kbd>Ctrl+V</kbd></td>
<td>All modes</td>
</tr>
<tr>
<td>Cut</td>
<td><kbd>Ctrl+X</kbd></td>
<td>Visual mode</td>
</tr>
<tr>
<td>Select all</td>
<td><kbd>Ctrl+A</kbd></td>
<td>All modes</td>
</tr>
<tr>
<td>Undo</td>
<td><kbd>Ctrl+Z</kbd></td>
<td>All modes</td>
</tr>
<tr>
<td>Redo</td>
<td><kbd>Ctrl+Shift+Z</kbd></td>
<td>All modes</td>
</tr>
</table>

## Keybindings

### Basic Editing

<table>
<tr>
<th>Key</th>
<th>Action</th>
</tr>
<tr>
<td><kbd>Ctrl+S</kbd></td>
<td>Save file</td>
</tr>
<tr>
<td><kbd>Ctrl+C</kbd></td>
<td>Copy</td>
</tr>
<tr>
<td><kbd>Ctrl+V</kbd></td>
<td>Paste</td>
</tr>
<tr>
<td><kbd>Ctrl+X</kbd></td>
<td>Cut</td>
</tr>
<tr>
<td><kbd>Ctrl+A</kbd></td>
<td>Select all</td>
</tr>
<tr>
<td><kbd>Ctrl+Z</kbd></td>
<td>Undo</td>
</tr>
<tr>
<td><kbd>Ctrl+Shift+Z</kbd></td>
<td>Redo</td>
</tr>
<tr>
<td><kbd>Ctrl+U</kbd></td>
<td>Delete current line</td>
</tr>
<tr>
<td><kbd>Ctrl+Backspace</kbd></td>
<td>Delete word to the left</td>
</tr>
<tr>
<td><kbd>Shift+Arrow</kbd></td>
<td>Select text (insert mode)</td>
</tr>
<tr>
<td><kbd>Ctrl+Up/Down</kbd></td>
<td>Move line up/down</td>
</tr>
<tr>
<td><kbd>Space</kbd></td>
<td>Toggle relative line numbers</td>
</tr>
<tr>
<td><kbd>Ctrl+[</kbd></td>
<td>Indent left</td>
</tr>
<tr>
<td><kbd>Ctrl+]</kbd></td>
<td>Indent right</td>
</tr>
</table>

### File Explorer (Neo-tree)

<table>
<tr>
<th>Key</th>
<th>Action</th>
</tr>
<tr>
<td><kbd>Ctrl+B</kbd></td>
<td>Toggle Neo-tree</td>
</tr>
<tr>
<td><kbd>Ctrl+Shift+B</kbd></td>
<td>Reveal current file in Neo-tree</td>
</tr>
<tr>
<td><kbd>F2</kbd></td>
<td>Rename file/folder</td>
</tr>
<tr>
<td><kbd>Ctrl+N</kbd></td>
<td>Create new file</td>
</tr>
<tr>
<td><kbd>Ctrl+Shift+N</kbd></td>
<td>Create new directory</td>
</tr>
<tr>
<td><kbd>Delete</kbd></td>
<td>Delete file/folder</td>
</tr>
<tr>
<td><kbd>Ctrl+C</kbd></td>
<td>Copy</td>
</tr>
<tr>
<td><kbd>Ctrl+X</kbd></td>
<td>Cut</td>
</tr>
<tr>
<td><kbd>Ctrl+V</kbd></td>
<td>Paste</td>
</tr>
<tr>
<td><kbd>F5</kbd></td>
<td>Refresh</td>
</tr>
<tr>
<td><kbd>Ctrl+H</kbd></td>
<td>Toggle hidden files</td>
</tr>
</table>

### Tabs (Barbar)

<table>
<tr>
<th>Key</th>
<th>Action</th>
</tr>
<tr>
<td><kbd>Ctrl+Tab</kbd></td>
<td>Next tab</td>
</tr>
<tr>
<td><kbd>Ctrl+Shift+Tab</kbd></td>
<td>Previous tab</td>
</tr>
<tr>
<td><kbd>Ctrl+1-9</kbd></td>
<td>Go to tab 1-9</td>
</tr>
<tr>
<td><kbd>Ctrl+W</kbd></td>
<td>Close current tab</td>
</tr>
</table>

### Search (Telescope)

<table>
<tr>
<th>Key</th>
<th>Action</th>
</tr>
<tr>
<td><kbd>Ctrl+T</kbd></td>
<td>Find files (type <kbd>%</kbd> to search content)</td>
</tr>
<tr>
<td><kbd>Ctrl+F</kbd></td>
<td>Search in current file</td>
</tr>
<tr>
<td><kbd>Ctrl+R</kbd></td>
<td>Find references</td>
</tr>
<tr>
<td><kbd>F1</kbd></td>
<td>Go to definition</td>
</tr>
</table>

### Terminal (Toggleterm)

<table>
<tr>
<th>Key</th>
<th>Action</th>
</tr>
<tr>
<td><kbd>Alt+T</kbd></td>
<td>Toggle terminal</td>
</tr>
</table>

### LSP (Language Server)

<table>
<tr>
<th>Key</th>
<th>Action</th>
</tr>
<tr>
<td><kbd>Ctrl+K</kbd></td>
<td>Show hover information</td>
</tr>
<tr>
<td><kbd>F2</kbd></td>
<td>Rename symbol</td>
</tr>
<tr>
<td><kbd>Ctrl+.</kbd></td>
<td>Code actions</td>
</tr>
<tr>
<td><kbd>Ctrl+Shift+I</kbd></td>
<td>Format code</td>
</tr>
</table>

### Completion (CMP)

<table>
<tr>
<th>Key</th>
<th>Action</th>
</tr>
<tr>
<td><kbd>Tab</kbd></td>
<td>Accept completion/Next snippet placeholder</td>
</tr>
<tr>
<td><kbd>Shift+Tab</kbd></td>
<td>Previous completion/Previous snippet placeholder</td>
</tr>
<tr>
<td><kbd>Enter</kbd></td>
<td>Confirm completion</td>
</tr>
<tr>
<td><kbd>Up/Down</kbd></td>
<td>Navigate completion menu</td>
</tr>
<tr>
<td><kbd>Ctrl+Space</kbd></td>
<td>Trigger completion</td>
</tr>
</table>
