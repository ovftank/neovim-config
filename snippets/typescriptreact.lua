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
    t("import type { FC } from 'react';"),
    t({ "", "" }),
    t("const "),
    f(get_filename, {}),
    t(": FC = () => {"),
    t({ "", "  return (" }),
    t({ "", "    <>" }),
    t({ "", "      " }),
    i(0),
    t({ "", "    </>" }),
    t({ "", "  );" }),
    t({ "", "};" }),
    t({ "", "" }),
    t("export default "),
    f(get_filename, {}),
    t(";"),
  }),
  s("us", {
    t("const ["),
    i(1, "state"),
    t(", set"),
    f(function(args)
      local state_name = args[1][1]
      if state_name == "" then
        return "State"
      end
      return state_name:gsub("^%l", string.upper)
    end, { 1 }),
    t("] = useState<"),
    i(3, "string"),
    t(">("),
    i(2, ""),
    t(");"),
  }),
}
