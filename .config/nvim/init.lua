-- settings

vim.opt.number = true
vim.opt.relativenumber = true
vim.opt.autoindent = true
vim.opt.cursorline = true
vim.opt.fixendofline = true
vim.opt.shiftwidth = 4
vim.opt.scrolloff = 8
vim.g.mapleader = " "
vim.g.maplocalleader = "\\"

-- tab width

vim.api.nvim_create_autocmd("FileType", {
	pattern = { "go", "lua" },
	callback = function()
		vim.opt.shiftwidth = 8
	end,
})

vim.api.nvim_create_autocmd("FileType", {
	pattern = "c",
	callback = function()
		vim.opt.shiftwidth = 2
	end,
})

-- various mappings

vim.keymap.set("i", "jk", "<Esc>")
vim.keymap.set("i", "je", "<C-o>")
vim.keymap.set("t", "<Esc>", "<C-\\><C-n>")
vim.keymap.set("t", "jk", "<C-\\><C-n>")

-- disabling arrows

vim.keymap.set({ "n", "v" }, "<Up>", "<Ignore>")
vim.keymap.set({ "n", "v" }, "<Down>", "<Ignore>")
vim.keymap.set({ "n", "v" }, "<Left>", "<Ignore>")
vim.keymap.set({ "n", "v" }, "<Right>", "<Ignore>")
vim.keymap.set({ "n", "v", "i" }, "<PageUp>", "<Ignore>")
vim.keymap.set({ "n", "v", "i" }, "<PageDown>", "<Ignore>")

-- neovide settings

if vim.g.neovide then
	vim.o.guifont = "Iosevka Nerd Font:h13"
	vim.g.neovide_scale_factor = 1.0
	vim.g.neovide_cursor_vfx_mode = "sonicboom"
	vim.g.neovide_cursor_smooth_blink = true
	vim.g.neovide_transparency = 0.8
	vim.g.neovide_padding_top = 16
	vim.g.neovide_padding_bottom = 4
	vim.g.neovide_padding_right = 16
	vim.g.neovide_padding_left = 16
	vim.g.neovide_hide_mouse_when_typing = true
end

-- Lazy

local lazypath = vim.fn.stdpath("data") .. "/lazy/lazy.nvim"
if not (vim.uv or vim.loop).fs_stat(lazypath) then
	local lazyrepo = "https://github.com/folke/lazy.nvim.git"
	local out = vim.fn.system({ "git", "clone", "--filter=blob:none", "--branch=stable", lazyrepo, lazypath })
	if vim.v.shell_error ~= 0 then
		vim.api.nvim_echo({
			{ "Failed to clone lazy.nvim:\n", "ErrorMsg" },
			{ out, "WarningMsg" },
			{ "\nPress any key to exit..." },
		}, true, {})
		vim.fn.getchar()
		os.exit(1)
	end
end
vim.opt.rtp:prepend(lazypath)

require("lazy").setup({
	spec = {
		{ import = "core" },
		{ import = "extra" },
	},
})

vim.cmd.colorscheme("nordic")
