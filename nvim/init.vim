call plug#begin('~/.vim/plugged') 
  Plug 'morhetz/gruvbox'
  " Plug 'gruvbox-community/gruvbox'
  Plug 'scrooloose/nerdtree'
  Plug 'tpope/vim-fugitive'
  Plug 'tpope/vim-surround'
  " Plug 'tpope/vim-commentary'
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
  Plug 'zivyangll/git-blame.vim'
  Plug 'TovarishFin/vim-solidity'
  Plug 'numToStr/Comment.nvim'
  Plug 'ThePrimeagen/refactoring.nvim'
  Plug 'JoosepAlviste/nvim-ts-context-commentstring'
call plug#end()

let g:pe_api_branch = 'develop'
let g:pe_app_branch = 'develop'

autocmd BufRead,BufNewFile *.sol set filetype=solidity
autocmd FileType ruby setlocal shiftwidth=4 tabstop=4
autocmd FileType solidity setlocal shiftwidth=4 tabstop=4

let g:mergetool_layout = 'mr'
let g:mergetool_prefer_revision = 'local'

highlight NvimTreeFolderIcon guifg=blue
highlight NvimTreeFolderIcon guibg=NONE
highlight NvimTreeFolderName guifg=#458588

lua require("clarkyex")
source ~/.config/nvim/after/plugin/colors.vim
