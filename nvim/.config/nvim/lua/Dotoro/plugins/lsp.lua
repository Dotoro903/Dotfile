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
        local capabilities = require('cmp_nvim_lsp').default_capabilities()
        local config = require("lspconfig")

        config.lua_ls.setup({ capabilities = capabilities })
        config.clangd.setup({ capabilities = capabilities })
        config.ts_ls.setup({ capabilities = capabilities })

        -- vim.lsp.enable('clangd')
    end,

}
