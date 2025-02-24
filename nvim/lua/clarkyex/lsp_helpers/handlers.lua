local lspconfig = require("lspconfig")
local lsp = require("lsp-zero")
local root_pattern = lspconfig.util.root_pattern
local H = {}
function H.rust_analyzer()
	lspconfig.rust_analyzer.setup({

		settings = {
			["rust-analyzer"] = {
				diagontstics = {
					enable = true,
				},
				inlayHints = {
					enable = true,
					showParameterNames = true,
					parameterHintsPrefix = "<- ",
					otherHintsPrefix = "=> ",
				},

				checkOnSave = {
					command = "clippy",
				},
			},
		},
	})
end

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

function H.denols()
	lspconfig.denols.setup({
		root_dir = root_pattern("deno.json", "deno.jsonc"),
	})
end

function H.ts_ls()
	lspconfig.ts_ls.setup({
		-- other options
		root_dir = function(fname)
			return not root_pattern("deno.json", "deno.jsonc")(fname)
				and (
					root_pattern("tsconfig.json")(fname) or root_pattern("package.json", "jsconfig.json", ".git")(fname)
				)
		end,
		single_file_support = false,
		settings = {
			javascript = {
				inlayHints = {
					includeInlayParameterNameHintsWhenArgumentMatchesName = true,
					includeInlayFunctionParameterTypeHints = true,
					includeInlayVariableTypeHints = true,
					includeInlayParameterNameHints = "all",
					includeInlayVariableTypeHintsWhenTypeMatchesName = true,
					includeInlayPropertyDeclarationTypeHints = true,
					includeInlayFunctionLikeReturnTypeHints = true,
					includeInlayEnumMemberValueHints = true,
				},
			},
			typescript = {
				inlayHints = {
					includeInlayParameterNameHintsWhenArgumentMatchesName = true,
					includeInlayFunctionParameterTypeHints = true,
					includeInlayVariableTypeHints = true,
					includeInlayParameterNameHints = "all",
					includeInlayVariableTypeHintsWhenTypeMatchesName = true,
					includeInlayPropertyDeclarationTypeHints = true,
					includeInlayFunctionLikeReturnTypeHints = true,
					includeInlayEnumMemberValueHints = true,
				},
			},
		},
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
end

local HOME = os.getenv("HOME")
local WORKSPACE_PATH = HOME .. "/workspace/java/"
local project_name = vim.fn.fnamemodify(vim.fn.getcwd(), ":p:h:t")
local workspace_dir = WORKSPACE_PATH .. project_name
local SYSTEM = "linux"
if vim.fn.has("mac") == 1 then
	SYSTEM = "mac"
end
local JDTLS_LOCATION = vim.fn.stdpath("data") .. "/lsp_servers/jdtls"

function H.jdtls()
	lspconfig.jdtls.setup({
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
end

function H.aiken()
	lspconfig.aiken.setup({})
end
return H
