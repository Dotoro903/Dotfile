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

		-- local config = require("lspconfig")
		local capabilities = require("cmp_nvim_lsp").default_capabilities()
		capabilities.workspace = capabilities.workspace or {}
		capabilities.workspace.didChangeWatchedFiles = { dynamicRegistration = true }

		vim.lsp.config["lua_ls"] = { capabilities = capabilities }
		vim.lsp.config["clangd"] = { capabilities = capabilities }
		vim.lsp.config["emmet_language_server"] = { capabilities = capabilities }
		vim.lsp.config["docker_language_server"] = { capabilities = capabilities }
		vim.lsp.config["dockerls"] = { capabilities = capabilities }
		vim.lsp.config["sql"] = { capabilities = capabilities }

		vim.lsp.config["pyright"] = {
			capabilities = capabilities,
		}

		vim.lsp.config["ts_ls"] = {
			capabilities = capabilities,
			on_attach = function(client, bufnr)
				disable_formatting(client)
			end,
			settings = {
				ts_ls = {
					quiet = true,
				},
			},
		}
		vim.lsp.config["html"] = {
			capabilities = capabilities,
			on_attach = function(client, bufnr)
				disable_formatting(client)
			end,
		}
		vim.lsp.config["cssls"] = {
			capabilities = capabilities,
			on_attach = function(client, bufnr)
				disable_formatting(client)
			end,
			settings = {
				css = {
					lint = {
						unknownAtRules = "ignore",
					},
				},
			},
		}
		vim.lsp.config["eslint"] = {
			capabilities = capabilities,
			on_attach = function(client, bufnr)
				disable_formatting(client)
			end,
			settings = {
				eslint = {
					quiet = true,
				},
			},
		}
		vim.diagnostic.config({
			virtual_text = true,
		})
	end,
}
