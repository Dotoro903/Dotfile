return {
    {
        "mason-org/mason.nvim",
        opts = {},

        config = function()
            require('mason').setup()
        end
    },
    {
        "mason-org/mason-lspconfig.nvim",
        dependencies = {
            { "mason-org/mason.nvim", opts = {} },
            "neovim/nvim-lspconfig",
        },

        config = function()

            require('mason-lspconfig').setup({
                ensure_installed = { 'lua_ls', 'pyright', 'clangd', 'rust_analyzer' },
                automatic_installation = true,
            })
        end
    }
}
