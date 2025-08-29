return {
    "HiPhish/rainbow-delimiters.nvim",
    config = function()
        vim.api.nvim_set_hl(0, 'RainbowDelimiterRed', { fg = '#d177a6' }) -- 
        vim.api.nvim_set_hl(0, 'RainbowDelimiterOrange', { fg = '#569CD6' })
        vim.api.nvim_set_hl(0, 'RainbowDelimiterYellow', { fg = '#C586C0' })
        vim.api.nvim_set_hl(0, 'RainbowDelimiterGreen', { fg = '#ff79c6' })
        vim.api.nvim_set_hl(0, 'RainbowDelimiterCyan', { fg = '#9e89b8' }) --
        vim.api.nvim_set_hl(0, 'RainbowDelimiterBlue', { fg = '#ff6e6e' }) -- 
        vim.api.nvim_set_hl(0, 'RainbowDelimiterViolet', { fg = '#d2db27' }) --

        require('rainbow-delimiters.setup').setup {
            strategy = {
                [''] = require('rainbow-delimiters').strategy['global'],
                vim = require('rainbow-delimiters').strategy['local'],
            },
            query = {
                [''] = 'rainbow-delimiters',
                lua = 'rainbow-blocks',
            },
            priority = {
                [''] = 110,
                lua = 210,
            },
            highlight = {
                --'RainbowDelimiterRed',
                --'RainbowDelimiterYellow',
                'RainbowDelimiterBlue',
                'RainbowDelimiterOrange',
                --'RainbowDelimiterGreen',
                --'RainbowDelimiterViolet',
                --'RainbowDelimiterCyan',
            },
        }
    end
}
