require('harpoon').setup({})

vim.api.nvim_set_keymap(
    'n',
    '<C-b>',
    ':lua require("harpoon.mark").add_file()<CR>',
    { noremap = true }
)
vim.api.nvim_set_keymap(
    'n',
    '<C-e>',
    ':lua require("harpoon.ui").toggle_quick_menu()<CR>',
    { noremap = true }
)
vim.api.nvim_set_keymap(
    'n',
    '<C-h>',
    ':lua require("harpoon.ui").nav_file(1)<CR>',
    { noremap = true }
)
vim.api.nvim_set_keymap(
    'n',
    '<C-t>',
    ':lua require("harpoon.ui").nav_file(2)<CR>',
    { noremap = true }
)
vim.api.nvim_set_keymap(
    'n',
    '<C-n>',
    ':lua require("harpoon.ui").nav_file(3)<CR>',
    { noremap = true }
)
vim.api.nvim_set_keymap(
    'n',
    '<C-s>',
    ':lua require("harpoon.ui").nav_file(4)<CR>',
    { noremap = true }
)
vim.api.nvim_set_keymap(
    'n',
    '<C-g>',
    ':lua require("harpoon.mark").rm_file()<CR>',
    { noremap = true }
)
vim.api.nvim_set_keymap(
    'n',
    '<leader>tu',
    ':lua require("harpoon.term").gotoTerminal(1)<CR>',
    { noremap = true }
)
vim.api.nvim_set_keymap(
    'n',
    '<leader>te',
    ':lua require("harpoon.term").gotoTerminal(2)<CR>',
    { noremap = true }
)
vim.api.nvim_set_keymap(
    'n',
    '<leader><C-t>',
    ':lua require("harpoon.term").clear_all()<CR>',
    { noremap = true }
)
vim.api.nvim_set_keymap(
    'n',
    '<leader><C-r>',
    ':lua require("harpoon.mark").shorten_list()<CR>',
    { noremap = true }
)
vim.api.nvim_set_keymap(
    'n',
    '<leader><C-d>',
    ':lua require("harpoon.mark").clear_all()<CR>',
    { noremap = true }
)
