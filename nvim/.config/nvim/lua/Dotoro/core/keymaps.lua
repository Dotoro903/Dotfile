vim.g.mapleader = " "
vim.g.maplocalleader = " "


vim.keymap.set("v", "J", ":m '>+1<CR>gv=gv", { noremap = true, silent = true, desc = "Move line down" })

vim.keymap.set("n", "<leader>w", ":w<CR>", { noremap = true, silent = true, desc = "Save file" })

vim.keymap.set("i", "<C-BS>", "<C-W>", { noremap = true, silent = true })
vim.keymap.set("i", "<C-H>", "<C-W>", { noremap = true, silent = true })

-- Format
--vim.keymap.set("n", '<leader>c', vim.lsp.buf.format, { noremap = true, silent = true })
vim.keymap.set("n", "<leader>c", function()
	require("conform").format({ lsp_fallback = true })
end)

vim.keymap.set("n", "<leader>nn", ":noh<CR>", { noremap = true, silent = true })

vim.keymap.set({ "n", "v" }, "gg", "gg_", { noremap = true, silent = true })
vim.keymap.set({ "n", "v" }, "G", "Gg_", { noremap = true, silent = true })

vim.keymap.set("n", "<leader><CR>", "o<ESC>", { noremap = true })

-- autocomplete
vim.keymap.set("i", "<C-Space>", "<C-x><C-o>", { noremap = true, silent = true, desc = "Trigger completion" })
-- vim.keymap.set('i', '<C-j>', '<C-n>', { noremap = true, silent = true, desc = 'Next completion' })
-- vim.keymap.set('i', '<C-k>', '<C-p>', { noremap = true, silent = true, desc = 'Previous completion' })
vim.keymap.set("i", "<C-o>", "<C-y>", { noremap = true, silent = true, desc = "Select completion" })

-- tab control
vim.keymap.set("n", "<A-L>", ":vsp<CR>", { noremap = true, silent = true })
vim.keymap.set("n", "<A-W>", ":vsp<CR>", { noremap = true, silent = true })

vim.keymap.set(
	"n",
	"<leader>q",
	":lua vim.diagnostic.open_float()<CR>",
	{ noremap = true, silent = true, desc = "Open diagnose" }
)

vim.keymap.set("n", "<leader>ls", function() require("Dotoro.live").start() end)
vim.keymap.set("n", "<leader>lS", function() require("Dotoro.live").stop() end)
