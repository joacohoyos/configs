require('paq')({
    { 'savq/paq-nvim', opt = true },
    'morhetz/gruvbox',
    'gruvbox-community/gruvbox',
    'tpope/vim-fugitive',
    'tpope/vim-surround',
    'edkolev/tmuxline.vim',
    'alvan/vim-closetag',
    'neovim/nvim-lspconfig',
    'hrsh7th/nvim-compe',
    'mhartington/formatter.nvim',
    'frazrepo/vim-rainbow',
    'szw/vim-maximizer',
    'ThePrimeagen/harpoon',
    'nvim-lua/popup.nvim',
    'nvim-telescope/telescope.nvim',
    -- 'nvim-telescope/telescope-fzy-native.nvim',
 {'nvim-telescope/telescope-fzf-native.nvim', run = 'make' },
    { 'nvim-treesitter/nvim-treesitter', run = ':TSUpdate' },
    'itchyny/lightline.vim',
    'ThePrimeagen/git-worktree.nvim',
    'kyazdani42/nvim-tree.lua',
    'kyazdani42/nvim-web-devicons',
    'vim-test/vim-test',
    'joacohoyos/rest.nvim',
    'joacohoyos/plenary.nvim',
    'zivyangll/git-blame.vim',
    'numToStr/Comment.nvim',
    'ThePrimeagen/refactoring.nvim',
    'JoosepAlviste/nvim-ts-context-commentstring',
    'joacohoyos/directory.nvim',
    'hrsh7th/vim-vsnip',
    'hrsh7th/vim-vsnip-integ',
    {
        'iamcco/markdown-preview.nvim',
        run = function()
            vim.fn['mkdp#util#install']()
        end,
    },
})

require('common')
require('clarkyex')

vim.cmd('autocmd BufRead,BufNewFile *.env.* set filetype=sh')
vim.cmd('autocmd FileType lua setlocal shiftwidth=4 tabstop=4')
vim.cmd('autocmd FileType lua setlocal shiftwidth=5 tabstop=4')
vim.cmd('autocmd FileType lua setlocal shiftwidth=5 tabstop=4')
