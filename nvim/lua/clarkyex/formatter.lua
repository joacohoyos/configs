-- local prettier = function()
-- 	return {
-- 		exe = "prettier",
-- 		args = {
-- 			"--write",
-- 			"--stdin-filepath",
-- 			vim.api.nvim_buf_get_name(0),
-- 		},
-- 		stdin = true,
-- 	}
-- end

local prettier = require("formatter.filetypes.javascript").prettier
local util = require("formatter.util")

local eslint = function()
	return {
		exe = "eslint_d",
		args = {
			"--stdin",
			"--stdin-filename",
			util.escape_path(util.get_current_buffer_file_path()),
			"--fix-to-stdout",
		},
		stdin = true,
		-- try_node_modules = true,
	}
end
-- local eslint = require("formatter.filetypes.javascript").eslint
-- print("hola", eslint().args)

local rustfmt = function()
	return {
		exe = "rustfmt",
		args = {
			"--edition 2021",
		},
		stdin = true,
	}
end

local black = function()
	return {
		exe = "black",
		args = { "-q", "-" },
		stdin = true,
	}
end

require("formatter").setup({
	logging = true,
	filetype = {
		javascript = { prettier, eslint },
		javascriptreact = { prettier, eslint },
		typescript = { prettier, eslint },
		typescriptreact = { prettier, eslint },
		json = { prettier },
		rust = {
			rustfmt,
		},
		go = {
			-- require("formatter.filetypes.go").gofmt,
			-- require("formatter.filetypes.go").goimports,
			require("formatter.filetypes.go").golines,
		},
		python = {
			black,
			-- require("formatter.filetypes.python").isort,
		},
		lua = { require("formatter.filetypes.lua").stylua },
		java = { require("formatter.filetypes.java").clangformat },
	},
})

vim.api.nvim_exec(
	[[
augroup FormatAutogroup
  autocmd!
  autocmd BufWritePost  *.java,*.js,*.jsx,*.ts,*.tsx,*.py,*.rs,*.lua,*.go FormatWrite
augroup END
]],
	true
)
