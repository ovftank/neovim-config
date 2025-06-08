local keymap = vim.keymap

local function close_buffer_or_dashboard()
  local buffers = vim.fn.getbufinfo({ buflisted = 1 })
  local valid_buffers = {}

  for _, buf in ipairs(buffers) do
    if buf.name ~= "" and vim.fn.filereadable(buf.name) == 1 then
      table.insert(valid_buffers, buf)
    end
  end

  if #valid_buffers <= 1 then
    vim.cmd('BufferClose')
    vim.schedule(function()
      if pcall(require, "dashboard") then
        vim.cmd('Dashboard')
      end
    end)
  else
    vim.cmd('BufferClose')
  end
end

keymap.set('n', '<C-Tab>', '<Cmd>BufferNext<CR>', { desc = 'next tab' })
keymap.set('n', '<C-S-Tab>', '<Cmd>BufferPrevious<CR>', { desc = 'prev tab' })

keymap.set('n', '<C-1>', '<Cmd>BufferGoto 1<CR>', { desc = 'tab 1' })
keymap.set('n', '<C-2>', '<Cmd>BufferGoto 2<CR>', { desc = 'tab 2' })
keymap.set('n', '<C-3>', '<Cmd>BufferGoto 3<CR>', { desc = 'tab 3' })
keymap.set('n', '<C-4>', '<Cmd>BufferGoto 4<CR>', { desc = 'tab 4' })
keymap.set('n', '<C-5>', '<Cmd>BufferGoto 5<CR>', { desc = 'tab 5' })
keymap.set('n', '<C-6>', '<Cmd>BufferGoto 6<CR>', { desc = 'tab 6' })
keymap.set('n', '<C-7>', '<Cmd>BufferGoto 7<CR>', { desc = 'tab 7' })
keymap.set('n', '<C-8>', '<Cmd>BufferGoto 8<CR>', { desc = 'tab 8' })
keymap.set('n', '<C-9>', '<Cmd>BufferGoto 9<CR>', { desc = 'tab 9' })

keymap.set('n', '<C-w>', close_buffer_or_dashboard, { desc = 'close tab' })
