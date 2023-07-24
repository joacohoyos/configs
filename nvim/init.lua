require("paq")({
	{ "savq/paq-nvim", opt = true },
	"github/copilot.vim",
	"morhetz/gruvbox",
	"gruvbox-community/gruvbox",
	"tpope/vim-fugitive",
	"tpope/vim-surround",
	"edkolev/tmuxline.vim",
	"alvan/vim-closetag",
	"mhartington/formatter.nvim",
	"frazrepo/vim-rainbow",
	"szw/vim-maximizer",
	"ThePrimeagen/harpoon",
	"nvim-lua/popup.nvim",
	"nvim-telescope/telescope.nvim",
	{ "nvim-telescope/telescope-fzf-native.nvim", run = "make" },
	{ "nvim-treesitter/nvim-treesitter", run = ":TSUpdate" },
	"itchyny/lightline.vim",
	"kyazdani42/nvim-tree.lua",
	"kyazdani42/nvim-web-devicons",
	"vim-test/vim-test",
	"joacohoyos/rest.nvim",
	"joacohoyos/plenary.nvim",
	"simrat39/rust-tools.nvim",
	"zivyangll/git-blame.vim",
	"numToStr/Comment.nvim",
	"ThePrimeagen/refactoring.nvim",
	"JoosepAlviste/nvim-ts-context-commentstring",
	"joacohoyos/directory.nvim",
	-- LSP
	{ "VonHeikemen/lsp-zero.nvim", branch = "v1.x" },
	{ "neovim/nvim-lspconfig" },
	{ "williamboman/mason.nvim" },
	{ "williamboman/mason-lspconfig.nvim" },
	{ "mfussenegger/nvim-jdtls", ft = { "java" } },
	-- Aiken
	"aiken-lang/editor-integration-nvim",
	-- Autocompletion
	{ "hrsh7th/nvim-cmp" },
	{ "hrsh7th/cmp-nvim-lsp" },
	{ "hrsh7th/cmp-buffer" },
	{ "hrsh7th/cmp-path" },
	{ "saadparwaiz1/cmp_luasnip" },
	{ "hrsh7th/cmp-nvim-lua" },
	-- Snippets
	{ "L3MON4D3/LuaSnip" },
	{ "rafamadriz/friendly-snippets" },
	{
		"iamcco/markdown-preview.nvim",
		run = function()
			vim.fn["mkdp#util#install"]()
		end,
	},
})

vim.keymap.set("i", "<leader>vsh", function()
	vim.lsp.buf.signature_help()
end, opts)
require("common")
require("clarkyex")

vim.cmd("autocmd BufRead,BufNewFile *.env.* set filetype=sh")
vim.cmd("autocmd FileType lua setlocal shiftwidth=4 tabstop=4")
vim.cmd("autocmd FileType lua setlocal shiftwidth=5 tabstop=4")
vim.cmd("autocmd FileType lua setlocal shiftwidth=5 tabstop=4")
