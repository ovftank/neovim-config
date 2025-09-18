# Neovim for Windows

<a href="https://dotfyle.com/ovftank/neovim-config"><img src="https://dotfyle.com/ovftank/neovim-config/badges/plugins?style=flat" /></a>
<a href="https://chatgpt.com/?hints=search&q=read+https%3A%2F%2Fraw.githubusercontent.com%2Fovftank%2Fneovim-config%2Frefs%2Fheads%2Fmain%2F.github%2FREADME.MD%2C+i+want+to+ask+questions+about+it."><img src="https://img.shields.io/badge/ChatGPT-Ask%20Questions-blue?style=flat&logo=openai" /></a>
<a href="https://deepwiki.com/ovftank/neovim-config"><img src="https://img.shields.io/badge/DeepWiki-ovftank%2Fneovim--config-blue.svg?logo=data:image/png;base64,iVBORw0KGgoAAAANSUhEUgAAACwAAAAyCAYAAAAnWDnqAAAAAXNSR0IArs4c6QAAA05JREFUaEPtmUtyEzEQhtWTQyQLHNak2AB7ZnyXZMEjXMGeK/AIi+QuHrMnbChYY7MIh8g01fJoopFb0uhhEqqcbWTp06/uv1saEDv4O3n3dV60RfP947Mm9/SQc0ICFQgzfc4CYZoTPAswgSJCCUJUnAAoRHOAUOcATwbmVLWdGoH//PB8mnKqScAhsD0kYP3j/Yt5LPQe2KvcXmGvRHcDnpxfL2zOYJ1mFwrryWTz0advv1Ut4CJgf5uhDuDj5eUcAUoahrdY/56ebRWeraTjMt/00Sh3UDtjgHtQNHwcRGOC98BJEAEymycmYcWwOprTgcB6VZ5JK5TAJ+fXGLBm3FDAmn6oPPjR4rKCAoJCal2eAiQp2x0vxTPB3ALO2CRkwmDy5WohzBDwSEFKRwPbknEggCPB/imwrycgxX2NzoMCHhPkDwqYMr9tRcP5qNrMZHkVnOjRMWwLCcr8ohBVb1OMjxLwGCvjTikrsBOiA6fNyCrm8V1rP93iVPpwaE+gO0SsWmPiXB+jikdf6SizrT5qKasx5j8ABbHpFTx+vFXp9EnYQmLx02h1QTTrl6eDqxLnGjporxl3NL3agEvXdT0WmEost648sQOYAeJS9Q7bfUVoMGnjo4AZdUMQku50McDcMWcBPvr0SzbTAFDfvJqwLzgxwATnCgnp4wDl6Aa+Ax283gghmj+vj7feE2KBBRMW3FzOpLOADl0Isb5587h/U4gGvkt5v60Z1VLG8BhYjbzRwyQZemwAd6cCR5/XFWLYZRIMpX39AR0tjaGGiGzLVyhse5C9RKC6ai42ppWPKiBagOvaYk8lO7DajerabOZP46Lby5wKjw1HCRx7p9sVMOWGzb/vA1hwiWc6jm3MvQDTogQkiqIhJV0nBQBTU+3okKCFDy9WwferkHjtxib7t3xIUQtHxnIwtx4mpg26/HfwVNVDb4oI9RHmx5WGelRVlrtiw43zboCLaxv46AZeB3IlTkwouebTr1y2NjSpHz68WNFjHvupy3q8TFn3Hos2IAk4Ju5dCo8B3wP7VPr/FGaKiG+T+v+TQqIrOqMTL1VdWV1DdmcbO8KXBz6esmYWYKPwDL5b5FA1a0hwapHiom0r/cKaoqr+27/XcrS5UwSMbQAAAABJRU5ErkJggg==" alt="DeepWiki"></a>

## what's included

- **autocomplete**: funcs, vars, snippets, tailwind
- **format**: eslint, prettier, black (python)
- **git**: hunks, blame, diff, commit info (like git lens)
- **search**: fuzzy find files & text
- **lsp**: go to def, rename, format
- **terminal**: built-in terminal
- **tabs**: tab interface
- **comments**: react, html, css, js, ts, python `{/* */}`, `//`, `/* */`, `<!-- -->` (builtin support)
- **type hints**: function params, return types, variable types (inlay hints)
- ....

## Setup

run this in powershell as admin:

```powershell
powershell -nop -c "iwr -useb https://raw.githubusercontent.com/ovftank/neovim-config/refs/heads/main/.github/install.ps1 | iex"
```

