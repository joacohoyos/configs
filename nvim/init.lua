require('paq') {	
	{'savq/paq-nvim', opt = true  };
	'morhetz/gruvbox';
	'gruvbox-community/gruvbox';
	'scrooloose/nerdtree';
	'tpope/vim-fugitive';
	'tpope/vim-surround';
	'tpope/vim-commentary';
	'edkolev/tmuxline.vim';
	'alvan/vim-closetag';
	'neovim/nvim-lspconfig';
	'hrsh7th/nvim-compe';
	'mhartington/formatter.nvim';
	'frazrepo/vim-rainbow';
	'szw/vim-maximizer';
	'ThePrimeagen/harpoon';
	'nvim-lua/plenary.nvim';
	'nvim-lua/popup.nvim';
	'nvim-telescope/telescope.nvim';
	'nvim-telescope/telescope-fzy-native.nvim';
	{'nvim-treesitter/nvim-treesitter', run=':TSUpdate'};
	'itchyny/lightline.vim';
	'ThePrimeagen/git-worktree.nvim';
	'kyazdani42/nvim-tree.lua';
	'kyazdani42/nvim-web-devicons';
	'joacohoyos/vim-test';
	'zivyangll/git-blame.vim';
	'TovarishFin/vim-solidity';
	'numToStr/Comment.nvim';
	'ThePrimeagen/refactoring.nvim';
	'JoosepAlviste/nvim-ts-context-commentstring';
}

require('common')
require('clarkyex')

vim.cmd("autocmd BufRead,BufNewFile *.sol set filetype=solidity")
vim.cmd("autocmd FileType ruby setlocal shiftwidth=4 tabstop=4")
vim.cmd("autocmd FileType solidity setlocal shiftwidth=4 tabstop=4")
