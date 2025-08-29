return {
    {
        "nvim-neo-tree/neo-tree.nvim",
        branch = "v3.x",
        dependencies = {
            "nvim-lua/plenary.nvim",
            "MunifTanjim/nui.nvim",
            "nvim-tree/nvim-web-devicons", -- optional, but recommended
        },
        lazy = false,                      -- neo-tree will lazily load itself
        opts = {
            window = {
                position = "left",
                width = 30,
            },
            hijack_netrw_behavior = "disabled",
            auto_restore_session_directory = false,
        },

        keys = {
            vim.keymap.set("n", '<leader>e', ':Neotree filesystem toggle<CR>')
        }
    }
}
