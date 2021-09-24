syntax enable
colorscheme gruvbox
set termguicolors
let g:gruvbox_contrast_dark = 'hard'

highlight nonText guibg=NONE ctermbg=NONE
highlight Normal guibg=NONE ctermbg=NONE
highlight EndOfBuffer guibg=NONE ctermbg=NONE
highlight CursorLineNr term=bold ctermfg=Yellow ctermbg=NONE guibg=NONE
highlight LineNr guibg=NONE ctermbg=NONE ctermfg=Yellow
highlight SignColumn guibg=NONE ctermbg=NONE
set background=dark

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
