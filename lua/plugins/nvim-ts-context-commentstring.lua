return {
    "JoosepAlviste/nvim-ts-context-commentstring",
    init = function()
        local original_get_option = vim.filetype.get_option
        ---@diagnostic disable-next-line: duplicate-set-field
        vim.filetype.get_option = function(filetype, option)
            if option == "commentstring" then
                return require("ts_context_commentstring.internal").calculate_commentstring()
                    or original_get_option(filetype, option)
            end
            return original_get_option(filetype, option)
        end
    end,
}
