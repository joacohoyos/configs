local prettier = function()
	return {
		exe = "prettier",
		args = {
			"--write",
			"--stdin-filepath",
			vim.api.nvim_buf_get_name(0),
		},
		stdin = true,
	}
end

local eslint = function()
	return {
		exe = "eslint",
		args = {
			"--stdin-filename",
			vim.api.nvim_buf_get_name(0),
			"--fix",
			"--cache",
		},
		stdin = false,
	}
end

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
		args = { "--line-length 80", "-q", "-" },
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
		rust = {
			rustfmt,
		},
		python = {
			black,
			require("formatter.filetypes.python").isort,
		},
		lua = { require("formatter.filetypes.lua").stylua },
	},
})

vim.api.nvim_exec(
	[[
augroup FormatAutogroup
  autocmd!
  autocmd BufWritePost *.js,*.jsx,*.ts,*.tsx,*.py,*.rs,*.lua FormatWrite
augroup END
]],
	true
)
