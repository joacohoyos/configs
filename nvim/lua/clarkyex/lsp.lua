vim.g.copilot_no_tab_map = true
vim.g.copilot_assume_mapped = true
vim.g.copilot_tab_fallback = ""

vim.opt.completeopt = "menuone,noselect"
vim.api.nvim_set_var("completion_matching_strategy_list", { "exact", "substring", "fuzzy" })

vim.keymap.set("i", "<leader>vsh", function()
	vim.lsp.buf.signature_help()
end, opts)

local lsp = require("lsp-zero")
local lspconfig = require("lspconfig")
local root_pattern = lspconfig.util.root_pattern

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
		"tsserver",
		"pylsp",
	},
	handlers = {
		lsp.default_setup,
	},
})

local cmp = require("cmp")
local cmp_select = { behavior = cmp.SelectBehavior.Select }
local cmp_mappings = lsp.defaults.cmp_mappings({
	["<C-p>"] = cmp.mapping.select_prev_item(cmp_select),
	["<C-n>"] = cmp.mapping.select_next_item(cmp_select),
	["<C-y>"] = cmp.mapping.confirm({ select = true }),
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
end)

lsp.configure("rust_analyzer", {
	settings = {
		["rust-analyzer"] = {
			checkOnSave = {
				command = "clippy",
			},
		},
	},
})

local function filter(arr, fn)
	if type(arr) ~= "table" then
		return arr
	end

	local filtered = {}
	for k, v in pairs(arr) do
		if fn(v, k, arr) then
			table.insert(filtered, v)
		end
	end

	return filtered
end

local function filterReactDTS(value)
	local targetUri = value.uri or value.targetUri
	return string.match(targetUri, "react/.*/index.d.ts") == nil
end

lsp.configure("denols", {
	root_dir = root_pattern("deno.json", "deno.jsonc"),
})

lsp.configure("tsserver", {
	-- other options
	root_dir = function(fname)
		return not root_pattern("deno.json", "deno.jsonc")(fname)
			and (root_pattern("tsconfig.json")(fname) or root_pattern("package.json", "jsconfig.json", ".git")(fname))
	end,
	single_file_support = false,
	handlers = {
		["textDocument/definition"] = function(err, result, method, ...)
			if vim.tbl_islist(result) and #result > 1 then
				local filtered_result = filter(result, filterReactDTS)
				return vim.lsp.handlers["textDocument/definition"](err, filtered_result, method, ...)
			end

			vim.lsp.handlers["textDocument/definition"](err, result, method, ...)
		end,
	},
})

local HOME = os.getenv("HOME")
local WORKSPACE_PATH = HOME .. "/workspace/java/"
local project_name = vim.fn.fnamemodify(vim.fn.getcwd(), ":p:h:t")
local workspace_dir = WORKSPACE_PATH .. project_name
local SYSTEM = "linux"
if vim.fn.has("mac") == 1 then
	SYSTEM = "mac"
end
local JDTLS_LOCATION = vim.fn.stdpath("data") .. "/lsp_servers/jdtls"

lsp.configure("jdtls", {
	cmd = {
		"jdtls",
		"-Declipse.application=org.eclipse.jdt.ls.core.id1",
		"-Dosgi.bundles.defaultStartLevel=4",
		"-Declipse.product=org.eclipse.jdt.ls.core.product",
		"-Dlog.protocol=true",
		"-Dlog.level=ALL",
		"-Xms1g",
		"--add-modules=ALL-SYSTEM",
		"--add-opens",
		"java.base/java.util=ALL-UNNAMED",
		"--add-opens",
		"java.base/java.lang=ALL-UNNAMED",
		"-jar",
		vim.fn.glob(JDTLS_LOCATION .. "/plugins/org.eclipse.equinox.launcher_*.jar"),
		"-configuration",
		JDTLS_LOCATION .. "/config_" .. SYSTEM,
		"-data",
		workspace_dir,
	},

	capabilities = lsp.capabilities,
	settings = {
		java = {
			eclipse = {
				downloadSources = true,
			},
			configuration = {
				updateBuildConfiguration = "interactive",
			},
			maven = {
				downloadSources = true,
			},
			implementationsCodeLens = {
				enabled = true,
			},
			referencesCodeLens = {
				enabled = true,
			},
			references = {
				includeDecompiledSources = true,
			},
			format = {
				enabled = true,
				settings = {
					url = vim.fn.stdpath("config") .. "/lang-servers/intellij-java-google-style.xml",
					profile = "GoogleStyle",
				},
			},
		},
		signatureHelp = { enabled = true },
		completion = {
			favoriteStaticMembers = {
				"org.hamcrest.MatcherAssert.assertThat",
				"org.hamcrest.Matchers.*",
				"org.hamcrest.CoreMatchers.*",
				"org.junit.jupiter.api.Assertions.*",
				"java.util.Objects.requireNonNull",
				"java.util.Objects.requireNonNullElse",
				"org.mockito.Mockito.*",
			},
		},
		contentProvider = { preferred = "fernflower" },
		extendedClientCapabilities = extendedClientCapabilities,
		sources = {
			organizeImports = {
				starThreshold = 9999,
				staticStarThreshold = 9999,
			},
		},
		codeGeneration = {
			toString = {
				template = "${object.className}{${member.name()}=${member.value}, ${otherMembers}}",
			},
			useBlocks = true,
		},
	},

	flags = {
		allow_incremental_sync = true,
	},
	-- Language server `initializationOptions`
	-- You need to extend the `bundles` with paths to jar files
	-- if you want to use additional eclipse.jdt.ls plugins.
	--
	-- See https://github.com/mfussenegger/nvim-jdtls#java-debug-installation
	--
	-- If you don't plan on using the debugger or other eclipse.jdt.ls plugins you can remove this
	init_options = {
		bundles = {},
	},
})

lspconfig.aiken.setup({})

lsp.setup()

vim.diagnostic.config({
	virtual_text = true,
})
