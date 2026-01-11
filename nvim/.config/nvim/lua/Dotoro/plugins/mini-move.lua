return {
	"nvim-mini/mini.move",
	config = function()
		require("mini.move").setup({
			mappings = {
                -- Move visual selection in Visual mode. Defaults are Alt (Meta) + hjkl.
                left = "<C-h>",
                right = "<C-l>",
                down = "<C-j>",
				up = "<C-k>",

				line_left = "<C-h>",
                line_right = "<C-l>",
                line_down = "<C-j>",
                line_up = "<C-k>",
			},
			options = {
				-- Automatically reindent selection during linewise vertical move
				reindent_linewise = true,
			},
		})
	end,
}
