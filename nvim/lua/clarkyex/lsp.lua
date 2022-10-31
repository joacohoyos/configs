vim.opt.completeopt = 'menuone,noselect'
vim.api.nvim_set_var('completion_matching_strategy_list', { 'exact', 'substring', 'fuzzy' })

vim.api.nvim_set_keymap('n', '<leader>vd', ':lua vim.lsp.buf.definition()<CR>', { noremap = true })
vim.api.nvim_set_keymap(
    'n',
    '<leader>vi',
    ':lua vim.lsp.buf.implementation()<CR>',
    { noremap = true }
)
vim.api.nvim_set_keymap(
    'n',
    '<leader>vsh',
    ':lua vim.lsp.buf.signature_help()<CR>',
    { noremap = true }
)
vim.api.nvim_set_keymap('n', '<leader>vrr', ':lua vim.lsp.buf.references()<CR>', {
    noremap = true,
})
vim.api.nvim_set_keymap('n', '<leader>vrn', ':lua vim.lsp.buf.rename()<CR>', { noremap = true })
vim.api.nvim_set_keymap('n', '<leader>vh', ':lua vim.lsp.buf.hover()<CR>', { noremap = true })
vim.api.nvim_set_keymap(
    'n',
    '<leader>vca',
    ':lua vim.lsp.buf.code_action()<CR>',
    { noremap = true }
)
vim.api.nvim_set_keymap(
    'n',
    '<leader>vsd',
    ':lua vim.diagnostic.open_float()<CR>',
    { noremap = true }
)
vim.api.nvim_set_keymap(
    'n',
    '<leader>vn',
    ':lua vim.diagnostic.goto_next()<CR>',
    { noremap = true }
)
vim.api.nvim_set_keymap(
    'n',
    '<leader>vll',
    ':lua vim.diagnostic.set_loclist()<CR>',
    { noremap = true }
)

local lsp = require('lspconfig')
local configs = require('lspconfig/configs')

-- For snippet support
local capabilities = vim.lsp.protocol.make_client_capabilities()
capabilities.textDocument.completion.completionItem.snippetSupport = true

local on_attach_no_warning = function(_, bufnr)
    vim.lsp.handlers['textDocument/publishDiagnostics'] =
        vim.lsp.with(vim.lsp.diagnostic.on_publish_diagnostics, {
            underline = false,
            virtual_text = false,
            signs = true,
            update_in_insert = false,
        })
end
-- configuring diagnostics
local custom_on_attach = function(_, bufnr)
    vim.lsp.handlers['textDocument/publishDiagnostics'] =
        vim.lsp.with(vim.lsp.diagnostic.on_publish_diagnostics, {
            underline = true,
            virtual_text = true,
            signs = true,
            update_in_insert = false,
        })
end

local react_on_attach = function(_, bufnr)
    custom_on_attach(_, bufnr)
    vim.lsp.handlers['textDocument/definition'] = function(a, method, result)
        if result == nil or vim.tbl_isempty(result) then
            print('empty')
            local _ = vim.lsp.log.info() and vim.lsp.log.info(method, 'No location found')
            return nil
        end
        print(a)
        -- for key, value in pairs(result) do
        --     print(key)
        --     print(value)
        -- end

        if vim.tbl_islist(result) then
            print('es')
            vim.lsp.util.jump_to_location(result[1], 'utf-16')
            if #result > 1 then
                local isReactDTs = false
                for key, value in pairs(result) do
                    if string.match(value.uri, 'react/index.d.ts') then
                        isReactDTs = true
                        break
                    end
                    if string.match(value.uri, 'next/types/global.d.ts') then
                        isReactDTs = true
                        break
                    end
                end
                print('isReact', isReactDTs)
                if not isReactDTs then
                    vim.lsp.util.set_qflist(util.locations_to_items(result))
                    vim.api.nvim_command('copen')
                    vim.api.api.nvim_command('wincmd p')
                end
            end
        else
            print('no es 33')
            r = vim.lsp.util.jump_to_location(result.params.textDocument, 'utf-8', true)
        end
    end
end

lsp.cssls.setup({
    on_attach = custom_on_attach,
    capabilities = capabilities,
})

lsp.html.setup({
    on_attach = custom_on_attach,
    capabilities = capabilities,
})

lsp.tsserver.setup({
    on_attach = custom_on_attach,
    init_options = {
        documentFormatting = false,
    },
    capabilities = capabilities,
})

lsp.solargraph.setup({
    on_attach = on_attach_no_warning,
    capabilities = capabilities,
})

lsp.jsonls.setup({
    on_attach = custom_on_attach,
    capabilities = capabilities,
    commands = {
        Format = {
            function()
                vim.lsp.buf.range_formatting({}, { 0, 0 }, { vim.fn.line('$'), 0 })
            end,
        },
    },
})

lsp.pylsp.setup({
    on_attach = custom_on_attach,
    capabilities = capabilities,
    init_options = {
        documentFormatting = false,
    },
})

lsp.rust_analyzer.setup({
    on_attach = custom_on_attach,
    capabilities = capabilities,
})

lsp.hls.setup({
    on_attach = custom_on_attach,
    capabilities = capabilities,
})

-- lsp.gopls.setup {
--   on_attach = custom_on_attach,
--   capabilities = capabilities,
--   init_options = {
--       gofumpt = true,
--       usePlaceholders = true,
--       semanticTokens = true,
--       staticcheck = true,
--       experimentalPostfixCompletions = true,
--       hoverKind = 'Structured',
--       analyses = {
--         nilness = true,
--         shadow = true,
--         unusedparams = true,
--         unusedwrite = true,
--         fieldalignment = true
--       },
--       codelenses = {
--         gc_details = true,
--         tidy = true
--       }
-- }
--     }

-- if not lsp.golangcilsp then
--  	configs.golangcilsp = {
-- 		default_config = {
-- 			cmd = {'golangci-lint-langserver'},
-- 			root_dir = lsp.util.root_pattern('.git', 'go.mod'),
-- 			init_options = {
-- 					command = { "golangci-lint", "run", "--enable-all", "--disable", "lll", "--out-format", "json" };
-- 			}
-- 		};
-- 	}
-- end

-- lsp.golangcilsp.setup {
-- 	filetypes = {'go'}
-- }

-- lsp.solc.setup{
--   cmd = {"solc", "--lsp"}
-- }
