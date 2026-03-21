return {
	{
		"mason-org/mason.nvim",
		opts = {},

		config = function()
			require("mason").setup()
		end,
	},
	{
		"mason-org/mason-lspconfig.nvim",
		dependencies = {
			{ "mason-org/mason.nvim", opts = {} },
			"neovim/nvim-lspconfig",
		},

		config = function()
			require("mason-lspconfig").setup({
				ensure_installed = {
					"lua_ls",
					"pyright",
					"clangd",
					"rust_analyzer",
					"bashls",
					"ts_ls",
					"eslint",
					"docker_language_server",
					"dockerls",
					"emmet_language_server",
					"html",
					"sqls",
					"gopls",
                    "cssls",
                    "tailwindcss",
				},
				automatic_installation = true,
				-- automatic_enable = false,
			})
		end,
	},
	{
		"WhoIsSethDaniel/mason-tool-installer.nvim",
		dependencies = { "williamboman/mason.nvim" },
		config = function()
			require("mason-tool-installer").setup({
				ensure_installed = {
					"prettierd",
					"prettier",
					"stylua",
					"eslint_d",
					"shfmt",
					"ruff",
					"sql-formatter",
					"golangci-lint",
				},
				auto_update = false,
			})
		end,
	},
}