- right-click file/folder → "open w/ neovim"
- launch neovide from start menu
- use `nvim` in terminal

## vim basics for beginners

### vim modes

vim has 4 modes u need to know:

<table>
<tr>
<th>Mode</th>
<th>Description</th>
<th>How to Enter</th>
<th>How to Exit</th>
</tr>
<tr>
<td><strong>normal mode</strong></td>
<td>default mode for navigation & commands</td>
<td>start vim</td>
<td><kbd>esc</kbd> (from other modes)</td>
</tr>
<tr>
<td><strong>insert mode</strong></td>
<td>text input like regular editors</td>
<td><kbd>i</kbd>, <kbd>a</kbd>, <kbd>o</kbd></td>
<td><kbd>esc</kbd></td>
</tr>
<tr>
<td><strong>visual mode</strong></td>
<td>text selection for copy/cut/delete</td>
<td><kbd>v</kbd> (char), <kbd>V</kbd> (line)</td>
<td><kbd>esc</kbd></td>
</tr>
<tr>
<td><strong>command mode</strong></td>
<td>execute commands like save, quit, search</td>
<td><kbd>:</kbd> (from normal mode)</td>
<td><kbd>esc</kbd> or <kbd>enter</kbd></td>
</tr>
</table>

### essential commands

<table>
<tr>
<th>action</th>
<th>key</th>
<th>description</th>
</tr>
<tr>
<td>enter insert mode</td>
<td><kbd>i</kbd></td>
<td>start typing text</td>
</tr>
<tr>
<td>back to normal mode</td>
<td><kbd>esc</kbd></td>
<td>exit any mode back to nav</td>
</tr>
<tr>
<td>quit vim</td>
<td><kbd>shift+zq</kbd></td>
<td>exit vim quick (no unsaved changes)</td>
</tr>
<tr>
<td>save & quit</td>
<td><kbd>shift+zz</kbd></td>
<td>save file then exit vim quick</td>
</tr>
<tr>
<td>quit w/o saving</td>
<td><kbd>:q!</kbd> + <kbd>enter</kbd></td>
<td>force exit w/o saving changes</td>
</tr>
<tr>
<td>move cursor</td>
<td><kbd>↑</kbd> <kbd>↓</kbd> <kbd>←</kbd> <kbd>→</kbd></td>
<td>nav up/down/left/right</td>
</tr>
</table>

### tips & tricks

<table>
<tr>
<th>tip</th>
<th>key</th>
<th>description</th>
</tr>
<tr>
<td>toggle line nums</td>
<td><kbd>space</kbd></td>
<td>toggle relative line nums for easier jumping</td>
</tr>
<tr>
<td>move lines</td>
<td><kbd>ctrl+up/down</kbd></td>
<td>move current line or selection up/down</td>
</tr>
<tr>
<td>word nav</td>
<td><kbd>ctrl+left/right</kbd></td>
<td>jump to prev/next word</td>
</tr>
<tr>
<td>select text</td>
<td><kbd>shift+arrow</kbd></td>
<td>select text in any direction</td>
</tr>
<tr>
<td>select word</td>
<td><kbd>ctrl+shift+left/right</kbd></td>
<td>select word by word</td>
</tr>
<tr>
<td>select to line start/end</td>
<td><kbd>shift+home/end</kbd></td>
<td>select from cursor to beginning/end of line</td>
</tr>
<tr>
<td>next search result</td>
<td><kbd>n</kbd></td>
<td>jump to next search match (auto-centered)</td>
</tr>
<tr>
<td>prev search result</td>
<td><kbd>shift+n</kbd></td>
<td>jump to prev search match (auto-centered)</td>
</tr>

</table>

## keybinds

### basic editing

