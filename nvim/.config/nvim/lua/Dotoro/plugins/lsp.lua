return {
	"neovim/nvim-lspconfig",
	dependencies = {
		{
			"folke/lazydev.nvim",
			ft = "lua", -- only load on lua files
			opts = {
				library = {
					-- See the configuration section for more details
					-- Load luvit types when the `vim.uv` word is found
					{ path = "${3rd}/luv/library", words = { "vim%.uv" } },
				},
			},
		},
	},

	config = function()
		local function disable_formatting(client)
			client.server_capabilities.documentFormattingProvider = false
			client.server_capabilities.documentRangeFormattingProvider = false
		end

		local capabilities = require("cmp_nvim_lsp").default_capabilities()
		local config = require("lspconfig")

		config.lua_ls.setup({ capabilities = capabilities })
		config.clangd.setup({ capabilities = capabilities })
		config.emmet.setup({ capabilities = capabilities, filetypes = { "html" } })

		config.ts_ls.setup({
			capabilities = capabilities,
			on_attach = function(client, bufnr)
				disable_formatting(client)
			end,
		})
		config.html.setup({
			capabilities = capabilities,
			on_attach = function(client, bufnr)
				disable_formatting(client)
			end,
		})
		config.cssls.setup({
			capabilities = capabilities,
			on_attach = function(client, bufnr)
				disable_formatting(client)
			end,
		})

		-- vim.lsp.enable('clangd')
	end,
}
