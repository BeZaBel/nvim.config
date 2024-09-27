-- ╔═══════════════════════════════════╗
-- ║ ██╗      █████╗ ███████╗██╗   ██╗ ║
-- ║ ██║     ██╔══██╗╚══███╔╝╚██╗ ██╔╝ ║
-- ║ ██║     ███████║  ███╔╝  ╚████╔╝  ║
-- ║ ██║     ██╔══██║ ███╔╝    ╚██╔╝   ║
-- ║ ███████╗██║  ██║███████╗   ██║    ║
-- ║ ╚══════╝╚═╝  ╚═╝╚══════╝   ╚═╝    ║
-- ╚═══════════════════════════════════╝
-- ╭─────────────────────────────────────────────────────────╮
-- │ Initialize lazy                                         │
-- ╰─────────────────────────────────────────────────────────╯
local lazypath = vim.fn.stdpath("data") .. "/lazy/lazy.nvim"
if not vim.loop.fs_stat(lazypath) then
	vim.fn.system({
		"git",
		"clone",
		"--filter=blob:none",
		"https://github.com/folke/lazy.nvim.git",
		"--branch=stable",
		lazypath,
	})
end
vim.opt.rtp:prepend(lazypath)

require("lazy").setup({
	{
		import = "plugs.base",
	},
	{
		import = "plugs.colors",
	},
	{
		import = "plugs.completion",
	},
	{
		import = "plugs.dev-utils",
	},
	{
		import = "plugs.lsp",
	},
	{
		import = "plugs.ui",
	},
	{
		import = "plugs.utils",
	},
}, {
	change_detection = {
		notify = false,
	},
	ui = {
		icons = vim.g.have_nerd_font and {} or {
			cmd = "⌘",
			config = "🛠",
			event = "📅",
			ft = "📂",
			init = "⚙",
			keys = "🗝",
			plugin = "🔌",
			runtime = "💻",
			require = "🌙",
			source = "📄",
			start = "🚀",
			task = "📌",
			lazy = "💤 ",
		},
	},
})
