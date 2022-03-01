local actions = require('telescope.actions')
require('telescope').setup {
    defaults = {
        file_sorter = require('telescope.sorters').get_fzy_sorter,
        prompt_prefix = ' >',
        color_devicons = true,

        file_previewer   = require('telescope.previewers').vim_buffer_cat.new,
        grep_previewer   = require('telescope.previewers').vim_buffer_vimgrep.new,
        qflist_previewer = require('telescope.previewers').vim_buffer_qflist.new,

        mappings = {
            i = {
                ["<C-x>"] = false,
                ["<C-q>"] = actions.send_to_qflist,
            },
        },
        -- file_ignore_patterns = {"node_modules", "dist", "build", ".next"},
    },
    extensions = {
        fzy_native = {
            override_generic_sorter = false,
            override_file_sorter = true,
        }
    }
}

require('telescope').load_extension('fzy_native')
require("telescope").load_extension("git_worktree")

-- Mappings
vim.api.nvim_set_keymap('n', '<leader>ps', ':lua require("telescope.builtin").live_grep({ search = vim.fn.input("Grep For > ")})<CR>', { noremap = true })
vim.api.nvim_set_keymap('n', '<leader>pc', ':lua require("telescope.builtin").find_files({prompt_title = "< VimRC >",cwd = "$HOME/configs"})<CR>', { noremap = true })
vim.api.nvim_set_keymap('n', '<leader>pt', ':lua require("clarkyex.telescope").search_tests()<CR>', { noremap = true })
vim.api.nvim_set_keymap('n', '<C-p>', ':lua require("telescope.builtin").find_files({no_ignore = true, hidden = true})<CR>', { noremap = true })
vim.api.nvim_set_keymap('n', '<leader>pb', ':lua require("telescope.builtin").buffers()<CR>', { noremap = true })

local M = {}
M.search_tests = function() 
    require("telescope.builtin").find_files({ find_command = {'ag', '-g', "(.*)\\/__tests__\\/(.*)(test|spec)(.*)(tsx|jsx|ts|js)$"} })
end

return M


