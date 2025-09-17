return {
    "catppuccin/nvim",
    name = "catppuccin",
    priority = 1000,
    config = function()
        require("catppuccin").setup({
            flavour = "auto", -- latte, frappe, macchiato, mocha
            background = {    -- :h background
                light = "latte",
                dark = "mocha",
            },
            transparent_background = false, -- disables setting the background color.
            float = {
                transparent = false,        -- enable transparent floating windows
                solid = false,             -- use solid styling for floating windows, see |winborder|
            },
            show_end_of_buffer = false,    -- shows the '~' characters after the end of buffers
            term_colors = true,            -- sets terminal colors (e.g. `g:terminal_color_0`)
            dim_inactive = {
                enabled = false,           -- dims the background color of inactive window
                shade = "dark",
                percentage = 0.15,         -- percentage of the shade to apply to the inactive window
            },
            no_italic = false,             -- Force no italic
            no_bold = false,               -- Force no bold
            no_underline = false,          -- Force no underline
            styles = {                     -- Handles the styles of general hi groups (see `:h highlight-args`):
                comments = { "italic" },   -- Change the style of comments
                conditionals = { "italic" },
                loops = {},
                functions = {},
                keywords = {},
                strings = {},
                variables = {},
                numbers = {},
                booleans = {},
                properties = {},
                types = {},
                operators = {},
                -- miscs = {}, -- Uncomment to turn off hard-coded styles
            },
            color_overrides = {
                mocha = {
                    --base = "#1b1a22",
                    --mantle = "#252333",
                    --text = "#e6e6f0",
                }
            },
            custom_highlights = {

            },

            highlight_overrides = {
                mocha = function(mocha)
                    return {
                        String = { fg = "#e4846a" },
                        Number = { fg = "#e2595d" },
                        Constant = { fg = '#e0def4'},
                        Function = { fg = "#bb9eff" },
                        Type = { fg = "#ebbce7" },

                        Import = { fg = "#C586C0" },
                        ['@keyword.import.cpp'] = { fg = "#C586C0" },
                        ['@keyword.import'] = { fg = "#C586C0" },

                        PreProc = { fg = '#C586C0' },
                        Keyword = { fg = "#b2d3db" },
                        ['@type.builtin'] = { fg = "#89b4f4" },
                        Visual = { bg = "#612d57" },
                        ['@variable.parameter'] = { fg = "#9c96eb", italic = true},
                        ['@tag.attribute'] = { fg = "#9c96eb" },
                        ['@variable'] = { fg = "#e0def4" },
                        ['@function.builtin'] = { fg = '#f38ba8' },

                        Comment = { fg = "#6C6C8C"},

                        Repeat = { fg = "#89b4f4" },
                        Conditional = { fg = "#89b4f4" },
                        ['@keyword.return'] = { fg = "#89b4f4" },
                        Operator = { fg = '#e6e6f0' },

                    }
                end
            },
            default_integrations = true,
            auto_integrations = false,
            integrations = {
                cmp = true,
                gitsigns = true,
                nvimtree = true,
                treesitter = true,
                notify = false,
                mini = {
                    enabled = true,
                    indentscope_color = "",
                },
                -- For more plugins integrations please scroll down (https://github.com/catppuccin/nvim#integrations)
            },
        })

        -- setup must be called before loading
        vim.api.nvim_set_hl(0, '@keyword.import.cpp', { link = 'Import' })
        vim.api.nvim_set_hl(0, '@keyword.import', { link = 'Import' })

        vim.cmd.colorscheme "catppuccin"
    end,
}
