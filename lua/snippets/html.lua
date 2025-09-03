local ls = require("luasnip")
local s = ls.snippet
local t = ls.text_node

return {
    s("tw:cdn", {
        t('<script src="https://cdn.jsdelivr.net/npm/@tailwindcss/browser@4"></script>'),
    }),
    s("fa:cdn", {
        t(
            '<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.7.2/css/all.min.css" />'
        ),
    }),
}
