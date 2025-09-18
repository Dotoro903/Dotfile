return {
	"stevearc/conform.nvim",
	config = function()
		require("conform").setup({

			-- format_on_save = { lsp_format = "fallback", timeout_ms = 2000 },
			format_on_save = nil,

			formatters_by_ft = {
                -- stylua: ignore start
				lua             = { "stylua" },
				python          = { "isort", "black" },
				rust            = { "rustfmt", lsp_format = "fallback" },
				javascript      = { "prettierd", "prettier" },
				typescript      = { "prettierd", "prettier" },
				json            = { "prettierd", "prettier" },
				html            = { "prettierd", "prettier" },
				css             = { "prettierd", "prettier" },
				markdown        = { "prettierd", "prettier" },
				yaml            = { "prettierd", "prettier" },
                typescriptreact = { "prettierd", "prettier" },
                javascriptreact = { "prettierd", "prettier" },


				sh              = { "shfmt" },
				bash            = { "shfmt" },
				zsh             = { "shfmt" },

				java            = { "clang-format" },

				c               = { "clang-format" },
				cpp             = { "clang-format" },
				-- stylua: ignore end
			},
		})
	end,
}
