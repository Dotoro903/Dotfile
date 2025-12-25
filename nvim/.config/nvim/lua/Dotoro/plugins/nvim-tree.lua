local function my_on_attach(bufnr)
	local api = require("nvim-tree.api")

	local function opts(desc)
		return { desc = "nvim-tree: " .. desc, buffer = bufnr, noremap = true, silent = true, nowait = true }
	end

	-- default mappings
	api.config.mappings.default_on_attach(bufnr)

	-- custom mappings
	vim.keymap.set("n", "d", api.fs.trash, opts("trash"))
	vim.keymap.set("n", "D", api.fs.trash, opts("trash"))
end

return {
	"nvim-tree/nvim-tree.lua",
	version = "*",
	lazy = false,
	dependencies = {
		"nvim-tree/nvim-web-devicons",
	},
	keys = {
		{ "<leader>e", "<cmd>NvimTreeToggle<cr>", desc = "Toggle tree" },
		{ "<leader>E", "<cmd>NvimTreeFocus<cr>", desc = "Focus tree" },
		-- { "<leader>fe", "<cmd>NvimTreeFindFile<cr>", desc = "Reveal file in tree" },
	},
	config = function()
		require("nvim-tree").setup({
			on_attach = my_on_attach,
			hijack_netrw = false,
			disable_netrw = false,

			filters = {
				dotfiles = false,
				git_ignored = false,
			},
			view = {
				width = 34,
				side = "left",
				preserve_window_proportions = true,
			},
			ui = {
				confirm = {
					remove = true,
					trash = true,
					default_yes = false,
				},
			},
			trash = {
				cmd = "gio trash",
			},
		})
	end,
}
