local ls = require("luasnip")
local s = ls.snippet
local t = ls.text_node
local f = ls.function_node
local i = ls.insert_node

local function filename_to_pascalcase()
    local filename = vim.fn.expand("%:t:r")
    if filename == "" then
        return "Component"
    end

    local pascalcase = filename:gsub("(%a)([%w_]*)", function(first, rest)
        return first:upper() .. rest:lower()
    end)

    pascalcase = pascalcase:gsub("[-_](%a)", function(letter)
        return letter:upper()
    end)

    return pascalcase
end

return {
    s("rfc", {
        f(function()
            local component_name = filename_to_pascalcase()
            return "const " .. component_name .. " = () => {"
        end),
        t({ "", "\treturn (" }),
        t({ "", "\t\t<>" }),
        t({ "", "\t\t\t" }),
        i(0),
        t({ "", "\t\t</>" }),
        t({ "", "\t);" }),
        t({ "", "};" }),
        t({ "", "" }),
        f(function()
            local component_name = filename_to_pascalcase()
            return "export default " .. component_name .. ";"
        end),
    }),
}
