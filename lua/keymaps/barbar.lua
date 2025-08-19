local keymap = vim.keymap

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

keymap.set('n', '<C-w>', '<Cmd>BufferClose<CR>', {
  nowait = true,
  desc = 'close tab'
})
