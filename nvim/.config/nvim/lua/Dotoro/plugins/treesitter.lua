return {
	"nvim-treesitter/nvim-treesitter",
	build = ":TSUpdate",
	event = { "BufReadPre", "BufNewFile" },
	dependencies = {
		"nvim-treesitter/nvim-treesitter-textobjects",
	},
	config = function()
		require("nvim-treesitter.configs").setup({
			-- 자동으로 설치할 언어들
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
			},

			sync_install = false,

			modules = {},

			ignore_install = {},

			-- 파일 열 때 자동으로 언어 파서 설치
			auto_install = true,

			-- 구문 강조 활성화
			highlight = {
				enable = true,
				additional_vim_regex_highlighting = false,
			},

			-- 들여쓰기 개선
			indent = {
				enable = true,
			},

			-- 증분 선택
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
						["av"] = "@assignment.rhs",
						["iv"] = "@assignment.rhs",
					},
				},
			},
		})
	end,
}