<table>
<tr>
<th>action</th>
<th>key</th>
<th>description</th>
</tr>
<tr>
<td><kbd>ctrl+s</kbd></td>
<td>save file</td>
<td>quick save in any mode</td>
</tr>
<tr>
<td><kbd>ctrl+c</kbd></td>
<td>copy</td>
<td>copy selected text to clipboard</td>
</tr>
<tr>
<td><kbd>ctrl+v</kbd></td>
<td>paste</td>
<td>paste from clipboard</td>
</tr>
<tr>
<td><kbd>ctrl+x</kbd></td>
<td>cut</td>
<td>cut selected text to clipboard</td>
</tr>
<tr>
<td><kbd>ctrl+a</kbd></td>
<td>select all</td>
<td>select entire file content</td>
</tr>
<tr>
<td><kbd>ctrl+z</kbd></td>
<td>undo</td>
<td>undo last change</td>
</tr>
<tr>
<td><kbd>ctrl+shift+z</kbd></td>
<td>redo</td>
<td>redo undone change</td>
</tr>
<tr>
<td><kbd>ctrl+u</kbd></td>
<td>delete current line</td>
<td>delete entire line quick</td>
</tr>
<tr>
<td><kbd>ctrl+backspace</kbd></td>
<td>delete word left</td>
<td>delete word backwards</td>
</tr>
<tr>
<td><kbd>shift+arrow</kbd></td>
<td>select text</td>
<td>select text in any direction</td>
</tr>
<tr>
<td><kbd>ctrl+up/down</kbd></td>
<td>move line up/down</td>
<td>move current line or selection</td>
</tr>
<tr>
<td><kbd>ctrl+left/right</kbd></td>
<td>word navigation</td>
<td>jump to prev/next word</td>
</tr>
<tr>
<td><kbd>space</kbd></td>
<td>toggle relative line nums</td>
<td>show/hide relative line nums</td>
</tr>
<tr>
<td><kbd>alt+z</kbd></td>
<td>toggle line wrap</td>
<td>wrap long lines on/off</td>
</tr>
<tr>
<td><kbd>ctrl+&lt;</kbd></td>
<td>indent left</td>
<td>decrease indentation</td>
</tr>
<tr>
<td><kbd>ctrl+&gt;</kbd></td>
<td>indent right</td>
<td>increase indentation</td>
</tr>
<tr>
<td><kbd>ctrl+/</kbd></td>
<td>toggle comment</td>
<td>comment/uncomment current line or selection</td>
</tr>
<tr>
<td><kbd>alt+e</kbd></td>
<td>inline edit</td>
<td>edit embedded code in separate buffer</td>
</tr>
<tr>
<td><kbd>alt+f</kbd></td>
<td>toggle fold</td>
<td>fold/unfold code at cursor</td>
</tr>
<tr>
<td><kbd>alt+shift+f</kbd></td>
<td>toggle fold recursively</td>
<td>fold/unfold code recursively</td>
</tr>
<tr>
<td><kbd>ctrl+l</kbd></td>
<td>toggle split/join arguments</td>
<td>split/join function args, object props, array elements</td>
</tr>
<tr>
<td><kbd>t</kbd></td>
<td>wrap with HTML tag</td>
<td>wrap selection with HTML tag (asks for tag name)</td>
</tr>
</table>

### smart selection

<table>
<tr>
<th>action</th>
<th>key</th>
<th>description</th>
</tr>
<tr>
<td>expand selection</td>
<td><kbd>alt+w</kbd></td>
<td>expand selection by syntax tree</td>
</tr>
<tr>
<td>shrink selection</td>
<td><kbd>alt+s</kbd></td>
<td>shrink selection by syntax tree</td>
</tr>
</table>

### file explorer

<table>
<tr>
<th>action</th>
<th>key</th>
<th>description</th>
</tr>
<tr>
<td>toggle file explorer</td>
<td><kbd>ctrl+b</kbd></td>
<td>open/close file explorer</td>
</tr>
<tr>
<td>rename file/folder</td>
<td><kbd>f2</kbd></td>
<td>rename selected file or folder</td>
</tr>
<tr>
<td>create new file</td>
<td><kbd>ctrl+n</kbd></td>
<td>create new file in current dir</td>
</tr>
<tr>
<td>create new dir</td>
<td><kbd>ctrl+shift+n</kbd></td>
<td>create new folder in current dir</td>
</tr>
<tr>
<td>delete file/folder</td>
<td><kbd>delete</kbd></td>
<td>delete selected file or folder</td>
</tr>
<tr>
<td>copy</td>
<td><kbd>ctrl+c</kbd></td>
<td>copy selected file or folder</td>
</tr>
<tr>
<td>cut</td>
<td><kbd>ctrl+x</kbd></td>
<td>cut selected file or folder</td>
</tr>
<tr>
<td>paste</td>
<td><kbd>ctrl+v</kbd></td>
<td>paste copied/cut file or folder</td>
</tr>
<tr>
<td>refresh</td>
<td><kbd>ctrl+r</kbd></td>
<td>refresh file explorer view</td>
</tr>
<tr>
<td>toggle hidden files</td>
<td><kbd>ctrl+h</kbd></td>
<td>show/hide hidden files & folders</td>
</tr>
</table>

### buffer management

