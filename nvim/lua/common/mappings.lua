vim.api.nvim_set_var('mapleader', ' ')
-- NvimTree
vim.api.nvim_set_keymap('n', '<C-f>', ':NvimTreeToggle<CR>' , { noremap = true})

-- Worktree
vim.api.nvim_set_keymap('n', '<Leader>gg', ':lua require("telescope").extensions.git_worktree.git_worktrees()<CR>', { noremap = true })
vim.api.nvim_set_keymap('n', '<Leader>gn', ':lua require("telescope").extensions.git_worktree.create_git_worktree()<CR>', { noremap = true })

-- Git
vim.api.nvim_set_keymap('n', '<leader>cc', ':lua require("helpers.commit").command()<CR>', { noremap = true })
vim.api.nvim_set_keymap('n', '<Leader>ca', ':G add .<CR>', { noremap = true })
vim.api.nvim_set_keymap('n', '<Leader>cpoh', ':G push origin HEAD', { noremap = true})
vim.api.nvim_set_keymap('n', '<Leader>cpfl', ':G push --force-with-lease', { noremap = true})
vim.api.nvim_set_keymap('n', '<leader>crom', ':Git rebase origin/master<CR>', { noremap = true })

-- Git merge
vim.api.nvim_set_keymap('n', '<Leader>gm', ':G mergetool<CR>', { noremap = true })
vim.api.nvim_set_keymap('n', '<Leader>mt', ':Gdiffsplit!<CR>', { noremap = true })
vim.api.nvim_set_keymap('n', '<Leader>dg', ':diffget //2<CR>', { noremap = true })
vim.api.nvim_set_keymap('n', '<Leader>dp', ':diffget //3<CR>', { noremap = true })

-- New Line
vim.api.nvim_set_keymap('n', '<Leader>o', 'o<ESC>', { noremap = true})
vim.api.nvim_set_keymap('n', '<Leader>O', 'O<ESC>', { noremap = true})

-- Deletting and pasting without overwriting clipboard
vim.api.nvim_set_keymap('v', '<Leader>dd', '"_d', { noremap = true})
vim.api.nvim_set_keymap('n', '<Leader>dd', '"_dd', { noremap = true})
vim.api.nvim_set_keymap('v', '<Leader>pp', '"_dP', { noremap = true})
vim.api.nvim_set_keymap('n', '<Leader>pp', '"_ddP', { noremap = true})
vim.api.nvim_set_keymap('v', '<Leader>d"', '"_di"', { noremap = true})
vim.api.nvim_set_keymap('n', '<Leader>d"', '"_di"', { noremap = true})
vim.api.nvim_set_keymap('v', '<Leader>p"', '"_di"P', { noremap = true})
vim.api.nvim_set_keymap('n', '<Leader>p"', '"_di"P', { noremap = true})
vim.api.nvim_set_keymap('v', "<Leader>d'", '"_di\'', { noremap = true})
vim.api.nvim_set_keymap('n', "<Leader>d'", '"_di\'', { noremap = true})
vim.api.nvim_set_keymap('v', "<Leader>p'", '"_di\'P', { noremap = true})
vim.api.nvim_set_keymap('n', "<Leader>p'", '"_di\'P', { noremap = true})
vim.api.nvim_set_keymap('v', '<Leader>d{', '"_di{,', { noremap = true})
vim.api.nvim_set_keymap('n', '<Leader>d{', '"_di{', { noremap = true})
vim.api.nvim_set_keymap('v', '<Leader>p{', '"_di{P', { noremap = true})
vim.api.nvim_set_keymap('n', '<Leader>p{', '"_di{P', { noremap = true})
vim.api.nvim_set_keymap('v', '<Leader>d(', '"_di(', { noremap = true})
vim.api.nvim_set_keymap('n', '<Leader>d(', '"_di(', { noremap = true})
vim.api.nvim_set_keymap('v', '<Leader>p(', '"_di(P', { noremap = true})
vim.api.nvim_set_keymap('n', '<Leader>p(', '"_di(P', { noremap = true})

-- To Lowercase or To Uppercase
vim.api.nvim_set_keymap('i', '<C-g>u', '<ESC>guawea', { noremap = true, silent = true})
vim.api.nvim_set_keymap('i', '<C-g>U', '<ESC>gUawea', { noremap = true, silent = true})
vim.api.nvim_set_keymap('i', '<C-g>w', '<ESC>0gu$', { noremap = true, silent = true})
vim.api.nvim_set_keymap('i', '<C-g>W', '<ESC>0gU$', { noremap = true, silent = true})

-- Maximize
vim.api.nvim_set_keymap('n', '<Leader>m', ':MaximizerToggle<CR>', { noremap = true })

-- Esc
vim.api.nvim_set_keymap('i', '<C-c>', '<ESC>', { noremap = true })
vim.api.nvim_set_keymap('t', '<Esc>', '<C-\\><C-n>', { noremap = true })

-- for when wanting to move one char after autopairing bracket
vim.api.nvim_set_keymap('i', '<C-h>', '<Left>', { noremap = true })
vim.api.nvim_set_keymap('i', '<C-t>', '<Right>', { noremap = true })

-- Remove Q mapping
vim.api.nvim_set_keymap('n', 'Q', '<nop>', { noremap = true })

-- Yank to end of line
vim.api.nvim_set_keymap('n', 'Y', 'y$', { noremap = true })

-- Keeping it centered
vim.api.nvim_set_keymap('n', 'n', 'nzzzv', { noremap = true })
vim.api.nvim_set_keymap('n', 'N', 'Nzzzv', { noremap = true })
vim.api.nvim_set_keymap('n', 'J', 'mzJ`z', { noremap = true })

-- Undo breakpoints
vim.api.nvim_set_keymap('i', ',', ',<C-g>u', { noremap = true })
vim.api.nvim_set_keymap('i', '.', '.<C-g>u', { noremap = true })
vim.api.nvim_set_keymap('i', '?', '?<C-g>u', { noremap = true })
vim.api.nvim_set_keymap('i', ';', ';<C-g>u', { noremap = true })
vim.api.nvim_set_keymap('i', '{', '{<C-g>u', { noremap = true })
vim.api.nvim_set_keymap('i', '[', '[<C-g>u', { noremap = true })
vim.api.nvim_set_keymap('i', '}', '}<C-g>u', { noremap = true })
vim.api.nvim_set_keymap('i', ']', ']<C-g>u', { noremap = true })
vim.api.nvim_set_keymap('i', ':', ':<C-g>u', { noremap = true })
vim.api.nvim_set_keymap('i', '=', '=<C-g>u', { noremap = true })

-- Moving lines up and down
vim.api.nvim_set_keymap('v', 'J', ":m '>+1<CR>gv=gv", { noremap = true })
vim.api.nvim_set_keymap('v', 'K', ":m '<-2<CR>gv=gv", { noremap = true })
vim.api.nvim_set_keymap('i', '<C-j>', '<ESC>:m .+1<CR>==i', { noremap = true })
vim.api.nvim_set_keymap('i', '<C-k>', '<ESC>:m .-2<CR>==i', { noremap = true })
vim.api.nvim_set_keymap('n', '<leader>k', ':m .-2<CR>==', { noremap = true })
vim.api.nvim_set_keymap('n', '<leader>j', ':m .+1<CR>==', { noremap = true })
vim.api.nvim_set_keymap('n', '<Leader>s', ':<C-u>call gitblame#echo()<CR>', { noremap = true })

-- Solidity
vim.api.nvim_set_keymap('n', '<leader>rtc', ':lua require("helpers.truffle").compile()<CR>', { noremap = true })
