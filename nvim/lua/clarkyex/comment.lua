require("nvim-treesitter.configs").setup({})
require("Comment").setup({
	{
		pre_hook = require("ts_context_commentstring.integrations.comment_nvim").create_pre_hook(),
	},
})
vim.g.skip_ts_context_commentstring_module = true
local ft = require("Comment.ft")
ft.aiken = ft.get("rust")
