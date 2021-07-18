lua require("clarkyex")

let mapleader = " "
nnoremap <C-f> :NERDTreeToggle<CR>
nnoremap <Leader>w :w<CR>
nnoremap <Leader>gg :lua require('telescope').extensions.git_worktree.git_worktrees()<CR>
nnoremap <Leader>gn :lua require('telescope').extensions.git_worktree.create_git_worktree()<CR>
nnoremap <Leader>ga :G add .<CR>
" nnoremap <Leader>gc :G commit -m "vi
nnoremap <leader>gc :lua require("helpers.commit").command()<CR>
nnoremap <leader>rt :lua require("helpers.test").command(false)<CR>
nnoremap <leader>rat :lua require("helpers.test").command(true)<CR>
nnoremap <Leader>gp :G push origin HEAD
nnoremap <Leader>gmt :G mergetool<CR>
nnoremap <Leader>gds :Gdiffsplit!<CR>
nnoremap <Leader>dgo :diffget //2<CR>
nnoremap <Leader>dgu :diffget //3<CR>
nnoremap <leader>ps :lua require('telescope.builtin').grep_string({ search = vim.fn.input("Grep For > ")})<CR>
nnoremap <leader>pc :lua require("telescope.builtin").find_files({prompt_title = "< VimRC >",cwd = "$HOME/configs"})<CR>
nnoremap <C-p> :lua require('telescope.builtin').git_files()<CR>
nnoremap <Leader>pf :lua require('telescope.builtin').find_files()<CR>
nnoremap <leader>pb :lua require('telescope.builtin').buffers()<CR>
nnoremap <leader>vrc :lua require('theprimeagen.telescope').search_dotfiles()<CR>
nnoremap <Leader>q :q<CR>
nnoremap <Leader>wq :wq<CR>
nnoremap <Leader>b :Buffers<CR>
nnoremap <Leader>n :bp<CR>
nnoremap <Leader>m :bn<CR>
nnoremap <Leader>, <<
nnoremap <Leader>. >>
nnoremap <Leader>o o<ESC>
nnoremap <Leader>O O<ESC>
inoremap ,, <ESC>A,<ESC>
inoremap ;; <ESC>A;<ESC>
vnoremap <Leader>dd "_d
nnoremap <Leader>dd "_dd
vnoremap <Leader>pp "_dP
nnoremap <Leader>pp "_ddP
vnoremap <Leader>d" "_di"
nnoremap <Leader>d" "_di"
vnoremap <Leader>p" "_di"P
nnoremap <Leader>p" "_di"P
vnoremap <Leader>d' "_di'
nnoremap <Leader>d' "_di'
vnoremap <Leader>p' "_di'P
nnoremap <Leader>p' "_di'P
vnoremap <Leader>d{ "_di{
nnoremap <Leader>d{ "_di{
vnoremap <Leader>p{ "_di{P
nnoremap <Leader>p{ "_di{P
vnoremap <Leader>d( "_di(
nnoremap <Leader>d( "_di(
vnoremap <Leader>p( "_di(P
nnoremap <Leader>p( "_di(P
inoremap <silent> <C-g>u <ESC>guawea
inoremap <silent> <C-g>U <ESC>gUawea
inoremap <silent> <C-g>w <ESC>0gu$
inoremap <silent> <C-g>W <ESC>0gU$
nnoremap <Leader>m :MaximizerToggle<CR>
vnoremap J :m '>+1<CR>gv=gv
vnoremap K :m '<-2<CR>gv=gv
inoremap <C-c> <ESC>
" for when wanting to move one char after autopairing bracket
inoremap <C-h> <Left>
tnoremap <Esc> <C-\><C-n>
nnoremap Q <nop>

