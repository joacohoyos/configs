local capabilities = vim.lsp.protocol.make_client_capabilities()
capabilities.textDocument.completion.completionItem.snippetSupport = true

local lsp = require'lspconfig'

lsp.cssls.setup { capabilities = capabilities, }

lsp.html.setup { capabilities = capabilities, }


lsp.tsserver.setup { 
  init_options = {
      documentFormatting = false,
  },
  capabilities = capabilities, 
}

lsp.solargraph.setup { capabilities = capabilities, }

lsp.jsonls.setup {
  capabilities = capabilities,
  commands = {
    Format = {
      function()
        vim.lsp.buf.range_formatting({},{0,0},{vim.fn.line("$"),0})
      end
    }
  }
}

local eslint = {
  lintCommand = "./node_modules/.bin/eslint -f unix --stdin --stdin-filename ${INPUT}",
  lintStdin = true,
  lintFormats = { "%f:%l:%c: %m" },
  lintIgnoreExitCode = true,
  formatCommand = "./node_modules/.bin/eslint --fix-to-stdout --stdin --stdin-filename=${INPUT}",
  formatStdin = true,
}

lsp.efm.setup({
  filetypes = {
    "typescript","javascript","typescriptreact","javascriptreact"
  },
  on_attach = custom_on_attach,
  root_dir = function(fname)
    return lsp.util.find_git_ancestor(fname) or vim.loop.os_homedir()
  end,
  init_options = { documentFormatting = true },
  settings = {
    rootMarkers = { ".git/" },
    languages = {
      typescript = { eslint },
      javascript = { eslint },
      javascriptreact = { eslint },
      typescriptreact = { eslint },
    },
  },
})
