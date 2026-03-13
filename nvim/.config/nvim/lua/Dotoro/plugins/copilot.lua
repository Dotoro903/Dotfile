return {
	{
		"zbirenbaum/copilot.lua",
		event = "VeryLazy",
		config = function()
			Suggestion = require("copilot.suggestion")
			require("copilot").setup({
				suggestion = {
					enabled = true,
					auto_trigger = false,
					accept = false,
				},
				panel = {
					enabled = false,
				},
				filetypes = {
					markdown = true,
					help = true,
					html = true,
					javascript = true,
					typescript = true,
					["*"] = true,
				},
			})
			vim.keymap.set("i", "<C-y>", "<cmd>Copilot suggestion toggle_auto_trigger<CR>", { desc = "Toggle Copilot" })
			vim.keymap.set("i", "<C-p>", "<cmd>Copilot panel<CR>", { desc = "Toggle Copilot" })
			vim.keymap.set("i", "<C-.>", function()
				if Suggestion.is_visible() then
					Suggestion.accept()
				else
					vim.api.nvim_feedkeys(vim.api.nvim_replace_termcodes("<C-.>", true, false, true), "n", false)
				end
			end, {
				silent = true,
			})
			vim.keymap.set("i", "<C-,>", function()
				if Suggestion.is_visible() then
					Suggestion.accept_word()
				else
					vim.api.nvim_feedkeys(vim.api.nvim_replace_termcodes("<C-.>", true, false, true), "n", false)
				end
			end, {
				silent = true,
			})
		end,
	},
	{
		"CopilotC-Nvim/CopilotChat.nvim",
		dependencies = {
			{ "nvim-lua/plenary.nvim", branch = "master" },
		},
		build = "make tiktoken",
		opts = {
			-- See Configuration section for options
		},
		keys = {
			{ "<leader>aa", "<cmd>CopilotChatToggle<cr>", desc = "Open Copilot Chat" },
			{
				"<leader>ae",
				":'<,'>CopilotChatExplain<cr>",
				mode = "v",
			},
			{
				"<leader>ad",
				":'<,'>CopilotChatDocs<cr>",
				mode = "v",
			},
			{
				"<leader>ao",
				":'<,'>CopilotChatOptimize<cr>",
				mode = "v",
			},
			{
				"<leader>ar",
				":'<,'>CopilotChatReview<cr>",
				mode = "v",
			},
			{
				"<leader>af",
				":'<,'>CopilotChatFix<cr>",
				mode = "v",
			},
			{
				"<leader>ac",
				":CopilotChatCommit<cr>",
				mode = "n",
			},
			{
				"<leader>aR",
				":CopilotChatReset<cr>",
				mode = "n",
			},
			-- Add or change mappings as you like
		},
	},
}
