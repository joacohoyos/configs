vim.opt.mouse = 'a'
vim.opt.colorcolumn = '101,120'
vim.opt.numberwidth = 5
vim.opt.clipboard = vim.opt.clipboard + 'unnamed'


vim.opt.hidden = true
vim.api.nvim_command('set nohlsearch')
vim.api.nvim_command('set noswapfile')
vim.api.nvim_command('set nobackup')
vim.api.nvim_command('set nowritebackup')
vim.api.nvim_command('set noshowmode')
vim.opt.incsearch = true
vim.opt.scrolloff = 8
vim.opt.showcmd = true
vim.opt.ruler = true
vim.opt.encoding = 'utf-8'
vim.opt.showmatch = true
vim.opt.expandtab = true
vim.opt.sw = 2
vim.opt.softtabstop = 2
vim.opt.tabstop = 2
vim.opt.number = true
vim.opt.relativenumber = true
vim.opt.cursorline = true
vim.opt.laststatus = 3
vim.opt.wrap = true
vim.opt.splitright = true
vim.opt.diffopt = vim.opt.diffopt + 'vertical'
vim.opt.updatetime = 50
vim.opt.shortmess = vim.opt.shortmess + 'c'
vim.opt.nu = true
vim.api.nvim_set_var('mergetool_layout', 'mr')
vim.api.nvim_set_var('mergetool_prefer_revision', 'local')
