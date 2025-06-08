local M = {}

local function has_words_before()
  unpack = unpack or table.unpack
  local line, col = unpack(vim.api.nvim_win_get_cursor(0))
  return col ~= 0 and vim.api.nvim_buf_get_lines(0, line - 1, line, true)[1]:sub(col, col):match("%s") == nil
end

function M.get_cmp_mappings()
  local cmp = require("cmp")
  local luasnip = require("luasnip")

  return cmp.mapping.preset.insert({
    ["<C-Space>"] = cmp.mapping.complete(),
    ["<CR>"] = cmp.mapping({
      i = function(fallback)
        if cmp.visible() then
          cmp.confirm({ behavior = cmp.ConfirmBehavior.Replace, select = true })
        else
          fallback()
        end
      end,
      s = cmp.mapping.confirm({ select = true }),
    }),
    ["<Up>"] = cmp.mapping(function(fallback)
      if cmp.visible() then
        cmp.select_prev_item()
      else
        fallback()
      end
    end, { "i", "s" }),
    ["<Down>"] = cmp.mapping(function(fallback)
      if cmp.visible() then
        cmp.select_next_item()
      else
        fallback()
      end
    end, { "i", "s" }),
    ["<Tab>"] = cmp.mapping(function(fallback)
      if cmp.visible() then
        cmp.confirm({ behavior = cmp.ConfirmBehavior.Replace, select = true })
      elseif luasnip.expand_or_jumpable() then
        luasnip.expand_or_jump()
      elseif has_words_before() then
        cmp.complete()
      else
        fallback()
      end
    end, { "i", "s" }),
    ["<S-Tab>"] = cmp.mapping(function(fallback)
      if cmp.visible() then
        cmp.select_prev_item()
      elseif luasnip.jumpable(-1) then
        luasnip.jump(-1)
      else
        fallback()
      end
    end, { "i", "s" }),
  })
end

function M.get_cmp_cmdline_mappings()
  local cmp = require("cmp")
  return cmp.mapping.preset.cmdline({
    ["<Tab>"] = {
      c = function()
        if cmp.visible() then
          if #cmp.get_entries() == 1 then
            cmp.confirm({ select = true })
          else
            cmp.select_next_item()
          end
        else
          cmp.complete()
          if #cmp.get_entries() == 1 then
            cmp.confirm({ select = true })
          end
        end
      end,
    },
    ["<S-Tab>"] = {
      c = function()
        if cmp.visible() then
          cmp.select_prev_item()
        else
          cmp.complete()
        end
      end,
    },
    ["<Up>"] = {
      c = function()
        if cmp.visible() then
          cmp.select_prev_item()
        else
          cmp.complete()
        end
      end,
    },
    ["<Down>"] = {
      c = function()
        if cmp.visible() then
          cmp.select_next_item()
        else
          cmp.complete()
        end
      end,
    },
  })
end

return M
