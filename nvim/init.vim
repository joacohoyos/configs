call plug#begin('~/.vim/plugged') 
  Plug 'morhetz/gruvbox'
  Plug 'scrooloose/nerdtree'
  Plug 'tpope/vim-fugitive'
  Plug 'tpope/vim-surround'
  Plug 'tpope/vim-commentary'
  Plug 'edkolev/tmuxline.vim'
  Plug 'alvan/vim-closetag'
  Plug 'tpope/vim-rails'
  Plug 'ThePrimeagen/vim-be-good'
  Plug 'neovim/nvim-lspconfig'
  Plug 'hrsh7th/nvim-compe'
  Plug 'hrsh7th/vim-vsnip'
  Plug 'hrsh7th/vim-vsnip-integ'
  Plug 'vim-ruby/vim-ruby'
  Plug 'mhartington/formatter.nvim'
  Plug 'frazrepo/vim-rainbow'
  Plug 'szw/vim-maximizer'
  Plug 'ThePrimeagen/harpoon'
  Plug 'nvim-lua/plenary.nvim'
  Plug 'nvim-lua/popup.nvim'
  Plug 'nvim-telescope/telescope.nvim'
  Plug 'nvim-telescope/telescope-fzy-native.nvim'
  Plug 'itchyny/lightline.vim'
  Plug 'nvim-treesitter/nvim-treesitter', {'do': ':TSUpdate'}
  Plug 'ThePrimeagen/git-worktree.nvim'
  Plug 'TovarishFin/vim-solidity'
call plug#end()

let g:pe_api_branch = 'develop'
let g:pe_app_branch = 'develop'

autocmd FileType ruby setlocal shiftwidth=4 tabstop=4
lua require("clarkyex")
