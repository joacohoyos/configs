local lsp = require'lspconfig'
local configs = require 'lspconfig/configs'

-- For snippet support
local capabilities = vim.lsp.protocol.make_client_capabilities()
capabilities.textDocument.completion.completionItem.snippetSupport = true

local on_attach_no_warning = function(_, bufnr)
  vim.lsp.handlers["textDocument/publishDiagnostics"] = vim.lsp.with(
    vim.lsp.diagnostic.on_publish_diagnostics, {
      underline = false,
      virtual_text = false,
      signs = true,
      update_in_insert = false,
    }
  )
end
-- configuring diagnostics
local custom_on_attach = function(_, bufnr)
  vim.lsp.handlers['textDocument/publishDiagnostics'] = vim.lsp.with(
    vim.lsp.diagnostic.on_publish_diagnostics, {
        underline = true,
        virtual_text = true,
        signs = true,
        update_in_insert = false,
    }
  )
end

lsp.cssls.setup { 
  on_attach = custom_on_attach,
  capabilities = capabilities, 
}

lsp.html.setup { 
  on_attach = custom_on_attach,
  capabilities = capabilities, 
}


lsp.tsserver.setup { 
  on_attach = custom_on_attach,
  init_options = {
      documentFormatting = false,
  },
  capabilities = capabilities, 
}

lsp.solargraph.setup { 
  on_attach = on_attach_no_warning, 
  capabilities = capabilities, 
}

lsp.jsonls.setup {
  on_attach = custom_on_attach,
  capabilities = capabilities,
  commands = {
    Format = {
      function()
        vim.lsp.buf.range_formatting({},{0,0},{vim.fn.line("$"),0})
      end
    }
  }
}

lsp.gopls.setup { 
  on_attach = custom_on_attach,
  capabilities = capabilities, 
  init_options = {
      gofumpt = true,
      usePlaceholders = true,
      semanticTokens = true,
      staticcheck = true,
      experimentalPostfixCompletions = true,
      hoverKind = 'Structured',
      analyses = {
        nilness = true,
        shadow = true,
        unusedparams = true,
        unusedwrite = true,
        fieldalignment = true
      },
      codelenses = {
        gc_details = true,
        tidy = true
      }
}
    }

if not lsp.golangcilsp then
 	configs.golangcilsp = {
		default_config = {
			cmd = {'golangci-lint-langserver'},
			root_dir = lsp.util.root_pattern('.git', 'go.mod'),
			init_options = {
					command = { "golangci-lint", "run", "--enable-all", "--disable", "lll", "--out-format", "json" };
			}
		};
	}
end

lsp.golangcilsp.setup {
	filetypes = {'go'}
}
