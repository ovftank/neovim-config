local ls = require("luasnip")
local s = ls.snippet
local t = ls.text_node
local i = ls.insert_node

return {
    s("tw:cdn", {
        t('<script src="https://cdn.jsdelivr.net/npm/@tailwindcss/browser@4"></script>'),
        i(0),
    }),

    s("fa:cdn", {
        t('<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.7.2/css/all.min.css">'),
        i(0),
    }),

    s("img", {
        t('<img src="'),
        i(1, ""),
        t('" alt="" class="max-w-full h-auto" loading="lazy">'),
        i(0),
    }),

    s("meta:nozoom", {
        t(
            '<meta name="viewport" content="width=device-width, initial-scale=1.0, maximum-scale=1.0, minimum-scale=1.0, user-scalable=no, shrink-to-fit=no">'),
        i(0),
    }),
}
