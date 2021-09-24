call plug#begin('~/.vim/plugged') 
  Plug 'morhetz/gruvbox'
  " Plug 'gruvbox-community/gruvbox'
  Plug 'scrooloose/nerdtree'
  Plug 'tpope/vim-fugitive'
  Plug 'tpope/vim-surround'
  Plug 'tpope/vim-commentary'
  Plug 'edkolev/tmuxline.vim'
  Plug 'alvan/vim-closetag'
  Plug 'neovim/nvim-lspconfig'
  Plug 'hrsh7th/nvim-compe'
  Plug 'mhartington/formatter.nvim'
  Plug 'frazrepo/vim-rainbow'
  Plug 'szw/vim-maximizer'
  Plug 'ThePrimeagen/harpoon'
  Plug 'nvim-lua/plenary.nvim'
  Plug 'nvim-lua/popup.nvim'
  Plug 'nvim-telescope/telescope.nvim'
  Plug 'nvim-telescope/telescope-fzy-native.nvim'
  Plug 'nvim-treesitter/nvim-treesitter', {'do': ':TSUpdate'}
  Plug 'itchyny/lightline.vim'
  Plug 'ThePrimeagen/git-worktree.nvim'
  Plug 'kyazdani42/nvim-tree.lua'
  Plug 'kyazdani42/nvim-web-devicons'
  Plug 'joacohoyos/vim-test'
  " Plug 'tpope/vim-rails'
  " Plug 'vim-ruby/vim-ruby'
call plug#end()

let g:pe_api_branch = 'develop'
let g:pe_app_branch = 'develop'

autocmd FileType ruby setlocal shiftwidth=4 tabstop=4

let g:nvim_tree_auto_close = 1 
let g:nvim_tree_update_cwd = 1
let g:nvim_tree_lsp_diagnostics = 1

let g:mergetool_layout = 'mr'
let g:mergetool_prefer_revision = 'local'

highlight NvimTreeFolderIcon guibg=blue

lua require("clarkyex")

