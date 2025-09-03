return {
	"mfussenegger/nvim-lint",
	config = function()
		local lint = require('lint')
		lint.linters_by_ft = {
			sh = { "shellcheck" },
		}
		vim.api.nvim_create_autocmd({ "BufWritePost", "InsertLeave", "BufEnter" }, {
			callback = function()
				lint.try_lint()
			end,
		})
	end,
}
