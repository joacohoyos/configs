vim.cmd("syntax enable")
vim.cmd("colorscheme gruvbox")
vim.opt.termguicolors = true
vim.api.nvim_set_var("gruvbox_contrast_dark", "hard")
vim.api.nvim_set_var("gruvbox_invert_selection", "0")

vim.opt.background = "dark"
vim.api.nvim_set_hl(0, 'nonText', {bg="NONE", ctermbg="NONE"})
vim.api.nvim_set_hl(0, "ndOfBuffer", { bg="NONE", ctermbg="NONE"})
vim.api.nvim_set_hl(0, "CursorLineNr", { fg="#EED202"})
vim.api.nvim_set_hl(0, "LineNr", { fg="#5eacd3"})
vim.api.nvim_set_hl(0, "SignColumn", { bg="NONE", ctermbg="NONE"})
vim.cmd("highlight Normal guibg=NONE ctermbg=NONE")
vim.api.nvim_set_hl(0, "CursorLine", { bold = true, bg="NONE"})
vim.api.nvim_set_hl(0, "NvimTreeFolderIcon", { fg="blue"})
vim.api.nvim_set_hl(0, "NvimTreeFolderIcon", { bg="NONE"})
vim.api.nvim_set_hl(0, "NvimTreeNormal", { bg="NONE"})
vim.api.nvim_set_hl(0, "NvimTreeFolderName", { fg="#458588"})

require('nvim-treesitter.configs').setup { highlight = { enable = true } }

vim.api.nvim_set_var("rainbow_active", 1)
