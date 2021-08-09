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
        }
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


local M = {}
M.search_tests = function() 
    require("telescope.builtin").find_files({ find_command = {'ag', '-g', "(.*)\\/__tests__\\/(.*)(test|spec)(.*)(tsx|jsx|ts|js)$"} })
end

M.live_grep = function() 
    require("telescope.builtin").grep_string({ search= vim.fn.input("Grep For > ") })
end

return M

