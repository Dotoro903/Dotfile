return {
	"akinsho/toggleterm.nvim",
	version = "*",
	opts = {},
	keys = {
		{ "<C-BS>", ":ToggleTerm<CR>", desc = "Toggle terminal" },
		{ "<C-BS>", [[<C-\><C-n><cmd>ToggleTerm<CR>]], desc = "Toggle terminal", mode = "t" },
		{ "<Esc>", [[<C-\><C-n>]], desc = "Terminal -> Normal", mode = "t" },
	},
}
