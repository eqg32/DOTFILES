return {
	"AckslD/swenv.nvim",
	config = function()
		require("swenv").setup({
			auto_create_venv = true,
			auto_create_venv_dir = ".venv",
		})
		vim.api.nvim_create_autocmd("FileType", {
			pattern = { "python" },
			callback = function()
				require("swenv.api").auto_venv()
			end,
		})
	end,
}
