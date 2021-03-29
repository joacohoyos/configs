local prettier = function()
  return {
    exe = "prettier",
    args = {
      "--stdin", "--stdin-filepath", vim.api.nvim_buf_get_name(0)
    },
    stdin = true
  }
end

local eslint = function()
  return {
    exe = "eslint",
    args = {"--stdin-filename", vim.api.nvim_buf_get_name(0), "--fix", "--cache"},
    stdin = false
  }
end

require('formatter').setup({
  logging = false,
  filetype = {
    javascript = {prettier, eslint},
    javascriptreact = {prettier, eslint},
    typescript = {prettier, eslint},
    typescriptreact = {prettier, eslint},
  }
})

vim.api.nvim_exec([[
augroup FormatAutogroup
  autocmd!
  autocmd BufWritePost *.js,*.jsx,*.ts,*.tsx FormatWrite
augroup END
]], true)
