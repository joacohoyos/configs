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
call plug#end()

syntax enable
set nocompatible
set t_Co=256
set termguicolors
colorscheme gruvbox
let g:gruvbox_contrast_dark = 'hard'

if exists('+termguicolors')
    let &t_8f = "\<Esc>[38;2;%lu;%lu;%lum"
    let &t_8b = "\<Esc>[48;2;%lu;%lu;%lum"
endif

" let g:gruvbox_invert_selection='0'
highlight nonText guibg=NONE ctermbg=NONE
highlight Normal guibg=NONE ctermbg=NONE
highlight EndOfBuffer guibg=NONE ctermbg=NONE
highlight CursorLineNr term=bold ctermfg=Yellow ctermbg=NONE guibg=NONE
highlight LineNr guibg=NONE ctermbg=NONE ctermfg=Yellow
highlight SignColumn guibg=NONE ctermbg=NONE

lua require'nvim-treesitter.configs'.setup { highlight = { enable = true, }, }

let g:rainbow_active = 1
let g:lightline = {
      \ 'colorscheme': 'wombat',
      \ 'active': {
      \   'left': [ [ 'mode', 'paste' ],
      \             [ 'gitbranch', 'readonly', 'filename', 'modified' ] ],
      \   'right': [['lineinfo']]
      \ },
      \ 'component': {
      \   'lineinfo': '%3l:%-2v%<',
      \   'filename': "%{expand('%:p:h:t')}/%t",
      \ },
      \ 'component_function': {
      \   'gitbranch': 'FugitiveHead',
      \ },
      \ 'mode_map': {
      \   'n' : 'N',
      \   'i' : 'I',
      \   'R' : 'R',
      \   'v' : 'V',
      \   'V' : 'VL',
      \   "\<C-v>": 'VB',
      \   'c' : 'C',
      \   's' : 'S',
      \   'S' : 'SL',
      \   "\<C-s>": 'SB',
      \   't': 'T',
      \ },
      \ }
autocmd FileType ruby setlocal shiftwidth=4 tabstop=4
lua require("clarkyex")
