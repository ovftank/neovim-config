local ls = require("luasnip")
local s = ls.snippet
local t = ls.text_node
local i = ls.insert_node

return {
  s("dom-load", {
    t("document.addEventListener('DOMContentLoaded', () => {"),
    t({ "", "\t" }),
    i(1, "body"),
    t({ "", "});" }),
  }),
}
