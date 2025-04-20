-- { "clang-format", "black", "stylua" }

return {
	"williamboman/mason-lspconfig.nvim",
	dependencies = { "williamboman/mason.nvim", "neovim/nvim-lspconfig" },
	config = function()
		local mason = require("mason")
		local mason_lspconfig = require("mason-lspconfig")
		local lspconfig = require("lspconfig")

		mason.setup()

		mason_lspconfig.setup({
			ensure_installed = { "lua_ls", "gopls", "pylsp", "clangd" },
		})

		lspconfig.lua_ls.setup({})
		lspconfig.gopls.setup({})
		lspconfig.pylsp.setup({})
		lspconfig.clangd.setup({})
	end,
}
