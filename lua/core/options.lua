local function setup_options()
    local opt = vim.opt

    opt.guifont = "JetBrainsMono NF:h10"

    opt.encoding = "utf-8"
    opt.fileencoding = "utf-8"


    opt.number = true
    opt.relativenumber = true
    opt.termguicolors = true
    opt.signcolumn = "yes"
    opt.cursorline = true
    opt.showmatch = true
    opt.scrolloff = 8
    opt.syntax = "on"


    opt.expandtab = true
    opt.shiftwidth = 4
    opt.tabstop = 4
    opt.smartindent = true
    opt.wrap = false


    opt.hlsearch = true
    opt.ignorecase = true
    opt.smartcase = true


    opt.hidden = true
    opt.errorbells = false
    opt.swapfile = false
    opt.backup = false
    opt.undofile = true
    opt.undodir = vim.fn.stdpath("data") .. "/undodir"
    opt.clipboard = "unnamedplus"
    opt.mouse = "a"
    opt.splitright = true
    opt.splitbelow = true


    opt.updatetime = 300
    opt.timeoutlen = 500


    opt.completeopt = "menuone,noselect"


    if vim.fn.has('win32') == 1 then
        opt.shell = 'cmd.exe'
        opt.shellcmdflag = '/c'
        opt.shellquote = ''
        opt.shellxquote = ''
    end
    opt.termguicolors = true
end


vim.api.nvim_create_autocmd("VimEnter", {
    callback = function()
        setup_options()
    end,
})


vim.opt.modifiable = true
vim.opt.encoding = "utf-8"
vim.opt.fileencoding = "utf-8"
