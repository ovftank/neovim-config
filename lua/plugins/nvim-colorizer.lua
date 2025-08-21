return {
    {
        "catgoose/nvim-colorizer.lua",
        event = "BufReadPre",
        opts = {
            filetypes = {
                "html",
                "css",
                "javascript",
                "javascriptreact",
                "typescript",
                "typescriptreact",
                "vue",
                "svelte",
            },
            user_default_options = {
                names = true,
                RGB = true,
                RRGGBB = true,
                RRGGBBAA = true,
                AARRGGBB = true,
                rgb_fn = true,
                hsl_fn = true,
                css = true,
                css_fn = true,
                tailwind = "both",
                tailwind_opts = {
                    update_names = true,
                },
                mode = "background",
                virtualtext = "■",
                virtualtext_inline = false,
                virtualtext_mode = "foreground",
                always_update = false,
                lazy_load = false,
            },
            buftypes = {
                "*",
                "!prompt",
                "!popup",
            },
        },
    },
}
