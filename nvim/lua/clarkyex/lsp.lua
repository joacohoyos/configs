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
  handlers = {
      ["textDocument/definition"] = function(_, method, result)
      if result == nil or vim.tbl_isempty(result) then
         local _ = vim.lsp.log.info() and vim.lsp.log.info(method, 'No location found')
         return nil
      end


      if vim.tbl_islist(result) then
         vim.lsp.util.jump_to_location(result[1])
         if #result > 1 then
            local isReactDTs = false
            for key, value in pairs(result) do
               if string.match(value.uri, "react/index.d.ts") then
                  isReactDTs = true
			      break
               end
            end
            if not isReactDTs then
               vim.lsp.util.set_qflist(util.locations_to_items(result))
               vim.api.nvim_command("copen")
               vim.api.api.nvim_command("wincmd p")
            end
         end
      else
         vim.lsp.util.jump_to_location(result)
      end

   end
}
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
