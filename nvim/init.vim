call plug#begin('~/.vim/plugged')
Plug 'morhetz/gruvbox'
Plug 'scrooloose/nerdtree'
Plug 'tpope/vim-fugitive'
Plug 'tpope/vim-surround'
Plug 'tpope/vim-commentary'
Plug 'maxmellon/vim-jsx-pretty'
Plug 'christoomey/vim-tmux-navigator'
Plug 'pangloss/vim-javascript'
Plug 'leafgarland/typescript-vim'
Plug 'alvan/vim-closetag'
Plug 'vim-airline/vim-airline'
Plug 'vim-airline/vim-airline-themes'
Plug 'tomasiser/vim-code-dark'
Plug 'junegunn/fzf.vim'
Plug 'junegunn/fzf', { 'do': { -> fzf#install() } }
Plug 'airblade/vim-gitgutter'
Plug 'edkolev/tmuxline.vim'
Plug 'tpope/vim-rails'
Plug 'ThePrimeagen/vim-be-good'
Plug 'neovim/nvim-lspconfig'
Plug 'hrsh7th/nvim-compe'
Plug 'hrsh7th/vim-vsnip'
Plug 'hrsh7th/vim-vsnip-integ'
Plug 'cohama/lexima.vim'
Plug 'vim-ruby/vim-ruby'
call plug#end()

syntax enable
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

let g:airline#extensions#branch#enabled = 1
let g:airline_theme = 'gruvbox'
let g:airline#extensions#tmuxline#enabled = 0 
let airline#extensions#tmuxline#snapshot_file = "~/.tmux-status.conf"
let g:tmuxline_powerline_separators = 1
lua require("clarkyex")
