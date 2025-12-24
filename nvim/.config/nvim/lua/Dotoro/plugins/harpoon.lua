return {
	{
		"theprimeagen/harpoon",
		branch = "harpoon2",
		dependencies = { "nvim-lua/plenary.nvim" },
		config = function()
			require("harpoon"):setup()
		end,
		keys = {
			{
				"<leader>M",
				function()
					require("harpoon"):list():add()
				end,
				desc = "harpoon file",
			},
			{
				"<leader>m",
				function()
					local harpoon = require("harpoon")
					harpoon.ui:toggle_quick_menu(harpoon:list())
				end,
				desc = "harpoon quick menu",
			},
            
            
            
			{
				"<leader>h1",
				function()
					require("harpoon"):list():replace_at(1)
				end,
				desc = "add file to 1",
			},
			{
				"<leader>h2",
				function()
					require("harpoon"):list():replace_at(2)
				end,
				desc = "add file to 2",
			},
			{
				"<leader>h3",
				function()
					require("harpoon"):list():replace_at(3)
				end,
				desc = "add file to 3",
			},
			{
				"<leader>h4",
				function()
					require("harpoon"):list():replace_at(4)
				end,
				desc = "add file to 4",
			},
			{
				"<leader>h5",
				function()
					require("harpoon"):list():replace_at(5)
				end,
				desc = "add file to 5",
			},




			{
				"<leader>hr1",
				function()
					require("harpoon"):list():remove_at(1)
				end,
				desc = "remove file at 1",
			},
			{
				"<leader>hr2",
				function()
					require("harpoon"):list():remove_at(2)
				end,
				desc = "remove file at 2",
			},
			{
				"<leader>hr3",
				function()
					require("harpoon"):list():remove_at(3)
				end,
				desc = "remove file at 3",
			},
			{
				"<leader>hr4",
				function()
					require("harpoon"):list():remove_at(4)
				end,
				desc = "remove file at 4",
			},
			{
				"<leader>hr5",
				function()
					require("harpoon"):list():remove_at(5)
				end,
				desc = "remove file at 5",
			},
			{
				"<leader>hrc",
				function()
					require("harpoon"):list():remove()
				end,
				desc = "remove file at 5",
			},
            
            
            
			{
				"<A-1>",
				function()
					require("harpoon"):list():select(1)
				end,
				desc = "harpoon to file 1",
			},
			{
				"<A-2>",
				function()
					require("harpoon"):list():select(2)
				end,
				desc = "harpoon to file 2",
			},
			{
				"<A-3>",
				function()
					require("harpoon"):list():select(3)
				end,
				desc = "harpoon to file 3",
			},
			{
				"<A-4>",
				function()
					require("harpoon"):list():select(4)
				end,
				desc = "harpoon to file 4",
			},
			{
				"<A-5>",
				function()
					require("harpoon"):list():select(5)
				end,
				desc = "harpoon to file 5",
			},
		},
	},
}
