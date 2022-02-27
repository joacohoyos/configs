lua require("clarkyex")

let mapleader = " "
nnoremap <C-f> :NvimTreeToggle<CR>
" Worktree
nnoremap <Leader>gg :lua require('telescope').extensions.git_worktree.git_worktrees()<CR>
nnoremap <Leader>gn :lua require('telescope').extensions.git_worktree.create_git_worktree()<CR>
" Git
nnoremap <leader>cc :lua require("helpers.commit").command()<CR>
nnoremap <Leader>ca :G add .<CR>
nnoremap <Leader>cpoh :G push origin HEAD
nnoremap <Leader>cpfl :G push --force-with-lease
nnoremap <leader>crom :Git rebase origin/master<CR>
" Git merge
nnoremap <Leader>gm :G mergetool<CR>
nnoremap <Leader>mt :Gdiffsplit!<CR>
nnoremap <Leader>dg :diffget //2<CR>
nnoremap <Leader>dp :diffget //3<CR>
" Telescope
" nnoremap <leader>ps :lua require('telescope.builtin').live_grep({ search = vim.fn.input("Grep For > ")})<CR>
nnoremap <leader>ps :lua require("clarkyex.telescope").live_grep()<CR>
nnoremap <leader>pc :lua require("telescope.builtin").find_files({prompt_title = "< VimRC >",cwd = "$HOME/configs"})<CR>
nnoremap <leader>pt :lua require("clarkyex.telescope").search_tests()<CR>
nnoremap <C-p> :lua require('telescope.builtin').git_files()<CR>
nnoremap <Leader>pf :lua require('telescope.builtin').find_files()<CR>
nnoremap <leader>pb :lua require('telescope.builtin').buffers()<CR>
"New Line
nnoremap <Leader>o o<ESC>
nnoremap <Leader>O O<ESC>
" Deletting and pasting without overwriting clipboard
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
" To Lowercase or To Uppercase
inoremap <silent> <C-g>u <ESC>guawea
inoremap <silent> <C-g>U <ESC>gUawea
inoremap <silent> <C-g>w <ESC>0gu$
inoremap <silent> <C-g>W <ESC>0gU$
" Maximize
nnoremap <Leader>m :MaximizerToggle<CR>
" Esc
inoremap <C-c> <ESC>
tnoremap <Esc> <C-\><C-n>
" for when wanting to move one char after autopairing bracket
inoremap <C-h> <Left>
inoremap <C-t> <Right>
" Remove Q mapping
nnoremap Q <nop>
" Yank to end of line
nnoremap Y y$
" Keeping it centered
nnoremap n nzzzv
nnoremap N Nzzzv
nnoremap J mzJ`z
" Undo breakpoints
inoremap , ,<C-g>u
inoremap . .<C-g>u
inoremap ? ?<C-g>u
inoremap ; ;<C-g>u
inoremap { {<C-g>u
inoremap [ [<C-g>u
inoremap } }<C-g>u
inoremap ] ]<C-g>u
inoremap : :<C-g>u
inoremap = =<C-g>u
" Moving lines up and down
vnoremap J :m '>+1<CR>gv=gv
vnoremap K :m '<-2<CR>gv=gv
inoremap <C-j> <ESC>:m .+1<CR>==i
inoremap <C-k> <ESC>:m .-2<CR>==i
nnoremap <leader>k :m .-2<CR>==
nnoremap <leader>j :m .+1<CR>==
nnoremap <Leader>s :<C-u>call gitblame#echo()<CR>

" Refactoring
vnoremap <Leader>re <Esc><Cmd>lua require('refactoring').refactor('Extract Function')<CR>
vnoremap <Leader>rf <Esc><Cmd>lua require('refactoring').refactor('Extract Function To File')<CR>
vnoremap <Leader>rr <Esc><Cmd>lua M.refactor()<CR>
nnoremap <Leader>ra :lua require('refactoring').debug.printf({below = false})<CR>
nnoremap <Leader>rb :lua require('refactoring').debug.printf({below = true})<CR>
vnoremap <Leader>rv :lua require('refactoring').debug.print_var({})<CR>
nnoremap <Leader>rc :lua require('refactoring').debug.cleanup({})<CR>

" Solidity
nnoremap <leader>rtc :lua require("helpers.truffle").compile()<CR>