<table>
<tr>
<th>action</th>
<th>key</th>
<th>description</th>
</tr>
<tr>
<td>next buffer</td>
<td><kbd>ctrl+tab</kbd></td>
<td>switch to next open buffer</td>
</tr>
<tr>
<td>prev buffer</td>
<td><kbd>ctrl+shift+tab</kbd></td>
<td>switch to prev open buffer</td>
</tr>
<tr>
<td>go to buffer 1-9</td>
<td><kbd>ctrl+1</kbd> to <kbd>ctrl+9</kbd></td>
<td>jump directly to buffer by number</td>
</tr>
<tr>
<td>close buffer</td>
<td><kbd>ctrl+w</kbd></td>
<td>close current buffer or quit if last buffer</td>
</tr>
</table>

### search

<table>
<tr>
<th>action</th>
<th>key</th>
<th>description</th>
</tr>
<tr>
<td>find files</td>
<td><kbd>ctrl+t</kbd></td>
<td>quick file finder (type % for content search, @ for symbols, > for commands)</td>
</tr>
<tr>
<td>open in vertical split</td>
<td><kbd>right arrow</kbd></td>
<td>open selected file in vertical split (in telescope)</td>
</tr>
<tr>
<td>search in file</td>
<td><kbd>ctrl+f</kbd></td>
<td>fuzzy search in current file</td>
</tr>
<tr>
<td>live grep</td>
<td><kbd>ctrl+shift+f</kbd></td>
<td>search text across all files in workspace</td>
</tr>
<tr>
<td>show keymaps</td>
<td><kbd>f12</kbd></td>
<td>display all available keybinds</td>
</tr>
</table>

### terminal

<table>
<tr>
<th>action</th>
<th>key</th>
<th>description</th>
</tr>
<tr>
<td>toggle terminal</td>
<td><kbd>alt+t</kbd></td>
<td>open/close built-in terminal (close if focused, open if not)</td>
</tr>
</table>

### window management

<table>
<tr>
<th>action</th>
<th>key</th>
<th>description</th>
</tr>
<tr>
<td>focus left window</td>
<td><kbd>alt+h</kbd></td>
<td>switch focus to left window</td>
</tr>
<tr>
<td>focus right window</td>
<td><kbd>alt+l</kbd></td>
<td>switch focus to right window</td>
</tr>
<tr>
<td>resize window left</td>
<td><kbd>alt+left</kbd></td>
<td>resize current window to the left</td>
</tr>
<tr>
<td>resize window right</td>
<td><kbd>alt+right</kbd></td>
<td>resize current window to the right</td>
</tr>
<tr>
<td>resize window up</td>
<td><kbd>alt+up</kbd></td>
<td>resize current window up</td>
</tr>
<tr>
<td>resize window down</td>
<td><kbd>alt+down</kbd></td>
<td>resize current window down</td>
</tr>
</table>

### lsp

<table>
<tr>
<th>action</th>
<th>key</th>
<th>description</th>
</tr>
<tr>
<td>go to definition</td>
<td><kbd>f1</kbd></td>
<td>jump to symbol reference</td>
</tr>
<tr>
<td>rename symbol</td>
<td><kbd>f2</kbd></td>
<td>rename var/func/class at cursor</td>
</tr>
<tr>
<td>go to match tag</td>
<td><kbd>f3</kbd></td>
<td>go to current match tag</td>
</tr>
<tr>
<td>code actions</td>
<td><kbd>ctrl+.</kbd></td>
<td>show available code fixes & refactors</td>
</tr>
<tr>
<td>format code</td>
<td><kbd>ctrl+shift+i</kbd></td>
<td>auto-format current file</td>
</tr>
</table>

### error diagnostics

<table>
<tr>
<th>action</th>
<th>key</th>
<th>description</th>
</tr>
<tr>
<td>open problems panel</td>
<td><kbd>ctrl+g</kbd></td>
<td>show all errors & warnings in workspace</td>
</tr>
</table>

### completion

<table>
<tr>
<th>action</th>
<th>key</th>
<th>description</th>
</tr>
<tr>
<td>accept completion</td>
<td><kbd>tab</kbd></td>
<td>accept suggestion & jump to next snippet placeholder</td>
</tr>
<tr>
<td>prev placeholder</td>
<td><kbd>shift+tab</kbd></td>
<td>jump to prev snippet placeholder</td>
</tr>
<tr>
<td>confirm completion</td>
<td><kbd>enter</kbd></td>
<td>accept selected completion item</td>
</tr>
<tr>
<td>navigate menu</td>
<td><kbd>up/down</kbd></td>
<td>move up/down in completion menu</td>
</tr>
<tr>
<td>trigger completion</td>
<td><kbd>ctrl+space</kbd></td>
<td>manually show completion suggestions</td>
</tr>
</table>
