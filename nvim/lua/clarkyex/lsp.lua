local H = require("clarkyex.lsp_helpers.handlers")
local T = require("clarkyex.lsp_helpers.toggler")
vim.g.copilot_no_tab_map = true
vim.g.copilot_assume_mapped = true
vim.g.copilot_tab_fallback = ""

vim.opt.completeopt = "menuone,noselect"
vim.api.nvim_set_var("completion_matching_strategy_list", { "exact", "substring", "fuzzy" })

vim.keymap.set("i", "<leader>vsh", function()
	vim.lsp.buf.signature_help()
end, opts)

local lsp = require("lsp-zero")

lsp.on_attach(function(client, bufnr)
	local opts = { buffer = bufnr, remap = false }

	vim.keymap.set("n", "<leader>vd", function()
		vim.lsp.buf.definition()
	end, opts)
	vim.keymap.set("n", "<leader>vh", function()
		vim.lsp.buf.hover()
	end, opts)
	vim.keymap.set("n", "<leader>vsd", function()
		vim.diagnostic.open_float()
	end, opts)
	vim.keymap.set("n", "vn", function()
		vim.diagnostic.goto_next()
	end, opts)
	vim.keymap.set("n", "vp", function()
		vim.diagnostic.goto_prev()
	end, opts)
	vim.keymap.set("n", "<leader>vca", function()
		vim.lsp.buf.code_action()
	end, opts)
	vim.keymap.set("n", "<leader>vrr", function()
		vim.lsp.buf.references()
	end, opts)
	vim.keymap.set("n", "<leader>vrn", function()
		vim.lsp.buf.rename()
	end, opts)
	vim.keymap.set("i", "<leader>vsh", function()
		vim.lsp.buf.signature_help()
	end, opts)
	if vim.lsp.inlay_hint then
		vim.keymap.set("n", "<leader>l", function()
			if vim.lsp.inlay_hint.is_enabled() then
				vim.lsp.inlay_hint.enable(false, opts)
			else
				vim.lsp.inlay_hint.enable(true, opts)
			end
		end, opts)
	else
		print("inlay hints not available")
	end
end)

require("mason").setup({})
require("mason-lspconfig").setup({
	ensure_installed = {
		"rust_analyzer",
		"bashls",
		"jdtls",
		"gopls",
		"jdtls",
		"html",
		"jsonls",
		"ts_ls",
		-- "pylsp",
		"pyright",
	},
	handlers = {
		lsp.default_setup,
		denols = H.denols,
		rust_analyzer = H.rust_analyzer,
		jdtls = H.jdtls,
		ts_ls = H.tsls,
	},
	inlay_hints = {
		enabled = true,
	},
})

-- setup aiken
H.aiken()

local cmp = require("cmp")
local cmp_select = { behavior = cmp.SelectBehavior.Select }
local cmp_mappings = lsp.defaults.cmp_mappings({
	["<C-p>"] = cmp.mapping.select_prev_item(cmp_select),
	["<C-n>"] = cmp.mapping.select_next_item(cmp_select),
	["<C-y>"] = cmp.mapping.confirm({ select = true }),
	["<CR>"] = cmp.mapping.confirm({ select = true }),
	["<C-Space>"] = cmp.mapping.complete(),
	["<Tab>"] = function(fallback)
		cmp.mapping.abort()
		local copilot_keys = vim.fn["copilot#Accept"]()
		if copilot_keys ~= "" then
			vim.api.nvim_feedkeys(copilot_keys, "i", true)
		else
			fallback()
		end
	end,
})

cmp.setup({
	mapping = cmp_mappings,
})

lsp.set_sign_icons({
	error = "E",
	warn = "W",
	hint = "H",
	info = "I",
})

-- lsp.setup()

vim.diagnostic.config({
	virtual_text = true,
})

vim.api.nvim_create_autocmd({ "BufEnter", "BufWinEnter" }, {
	pattern = { "*.ts", "*.tsx", "*.js", "*.jsx" },
	callback = function(ev)
		-- Get the current buffer number
		local bufnr = vim.api.nvim_get_current_buf()

		-- Get the full path of the current file
		local filepath = vim.api.nvim_buf_get_name(bufnr)

		-- Get the size of the current buffer/file in bytes
		local file_size = vim.fn.getfsize(filepath)

		limit = 2.5 * 1024 * 1024
		ts_ls_id = T.get_lsp_num("ts_ls")
		if file_size >= limit then
			T.stop_server(ts_ls_id)
		else
			-- T.start_server("tsserver")
			T.start_server(ts_ls_id)
		end
	end,
})
