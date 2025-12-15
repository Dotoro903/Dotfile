return {
    'akinsho/bufferline.nvim',
    version = "*",
    dependencies = 'nvim-tree/nvim-web-devicons',
    config = function()
        vim.opt.termguicolors = true
        require("bufferline").setup {
            -- buffer cycle
            vim.keymap.set('n', '<A-h>', ':BufferLineCyclePrev<CR>', { silent = true } ),
            vim.keymap.set('n', '<A-l>', ':BufferLineCycleNext<CR>', { silent = true } ),
            -- buffer close
            vim.keymap.set('n', '<A-w>', ':bd'),
            -- buffer select jump
            vim.keymap.set('n', '<A-1>', ':BufferLineGoToBuffer 1<CR>', { silent = true } ),
            vim.keymap.set('n', '<A-2>', ':BufferLineGoToBuffer 2<CR>', { silent = true } ),
            vim.keymap.set('n', '<A-3>', ':BufferLineGoToBuffer 3<CR>', { silent = true } ),
            vim.keymap.set('n', '<A-4>', ':BufferLineGoToBuffer 4<CR>', { silent = true } ),
            vim.keymap.set('n', '<A-5>', ':BufferLineGoToBuffer 5<CR>', { silent = true } ),
            vim.keymap.set('n', '<A-6>', ':BufferLineGoToBuffer 6<CR>', { silent = true } ),
            vim.keymap.set('n', '<A-7>', ':BufferLineGoToBuffer 7<CR>', { silent = true } ),
            vim.keymap.set('n', '<A-8>', ':BufferLineGoToBuffer 8<CR>', { silent = true } ),
            vim.keymap.set('n', '<A-9>', ':BufferLineGoToBuffer 9<CR>', { silent = true } ),
            vim.keymap.set('n', '<A-0>', ':BufferLineGoToBuffer 10<CR>', { silent = true } ),
            options = {
                numbers = "ordinal",
            }
        }
    end
}
