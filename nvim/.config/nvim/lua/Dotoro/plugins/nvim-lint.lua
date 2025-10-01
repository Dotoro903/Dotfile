return {
	"mfussenegger/nvim-lint",
	config = function()
		local lint = require("lint")
		lint.linters_by_ft = {
			sh = { "shellcheck" },
			-- python = { "pylint" },
			javascript = { "eslint_d" },
		}
		vim.api.nvim_create_autocmd({ "BufWritePost", "InsertLeave", "BufEnter" }, {
			callback = function()
				lint.try_lint()
			end,
		})

		lint.linters.shellcheck.args = { "-x" }
	end,
}
