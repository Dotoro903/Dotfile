return {
    "stevearc/conform.nvim",
    config = function()
        require("conform").setup({

            format_on_save = { lsp_format = "fallback", timeout_ms = 2000 },

            formatters_by_ft = {
                lua        = { "stylua" },
                -- Conform will run multiple formatters sequentially
                python     = { "isort", "black" },
                -- You can customize some of the format options for the filetype (:help conform.format)
                rust       = { "rustfmt", lsp_format = "fallback" },
                -- Conform will run the first available formatter
                javascript = { "prettierd", "prettier", stop_after_first = true },
                typescript = { "prettierd", "prettier"},
                json       = { "prettierd", "prettier"},
                html       = { "prettierd", "prettier"},
                css        = { "prettierd", "prettier"},
                markdown   = { "prettierd", "prettier"},
                yaml       = { "prettierd", "prettier"},

                java = { "clang-format" },

                c          = { "clang-format" },
                cpp        = { "clang-format" },
            },
        })
    end,
}
