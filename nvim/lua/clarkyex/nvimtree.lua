local function my_on_attach(bufnr)
	local api = require("nvim-tree.api")

	local function opts(desc)
		return { desc = "nvim-tree: " .. desc, buffer = bufnr, noremap = true, silent = true, nowait = true }
	end

	-- default mappings
	api.config.mappings.default_on_attach(bufnr)

	-- custom mappings
	vim.keymap.set("n", "<C-t>", api.tree.change_root_to_parent, opts("Up"))
	vim.keymap.set("n", "<C-n>", api.tree.change_root_to_node, opts("CD"))
end

require("nvim-tree").setup({
	on_attach = my_on_attach,
	renderer = {
		highlight_git = true,
	},
	disable_netrw = true,
	hijack_netrw = true,
	hijack_directories = {
		enable = true,
		auto_open = true,
	},
	-- auto_close = true,
	open_on_tab = false,
	hijack_cursor = false,
	update_cwd = true,
	diagnostics = {
		enable = true,
		icons = {
			hint = "",
			info = "",
			warning = "",
			error = "",
		},
	},
	filters = {
		dotfiles = false,
		custom = {},
	},
	update_focused_file = {
		enable = false,
		update_cwd = false,
		ignore_list = {},
	},
	system_open = {
		cmd = nil,
		args = {},
	},
	git = {
		enable = true,
		ignore = false,
		timeout = 500,
	},
	view = {
		width = "20%",
		side = "left",
	},
})
