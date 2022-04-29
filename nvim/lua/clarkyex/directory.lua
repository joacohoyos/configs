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
        ["podchain/mma-treasures"] = {
            { path = '~/podchain/mma-treasures/app/develop', match = "app" },
            { path = '~/podchain/mma-treasures/api/develop', match = "api" },
            { path = '~/podchain/mma-treasures/admin', match = "admin" },
            { path = '~/podchain/mma-treasures/contracts', match = "contracts" }
        },
        ["podchain/petaverse"] = {
            { path = '~/podchain/petaverse/app/develop', match = "app" },
            { path = '~/podchain/petaverse/api/develop', match = "api" },
            { path = '~/podchain/petaverse/contracts', match = "contracts" },
            { path = '~/podchain/petaverse/admin/develop', match = "admin" },
        }
    },
    directories = {
        '~/podchain/mma-treasures/app/develop',
        '~/podchain/mma-treasures/api/develop',
        '~/podchain/mma-treasures/admin',
        '~/podchain/mma-treasures/contracts',
        '~/podchain/petaverse/app/develop',
        '~/podchain/petaverse/api/develop',
        '~/podchain/petaverse/contracts',
        '~/podchain/petaverse/admin/develop',
        '~/base/api',
        '~/base/app',

    },
    global_settings = {
        after_change = function () 
            require("harpoon.term").clear_all()
        end
    }
})
