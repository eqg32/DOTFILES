return {
	"folke/snacks.nvim",
	priority = 1000,
	lazy = false,
	opts = {
		bigfile = { enabled = true },
		dashboard = { enabled = true },
		explorer = { enabled = true },
		indent = { enabled = true },
		input = { enabled = true },
		picker = { enabled = true },
		notifier = { enabled = true },
		quickfile = { enabled = true },
		scope = { enabled = true },
		scroll = { enabled = false },
		statuscolumn = { enabled = true },
		words = { enabled = true },
	},
	keys = {
		{
			"<leader>e",
			function()
				require("snacks").explorer()
			end,
			desc = "Toggle explorer",
		},
		{
			"<leader>t",
			function()
				require("snacks").terminal.toggle()
			end,
			desc = "Toggle terminal",
		},
		{
			"<leader>b",
			function()
				require("snacks").picker.buffers()
			end,
			desc = "Open buffer picker",
		},
		{
			"<leader>f",
			function()
				require("snacks").picker.files()
			end,
			desc = "Open file picker",
		},
	},
}
