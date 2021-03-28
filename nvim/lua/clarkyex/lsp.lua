local capabilities = vim.lsp.protocol.make_client_capabilities()
capabilities.textDocument.completion.completionItem.snippetSupport = true

require'lspconfig'.cssls.setup { capabilities = capabilities, }

require'lspconfig'.html.setup { capabilities = capabilities, }

require'lspconfig'.tsserver.setup { capabilities = capabilities, }

require'lspconfig'.solargraph.setup { capabilities = capabilities, }

require'lspconfig'.jsonls.setup {
  capabilities = capabilities,
  commands = {
    Format = {
      function()
        vim.lsp.buf.range_formatting({},{0,0},{vim.fn.line("$"),0})
      end
    }
  }
}
