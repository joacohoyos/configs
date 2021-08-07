lua << EOF
require('compe').setup({
  source = {
    path = true;
    buffer = true;
    calc = true;
    nvim_lsp = true;
    nvim_lua = true;
    vsnip = false;
    ultisnips = true;
    luasnip = true;
    treesitter = true;
  };
})
EOF
inoremap <silent><expr> <C-Space> compe#complete()
inoremap <silent><expr> <C-a>      compe#confirm('<C-a>')
inoremap <silent><expr> <C-e>     compe#close('<C-e>')
