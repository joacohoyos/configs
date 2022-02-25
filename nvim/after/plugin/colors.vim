syntax enable
colorscheme gruvbox
set termguicolors
let g:gruvbox_contrast_dark = 'hard'

set background=dark
highlight nonText guibg=NONE ctermbg=NONE
highlight EndOfBuffer guibg=NONE ctermbg=NONE
highlight CursorLineNr guibg=NONE ctermbg=NONE guifg=#5eacd3
highlight LineNr guifg=#5eacd3
highlight SignColumn guibg=NONE ctermbg=NONE
highlight CursorLine cterm=NONE

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
