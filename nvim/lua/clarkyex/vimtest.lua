vim.api.nvim_set_var('test#strategy', 'harpoon')
vim.api.nvim_set_var('test#harpoon_term', 2)

vim.api.nvim_set_keymap('n', '<leader>rtf', ':TestFile<CR>', { noremap = true })
vim.api.nvim_set_keymap('n', '<leader>rtl', ':TestLast<CR>', { noremap = true })
vim.api.nvim_set_keymap('n', '<leader>rtn', ':TestNearest<CR>', { noremap = true })
vim.api.nvim_set_keymap('n', '<leader>rts', ':TestSuite<CR>', { noremap = true })
vim.api.nvim_set_keymap('n', '<leader>rtv', ':TestVisit<CR>', { noremap = true })
