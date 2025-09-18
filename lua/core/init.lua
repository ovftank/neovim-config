require("core.autocmds")
require("core.bootstrap")
require("core.diagnostics")
require("core.options")
if vim.g.neovide then
    require("core.neovide")
end
