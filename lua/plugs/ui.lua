return {
	{
		"stevearc/oil.nvim",
		opts = {},
		dependencies = { "echasnovski/mini.icons" },
		config = require("setup.oil").setup,
	},
	{
		-- Gotta go fast when searching for things in a buffer
		"folke/flash.nvim",
		event = "VeryLazy",
		opts = {},
		keys = require("setup.flash").keys,
		config = require("setup.flash").setup,
	},
	{
		-- Highlight colors
		"NvChad/nvim-colorizer.lua",
		event = { "BufReadPre", "BufNewFile" },
		config = true,
	},
	{
		-- Show keymaps
		"folke/which-key.nvim",
		event = "VeryLazy",
		config = require("setup.which-key").setup,
	},
	{
		-- Fancy colors for delimiters
		"HiPhish/rainbow-delimiters.nvim",
		lazy = false,
		priority = 1000,
		event = "BufEnter",
		config = require("setup.rainbow-delimiters").setup,
	},
	{
		-- Fancy colors for indentations
		"lukas-reineke/indent-blankline.nvim",
		main = "ibl",
		config = require("setup.ibl").setup,
	},
}
