return {
	{
		"L3MON4D3/LuaSnip",
		version = "v2.*",
		build = "make install_jsregexp",
		config = function()
			require("luasnip.loaders.from_vscode").lazy_load()
			require("luasnip.loaders.from_lua").load({ paths = "~/.config/nvim/lua/Dotoro/snippets" })
		end,
	},
	{
		"saghen/blink.cmp",
		version = "1.*",
		dependencies = { "L3MON4D3/LuaSnip" },
		opts_extend = { "sources.default" },
		opts = {
			-- "super-tab" preset replicates your old Tab/S-Tab behavior:
			-- Tab expands/jumps snippet if possible, else selects next item, else inserts tab
			keymap = {
				preset = "default",
				["<CR>"] = { "select_and_accept", "fallback" },
			},

			snippets = { preset = "luasnip" },

			completion = {
				documentation = { auto_show = true, auto_show_delay_ms = 200 },
				menu = { border = "rounded" },
				list = { selection = { preselect = false } },
			},

			sources = {
				default = { "lsp", "path", "snippets", "buffer" },
				providers = {
					lsp = {
						-- your emmet-allow-Text-kind filter, ported
						transform_items = function(_, items)
							return vim.tbl_filter(function(item)
								local client = vim.lsp.get_client_by_id(item.client_id)
								if client and client.name == "emmet_language_server" then
									return true
								end
								return item.kind ~= require("blink.cmp.types").CompletionItemKind.Text
							end, items)
						end,
					},
				},
			},
		},
	},
}
