vim.g.mapleader = " "
vim.g.maplocalleader = " "

vim.keymap.set("i", "<C-BS>", "<C-W>", { noremap = true, silent = true })
vim.keymap.set("i", "<C-H>", "<C-W>", { noremap = true, silent = true })

-- Format
--vim.keymap.set("n", '<leader>c', vim.lsp.buf.format, { noremap = true, silent = true })
vim.keymap.set("n", "<leader>c", function()
	require("conform").format({ lsp_fallback = true })
end)

vim.keymap.set("n", "<leader>nn", ":noh<CR>", { noremap = true, silent = true })

vim.keymap.set("n", "]c", "`]", { noremap = true })
vim.keymap.set("n", "[c", "`[", { noremap = true })

vim.keymap.set("n", "<leader><CR>", "o<ESC>", { noremap = true })

-- autocomplete
vim.keymap.set("i", "<C-Space>", "<C-x><C-o>", { noremap = true, silent = true, desc = "Trigger completion" })
vim.keymap.set("i", "<C-o>", "<C-y>", { noremap = true, silent = true, desc = "Select completion" })

-- tab control
vim.keymap.set("n", "<A-L>", ":vsp<CR>", { noremap = true, silent = true })
vim.keymap.set("n", "<A-J>", ":split<CR>", { noremap = true, silent = true })
vim.keymap.set("n", "<A-W>", ":vsp<CR>", { noremap = true, silent = true })

-- Move split focus
vim.keymap.set("n", "<C-A-h>", "<C-w>h", { noremap = true, silent = true })
vim.keymap.set("n", "<C-A-j>", "<C-w>j", { noremap = true, silent = true })
vim.keymap.set("n", "<C-A-k>", "<C-w>k", { noremap = true, silent = true })
vim.keymap.set("n", "<C-A-l>", "<C-w>l", { noremap = true, silent = true })

vim.keymap.set(
	"n",
	"<leader>q",
	":lua vim.diagnostic.open_float()<CR>",
	{ noremap = true, silent = true, desc = "Open diagnose" }
)

vim.keymap.set("n", "<leader>ls", ":LiveServerStart<CR>", { noremap = true, silent = true })
vim.keymap.set("n", "<leader>lS", ":LiveServerStop<CR>", { noremap = true, silent = true })

vim.keymap.set("n", "<leader>aa", ":CopilotChatToggle<CR>", { noremap = true, silent = true })

vim.api.nvim_set_keymap("n", "gD", "<cmd>lua vim.lsp.buf.declaration()<CR>", { noremap = true, silent = true })
vim.api.nvim_set_keymap("n", "gd", "<cmd>lua vim.lsp.buf.definition()<CR>", { noremap = true, silent = true })
