return {
	"neovim/nvim-lspconfig", -- kept only as a source of server definitions (cmd/filetypes/root_markers)
	dependencies = {
		{
			"folke/lazydev.nvim",
			ft = "lua",
			opts = {
				library = {
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

		local capabilities = require("blink.cmp").get_lsp_capabilities()
		capabilities.workspace = capabilities.workspace or {}
		capabilities.workspace.didChangeWatchedFiles = { dynamicRegistration = true }

		local servers = {
			"lua_ls",
			"clangd",
			"docker_language_server",
			"dockerls",
			"sql",
			"pyright",
		}
		for _, name in ipairs(servers) do
			vim.lsp.config[name] = { capabilities = capabilities }
		end

		vim.lsp.config["emmet_language_server"] = {
			capabilities = capabilities,
			filetypes = { "html", "css", "tsx", "jsx", "typescriptreact", "javascriptreact" },
		}

		vim.lsp.config["ts_ls"] = {
			capabilities = capabilities,
			on_attach = function(client, bufnr)
				disable_formatting(client)
			end,
			settings = {
				ts_ls = { quiet = true },
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
				css = { lint = { unknownAtRules = "ignore" } },
			},
		}

		vim.lsp.config["eslint"] = {
			capabilities = capabilities,
			on_attach = function(client, bufnr)
				disable_formatting(client)
			end,
			settings = {
				eslint = { quiet = true },
			},
		}

		-- explicitly enable everything you just configured
		vim.lsp.enable({
			"lua_ls",
			"clangd",
			"docker_language_server",
			"dockerls",
			"sql",
			"pyright",
			"emmet_language_server",
			"ts_ls",
			"html",
			"cssls",
			"eslint",
		})

		vim.diagnostic.config({
			virtual_text = true,
		})
	end,
}
