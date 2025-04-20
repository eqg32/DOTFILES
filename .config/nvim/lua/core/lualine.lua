return {
	"nvim-lualine/lualine.nvim",
	dependencies = { "nvim-tree/nvim-web-devicons" },
	config = true,
	opts = {
		options = {
			section_separators = { left = "", right = "" },
			component_separators = "│",
		},
		sections = {
			lualine_b = {
				function()
					return vim.fn.getcwd()
				end,
				"branch",
				"diff",
			},
			lualine_c = {
				"filename",
				"diagnostics",
			},
			lualine_x = { "filetype" },
		},
	},
}
