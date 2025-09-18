---@diagnostic disable-next-line: duplicate-set-field
vim.deprecate = function() end

vim.opt.autoindent = true
vim.opt.breakindent = true
vim.opt.expandtab = true
vim.opt.formatoptions = "jqnt"
vim.opt.gdefault = true
vim.opt.linebreak = true
vim.opt.shiftwidth = 4
vim.opt.smartindent = true
vim.opt.softtabstop = 4
vim.opt.tabstop = 4
vim.opt.textwidth = 999
vim.opt.wrap = false

vim.opt.cmdheight = 1
vim.opt.colorcolumn = ""
vim.opt.cursorcolumn = false
vim.opt.cursorline = true
vim.opt.laststatus = 3
vim.opt.winbar = ""
vim.opt.showtabline = 0
vim.opt.lazyredraw = true
vim.opt.number = true
vim.opt.relativenumber = false
vim.opt.ruler = true
vim.opt.scrolloff = 8
vim.opt.showbreak = "↪ "
vim.opt.showcmd = true
vim.opt.showmode = false
vim.opt.signcolumn = "yes"
vim.opt.termguicolors = true
vim.opt.conceallevel = 0

vim.opt.foldcolumn = "auto:9"
vim.opt.fillchars = vim.opt.fillchars
    + {
        foldclose = "▶",
        foldopen = "▼",
        foldsep = " ",
    }
vim.opt.foldenable = true
vim.opt.foldexpr = "v:lua.vim.treesitter.foldexpr()"
vim.opt.foldlevel = 99
vim.opt.foldlevelstart = 99
vim.opt.foldmethod = "expr"
vim.opt.foldnestmax = 20
vim.opt.foldtext = "v:lua.vim.treesitter.foldtext()"

vim.opt.hlsearch = false
vim.opt.ignorecase = true
vim.opt.incsearch = true
vim.opt.smartcase = true
vim.opt.wrapscan = true

vim.opt.mouse = "a"
vim.opt.mousefocus = false
vim.opt.mousehide = true
vim.opt.mousemodel = "extend"
vim.opt.mousemoveevent = true
vim.opt.mousescroll = "ver:3,hor:6"
vim.opt.mousetime = 500

vim.opt.completeopt = "menu,menuone,noselect,noinsert"
vim.opt.pumheight = 10
vim.opt.pumwidth = 50

vim.opt.autoread = true
vim.opt.backup = false
vim.opt.confirm = false
vim.opt.exrc = true
vim.opt.hidden = true
vim.opt.secure = true
vim.opt.splitright = true
vim.opt.splitbelow = true
vim.opt.swapfile = false
vim.opt.writebackup = false

vim.opt.wildignore = {
    "*.o",
    "*.a",
    "*.so",
    "*.dll",
    "*.dylib",
    "*.exe",
    "*.out",
    "*.app",
    "__pycache__",
    "*.pyc",
    "*.pyo",
    "*.pyd",
    ".Python",
    "env",
    "venv",
    ".venv",
    "ENV",
    "env.bak",
    "venv.bak",
    ".pytest_cache",
    ".coverage",
    "htmlcov",
    ".tox",
    ".eggs",
    "*.egg",
    "node_modules",
    "npm-debug.log*",
    "yarn-debug.log*",
    "yarn-error.log*",
    ".nyc_output",
    ".next",
    ".nuxt",
    ".cache",
    "dist",
    "build",
    ".parcel-cache",
    ".eslintcache",
    ".stylelintcache",
}
vim.opt.wildmenu = true
vim.opt.wildmode = "longest:full,full"

vim.opt.list = true
vim.opt.listchars = {
    tab = "→ ",
    space = "·",
    trail = "·",
    extends = ">",
    precedes = "<",
}

vim.opt.clipboard = "unnamedplus"
vim.opt.selection = "inclusive"
vim.opt.selectmode = "key"

vim.opt.modeline = true
vim.opt.modelines = 5
vim.opt.sessionoptions = "blank,buffers,curdir,folds,help,tabpages,winsize,winpos,terminal"

vim.opt.diffopt = "internal,filler,closeoff,context:3"

vim.opt.timeoutlen = 500
vim.opt.ttimeoutlen = 50
vim.opt.updatetime = 100

vim.lsp.inlay_hint.enable(true, nil)
