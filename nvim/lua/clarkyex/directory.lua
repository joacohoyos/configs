-- Working Dir
vim.api.nvim_set_keymap(
    'n',
    '<leader>na',
    ':lua require("directory").change_directory(1)<CR>',
    { noremap = true }
)
vim.api.nvim_set_keymap(
    'n',
    '<leader>no',
    ':lua require("directory").change_directory(2)<CR>',
    { noremap = true }
)
vim.api.nvim_set_keymap(
    'n',
    '<leader>ne',
    ':lua require("directory").change_directory(3)<CR>',
    { noremap = true }
)
vim.api.nvim_set_keymap(
    'n',
    '<leader>nu',
    ':lua require("directory").change_directory(4)<CR>',
    { noremap = true }
)

require("directory").setup({
    projects = {
    },
    directories = {
    },
    global_settings = {
        after_change = function () 
            require("harpoon.term").clear_all()
        end
    }
})
