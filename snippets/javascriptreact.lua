local ls = require("luasnip")
local s = ls.snippet
local t = ls.text_node
local i = ls.insert_node
local f = ls.function_node

local function get_filename()
  local filename = vim.fn.expand("%:t:r")
  if filename == "" then
    return "Component"
  end
  return filename:gsub("^%l", string.upper)
end

return {
  s("rfc", {
    t("const "),
    f(get_filename, {}),
    t(" = () => {"),
    t({"", "\treturn ("}),
    t({"", "\t\t<>"}),
    t({"", "\t\t\t"}),
    i(0),
    t({"", "\t\t</>"}),
    t({"", "\t);"}),
    t({"", "};"}),
    t({"", ""}),
    t("export default "),
    f(get_filename, {}),
    t(";"),
  }),

  s("dom-load", {
    t("document.addEventListener('DOMContentLoaded', () => {"),
    t({"", "\t"}),
    i(1, "body"),
    t({"", "});"}),
  }),
}
