return {
	"nvim-treesitter/nvim-treesitter",
	build = ":TSUpdate",
	event = { "BufReadPre", "BufNewFile" },
	dependencies = {
		"nvim-treesitter/nvim-treesitter-textobjects",
	},
	priority = 1000,
	config = function()
		require("nvim-treesitter.configs").setup({
			ensure_installed = {
				"c",
				"cpp",
				"lua",
				"vim",
				"vimdoc",
				"query",
				"javascript",
				"typescript",
				"python",
				"rust",
				"go",
				"html",
				"css",
				"json",
				"yaml",
				"markdown",
				"tsx",
			},
			sync_install = false,
			modules = {},
			ignore_install = {},

			auto_install = true,

			highlight = {
				enable = true,
				additional_vim_regex_highlighting = false,
			},
			indent = {
				enable = true,
			},

			incremental_selection = {
				enable = true,
				keymaps = {
					init_selection = "gnn",
					node_incremental = "grn",
					scope_incremental = "grc",
					node_decremental = "grm",
				},
			},

			textobjects = {
				select = {
					enable = true,
					lookahead = true,
					keymaps = {
						["af"] = "@function.outer",
						["if"] = "@function.inner",

						["ar"] = "@block.outer",
						["ir"] = "@block.inner",

						["av"] = "@assignment.rhs",
						["iv"] = "@assignment.rhs",
					},
				},
			},
		})
	end,
}
