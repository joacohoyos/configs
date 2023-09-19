require("nvim-treesitter.configs").setup({
	highlight = {
		enable = true,
		disable = { "http" },
	},
	context_commentstring = {
		enable = true,
	},
})
