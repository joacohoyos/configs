local lsp = require'lspconfig'

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
